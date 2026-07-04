# ML Basics using Keras

Working through the **"ML basics with Keras"** tutorials from the official
TensorFlow documentation.

## Notebooks

| File | Tutorial | Dataset | Notes |
|------|----------|---------|-------|
| `01_basic_classification.ipynb` | [Basic classification](https://www.tensorflow.org/tutorials/keras/classification) | Fashion MNIST | Dense network, ~88% test accuracy |

## Running the notebooks

These notebooks are set to use a Jupyter kernel named **Python (tf-tutorials)**
backed by a virtualenv with TensorFlow.

### If you already have the `tf-tutorials` kernel

Open a notebook and pick the **Python (tf-tutorials)** kernel — done.

### Setting it up from scratch

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install tensorflow matplotlib ipykernel
python -m ipykernel install --user --name tf-tutorials --display-name "Python (tf-tutorials)"
jupyter lab   # then open the notebook and select the kernel
```

### macOS note

The python.org framework Python ships without root certificates, so dataset
downloads (e.g. Fashion MNIST) fail with `CERTIFICATE_VERIFY_FAILED`. Each
notebook includes a cell near the top that points `SSL_CERT_FILE` at certifi's
bundle to fix this.

## License & attribution

Adapted from [tensorflow/docs](https://github.com/tensorflow/docs) under the
Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).
