#!/usr/bin/env bash
#
# Copyright (C) 2021-2023 Intel Corporation
# SPDX-License-Identifier: MIT
# @file build.sh
#

set -e

WORK=`dirname "$0"`
WORK_DIR=`cd ${WORK} && pwd`

sudo apt install -y build-essential libprotobuf-dev automake libgrpc++-dev \
                    python3-grpc-tools libze-dev libhwloc-dev

git clone https://github.com/intel/igsc.git
cd igsc
cmake .
make && sudo make install

git clone https://github.com/intel/metee.git
cd metee
cmake .
make && sudo make install

./build.sh -DDAEMONLESS=ON
