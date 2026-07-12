# ML Basics using Keras

This repository is a beginner-friendly introduction to Machine Learning using TensorFlow and Keras. It explains the core concepts behind neural networks in simple language and provides hands-on examples that you can run and experiment with.

Whether you're new to AI or looking to understand how neural networks work, this tutorial walks through the building blocks step by step.

## What is Machine Learning?
Machine learning (ML) is a way of teaching computers how to learn patterns from data instead of writing explicit rules. For example, instead of writing rules to identify handwritten digits, we show the computer thounsands of examples. The model learns from patterns and can predict a new digit which the model has never seen before.

Just like humans learn from experinece, machine learning models learn from examples.

## What is TensorFlow?
TensorFlow is an open source machine learning framework developed by Google. 
It provides tools needed to:
- Build machine learning models
- Train models with data
- Evaluate their performance
- Make predictions on new data
Think of TensorFlow as an engine that performs all mathematical calculations behind machine learning.

## What is Keras?
Keras is a high-level API that runs on top of TensorFlow.

Instead of writing hundreds of lines of complex code, Keras lets you build neural networks using just a few lines.

Think of it like this:

TensorFlow = the engine of a car
Keras = the steering wheel and dashboard that make the car easy to drive

## What is a neural network?

## What is a sequential model?

## What is a dense layer?


## Notebooks

| File | Tutorial | Dataset | Notes |
|------|----------|---------|-------|
| `01_basic_classification.ipynb` | [Basic classification](https://www.tensorflow.org/tutorials/keras/classification) | Fashion MNIST | Dense network, ~88% test accuracy |
| `02_basic_regression.ipynb` | [Basic regression](https://www.tensorflow.org/tutorials/keras/regression) | Auto MPG | Predict fuel efficiency; DNN reaches ~1.7 MPG MAE |

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
