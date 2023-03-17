FROM ubuntu:jammy
RUN apt update && apt upgrade -y
RUN apt-get install git gh make parallel jq -y

RUN git clone https://github.com/JosiahSiegel/git-secrets.git
RUN make -C /git-secrets install
COPY lib/* /

ENTRYPOINT ["bash", "/scan.sh"]
