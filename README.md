# mysite: boilerplate project for django + uwsgi + nginx on Mac OS X

This project serves as a biolerplate using django framework and nginx as the web server, with uwsgi to communicate. It's mainly for Mac OS X users, and not tested on Linux system. If you want it works on Linux system, you need to change some paths for the configuration files.

## Prerequisite

1. python 2.7 & pip: `brew install python`
2. nginx: `brew install nginx`
3. virtualenv: `pip install virtualenv`


## Usage

### Installation

1. create a virtual environment: `virtualenv venv`
2. activate the virtaul environment: `source venv/bin/activate`
3. install all the dependent packages: `pip install -r requirements.txt`

### Deploy

`cd` into the `mysite` folder where holds the `manage.py`, run `./deploy.sh`. It will first create the nginx and uwsgi configuration files, then make a soft link in `/usr/local/etc/nginx/servers` to the configuration file.

### Start Service

Run `./start.sh`. It will start nginx and uwsgi. Visit [http://localhost:8888/]() to see the welcome page. All the uwsgi logs are in `uwsgi.log`.

### Stop Service

Run `./stop.sh`. It will stop uwsgi and nginx.


## About the Configuration

1. mysite server uses 8888 port, you can change it in `deploy.sh`.
2. uwsgi communicates with nginx through unix file `/tmp/mysite.sock` to achieve better efficiency.
3. The uwsgi pid is logged at `/tmp/mysite.pid`, and if something goes wrong, you can easily kill the uwsgi process with it.
4. The static file folders are `static1` and `static2`, as configurated in `mysite/settings.py`. You can change the configuration and add more static files. Make sure  run `python manage.py collectstatic` after that, django will collect all the static files in `static` folder and nginx will find static files in it.
5. The uploaded files are located at `media` folder, and nginx will find files in it.
6. Make sure that nginx has the right permission to visit the `media` and `static` folder, modify `/usr/local/etc/nginx/nginx.conf` and change the `user` option properly, e.g `user sean staff`.

