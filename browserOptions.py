
from selenium import webdriver
def Get_Proxy_Option(url):
    PROXY = url # IP:PORT or HOST:PORT
    print(PROXY)
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--proxy-server=%s' % PROXY)
    #chrome_options.add_argument("--ignore-certificate-errors")

    return chrome_options

def Get_Proxy_Option_Firefox(url):

    proxy = url

    firefox_capabilities = webdriver.DesiredCapabilities.FIREFOX
    firefox_capabilities['marionette'] = True

    firefox_capabilities['proxy'] = {
        "proxyType": "MANUAL",
        "httpProxy": proxy,
        "ftpProxy": proxy,
        "sslProxy": proxy
    }
    return  firefox_capabilities