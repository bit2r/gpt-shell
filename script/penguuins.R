library(palmerpenguins)
library(tidyverse)

# 1. 데이터 나누기 --------------------------------------------------------------

species <- palmerpenguins::penguins %>%
  count(species) %>%
  pull(species) %>%
  as.character(.)

save_species <- function(species_name = "Adelie") {
  palmerpenguins::penguins %>%
    filter(str_detect(species, species_name)) %>%
    write_csv(glue::glue("data/penguin_{str_to_lower(species_name)}.csv"))
}

walk(species, save_species)

fs::dir_ls(path = "data/", glob="data/penguin_*.csv")

# 2. 데이터 나누기 --------------------------------------------------------------

## 첫번째 프롬프트
"펭귄 종별로 구분된 palmer penguins csv 파일이 세개 data/ 폴더안에 있습니다. \
각각의 파일명은 penguin_adelie.csv, penguin_chinstrap.csv, penguin_gentoo.csv 으로 \
종별 펭귄 개체수 빈도수를 계산하는 코드를 작성하세요."

## 두번째 프롬프트
"펭귄 종별로 구분된 palmer penguins csv 파일이 세개 data/ 폴더안에 있습니다. \
각각의 파일명은 penguin_adelie.csv, penguin_chinstrap.csv, penguin_gentoo.csv 으로 \
종은 species 첫번째 칼럼에 위치하고, 종별 펭귄 개체수 빈도수를 계산하는 코드를 작성하세요."

## 세번째 프롬프트
"펭귄 종별로 구분된 palmer penguins csv 파일이 세개 data/ 폴더안에 있습니다. \
각각의 파일명은 penguin_adelie.csv, penguin_chinstrap.csv, penguin_gentoo.csv 으로 \
종은 species 첫번째 칼럼에 위치하고, 첫번째 행은 칼럼명이고, 종별 펭귄 개체수 빈도수를 계산하는 코드를 작성하세요."



# 3. LA 범죄데이터셋 ------------------------------------------------------------
# https://catalog.data.gov/dataset/crime-data-from-2020-to-present
# https://data.lacity.org/Public-Safety/Crime-Data-from-2020-to-Present/2nrs-mtv8

crimes <- read_csv("data/Crime_Data_from_2020_to_Present.csv")

crimes %>%
  janitor::clean_names() %>%
  count(crm_cd, crm_cd_desc, sort = TRUE)

# awk -F ',' '{print $5}' crime_data.csv | sort | uniq -c | sort -nr

