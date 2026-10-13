FROM docker.io/library/python:3.13-slim
RUN python3 - <<'PY'
import socket, urllib.request

def reaches(url):
    try:
        urllib.request.urlopen(url, timeout=5)
        return True
    except Exception as error:
        print(f"{url}: refused or no answer ({type(error).__name__})")
        return False

assert reaches("https://pypi.org/simple/"), "the build must reach the public internet"
assert not reaches("http://169.254.169.254/latest/meta-data/"), "REACHED the instance metadata"
assert not reaches("https://kubernetes.default.svc/"), "REACHED the cluster API server"
print("egress probe passed")
PY
CMD ["python3", "-m", "http.server", "8080"]
