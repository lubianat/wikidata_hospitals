library("WikidataQueryServiceR")


get_all_hospitals <- function(){
  
  
  
}

hospitals_by_country_and_location <- query_wikidata('
SELECT ?item ?itemLabel ?countryLabel ?administrativeUnitLabel
WHERE 
{
  ?item wdt:P31/wdt:P279* wd:Q16917.
  ?item wdt:P17 ?country.
  ?item wdt:P131 ?administrativeUnit.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
}
')

write.csv(hospitals_by_country_and_location, file = "wikidata_query_for_hospitals_by_country and location.csv")
