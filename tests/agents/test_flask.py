import pytest
import requests


def url_tester(url):
    r = requests.get(url=url)
    assert r.status_code == 200, "looks like not 200"


@pytest.mark.flask
def test_flask_app(flask):
    url_tester(flask.address)


@pytest.mark.flask
def test_flask_foo(flask):
    url_tester(flask.foo)


def test_flask_bar(flask):
    url_tester(flask.bar)


# def test_flask_oof_fail(flask):
#     url_tester(flask.oof)


def test_flask_oof(flask):
    with pytest.raises(Exception):
        url_tester(flask.oof)