package main

// 10 OMIT
import (
	"context"
	"fmt"

	"github.com/open-policy-agent/opa/rego"
)

// 20 OMIT
type BuyFlatApplication struct {
	Applicants []Applicant
}
type Applicant struct {
	ResidentStatus string
}

type ApplicationDecision struct {
	Approved bool
}

// 30 OMIT
func main() {
	fmt.Println("Closer to the real HDB")
	app := BuyFlatApplication{[]Applicant{
		Applicant{ResidentStatus: "pr"},
		Applicant{ResidentStatus: "pr"}, // change me
		Applicant{ResidentStatus: "other"},
	}}
	decision := OKToBuyFlat(&app)
	fmt.Printf("Your application result is: %#v\n", decision)
}

// 40 OMIT
func OKToBuyFlat(app *BuyFlatApplication) ApplicationDecision {
	rg := rego.New( // explain this structure
		rego.Query("data.hdb"),
		rego.Input(app),
		rego.Module("hdb_criteria.rego", `
package hdb
default atLeastOneCitizen = false

atLeastOneCitizen {
	input.Applicants[_].ResidentStatus == "citizen"
}
`))
	rs, err := rg.Eval(context.Background()) // rs: result set, has Expressions and Bindings
	if err != nil {
		fmt.Println(err)
	}

	var d ApplicationDecision
	d.Approved = rs[0]. // talk about interface{} and type assertions
				Expressions[0].
				Value.(map[string]interface{})["atLeastOneCitizen"].(bool)
	return d
}

// 50 OMIT
