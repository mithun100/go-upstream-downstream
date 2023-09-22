// upstream-app/main.go
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

const downstreamURL = "http://go-downstream-service"

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Made request to the downstream and waiting for response")
	resp, err := http.Get(downstreamURL)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	fmt.Fprintf(w, "Upstream App: Received response from Downstream App: %s", body)
}

func main() {
	http.HandleFunc("/", handler)

	http.ListenAndServe(":8080", nil)
}
