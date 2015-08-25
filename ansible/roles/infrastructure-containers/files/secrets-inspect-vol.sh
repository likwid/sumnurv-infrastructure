#!/bin/bash

echo $(docker inspect -f '{{ index .Volumes "/srv/company/secrets" }}' secrets)
