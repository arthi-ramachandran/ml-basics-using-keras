# ML Basics using Keras

Machine Learning Basics Using Keras is a beginner-friendly tutorial that explains neural networks, Dense layers, activation functions, logits, loss functions, optimizers, and model training using TensorFlow/Keras with hands-on examples.


## Notebooks

| File | Tutorial | Dataset | Notes |
|------|----------|---------|-------|
| `01_basic_classification.ipynb` | [Basic classification](https://www.tensorflow.org/tutorials/keras/classification) | Fashion MNIST | Dense network, ~88% test accuracy |

## Running the notebooks

To save disk space, this repo shares a single virtualenv/kernel with the
sibling [`tensorflow-tutorials`](https://github.com/arthi-ramachandran/tensorflow-tutorials)
repo. The kernel is named **Python (tf-tutorials)** and its venv lives at
`../tensorflow-tutorials/.venv`.

### Run a notebook end-to-end (headless)

```bash
./run.sh 01_basic_classification.ipynb
```

`run.sh` activates the shared venv, sets the SSL cert bundle, and executes the
notebook in place with the `tf-tutorials` kernel. Override the venv location
with `SHARED_VENV=/path/to/venv ./run.sh ...` if needed.

### Run interactively

The notebook sets the SSL cert env vars in a cell near the top, so you only
need to select the right kernel.

- **VS Code:** open the `.ipynb`, then pick the **Python (tf-tutorials)** kernel
  in the top-right kernel picker. No venv activation needed.
- **JupyterLab:** the shared venv doesn't include JupyterLab; install it first,
  then launch and select the **Python (tf-tutorials)** kernel:

  ```bash
  source ../tensorflow-tutorials/.venv/bin/activate
  pip install jupyterlab
  jupyter lab
  ```

### Setting it up from scratch (e.g. after a fresh clone)

If you don't have the shared venv/kernel, create one:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install tensorflow matplotlib ipykernel   # add jupyterlab for interactive use
python -m ipykernel install --user --name tf-tutorials --display-name "Python (tf-tutorials)"
# then run with: SHARED_VENV=.venv ./run.sh 01_basic_classification.ipynb
```

### macOS note

The python.org framework Python ships without root certificates, so dataset
downloads (e.g. Fashion MNIST) fail with `CERTIFICATE_VERIFY_FAILED`. Each
notebook includes a cell near the top that points `SSL_CERT_FILE` at certifi's
bundle to fix this.

## License & attribution

Adapted from [tensorflow/docs](https://github.com/tensorflow/docs) under the
Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).
