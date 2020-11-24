FROM ubuntu:latest

RUN apt-get update \
    && apt-get -y install ansible git \
    && git clone https://github.com/bearddan2000/ansible-lib-playbooks.git \
    && chmod -R +x ansible-lib-playbooks \
    && ansible-playbook ansible-lib-playbooks/lang/cpp.yml

COPY bin/ .

RUN g++ -o main *.cpp \
    && chmod +x main*

CMD "./main"
