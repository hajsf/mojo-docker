#!/bin/bash

# Read the MODULAR_AUTH_KEY from the .env file and execute modular auth
export $(cat .env | xargs) && \
modular auth $MODULAR_AUTH_KEY
