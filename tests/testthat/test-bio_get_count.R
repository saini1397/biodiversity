

# Create a Dummy dataframe to test.

df1 <- tibble(Biodiversity=c('Animal','Animal','Animal','Bird'),obs=c(101,102,103,104)) 


test_that("bio_get_count working fine", {
  expect_equal(bio_get_count(df=df1,group_var=Biodiversity),tibble(Biodiversity=c("Animal","Bird"),n=c(3,1)))
})


test_that("bio_get_count not working fine with missing column", {
  expect_error(bio_get_count(df=df1,group_var=Cat1))
})

test_that("bio_get_count working fine", {
  expect_identical(unique(bio_get_count(df=df1,group_var=Biodiversity)$Biodiversity),c("Animal","Bird"))
})

