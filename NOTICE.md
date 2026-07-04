# Attribution

This repository adapts material from the official TensorFlow documentation:

- **Source:** [tensorflow/docs](https://github.com/tensorflow/docs) —
  `site/en/tutorials/keras/classification.ipynb`
- **Original notebook:** [Basic classification: Classify images of clothing](https://www.tensorflow.org/tutorials/keras/classification)

The TensorFlow documentation is licensed under:
- Code: **Apache License 2.0** (see [LICENSE](LICENSE))
- Prose/documentation content: **Creative Commons Attribution 4.0** (CC BY 4.0)

Copyright 2018 The TensorFlow Authors. The original Apache license header is
retained in the first cells of the notebook.

## Local modifications

- Added an SSL-certificate fix cell so the Fashion MNIST dataset downloads on
  macOS (python.org framework Python lacks root certs).
- Set the notebook kernel to `Python (ml-basics-keras)`.
