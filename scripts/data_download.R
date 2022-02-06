#### Preamble ####
# Purpose: Download data from opentoronto
# Author: Jacob Yoke Hong Si
# Data: 2nd Feb 2021
# Contact: jacobyh.si@mail.utoronto.ca
# License: MIT
# Pre-requisites: 

#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Data Download ####
# From https://open.toronto.ca/dataset/covid-19-cases-in-toronto/

# Datasets are grouped into 'packages' that have multiple datasets also called
# 'resources' that are relevant to that topic. So we first look at the package using a unique key
# that we obtain from the datasets webpage. (see above)

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")

# We need the unique key from that list of resources
# There is only one resource so get_resources() will load that
# If there is more than one resource, we will need filter or specify
covid_data <- resources %>% 
  get_resource()

#### Save Data ####
write_csv(covid_data, "inputs/data/covid_data.csv")






         