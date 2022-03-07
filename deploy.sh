#!/usr/bin/env bash

ytt -f examples/data \
    -f deploy \
    | kubectl apply -f - --server-side
