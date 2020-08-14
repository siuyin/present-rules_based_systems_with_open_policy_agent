package main

import "fmt"

type BuyFlatApplication struct{}
type ApplicationDecision struct{}

func main() {
	fmt.Println("Not the real HDB")
	app := BuyFlatApplication{}
	decision := OKToBuyFlat(&app)
	fmt.Printf("Your application result is: %v\n", decision)
}

func OKToBuyFlat(app *BuyFlatApplication) ApplicationDecision {
	// if-then-else logic here ...
	return ApplicationDecision{}
}
