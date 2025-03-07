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

if [ -z "${SCRIPT_LIBS_DIR}" ]
then
  echo -e "\\e[1;91mERROR\\e[0m: \\e[1;34mSCRIPT_LIBS_DIR\\e[0m variable must be defined"
fi

# shellcheck source=colors.sh
source "${SCRIPT_LIBS_DIR}/colors.sh"

function timestamp() {
  date --rfc-3339=ns
}

function log() {
  echo -e "$(timestamp) $*"
}

function log_success() {
  echo -e "$(timestamp) [$(bright_green SUCCESS)] $*"
}

function log_info() {
  echo -e "$(timestamp) [$(bright_blue INFO)] $*"
}

function log_error() {
  echo -e "$(timestamp) [$(bright_red ERROR)] $*"
}

function log_warn() {
  echo -e "$(timestamp) [$(bright_yellow WARN)] $*"
}

function log_debug() {
  if [ -n "${DEBUG}" ]; then
    echo -e "$(timestamp) [DEBUG] $*"
  fi
}

function fail() {
  log_error "$*"
  exit 1
}

function verbose_echo() {
  if [ -n "${VERBOSE}" ]; then
    echo "$*"
  fi
}

function now_millis() {
  date +%s%N | cut -b1-13
}

function require_env() {
  required_variable=$1

  if [ -z "${required_variable}" ]; then
    echo "specified the required environment variable name"
    exit 1
  fi

  value="${!required_variable}"
  if [ -z "${value}" ]; then
    fail "missing environment variable $(bright_cyan "${required_variable}")"
  fi

}
