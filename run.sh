#!/usr/bin/env bash
# Run a notebook in this repo end-to-end using the shared tf-tutorials venv.
# Usage: ./run.sh 01_basic_classification.ipynb
#
# This repo shares a single venv/kernel with ../tensorflow-tutorials to save
# disk space. If that venv is missing, recreate it per the README, or point
# SHARED_VENV below at your own venv.
set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHARED_VENV="${SHARED_VENV:-$HERE/../tensorflow-tutorials/.venv}"

if [ ! -d "$SHARED_VENV" ]; then
  echo "Shared venv not found at: $SHARED_VENV" >&2
  echo "Recreate it (see README) or set SHARED_VENV to your venv path." >&2
  exit 1
fi

source "$SHARED_VENV/bin/activate"
# python.org framework Python lacks root certs; use certifi's bundle so
# Keras dataset downloads (e.g. Fashion MNIST) pass SSL verification.
export SSL_CERT_FILE="$(python -c 'import certifi; print(certifi.where())')"
export REQUESTS_CA_BUNDLE="$SSL_CERT_FILE"
NB="${1:-01_basic_classification.ipynb}"
jupyter nbconvert --to notebook --execute --inplace \
  --ExecutePreprocessor.kernel_name=tf-tutorials \
  --ExecutePreprocessor.timeout=600 "$HERE/$NB"
