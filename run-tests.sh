#!/bin/env bash

PHP_VERSIONS="7.1 7.2 7.3 7.4 8.0 8.1"
PHP_VERSIONS="8.0 8.1"

export PATH=./mybin:./vendor/bin:$PATH
hash -r
which php

for VERSION in $PHP_VERSIONS; do
    export PHP_VERSION=$VERSION
    php --version

    rm -vf composer.lock
    rm -rf vendor

    #composer install --no-dev
    composer install

    phpspec run

    phpspec --version
    echo "Tested $VERSION. Continue?"
    read ASDF
done
