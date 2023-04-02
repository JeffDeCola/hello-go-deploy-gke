// hello-go-deploy-gke main.go

// hello-go-deploy-gae main.go

package main

import (
	"fmt"
	"log"
	"net/http"
	"sync"
	"time"
)

// Counter is the sum and mutex.
type Counter struct {
	sum  int
	lock sync.RWMutex
}

var counter = &Counter{}

// Result is the sum
func (c *Counter) Result() int {
	c.lock.RLock()
	count := c.sum
	c.lock.RUnlock()
	return count
}

// addThis adds
func (c *Counter) addThis(i int) {
	c.lock.RLock()
	c.sum = c.sum + i
	c.lock.RUnlock()
}

func loopForever() {
	counter.sum = 5
	var i = 1
	for true {
		counter.addThis(i)
		// fmt.Println("Jeff - The count is:", counter.sum)
		time.Sleep(2000 * time.Millisecond)
	}
}

func main() {

	go loopForever()

	http.HandleFunc("/", handleJeff)
	//appengine.Main()
	log.Fatal(http.ListenAndServe(":8080", nil))

}

func handleJeff(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world! - hello-go-deploy-gke example 01 - Using a docker container for gke")
	fmt.Fprintln(w, "The current count is", counter.Result())
}
