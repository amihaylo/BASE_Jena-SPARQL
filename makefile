rdf_dataset=./datasets/vc-db-1.rdf
sparql_query=./q1.rq

run:
	docker run --rm -v $(PWD):/home/ -w /home/ stain/jena /jena/bin/sparql --data=$(rdf_dataset) --query=$(sparql_query)
