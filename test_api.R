library(httr)
library(jsonlite)

base_url <- paste0("http://localhost:", Sys.getenv("APP_PORT", "8000"))

# Test the root endpoint
test_root <- function() {
  response <- GET(base_url)
  content <- content(response, "parsed")
  print("Root endpoint test:")
  print(content)
}

# Test the test endpoint
test_test_endpoint <- function() {
  response <- GET(paste0(base_url, "/test"))
  content <- content(response, "parsed")
  print("Test endpoint test:")
  print(content)
}

# Test the health endpoint
test_health_endpoint <- function() {
  response <- GET(paste0(base_url, "/health"))
  content <- content(response, "parsed")
  print("Health endpoint test:")
  print(content)
}

# Run tests
test_root()
test_test_endpoint()
test_health_endpoint()

print("All tests completed.")
