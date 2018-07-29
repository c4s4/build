#!/usr/bin/env python
# encoding: UTF-8

'''
Sample Flask source file.
'''

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
