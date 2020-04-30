Lab 11: Poisson Regression
================

## Modeling Senior Theses

At the beginning of the semester, your group developed a plan to collect
a representative sample of theses from the thesis tower in order to
learn about the process of how senior theses are checked out. At the
time, most of you were new to the field of statistics and were just
getting your feet with R (and were probably thinking, “Why does he keep
saying chunk?”).

Three months later, now, you’ve become adept at writing code to wrangle,
visualize, and analyze data. The objective of this lab is to bring all
of that experience and skill to bear on the data that you collected
yourselves. Your data now lives in a data set called `theses` in the
`oilabs` package.

For our analysis, it will be interesting to pool our data with that
collected by previous years. It is stored in a comma separated values
file (.csv) on the course website and can be read in
with:

``` r
old_theses <- read.csv("https://raw.githubusercontent.com/intro-stats/141-course-materials/master/slides/files/sample_theses.csv")
```

1.  How do the data sets compare in terms of number of observations?
    Which variables are available in each?

### Exploratory Data Analysis

Let’s start with an investigation of `theses`, the data that you
collected at the beginning of the semester.

2.  Create three visualizations that help you learn about the phenomenon
    of senior thesis checkouts. As a reminder, here is a tool kit of
    `ggplot()` layers that you’ve used before:

<!-- end list -->

  - `geom_histogram()`
  - `geom_boxplot()`
  - `geom_density()`
  - `geom_bar()`
  - `geom_point()`
  - `geom_jitter()`
  - `geom_line()`
  - `facet_wrap()`

### Classical Inference

Despite its relatively small size, there are many inferential questions
that we can ask of these data to learn more about senior theses. Please
answer the two such questions below (one will be of your own choosing).
For each one, please:

  - Articulate the hypotheses of interest (if using the hypothesis
    testing framework) or the parameters of interest (if using the
    confidence interval framework)
  - Conduct the test or construct the interval using either a
    computational technique (`infer`) or a mathematical approximation
    (this will have you using functions like `pt()`, `pnorm()`,
    `pchisq()`, etc.).
  - Interpret the results in common language; what does this tell us
    about senior theses?
  - Do you expect your result to be precise or might it be a bit off?
    Describe why, considering the mathematical assumptions that go into
    these methods.

<!-- end list -->

3.  What is an interval estimate for the average number of times a
    thesis is checked out?

4.  Pose and answer an additional question (that doesn’t involve
    regression).

### Regression

While estimating the average number of checkouts of a thesis is useful,
we have a strong intuition that the older that the thesis is, the more
chances it will have to be checkout out. This has us thinking in a
regression setting now, and not about the `year` that a thesis is
published, but rather its `age`.

5.  Add a new variable to your dataframe that records the `age` of each
    thesis.

6.  Construct a scatterplot of the relationship between the number of
    checkouts and the age of a thesis. Describe the relationship that
    you see.

7.  Fit a least-squares regression model to this data and call it `m1`.
    Do you find evidence of a significant relationship between the age
    of a thesis and the number of checkouts?

8.  Create a residual plot and a qq-plot for this model. How much
    confidence does this give you about the validity of this model and
    the accuracy of the p-values?

9.  Fit a Poisson regression model called `m2` that predicts checkouts
    using age. Use the following code to plot both the Poisson
    regression (in red) and the least squares regression (in green) on
    the same scatterplot. Which model better describes the structure in
    the scatterplot?

<!-- end list -->

``` r
ggplot(theses, aes(x = age, y = checkouts)) +
  geom_jitter() +
  stat_function(fun = function(age) {coef(m1)[1] + coef(m1)[2] * age},
                color = "green", lwd = 2) +
  stat_function(fun = function(age) {exp(coef(m2)[1] + 
                                           coef(m2)[2] * age)},
                color = "red", lwd = 2) +
  theme_bw()
```

10. Does this second model find a significant relationship between the
    age of a thesis and the number of checkouts?

11. I spoke with the librarians and it turns out that it is only since
    1994 that theses have been in circulation and had their checkouts
    logged. Create a new dataset called `new_theses` that only contains
    those that were written since 1994. Refit both models (you should be
    able to copy and paste your code) and remake the plot from exercise
    9. How does this change your conclusion?
