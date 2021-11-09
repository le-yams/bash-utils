#!/bin/bash

source $SCRIPT_LIBS_DIR/colors.sh

function log_info() {
  echo -e "[$(bright_blue INFO)] $*"
}

function log_error() {
  echo -e "[$(bright_red ERROR)] $*"
}

function log_warn() {
  echo -e "[$(bright_yellow WARN)] $*"
}

function log_debug() {
  if [ -n ${DEBUG} ]; then
    echo -e "[DEBUG] $*"
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
