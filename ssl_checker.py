import requests


def verify_ssl_certificate(url):
    response = requests.get(url)
    response.raise_for_status()
    print("Certificate is valid.")


if __name__ == "__main__":
    verify_ssl_certificate("https://iabhinav.in")