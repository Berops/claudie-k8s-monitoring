# K8s monitoring
This repository is a [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus) deployment rewritten using [ytt](https://carvel.dev/ytt/) to allow more agility in a consumption of the work done by the Prometheus community.

## Motivation
The main reason for creating this project is to achieve a greater degree of flexibility than currently allowed by the most popular deployment tools (i.e. Helm, Kustomize) and to get a real-world usage feedback from ytt. The main advantage of the ytt manifest management tool is the ability to use remote (git-hosted) bases. This results in the following two use-cases:
1. Deployment the upstream as-is; this is effectively no different to e.g. using a helm-chart. However it pre-sets you for any later customization efforts.
2. Using upstream (this repo) as a remote-base in combination with local overlays. This method allows for customization with easier future upgrades, where you just take care of your local patches in order to make them compatible with the new releases in this repo. Also, if you need to override just one component (e.g. Grafana) because the upstream one doesn't suit you, you can modify just Grafana without cloning all other components.

## Prerequisites:
- Install [ytt](https://carvel.dev/ytt/)

## Usage
1. Create your local `data.yaml` (see `examples/data.yaml` in this repo)
2. Execute `ytt -f data.yaml -f deploy | kubectl apply -f - --server-side`
