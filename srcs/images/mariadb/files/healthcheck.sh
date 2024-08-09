#!/bin/bash

if mysqladmin ping --silent; then
    /bin/bash /setup.sh
    echo "YEEEEEEEEEES" >&2
    exit 0
else
    echo "NEIIIIIIIIIIIIN" >&2
    exit 1
fi