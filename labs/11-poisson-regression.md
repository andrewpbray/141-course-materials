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
