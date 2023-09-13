#!/bin/bash

curl https://google.com &> /dev/null && exit 0 || exit 1
