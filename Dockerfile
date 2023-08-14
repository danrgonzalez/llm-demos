FROM continuumio/miniconda3

SHELL ["/bin/bash", "-c"]

ENV PYTHONPATH=/

ADD environment.yml /environment.yml

RUN conda update -n base conda
RUN conda env create -f environment.yml && conda clean -a

ADD ./demo /demo
#ADD ./app /app
#ADD ./tests /tests
#ADD ./notebooks /notebooks
#ADD ./config /config
#ADD ./models /models

WORKDIR /

ENTRYPOINT source activate llm-demos && jupyter lab

#ENTRYPOINT source activate llm-demos && python test/test.py

#ENTRYPOINT source activate llm-demos && python app/main.py
