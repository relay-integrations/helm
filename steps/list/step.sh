#!/bin/sh

helm init --client-only

ni cluster config

NS=$(ni get -p {.namespace})
CLUSTER=$(ni get -p {.cluster.name})
KUBECONFIG=/workspace/"${CLUSTER}"/kubeconfig

TLS_OPTIONS=
CREDENTIALS=$(ni get -p {.credentials})
if [ -n "${CREDENTIALS}" ]; then
    ni credentials config -d $(helm home)
    TLS_OPTIONS="--tls --tls-verify"
fi

helm list ${TLS_OPTIONS} \
    --namespace ${NS} --kubeconfig ${KUBECONFIG}
