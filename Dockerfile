FROM busybox:ubuntu-14.04
MAINTAINER M2i3

# Install ngrok
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /
RUN unzip ngrok-stable-linux-amd64.zip -d /bin && \
 rm -f ngrok-stable-linux-amd64.zip && \
 echo "web_addr: 0.0.0.0:4040" > /etc/ngrok.conf

EXPOSE 4040  
 
EXPOSE 4040

CMD /bin/ngrok -config /etc/ngrok.conf -log stdout $(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'):$HTTP_PORT
