#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y
sudo apt install openjdk-11-jdk -y