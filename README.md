# ML Basics using Keras

This repository is a beginner-friendly introduction to Machine Learning using TensorFlow and Keras. It explains the core concepts behind neural networks in simple language and provides hands-on examples that you can run and experiment with.

Whether you're new to AI or looking to understand how neural networks work, this tutorial walks through the building blocks step by step.

## What is Machine Learning?
Machine learning (ML) is a way of teaching computers how to learn patterns from data instead of writing explicit rules. For example, instead of writing rules to identify handwritten digits, we show the computer thousands of examples. The model learns from patterns and can predict a new digit which the model has never seen before.

Just like humans learn from experience, machine learning models learn from examples.

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
A neural network is the "brain" of a machine learning model. It's loosely inspired by how neurons connect in the human brain.

It's made of layers of small units called **neurons**. Each neuron takes some numbers as input, multiplies them by weights it has learned, adds them up, and passes the result on to the next layer. By stacking many of these layers, the network can learn to recognize complex patterns — like the shape of a handwritten digit or the features of a piece of clothing.

The network starts out knowing nothing (random weights). During **training**, it looks at examples, checks how wrong its guesses are, and slowly adjusts its weights to get better — a bit like tuning thousands of tiny dials until the answers come out right.

## What is a sequential model?
A **Sequential model** is the simplest way to build a neural network in Keras. It's just a stack of layers, one after another, where data flows straight through from the first layer to the last.

```python
model = tf.keras.Sequential([
    layer_1,
    layer_2,
    layer_3,
])
```

Think of it like an assembly line: the input goes in one end, each layer does its bit of work in order, and the prediction comes out the other end. It's perfect for beginners because you don't have to wire the layers together yourself — you just list them in order.

## What is a dense layer?
A **dense layer** (also called a fully-connected layer) is the most common building block of a neural network. "Dense" means every neuron in the layer is connected to *every* value from the previous layer — nothing is left out.

```python
tf.keras.layers.Dense(128, activation='relu')
```

Here, `128` is the number of neurons in the layer, and `activation='relu'` is a simple function that lets the network learn non-straight-line (non-linear) patterns. Stack a few dense layers together and the network can learn surprisingly rich relationships in the data.

In short: **neurons** make up a **dense layer**, dense layers stack into a **Sequential model**, and that model is a **neural network** you train with TensorFlow.


## Weights and Biases
Weights and biases are the two types of parameters that a neural network learns during training. Weights determine how important each input feature is. A larger weight means that input has a stronger influence on the prediction. Biases are extra values added to the weighted sum that help the neuron shift its output. They allow the model to make accurate predictions even when all input values are zero.
Simple example

Suppose you're predicting house prices using two features:
- House size
- Number of bedrooms

A neuron might compute:
Prediction=(Weight1*Size) + (Weight2*Bedrooms) + Bias

For example:
Weight for size = 200 (size has a strong effect)
Weight for bedrooms = 10 (smaller effect)
Bias = 50

Initially, these values are random. During training, the neural network repeatedly adjusts the weights and biases to reduce the loss, so its predictions become more accurate.

## Activation function
An activation function is a mathematical function applied to a neuron's output that helps a neural network learn complex patterns. Without activation functions, a neural network would behave like a simple linear model, no matter how many layers it had.
Think of a neuron like this -
Inputs
   │
Weights × Inputs + Bias
   │
Activation Function
   │
Output

ReLU -
ReLU is the most commonly used activation function in the hidden layers of neural networks.
Rule:
If the input is negative, output 0.
If the input is positive, output the same value.
Examples: 
| Input | Output |
| ----: | -----: |
|    -5 |      0 |
|    -1 |      0 |
|     0 |      0 |
|     3 |      3 |
|     8 |      8 |
Imagine a neuron detecting whether an image contains an edge.
If no edge is found (negative value), ReLU outputs 0.
If an edge is found (positive value), it passes the value forward.
This makes learning faster and helps deep networks train efficiently.
Common use: Hidden layers in most deep learning models.

Sigmoid -
The Sigmoid function converts any number into a value between 0 and 1.
For example:
| Input | Output |
| ----: | -----: |
|    -5 |   0.01 |
|    -2 |   0.12 |
|     0 |   0.50 |
|     2 |   0.88 |
|     5 |   0.99 |
The output can be interpreted as a probability.
Suppose you're predicting whether an email is spam. The model produces a value 2.2. After applying sigmoid, model produces 0.90. This means, 90% probability that email is spam. 
Common use cases - Binary classification(Yes/No, Spam/Not Spam, Fraud/Not Fraud).

Softmax -
Softmax is used when there are more than two possible classes.
Instead of producing one probability, it converts a list of scores (logits) into probabilities that sum to 100%. Suppose an image could be:
Cat
Dog
Bird
The model first produces logits:
| Class | Logit |
| ----- | ----: |
| Cat   |   5.2 |
| Dog   |   2.0 |
| Bird  |   0.5 |
After applying softmax, model produces -
| Class | Probability |
| ----- | ----------: |
| Cat   |         93% |
| Dog   |          6% |
| Bird  |          1% |
The model predicts Cat because it has the highest probability.
Common use: Multi-class classification (e.g., classifying handwritten digits 0–9, identifying animals, predicting the next word in a language model).

| Activation Function | Output Range                         | Common Use                 |
| ------------------- | ------------------------------------ | -------------------------- |
| **ReLU**            | 0 to ∞                               | Hidden layers              |
| **Sigmoid**         | 0 to 1                               | Binary classification      |
| **Softmax**         | Multiple probabilities that sum to 1 | Multi-class classification |

Example Neural Network
model = Sequential([
    Flatten(input_shape=(28,28)),
    Dense(128, activation='relu'),
    Dense(10, activation='softmax')
])
Here's what each layer does:

- Flatten converts the 28×28 image into a 784-element vector.
- Dense(128, activation='relu') learns useful features from the image. ReLU helps the network capture complex patterns.
- Dense(10, activation='softmax') outputs the probabilities for the 10 possible digit classes (0–9).

# Logits
Logits are the raw confidence scores a neural network produces before converting them into probabilities.
Suppose the model is completing the sentence:
"The capital of France is"
The model first assigns logits like this -
| Word   | Logit |
| ------ | ----: |
| Paris  |  12.5 |
| London |   6.2 |
| Berlin |   5.8 |
These are just confidence scores. After softmax, they become:
| Word   | Probability |
| ------ | ----------: |
| Paris  |         99% |
| London |        0.7% |
| Berlin |        0.3% |
The model then chooses "Paris".


# Loss function


# Epochs

# Regression

# Classification


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
