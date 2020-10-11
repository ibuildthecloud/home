#!/bin/bash

cat << EOF
type ${1} struct {
	metav1.TypeMeta   \`json:",inline"\`
	metav1.ObjectMeta \`json:"metadata,omitempty"\`

	Spec ${1}Spec \`json:"spec"\`
	Status ${1}Status \`json:"status"\`
}

type ${1}Spec struct {
}

type ${1}Status struct {
	Conditions []genericcondition.GenericCondition \`json:"conditions,omitempty"\`
}
EOF
