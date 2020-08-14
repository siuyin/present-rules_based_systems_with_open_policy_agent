package main

import (
	"context"
	"fmt"

	"github.com/open-policy-agent/opa/rego"
)

type BuyFlatApplication struct {
	Applicants []Applicant
}
type Applicant struct {
	ResidentStatus string
}

type ApplicationDecision struct {
	Approved bool
}

func main() {
	fmt.Println("Closer to the real HDB")
	app := BuyFlatApplication{[]Applicant{
		Applicant{ResidentStatus: "pr"},
		Applicant{ResidentStatus: "citizen"},
		Applicant{ResidentStatus: "other"},
	}}
	decision := OKToBuyFlat(&app)
	fmt.Printf("Your application result is: %v\n", decision)
}

func OKToBuyFlat(app *BuyFlatApplication) ApplicationDecision {
	fmt.Printf("%#v\n", *app)
	rego := rego.New(
		rego.Query("data.hdb"),
		rego.Input(app),
		rego.Module("hdb_criteria.rego",
			` package hdb
default atLeastOneCitizen = false

atLeastOneCitizen {
	input.Applicants[_].ResidentStatus == "citizen"
}
`))
	rs, err := rego.Eval(context.Background()) // rs: result set
	if err != nil {
		fmt.Println(err)
	}
	var d ApplicationDecision
	d.Approved = rs[0].Expressions[0].Value.(map[string]interface{})["atLeastOneCitizen"].(bool)
	fmt.Println(d)
	return d
}
