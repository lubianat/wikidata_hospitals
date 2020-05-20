library("WikidataQueryServiceR")

country = "Q155"

get_hospitals_by_country_id <- function(country_id){
  query_code = paste0('
SELECT ?item ?itemLabel ?countryLabel ?administrativeUnitLabel
WHERE 
{
  ?item wdt:P31/wdt:P279* wd:Q16917.
  ?item wdt:P17 wd:', country_id, '.
  ?item wdt:P131 ?administrativeUnit.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en,pt,pt-br". }
}
')
  
  return(query_wikidata(query_code))
}



br_hospitals = get_hospitals_by_country_id(country)

br_hospitals
