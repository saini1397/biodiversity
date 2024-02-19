#Use this to Load the data from CSV


library(readr)

saveRDS(read_csv("C:/Users/Ayansh/Downloads/biodiversity-data/occurence.csv",n_max=500000),file="occurence.rds", compress = TRUE )


#saveRDS(read_csv("C:/Users/Ayansh/Downloads/biodiversity-data/multimedia.csv",n_max=500),file="multimedia.rds", compress = TRUE )
