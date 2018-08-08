FROM python:2.7-slim-jessie

RUN apt update && apt install --yes git cmake

RUN git clone -b v0.9.0 https://github.com/tensorflow/model-analysis.git

WORKDIR model-analysis/examples/chicago_taxi

RUN pip install -r requirements.txt

COPY ./preprocess.sh ./preprocess_pachyderm.sh
COPY ./train.sh ./train_pachyderm.sh