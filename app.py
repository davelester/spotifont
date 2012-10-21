from tornado.database import Connection
from flask import request
from os import environ
from flask import Flask, g, render_template, Response, redirect, url_for, flash, request, session
from flask_oauth import OAuth
import config

app = Flask(__name__)
app.debug = config.DEBUG
app.secret_key = config.SECRET_KEY
oauth = OAuth()

# Facebook-specific OAuth Config
facebook = oauth.remote_app('facebook',
    base_url='https://graph.facebook.com/',
    request_token_url=None,
    access_token_url='/oauth/access_token',
    authorize_url='https://www.facebook.com/dialog/oauth',
    consumer_key=config.FACEBOOK_APP_ID,
    consumer_secret=config.FACEBOOK_APP_SECRET,
    request_token_params={'scope': 'email'}
)

@app.before_request
def connect_db():
    g.db = Connection(config.SPOTIFONT_DB_HOST,
                      config.SPOTIFONT_DB_NAME,
                      config.SPOTIFONT_DB_USER,
                      config.SPOTIFONT_DB_PASSWD)

@app.after_request
def close_connection(response):
    g.db.close()
    return response

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/search/<query>")
def search(query):
	fonts = g.db.iter("SELECT DISTINCT f.font_name, c.controlled_name FROM Fonts AS f, Tags as t, Tag_Links as tl, Controlled as c WHERE c.font_id=f.id AND f.id=tl.font_id AND tl.tag_id=t.id AND t.tag_name='" + query + "'")

	ret = '['	
	if (fonts == True):
		for font in fonts:
			ret+='{"fontname": "' + font.font_name +'", "controlled": "' + font.controlled_name +'"}'
	else:
		ret+='{"error": "We pity the fool who does a query with no results. suck"}'
	ret += ']'


	resp = Response(response=ret,
					status=200,
					mimetype="application/json")

	return resp
	
@app.route("/font/<fontname>")
def font(fontname):
	# todo: should pull only unique tags, and also return the count of the times a tag appears for a given font
	tags = g.db.iter("SELECT t.* FROM Fonts AS f, Tags as t, Tag_Links as tl WHERE f.font_name='"+fontname+"' AND f.id=tl.font_id AND tl.tag_id=t.id AND t.type='u'")
	return render_template("font.html", tags=tags)


@app.route('/login')
def login():
    return facebook.authorize(callback=url_for('facebook_authorized',
        next=request.args.get('next') or request.referrer or None,
        _external=True))


@app.route('/login/authorized')
@facebook.authorized_handler
def facebook_authorized(resp):
	if resp is None:
		return 'Access denied: reason=%s error=%s' % (
			request.args['error_reason'],
			request.args['error_description']
		)
	session['oauth_token'] = (resp['access_token'], '')
	me = facebook.get('/me')
	g.userid = me.data['id']
	return render_template("index.html")


@facebook.tokengetter
def get_facebook_oauth_token():
    return session.get('oauth_token')

if __name__ == "__main__":
    app.run()