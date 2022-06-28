from flask import Flask, render_template

dapp = Flask(__name__)

@dapp.route('/')
def landingPage():
    return render_template('landing.html')


