setwd("./Exercise-4")
devtools::install("dsServer")
devtools::install("dsClient")

library(dsBase)
library(dsBaseClient)
library(dsServer)
library(dsClient)

data("iris")
myVector <- iris$Sepal.Length
myVector1 <- myVector[1:100]
myVector2 <- myVector[101:111]
myVector3 <- myVector[112:150]
builder <- DSI::newDSLoginBuilder()
dslite.server <- DSLite::newDSLiteServer(
  tables=list(
    myVector1 = myVector1,
    myVector2 = myVector2,
    myVector3 = myVector3
  ),
  config = DSLite::defaultDSConfiguration(
    include=c("dsBase", "dsServer")
  )
)
builder$append(
  server = "server1",
  url = "dslite.server",
  table = "myVector1",
  driver = "DSLiteDriver"
)
builder$append(
  server = "server2",
  url = "dslite.server",
  table = "myVector2",
  driver = "DSLiteDriver"
)
builder$append(
  server = "server3",
  url = "dslite.server",
  table = "myVector3",
  driver = "DSLiteDriver"
)
logindata.dslite <- builder$build()
conns <- DSI::datashield.login(
  logins = logindata.dslite,
  assign = T,
  symbol = "myVector"
)

ds.mean2("myVector1")

mean(myVector)
