package main

import (
	"fmt"
	"net/http"
)

func setupHandler() *http.ServeMux {
	handler := http.NewServeMux()
	handler.HandleFunc("/hello", func(response http.ResponseWriter, request *http.Request) {
		name := request.URL.Query().Get("name")
		if name == "" {
			name = "World"
		}
		fmt.Fprintf(response, "Hello %s!", name)
	})
	return handler
}

func main() {
	handler := setupHandler()
	http.ListenAndServe(":8080", handler)
}
