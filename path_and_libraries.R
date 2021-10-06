# Load the DBI package
library(DBI)

# Edit dbConnect() call, custom the fields marked by XX
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "XX", 
                 host = "XX.com", 
                 port = XX,
                 user = "XX",
                 password = "XX")

# Build a vector of table names: tables
tables <- dbListTables(con )

# Display structure of tables
str(tables)

# Import the users table from XX: users
users <- dbReadTable(con, "users")

# Import all columns of comments where user_id is 1: 
id_1 <- dbGetQuery(con, " SELECT * FROM comments WHERE user_id=1 ")

# Import post column of comments where date is higher than '2016-07-01': 
new <- dbGetQuery(con, "SELECT post FROM comments WHERE date >'2016-07-01'")

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 6")

# Use dbFetch() twice
dbFetch(res,n=2)
dbFetch(res)


# Clear res
dbClearResult(res)

# Load the readr package
library(readr)

# Import the csv file: 
url_csv <- "http://XX.csv"

data_csv <- read_csv(url_csv)

# Import the txt file: 
url_delim <- "http://XX.txt"
 data_text <- read.delim(url_delim)


# Path to the data file: path
path <- file.path("data", "data.txt")

# Import the data.txt file: data
data <- read.table(path, 
                      sep = '\t', 
                      col.names = c("type", "name", "sodium"))

# Call head() on hotdogs
head(data)


# Load the readxl and gdata package
library(readxl)
library(gdata)

# Specification of the url: 
url_xls <- "http://XX.xls"

# Import the .xls file with gdata: 
excel_gdata <- read.xls(url_xls)

# Download file behind URL:
download.file(url_xls, destfile = "local.xls")

# Import the local.xls file with readxl: 
data_readxl <- read_excel("local.xls")


# load the data.table package using library()
library(data.table)

# Import columns 1 and 3 of data.csv:
data_table <- fread("potatoes.csv", select=c(1,3))
