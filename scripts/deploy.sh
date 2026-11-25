#!/bin/sh
# Simple local deployment: copy the application into a versioned release
# folder, point a "current" symlink at it, and smoke-test the deployed app.
set -e

DEPLOY_ROOT="${DEPLOY_DIR:-$HOME/deployments/python-ci-cd}"
BUILD_ID="${BUILD_NUMBER:-local}"
RELEASE_DIR="$DEPLOY_ROOT/releases/build-$BUILD_ID"

echo "Deploying build $BUILD_ID to $RELEASE_DIR"
mkdir -p "$RELEASE_DIR"
cp app.py requirements.txt "$RELEASE_DIR/"

ln -sfn "$RELEASE_DIR" "$DEPLOY_ROOT/current"
echo "current -> $(readlink "$DEPLOY_ROOT/current")"

echo "Smoke test of deployed app:"
OUTPUT=$(python3 "$DEPLOY_ROOT/current/app.py")
echo "$OUTPUT"
[ "$OUTPUT" = "Hello, World from Maya Zeaiter!" ] || { echo "Smoke test FAILED"; exit 1; }
echo "Deployment successful."
