FROM pytorch/pytorch

MAINTAINER Aishwarya Rajan "arajan@nyu.edu"

COPY ./pytorch-cli /workspace

RUN pip install --upgrade pip && pip install -r requirements.txt 

CMD ["python3", "main.py", "--epochs=1"]
