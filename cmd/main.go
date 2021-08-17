package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/satori/go.uuid"
)

func main() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", readinessCheck)
	router.HandleFunc("/generate", generateUUIDv4)
	log.Fatal(http.ListenAndServe(":8080", router))
}

func readinessCheck(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "OK")
}

func generateUUIDv4(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, uuid.NewV4().String())
}
