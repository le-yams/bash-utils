#!/bin/bash

if [ -z "${SCRIPT_LIBS_DIR}" ]
then
  echo -e "\\e[1;91mERROR\\e[0m: \\e[1;34mSCRIPT_LIBS_DIR\\e[0m variable must be defined"
fi

# shellcheck source=lib/colors.sh
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
  if [ ! -z ${VERBOSE} ]; then
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
