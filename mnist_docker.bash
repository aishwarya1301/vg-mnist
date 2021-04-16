#!/bin/bash

docker image build -t aishwaryar/mnist:latest .
docker run aishwaryar/mnist
