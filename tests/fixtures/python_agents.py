import pytest
import os


@pytest.fixture(scope="session")
def flask():
    return Agent("flask",
                 f'http://{os.getenv("FLASK_SERVER")}',
                 '8001')


class Agent:
    def __init__(self, app_name, url, port):
        self.app_name = app_name
        self.url = url
        self.port = port
        self.address = f"{self.url}:{self.port}"
        self.foo = self.endpoint("foo")
        self.bar = self.endpoint("bar")
        self.oof = self.endpoint("oof")

    def endpoint(self, path):
        return f"{self.address}/{path}"


