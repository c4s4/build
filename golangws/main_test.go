package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHandler(t *testing.T) {
	handler := setupHandler()
	recorder := httptest.NewRecorder()
	request, _ := http.NewRequest("GET", "/hello?name=Foo", nil)
	handler.ServeHTTP(recorder, request)
	if recorder.Code != 200 {
		t.Errorf("%d != 200\n", recorder.Code)
	}
	if recorder.Body.String() != "Hello Foo!" {
		t.Errorf("%s != 'Hello Foo!'", recorder.Body.String())
	}
}
