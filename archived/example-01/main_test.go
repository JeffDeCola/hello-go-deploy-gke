// hello-go-deploy-gke main.go

// hello-go-deploy-gae main.go

package main

import (
	"net/http"
	"sync"
	"testing"
)

func TestCounter_Result(t *testing.T) {
	type fields struct {
		sum  int
		lock sync.RWMutex
	}
	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			c := &Counter{
				sum:  tt.fields.sum,
				lock: tt.fields.lock,
			}
			if got := c.Result(); got != tt.want {
				t.Errorf("Counter.Result() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestCounter_addThis(t *testing.T) {
	type fields struct {
		sum  int
		lock sync.RWMutex
	}
	type args struct {
		i int
	}
	tests := []struct {
		name   string
		fields fields
		args   args
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			c := &Counter{
				sum:  tt.fields.sum,
				lock: tt.fields.lock,
			}
			c.addThis(tt.args.i)
		})
	}
}

func Test_loopForever(t *testing.T) {
	tests := []struct {
		name string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			loopForever()
		})
	}
}

func Test_main(t *testing.T) {
	tests := []struct {
		name string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			main()
		})
	}
}

func Test_handleJeff(t *testing.T) {
	type args struct {
		w http.ResponseWriter
		r *http.Request
	}
	tests := []struct {
		name string
		args args
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			handleJeff(tt.args.w, tt.args.r)
		})
	}
}
