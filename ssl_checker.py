import certifi
import ssl
import socket


def verify_ssl_certificate(hostname):
    context = ssl.create_default_context(cafile=certifi.where())

    with socket.create_connection((hostname, 443)) as sock:
        with context.wrap_socket(sock, server_hostname=hostname) as ssock:
            ssock.do_handshake()
            cert = ssock.getpeercert()
            print("Certificate is valid.")


if __name__ == "__main__":
    verify_ssl_certificate("iabhinav.in")