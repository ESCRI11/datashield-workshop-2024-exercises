devtools::install("dsServer")
devtools::install("dsClient")

library(dsBase)
library(dsBaseClient)
library(dsServer)
library(dsClient)

data("iris")
myTable <- iris
builder <- DSI::newDSLoginBuilder()
dslite.server <- DSLite::newDSLiteServer(
  tables=list(myTable = myTable),
  config = DSLite::defaultDSConfiguration(
    include=c("dsBase", "dsServer")
  )
)
builder$append(
  server = "server1",
  url = "dslite.server",
  table = "myTable",
  driver = "DSLiteDriver"
)
logindata.dslite <- builder$build()
conns <- DSI::datashield.login(
  logins = logindata.dslite,
  assign=T,
  symbol = "myTable_table"
)

ds.getColnames("myTable_table")
