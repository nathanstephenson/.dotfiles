#!/bin/bash

if [[ $1 == "pbp-api" ]]; then
    echo "[pbp.md](pbp.md)"
elif [[ $1 == "platform" ]]; then
    echo "[platform.md](platform.md)"
fi
