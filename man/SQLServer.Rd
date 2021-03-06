% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbi-classes.R, R/dbi-methods.R
\docType{methods}
\name{SQLServer}
\alias{SQLServer}
\alias{dbConnect,SQLServerDriver-method}
\title{Create a SQLServer driver}
\usage{
SQLServer(identifier.quote = "\\"")

\S4method{dbConnect}{SQLServerDriver}(drv, server, file = NULL,
  database = "", type = "sqlserver", port = "", properties = list())
}
\arguments{
\item{identifier.quote}{quote character for a SQL Server identifier can be a
double quotation mark (\code{\"}) which is the default.}

\item{drv}{An objected of class \code{\linkS4class{SQLServerDriver}}, or an
existing \code{\linkS4class{SQLServerConnection}}. If a connection,
the connection will be cloned.}

\item{server}{the server address or recognised alias thereof.}

\item{file}{defaults to using the server details file in
\code{$HOME/sql.yaml}. The server details including \code{type}, \code{port}
and any optional \code{properties} can be sourced from this file. If the
\code{server} name is found in \code{file}, the details therein are used
(and in particular, those provided in other arguments to this function are
ignored). The connection method prefers server details to be provided in
a \code{"sql.yaml"} file rather than provided as arguments to this function.
If you wish to specify the details as parameters, ensure that either the
\code{file} does not exist or that the \code{server} details are not in the
YAML file.}

\item{database}{the name of the database hosted on the \code{server}. If an
empty string, a connection to the default database on \code{server} is
assumed.}

\item{type}{the server type. Must be either \code{"sqlserver"} or
\code{"sybase"}. Defaults to \code{"sqlserver"}.}

\item{port}{the TCP/IP default port. This will be coerced to a string.
Defaults to \code{1433} if an empty string (jTDS behaviour).}

\item{properties}{One or more \href{http://jtds.sourceforge.net/faq.html}{optional connection properties.}
in a named list. Note if you intend to set the \code{useNTLMv2} property to \code{'true'}
from the default API value of \code{'false'}, you will need to make a specific
authentication driver available to the SQL Server driver, although this hasn't
worked particularly well in testing. See \code{\link{RSQLServer}} for more
details. Should you wish to use Windows authentication to connect to the server,
I recommend you set the following optional parameters: set \code{useNTLMv2} to
\code{'true'}, \code{domain} to your domain and \code{user} and
\code{password} to your username and password on \code{domain}. jTDS'
SSO functionality is flaky.}
}
\value{
An object of class \code{SQLServerDriver}.

a \code{\linkS4class{SQLServerConnection}}
}
\description{
This creates a SQL Server driver used to access SQL Server databases and is
based on the jTDS driver.

Connect to/disconnect from a SQL Server database.
}
\examples{
\dontrun{
SQLServer()
}
# View sql.yaml file bundled in package
file <- system.file("extdata", "sql.yaml", package = "RSQLServer")
readLines(file)
# Connect using ~/sql.yaml file
\dontrun{
if (have_test_server()) {
 dbConnect(RSQLServer::SQLServer(), "TEST")
}
# Example where ~/sql.yaml does not exist or where the server
# is not in the YAML file.
dbConnect(RSQLServer::SQLServer(), server="11.1.111.11", port=1434,
   properties=list(useNTLMv2="true", domain="myco", user="me",
     password="asecret"))
}
}
\references{
\href{http://jtds.sourceforge.net/}{jTDS project}
}

