from tornado.database import Connection
from flask import Flask, g, render_template
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
	fontnames = g.db.iter("select f.* FROM Fonts AS f")
	return render_template("search.html", fontnames=fontnames)

@app.route("/font/<fontname>")
def font(name):
	return render_template("font.html")

if __name__ == "__main__":
    app.run()