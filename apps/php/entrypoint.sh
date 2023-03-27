#!/bin/bash
set -e # Fail on error

if [ $APP_ENV = "prod" ]
then
    mv config.prod config
else
    mv config.dev config
fi

apache2-foreground