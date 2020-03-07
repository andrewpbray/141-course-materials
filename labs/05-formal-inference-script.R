library(tidyverse)
library(oilabs)
library(infer)
data(yawn)

# Calculate for each group, the proportion 
# that yawned

obs_stat <- yawn %>%
  specify(response ~ group, success = "no yawn") %>%
  calculate(stat = "diff in props",
            order = c("no stimulus", "stimulus"))

# H_0: yawning is independent of being in the seeded group
# diff_in_props = d = 0

# H_A: yawning is dependent on being in the seeded group
# diff_in_props = d != 0

set.seed(392)
null <- yawn %>%
  specify(response ~ group, success = "no yawn") %>%
  hypothesize(null = "independence") %>%
  generate(reps = 100, type = "permute") %>%
  calculate(stat = "diff in props",
            order = c("no stimulus", "stimulus"))

# Visualize p-value
null %>%
  visualize() +
  shade_p_value(obs_stat, direction = "two_sided")

# Get p-value
null %>%
  get_p_value(obs_stat, direction = "two_sided")
