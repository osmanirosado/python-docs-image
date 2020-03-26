# Python Documentation

A docker image with the documentation of Python.

## Description

### Run

To run the documentation of Python 3.8.2 on port 8088 execute.

```
docker run -p 8088:80 -d osmanirosado/python-docs:3.8.2
```

### Build

To build the documentation image for Python 3.8.2.

```[bash]
docker build --build-arg version=3.8.2 -t osmanirosado/python-docs:3.8.2 .
```

