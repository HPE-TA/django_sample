#!/bin/sh

BASE_DIR=$( cd $(dirname $0); cd .. ; pwd )

if [[ $(whoami) != "root" ]]; then
    echo "Please execute with root"
    exit 1
fi

# Install requirement packages
yum install -y mariadb mariadb-devel git gcc

if [[ -z $(which python3.6 2>/dev/null ) ]]; then
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm
    yum -y install python36u python36u-devel python36u-pip
fi

if [[ -z $(which pip3.6 2>/dev/null ) ]]; then
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm
    yum -y install python36u-pip
fi

# Install python lib requirements
cd $BASE_DIR
pip3.6 install -r requirements/production.txt

# Setting uwsgi.ini
cat << EOF > systemd/uwsgi.ini
[uwsgi]
socket = :3031
chdir = $BASE_DIR
pythonpath = $BASE_DIR
env = DJANGO_SETTINGS_MODULE=config.settings.production
module = config.wsgi
pidfile = /var/run/uwsgi.pid
processes = 4
threads = 2
stats = :9191
EOF

# Setting systemd file
cat << EOF > systemd/uwsgi.service
[Unit]
Description=uWSGI service

[Service]
EnvironmentFile=$BASE_DIR/systemd/env
ExecStart=/bin/bash -c 'uwsgi --ini $BASE_DIR/systemd/uwsgi.ini'

[Install]
WantedBy=multi-user.target
EOF

# Register uwsgi.service to systemd
cd /etc/systemd/system
ln -s $BASE_DIR/systemd/uwsgi.service uwsgi.service

# Start uwsgi.service
systemctl start uwsgi.service
systemctl enable uwsgi.service
