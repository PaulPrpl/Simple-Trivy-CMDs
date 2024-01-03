#!/bin/env bash
[[ $# -ne 1 && ! -r "$1" ]] && exit 2
output="sbom-`date +%s`-${1##*/}.json"
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/.cache:/root/.cache/ aquasec/trivy --format cyclonedx image $1 --scanners vuln,misconfig,secret,license | tee "$output"
