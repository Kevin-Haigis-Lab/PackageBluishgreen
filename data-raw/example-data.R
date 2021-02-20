## Code to prepare some example datasets.

library(dplyr)

data_dir <- file.path("inst", "extdata")
pancreas_dir <- file.path(data_dir, "unmicst-OP1181_pancreas_TUNEL_01.csv")

pancreas <- readr::read_csv(pancreas_dir) %>%
  janitor::clean_names() %>%
  select(
    cell_id,
    x = x_centroid,
    y = y_centroid,
    dapi = dapi_nuclei_mask,
    fitc = fitc_nuclei_mask,
    area:orientation
  )

usethis::use_data(pancreas, overwrite = TRUE)
