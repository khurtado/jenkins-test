#!/bin/bash

# give proper permissions to
chown -R ${MY_ID}:${MY_GROUP} /home/cmsbld

USERN=$(id -un ${MY_ID})

su - $USERN

pushd /home/cmsbld

# clone jenkins-test scripts
git clone https://github.com/d-ylee/jenkins-test

popd

$@