FROM rocker/tidyverse:4.1.0

WORKDIR /app

COPY . /app

# Install required packages
RUN R -e "install.packages(c('plumber', 'metafor', 'assertthat', 'readxl', 'jsonlite', 'ggplot2', 'dplyr', 'httr', 'testthat', 'checkmate'), repos='http://cran.rstudio.com/')"

# Set default environment variable for APP_PORT
ENV APP_PORT=8000

EXPOSE $APP_PORT

# Add healthcheck
HEALTHCHECK CMD curl -f http://localhost:$APP_PORT/health || exit 1

# Run tests and then start the API
CMD ["sh", "-c", "Rscript tests/run_tests.R && Rscript run_api.R"]
