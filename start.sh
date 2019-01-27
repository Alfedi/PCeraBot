#!/bin/bash

# Taken from Ironjanowar refraner bot. All credits to him.

export PCERA_TOKEN=$(cat pcerabot.token)
export USUARIO=$(cat kk.info)
export MUSIC_DIR=$HOME/Music

echo "Getting deps"
mix deps.get

echo "Compiling..."
mix compile
if [ $? != 0 ]; then
    echo -e "\n\nCould not compile"
    exit 1
fi

echo Running...
mix run --no-halt
