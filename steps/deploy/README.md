# helm-step-deploy

The Helm deployer step container deploys a Helm chart to a Kubernetes cluster.

## Specification

See the [spec.schema.json](spec.schema.json) for the formal specification for using this step.

> **Note**: The value you set for a secret must be a string. If you have multiple key-value pairs to pass into the secret, or your secret is the contents of a file, you must encode the values using base64 encoding, and use the encoded string as the secret value. 

## Examples

See the [step.yaml](step.yaml) for a detailed example of using this step.