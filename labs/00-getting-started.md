Lab 0: Getting Started with RStudio and RMarkdown
================

The goal of this lab is very practical: learn where to find the labs
(you have succeeded\!), login to the RStudio server, create your first
RMarkdown file, knit it, then modify it.

Please make the following modifications to your lab file. Be sure to
knit it after every step to see what changed.

1.  Add `author: Your Name` on a new line within the header.

2.  Delete everything after the header.

3.  Add a new title `## My Homestate: homestate` (if you’re from abroad,
    use Oregon).

4.  Copy and paste the first paragraph from that state’s Wikipedia page
    into the Rmd and remove any weird formatting.

5.  Use the button at the top of the Rmd to insert a chunk and then copy
    the following code into it (swap out the `"OR"` with the two letter
    abbreviation of your state).

<!-- end list -->

``` r
library(usmap)
library(ggplot2)
plot_usmap(include = "OR")
```

Make one final knit, be sure you’re happy with your report, then
download it to your computer and upload it to gradescope.
