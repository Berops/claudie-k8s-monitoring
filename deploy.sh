#!/usr/bin/env bash

ytt -f ns.yaml \
    -f labels.lib.yaml \
    -f metadata.lib.yaml \
    -f data.yaml \
    | kubectl apply -f - --server-side

ytt -f alertmanager \
    -f blackboxExporter \
    -f grafana \
    -f kubePrometheus \
    -f promAdapter \
    -f prometheus \
    -f labels.lib.yaml \
    -f metadata.lib.yaml \
    -f data.yaml \
    | kubectl apply -f - --server-side
