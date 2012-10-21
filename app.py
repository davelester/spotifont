from tornado.database import Connection
from flask import Flask, g, render_template, Response
app = Flask(__name__)
import config

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
	for font in fonts:
		ret+='{"fontname": "' + font.font_name +'", "controlled": "' + font.controlled_name +'"}'
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

if __name__ == "__main__":
    app.run()