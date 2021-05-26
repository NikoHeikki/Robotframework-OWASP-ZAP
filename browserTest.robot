***Settings***
Library     BuiltIn
Library     SeleniumLibrary
Library     Collections
Library    ./browserOptions.py


*** Test Cases ***
Open Browser Chrome With Proxy To Owasp Zap

    ${options}=    Get_Proxy_Option     owasp-zap:8080
  
    ${chrome_options}=     Call Method     ${options}    to_capabilities
    Open Browser    http://www.github.com    browser=chrome    remote_url=http://localhost:4444/wd/hub    desired_capabilities=${chrome_options}

Open Browser Firefox With Proxy To Owasp Zap
    ${options2}=    Get_Proxy_Option_Firefox     owasp-zap:8080
    Open Browser    http://www.cnn.com    browser=firefox    remote_url=http://localhost:4444/wd/hub    desired_capabilities=${options2}
