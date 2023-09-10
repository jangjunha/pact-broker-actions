#!/usr/bin/env bash

echo "Target: $PACT_TARGET"
echo "Version: $PACT_VERSION"

docker run --rm \
	-w ${PWD} \
	-v ${PWD}:${PWD} \
	-e PACT_BROKER_BASE_URL=$PACT_BROKER_URL \
	-e PACT_BROKER_USERNAME=$PACT_BROKER_USERNAME \
	-e PACT_BROKER_PASSWORD=$PACT_BROKER_PASSWORD \
	pactfoundation/pact-cli \
	publish \
	$PACT_TARGET \
	--consumer-app-version $PACT_VERSION \
	--branch $GITHUB_REF_NAME
