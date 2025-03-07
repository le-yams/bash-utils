#!/bin/bash

#
#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#

FOREGROUND_BRIGHT_RED=91
FOREGROUND_BRIGHT_GREEN=92
FOREGROUND_BRIGHT_YELLOW=93
FOREGROUND_BRIGHT_BLUE=94
FOREGROUND_BRIGHT_MAGENTA=95
FOREGROUND_BRIGHT_CYAN=96

FOREGROUND_RED=31
FOREGROUND_GREEN=32
FOREGROUND_YELLOW=33
FOREGROUND_BLUE=34
FOREGROUND_MAGENTA=35
FOREGROUND_CYAN=36

function color() {
  color=$1
  shift
  # shellcheck disable=SC2028
  echo "\\e[1;${color}m$*\\e[0m"
}

function red() {
  color ${FOREGROUND_RED} "$@"
}

function green() {
  color ${FOREGROUND_GREEN} "$@"
}

function yellow() {
  color ${FOREGROUND_YELLOW} "$@"
}

function blue() {
  color ${FOREGROUND_BLUE} "$@"
}

function magenta() {
  color ${FOREGROUND_MAGENTA} "$@"
}

function cyan() {
  color ${FOREGROUND_CYAN} "$@"
}

function bright_red() {
  color ${FOREGROUND_BRIGHT_RED} "$@"
}

function bright_green() {
  color ${FOREGROUND_BRIGHT_GREEN} "$@"
}

function bright_yellow() {
  color ${FOREGROUND_BRIGHT_YELLOW} "$@"
}

function bright_blue() {
  color ${FOREGROUND_BRIGHT_BLUE} "$@"
}

function bright_magenta() {
  color ${FOREGROUND_BRIGHT_MAGENTA} "$@"
}

function bright_cyan() {
  color ${FOREGROUND_BRIGHT_CYAN} "$@"
}
