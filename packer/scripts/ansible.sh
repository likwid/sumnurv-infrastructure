#!/bin/bash

apt-get -y update
apt-get -y install python-dev python-pip libyaml-dev
pip install ansible --upgrade
apt-get clean
