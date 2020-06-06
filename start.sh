#!/bin/bash
app="people-counter"
docker build -t ${app} pyimagesearch/
docker run -p 127.0.0.1:8080:8080/tcp ${app}
