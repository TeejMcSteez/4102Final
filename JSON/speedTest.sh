#!/bin/bash

watch -n 1 curl -w "%{time_total}\n" localhost:8080
