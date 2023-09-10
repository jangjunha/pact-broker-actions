#!/usr/bin/env bash

echo "Target: $target"
echo "Version: $version"

docker run --rm \
	-w ${PWD} \
	-v ${PWD}:${PWD} \
	-e PACT_BROKER_BASE_URL=$PACT_BROKER_URL \
	-e PACT_BROKER_USERNAME=$PACT_BROKER_USERNAME \
	-e PACT_BROKER_PASSWORD=$PACT_BROKER_PASSWORD \
	pactfoundation/pact-cli \
	publish \
	$target \
	--consumer-app-version $version \
	--branch $GITHUB_REF_NAME
