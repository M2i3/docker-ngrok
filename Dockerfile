FROM busybox:ubuntu-14.04
MAINTAINER M2i3

# Install ngrok
ADD https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip /
RUN unzip ngrok_2.0.19_linux_amd64.zip -d /bin && \
 rm -f ngrok.zip && \
 touch /.ngrok

CMD /bin/ngrok -config /.ngrok -log stdout $(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'):$HTTP_PORT
