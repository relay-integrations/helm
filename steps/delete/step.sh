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

RELEASE_NAME=$(ni get -p {.name})

PURGE_OPTIONS=
PURGE=$(ni get -p {.purge})
if [ "${PURGE}" = "true" ]; then
    PURGE_OPTIONS="--purge"
fi

helm delete ${RELEASE_NAME} ${TLS_OPTIONS} \
    ${PURGE_OPTIONS} \
    --kubeconfig ${KUBECONFIG}

