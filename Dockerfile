ARG UBUNTU_VERSION=18.04
FROM ubuntu:${UBUNTU_VERSION}

ARG USE_PYTHON_3_NOT_2=True
ARG _PY_SUFFIX=${USE_PYTHON_3_NOT_2:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

RUN apt-get update && apt-get install -y \
    ${PYTHON} \
    ${PYTHON}-pip

RUN ${PIP} install --upgrade \
    pip \
    setuptools

RUN ${PIP} install tensorflow \
  jupyter \
  jupyterlab \
  seaborn \
  scipy \
  scikit-learn \
  dateutils

RUN mkdir /notebooks && chmod a+rwx /notebooks
RUN mkdir /.local && chmod a+rwx /.local
WORKDIR /notebooks
EXPOSE 8888

CMD ["bash", "-c", "jupyter lab --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root"]
