library(tidyverse)
fandango_2015 <- read_csv("data/fandango_score_comparison.csv")
ratings_2016  <- read_csv("data/movie_ratings_16_17.csv")
head(fandango_2015)
head(ratings_2016)
# Goal:
# Compare Fandango movie ratings from 2015 and 2016
# to check if rating behavior changed.
fandango_2015 <- fandango_2015 %>%
  select(FILM, Fandango_Stars, Fandango_votes)

ratings_2016 <- ratings_2016 %>%
  select(movie, fandango)
fandango_2015 <- fandango_2015 %>%
  filter(Fandango_votes > 30)
summary(fandango_2015$Fandango_Stars)
summary(ratings_2016$fandango)
table(fandango_2015$Fandango_Stars)
table(ratings_2016$fandango)
prop.table(table(fandango_2015$Fandango_Stars))
prop.table(table(ratings_2016$fandango))
ggplot() +
  geom_bar(data = fandango_2015,
           aes(x = Fandango_Stars),
           fill = "blue",
           alpha = 0.6) +
  geom_bar(data = ratings_2016,
           aes(x = fandango),
           fill = "red",
           alpha = 0.6) +
  labs(
    title = "Comparison of Fandango Movie Ratings (2015 vs 2016)",
    x = "Movie Rating",
    y = "Number of Movies"
  )
mean(fandango_2015$Fandango_Stars)
mean(ratings_2016$fandango)
# Conclusion:
# Movie ratings in 2015 were generally higher.
# After 2015, very high ratings reduced.
# This indicates improved accuracy and reduced rating inflation.
# Next Steps:
# - Analyze more years
# - Compare with IMDb or Rotten Tomatoes
# - Apply hypothesis testing
