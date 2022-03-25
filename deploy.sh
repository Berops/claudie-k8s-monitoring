#!/usr/bin/env bash

ytt -f examples/data.yaml \
    -f deploy \
    | kubectl apply -f - --server-side
