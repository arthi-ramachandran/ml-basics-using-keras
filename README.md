# ML Basics using Keras

Working through the **"ML basics with Keras"** tutorials from the official
TensorFlow documentation.

## Notebooks

| File | Tutorial | Dataset | Notes |
|------|----------|---------|-------|
| `01_basic_classification.ipynb` | [Basic classification](https://www.tensorflow.org/tutorials/keras/classification) | Fashion MNIST | Dense network, ~88% test accuracy |

## Running the notebooks

This repo is self-contained: it has its own virtualenv in `.venv/` (gitignored)
and a dedicated Jupyter kernel named **Python (ml-basics-keras)**.

### Run a notebook end-to-end (headless)

```bash
./run.sh 01_basic_classification.ipynb
```

This activates `.venv`, sets the SSL cert bundle, and executes the notebook
in place with the `ml-basics-keras` kernel.

### Run interactively

```bash
source .venv/bin/activate
jupyter lab   # open the notebook, pick the "Python (ml-basics-keras)" kernel
```

### Setting it up from scratch (e.g. after a fresh clone)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install tensorflow matplotlib ipykernel
python -m ipykernel install --user --name ml-basics-keras --display-name "Python (ml-basics-keras)"
```

### macOS note

The python.org framework Python ships without root certificates, so dataset
downloads (e.g. Fashion MNIST) fail with `CERTIFICATE_VERIFY_FAILED`. Each
notebook includes a cell near the top that points `SSL_CERT_FILE` at certifi's
bundle to fix this.

## License & attribution

Adapted from [tensorflow/docs](https://github.com/tensorflow/docs) under the
Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).
