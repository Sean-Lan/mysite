#!/usr/bin/env bash

# start nginx
sudo nginx

# start uwsgi
uwsgi --ini mysite_uwsgi.ini

