# 1. Start from shiny-verse, which is officially multi-platform.
FROM rocker/shiny-verse:latest

# 2. Copy your application files into the container's app directory.
#    Shiny Server is already installed and configured in this image.
COPY . /srv/shiny-server/

# 3. Install ONLY the packages that are NOT already in the tidyverse/shiny-verse image.
RUN R -e "install.packages(c('thematic', 'DT', 'rhandsontable', 'car', 'psych', 'shinyWidgets', 'bsicons'), repos='https://cloud.r-project.org/')"

# 4. Expose the port Shiny Server listens on.
EXPOSE 3838