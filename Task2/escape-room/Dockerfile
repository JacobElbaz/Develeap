FROM ubuntu:16.04
RUN useradd -ms /bin/bash escape
WORKDIR /home/escape
COPY escapeRoom escapeRoom
COPY .buildEscapeRoom.sh .
RUN chmod +x .buildEscapeRoom.sh && ./.buildEscapeRoom.sh
RUN rm .buildEscapeRoom.sh
COPY .motd.txt /home/escape/escapeRoom/welcome.txt
COPY .motd.txt /etc/motd
RUN echo "cat /etc/motd" >> /home/escape/.bashrc
USER escape
WORKDIR /home/escape/escapeRoom
ENTRYPOINT ["bash"]

