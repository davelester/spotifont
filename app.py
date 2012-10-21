from tornado.database import Connection
from os import environ
from flask import Flask, g, render_template, Response, url_for, request, session, flash, redirect
import config


#Configuration, the default log-in name is username = admin, and password = default
USERNAME = "admin"
PASSWORD = "default"
SECRET_KEY = 'development key'

app = Flask(__name__)
app.config.from_object(__name__)
app.config.from_envvar('FLASKR_SETTINGS', silent=True)

app.debug = True

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
		ret+='{"error": "We pity the fool who does a query with no results. sucka!"}'
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

@app.route('/login', methods=['GET', 'POST'])
def login():
  error = None
  if request.method == 'POST':
    if request.form['username'] != app.config['USERNAME']: #where USERNAME = admin
      error = 'Invalid username'
    elif request.form['password'] != app.config['PASSWORD']:#where PASSWORD = default
      error = 'Invalid password'
    else:
      session['logged_in'] = True
      flash('You were logged in')
      return redirect("/")
  return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect("/login")


#this is to test if the table is returning the correct usernames
@app.route('/fetch')
def fetch():
  usernames = list(g.db.iter("SELECT username, password FROM Users"))
  return render_template("test.html", user=usernames)


#the following method should get new user to register, though I am not sure how to INSERT INTO database
'''@app.route('/register', methods=['GET', 'POST'])
def register():
  user = request.form.get['username']
  pw = request.form.get['password']
  g.db("INSERT INTO Users (id, username, password) VALUES (3, user, pw)")

  return render_template("register.html", user=user, password=pw)'''

if __name__ == "__main__":
    app.run()