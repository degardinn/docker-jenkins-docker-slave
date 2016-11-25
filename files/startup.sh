#!/bin/bash

service docker start
jenkins-slave $*
