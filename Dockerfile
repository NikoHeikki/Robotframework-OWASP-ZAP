FROM elgalu/selenium
USER seluser
# Copy the Owasp Zed Attack Proxy Root CA certificate inside container 
COPY ./owasp-zap-root.pem /home/seluser/owasp-zap-root.pem
# Install necessary stuff into container 
RUN sudo apt-get update -y
RUN sudo apt-get install libnss3-tools -y
RUN sudo apt-get install vim -y
# Create folders and add right permissions
RUN sudo mkdir -p /home/seluser/.pki/nssdb
RUN sudo chmod 755 /home/seluser/.pki
RUN sudo chmod 755 /home/seluser/.pki/nssdb
RUN sudo chown seluser:seluser /home/seluser/.pki
RUN sudo chown seluser:seluser /home/seluser/.pki/nssdb
# Import OWASP ZAP certificate with certutil
RUN certutil -d /home/seluser/.pki/nssdb -N --empty-password
RUN certutil -d sql:/home/seluser/.pki/nssdb -A -n 'OWASP Zed Attack Proxy Root CA' -i /home/seluser/owasp-zap-root.pem -t TCP,TCP,TCP
RUN certutil -d sql:/home/seluser/.pki/nssdb -L
RUN whoami
