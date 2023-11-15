FROM node:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y emacs-nox vim tmux curl wget nano git default-jdk openssh-client python3
COPY src /xterm

WORKDIR /xterm
RUN yarn install --frozen-lockfile

RUN useradd -m student
ENTRYPOINT node server.js -w /home/student
