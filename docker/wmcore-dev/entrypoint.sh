#!/bin/bash

# give proper permissions to
chown -R ${MY_ID}:${MY_GROUP} /home/cmsbld

su - $(id -un ${MY_ID})

$@