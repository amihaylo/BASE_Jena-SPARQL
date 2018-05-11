# TEST files 
rdf_test_dataset=./datasets/vc-db-1.rdf
sparql_test_query=./queries/test.rq

#MAIN: Query files
rdf_main_dataset=./datasets/vc-db-3.ttl
sparql_main_query=./queries/main.rq

#MAIN2: Name graphs: https://jena.apache.org/tutorials/sparql_datasets.html
sparql_main2_query=./queries/main2.rq
rdf_default_graph=./datasets/ds-dft.ttl
rdf_named_graph1=./datasets/ds-ng-1.ttl
rdf_named_graph2=./datasets/ds-ng-2.ttl

all: main

#The query file used to go through the tutorial
main:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --data=$(rdf_main_dataset) --query=$(sparql_main_query)

#Running named graphs
main2:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --graph=$(rdf_default_graph) --namedgraph=$(rdf_named_graph1) --namedgraph=$(rdf_named_graph2) --query=$(sparql_main2_query)

#To ensure that the container works as intended
#Expect:
# ---------------------------------
# | x                             |
# =================================
# | <http://somewhere/JohnSmith/> |
# ---------------------------------
test:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --data=$(rdf_test_dataset) --query=$(sparql_test_query)	
