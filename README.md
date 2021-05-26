# Robotframework-OWASP-ZAP
Run robotframework UI tests in Zalenium(Selenium Grid container version) with ability to proxy all tests http/https traffic to OWASP Zed Attack Proxy for passive/active scan, it injects ZAP's root CA certificate into Zalenium so you dont have to worry about ssl insecure certificate errors related to ZAP, like you would if you didnt trust the certificate. This demo runs ZAP and Zalenium as Docker containers.

## Run demo

### Clone this repository
```
git clone https://github.com/NikoHeikki/Robotframework-OWASP-ZAP.git
```

### Run start script
This will start ZAP container and wait for it to accept requests. When ZAP is ready, it curl's to get ZAP CA certificate and store it to file. Then script builds selenium container and injects certificate into it, using certutil. After that script will start also Zalenium.
```
./start-zap-zalenium.sh
```
### Access Zalenium and ZAP
Zalenium live view can be accessed from http://localhost:4444/grid/admin/live
ZAP api can be accessed from http://localhost:8080

### Run robot test
Robot test uses browserOptions.py library to handle browser proxy options. You can view test execution from Zalenium live view(link above), notice there are no ssl errors, since there is ZAP certificate imported into cert store. when test has ran, view sites test visited from http://localhost:8080/JSON/core/view/sites , you should see sites there where robot visited. You can use this information to run ZAP active scan.
```
robot browserTest.robot
```
