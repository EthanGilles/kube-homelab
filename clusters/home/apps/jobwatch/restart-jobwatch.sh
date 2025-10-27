#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Namespace not specified."
    echo "Usage: $0 <namespace>"
    exit 1
fi

NAMESPACE="$1"

# List of component name patterns to delete
COMPONENTS=("jobwatch-backend" "jobwatch-frontend" "jobwatch-redis")

echo "Fetching pods in namespace: $NAMESPACE"
PODS=$(kubectl get pods -n "$NAMESPACE" -o jsonpath="{.items[*].metadata.name}")

for component in "${COMPONENTS[@]}"; do
    POD_NAME=$(echo "$PODS" | tr ' ' '\n' | grep "$component" | head -n1)
    if [ -n "$POD_NAME" ]; then
        echo "Deleting $component pod: $POD_NAME"
        kubectl delete pod "$POD_NAME" -n "$NAMESPACE"
    else
        echo "No pod found for $component"
    fi
done

echo "Jobwatch restarted in $NAMESPACE"

