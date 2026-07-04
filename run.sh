#!/usr/bin/env bash
# Run a notebook in this repo end-to-end using its own venv/kernel.
# Usage: ./run.sh 01_basic_classification.ipynb
set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$HERE/.venv/bin/activate"
# python.org framework Python lacks root certs; use certifi's bundle so
# Keras dataset downloads (e.g. Fashion MNIST) pass SSL verification.
export SSL_CERT_FILE="$(python -c 'import certifi; print(certifi.where())')"
export REQUESTS_CA_BUNDLE="$SSL_CERT_FILE"
NB="${1:-01_basic_classification.ipynb}"
jupyter nbconvert --to notebook --execute --inplace \
  --ExecutePreprocessor.kernel_name=ml-basics-keras \
  --ExecutePreprocessor.timeout=600 "$HERE/$NB"
