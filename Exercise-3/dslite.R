devtools::install("dsServer")
devtools::install("dsClient")

library(dsBase)
library(dsBaseClient)
library(dsServer)
library(dsClient)

data("iris")
exposures <- iris
builder <- DSI::newDSLoginBuilder()
dslite.server <- DSLite::newDSLiteServer(
  tables=list(exposures = exposures),
  config = DSLite::defaultDSConfiguration(
    include=c("dsBase", "dsServer")
  )
)
builder$append(
  server = "server1",
  url = "dslite.server",
  table = "exposures",
  driver = "DSLiteDriver"
)
logindata.dslite <- builder$build()
conns <- DSI::datashield.login(
  logins = logindata.dslite,
  assign=T,
  symbol = "exposures_table"
)

ds.getColnames("exposures_table")
