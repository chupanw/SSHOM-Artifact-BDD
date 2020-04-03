# Generating BDDs Using VarexC

This zip file contains artifacts for generating BDDs for the following
systems:

* Triangle
* Monopoly
* Chess
* Validator
* Cli

## Requirement

JDK 8 or later

## Steps

Execute the following commands in terminal:

* Triangle: `./bdd.sh triangle`
* Monopoly: `./bdd.sh monopoly`
* Chess: `./bdd.sh chess`
* Validator: `./bdd.sh validator`
* Cli: `./bdd.sh cli`

Variational execution runs the test cases that come with each system and
generate BDDs in the current folder, one `txt` file per test case. Generated
BDDs can be used to compute a complete set of SSHOMs via SAT solving, the steps
of which are not include in this zip file, but are part of the `SSHOM-Finder`
artifact, which we also share. The `SSHOM-Finder` artifact contains
pre-computed BDDs already, so this zip file is only relevant for those who are
curious about how BDDs are generated. 
