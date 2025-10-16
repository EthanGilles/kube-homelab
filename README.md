# Kubernetes Cluster Configuration

This repository contains the infrastructure and application 
manifests used to manage the Kubernetes cluster configuration. The cluster 
is managed using [Flux](https://fluxcd.io/) for GitOps continuous deployment, 
and the repository is integrated with [Renovate](https://renovatebot.com/) to 
automate dependency and version updates via Pull Requests (PRs).

---

## Cluster Diagrams

A Diagram showing how the GitOps workflow with flux happens:
![Flux Diagram](https://github.com/EthanGilles/EthanGilles/blob/d3016679f036e17bf369824cf7c39a4e8a954783/homelab-diagrams/flux.png)


The workflow associated with Renovate and keeping Helm Charts up-to-date.
![Renovate Workflow](https://github.com/EthanGilles/EthanGilles/blob/761d05588b9b2809357a47e744ced8ac474b47bb/homelab-diagrams/renovate-workflow.png)

---

## Overview

- **Cluster Management:** All Kubernetes manifests, Helm charts, and configuration files 
are declaratively stored here.
- **GitOps with Flux:** Flux continuously reconciles the cluster state with 
this Git repository, ensuring the live cluster matches the desired configuration.
- **Automated Updates with Renovate:** Renovate bot scans dependency files 
(e.g., Helm chart versions, container image tags) and opens PRs to 
update to newer versions automatically, keeping the cluster secure 
and up-to-date with barely any manual effort.

---
## Currently Deployed:

### GitOps: 
- [FluxCD](https://github.com/fluxcd/flux2)

### Infrastructure
- [Cert-Manager](https://github.com/cert-manager/cert-manager)
- [Longhorn](https://github.com/longhorn/longhorn)
- [Ingress-Nginx](Nginx-Ingress)

### Monitoring:
- [Prometheus](https://github.com/prometheus-community/helm-charts)
- [Loki](https://github.com/grafana/loki)
- [Grafana](https://github.com/grafana/helm-charts)

### Apps:
- [Capacitor](https://github.com/gimlet-io/capacitor)
- [JobWatch (Personal app)](https://github.com/EthanGilles/job-scraper)

---

## Getting Started

1. **Bootstrap Flux:**  
   If you are setting up Flux for the first time, follow the official [Flux bootstrap guide](https://fluxcd.io/docs/installation/) to connect Flux to this repo and your cluster.

2. **Managing Applications:**  
   Add or update your Kubernetes manifests or HelmRelease resources under the `/clusters/home/` directory.

3. **Automatic Updates:**  
   Renovate will regularly scan for new versions of container images and Helm charts and create PRs with proposed version bumps.

4. **Review and Merge PRs:**  
   Review Renovate PRs and merge them to keep your cluster dependencies current and secure.

---

## Renovate Bot Configuration

Renovate is configured via the `renovate.json` file in this repository. Key points:

- Auto-detection of Helm charts and container image tags.
- Scheduled update windows to control PR creation timing.
- Version constraints to avoid breaking changes automatically.
- Automatic PR labeling and grouping for better management.

Refer to the official [Renovate documentation](https://docs.renovatebot.com/configuration-options/) for advanced customization.

---

## Resources

- [Flux CD GitOps Documentation](https://fluxcd.io/docs/)
- [Renovate Bot Documentation](https://docs.renovatebot.com/)
- [Kubernetes Official Docs](https://kubernetes.io/docs/)

---
