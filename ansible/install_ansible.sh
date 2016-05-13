#!/bin/bash

if ! ansible --version | grep 1.9.4
then
    if apt-get update -q
    then
        echo "Apt updated"
    fi
    if apt-get install -yq python-pip python-dev libffi-dev libssl-dev
    then 
        echo "Dependencies installed"
    fi
    if pip install -U pip ansible==1.9.4
    then 
        echo "Ansible 1.9.4 installed"
    fi
fi
