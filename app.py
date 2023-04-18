#!/usr/bin/python3
# -*- coding: utf-8 -*-

from flask import *



app = Flask(__name__)
app.secret_key = 'SupperSSH-SLAM'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods = ['POST'])
def login():
    login = request.form[ 'login' ]
    password = request.form[ 'password' ]

    if login == 'admin' and password == 'azerty':
        session['login'] = login
        session['password'] = password
        return redirect('/supper')
    else:
        return redirect('/')

@app.route('/supper')
def supper():
    return render_template('supper.html')

@app.route('/supper', methods = ['POST'])
def supper_post():

    IPs = request.files['IPs']
    if IPs:
        content = IPs.read()
        with open('techniques/IPs/ip_liste.txt', 'wb') as f:
            f.write(content)

    CMDs = request.files['CMDs']
    if CMDs:
        content = CMDs.read()
        with open('techniques/CMDs/cmd_liste.txt', 'wb') as f:
            f.write(content)

    ip = open('techniques/IPS/ip_liste.txt')
    cmd = open('techniques/CMDs/cmd_liste.txt')
    return render_template( 'supper.html', ip=ip.readlines(0), cmd=cmd.readlines(0) )
    
    

if __name__ == '__main__':
    app.run( host='0.0.0.0', port='5000', debug = True)


