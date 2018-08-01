# encoding: UTF-8

import pytest
import $NAME$


def test_hello():
    client = $NAME$.app.test_client()
    response = client.get('/')
    assert b'Hello World!' in response.data
