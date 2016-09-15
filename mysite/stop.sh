#!/usr/bin/env bash

# shut down uwsgi
uwsgi --stop /tmp/mysite.pid

# gracefully stop nginx
sudo nginx -s quit
