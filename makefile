rdf_dataset=./datasets/vc-db-1.rdf
sparql_test_query=./queries/test.rq
sparql_main_query=./queries/main.rq

all: main

#The query file used to go through the tutorial
main:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --data=$(rdf_dataset) --query=$(sparql_main_query)

#To ensure that the container works as intended
#Expect:
# ---------------------------------
# | x                             |
# =================================
# | <http://somewhere/JohnSmith/> |
# ---------------------------------
test:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --data=$(rdf_dataset) --query=$(sparql_test_query)	
