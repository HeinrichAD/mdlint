#!/usr/bin/env bash

set -exuo pipefail

VERSION="$NEW_VERSION"

UV_DRY_RUN_ARGS=()
if [[ "$DRY_RUN" == "true" ]]; then
    UV_DRY_RUN_ARGS+=("--dry-run")
fi


cp README.md npm/README.md
npm --prefix npm version "$VERSION"

cp README.md python/README.md
uv --directory python version "${UV_DRY_RUN_ARGS[@]}" "$VERSION"
