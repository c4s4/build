package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func setupRouter() *gin.Engine {
	router := gin.Default()
	router.GET("/hello/:name", func(ctx *gin.Context) {
		name := ctx.Param("name")
		ctx.String(http.StatusOK, "Hello %s!", name)
	})
	return router
}

func main() {
	router := setupRouter()
	router.Run()
}
