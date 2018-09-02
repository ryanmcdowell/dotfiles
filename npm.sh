#!/bin/sh

# Install packages
npm install -g express
npm install -g grunt-cli
npm install -g bower
npm install -g generator-license
npm install -g conventional-changelog-cli
npm install -g jshint

# Yo and it's generators need to be installed on the same command line
# in order to avoid unmet peer dependency bug in repo.
npm install -g yo generator-karma generator-angular
