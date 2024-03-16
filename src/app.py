from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Okay, it works! Whats next?'
