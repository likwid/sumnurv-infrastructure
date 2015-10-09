#!/bin/bash

apt-get -y install python-dev python-setuptools libyaml-dev
easy_install pip
pip install ansible --upgrade
apt-get clean
