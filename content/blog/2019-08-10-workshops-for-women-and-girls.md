---
author: "Forwards Teaching Team"
banner: 
categories: ["education","software"]
date: 2019-08-10
description: "Workshops for Women and Girls"
tags: ["software", "teaching", "education", "community","training"]
title: "Workshops for Women and Girls"
tocify: true
#output: github_document
knit: (function(inputFile, encoding) {
    outputFile <- 
        knitr::knit(inputFile, 
                    output = paste0("../../../../website_source/content/blog/",
                                    gsub(".*/(.*).Rmd", "\\1", inputFile), 
                                    ".md"), encoding = encoding);
    out <- readLines(outputFile);
    out <- gsub("/images/", "//images/", out);
    writeLines(out, outputFile)
    })
---


# Workshops around the globe

Thanks to generous funding from the [R Consortium](https://www.r-consortium.org/projects/awarded-projects), Forwards has offered a series of workshops around the world to support the development of coding skills and increase the participation of women in the [R](https://www.r-project.org) community.  In the last year and a half, more than 10 workshops have engaged more than 100 high school students and women in the USA, Australia, New Zealand, and Europe.  Information about our series of workshops for women and girls can be found on the [Edu](https://forwards.github.io/edu/) section of the foRwards website.

Here are highlights from some of our recent workshops.
 
## New York City

Forwards members Emily Dodwell, Senior Inventive Scientist at AT&T Labs, and Joyce Robbins, Lecturer in Discipline in the Statistics Department at Columbia University, taught the first Forwards high school girls workshop in the United States on October 27, 2018 in New York City at AT&T.  Sixteen motivated, curious, and dedicated students worked diligently throughout a morning session to tackle an introduction to R, plots in ggplot2, Markdown, and manipulating data with dplyr.  Breakout groups over a lunch of pizza and salad discussed careers in data science; volunteers shared their career trajectories, and students asked questions and shared their experiences in high school STEM courses and extracurricular activities.
 
The six-hour workshop culminated in an afternoon hackathon, the theme of which was transportation in and around NYC.  Each pair of students chose one of three publicly available datasets—NYC Flights, Taxis, and CitiBike—to explore using the R skills they learned earlier in the day.  They then gave a five minute presentation highlighting visualizations they created that captured interested behavior or answered questions they formulated.
 
Many thanks to our volunteers from AT&T Labs Research, Cheryl Flynn and Ritwik Mitra, and from R-Ladies NYC, Soumya Kalra and Angeline Protacio.

## Brisbane

foRwards teamed up with [ACEMS](https://acems.org.au/home) to organise
the Brisbane Coding Workshop for Girls was held at
[River City Labs](https://www.rivercitylabs.net) March 30, 2019. There
were approximately 10 girls, and 5 helpers. The girls worked on
[instructional material](
(https://ebsmonash.shinyapps.io/sunny_tutorial/) ) on getting up and
running with R, and the tidyverse in the morning. We broke for a pizza
lunch, and in the afternoon the girls experimented with developing their own shiny app. A theme for the afternoon is “break it, fix it, break it, fix it, ...” to encourage experimenting, and trying new things. The girls used data from the [Atlas of Living Australia](https://www.ala.org.au), on wildlife sightings around Brisbane, as the basis for the app. There is an [R package](https://cran.r-project.org/web/packages/ALA4R/index.html) to interface with this extraordinary data resource. Two of the apps developed can be viewed from these links:

- [Claudia's app](https://ebsmonash.shinyapps.io/Claudia_brissy_wildlife/)
- [Rachel's app](https://ebsmonash.shinyapps.io/Rachel_brissy_wildlife/)

![](/images/brissy_girls.jpg)

## Auckland

foRwards teamed up with the Auckland University Department of
Statistics to offer two workshops, one day for women on package
development, run by Jenny Bryan and Hadley Wickham, and one day on web
app development for girls. The tutorial material for the girls
workshop can be seen at
(https://ebsmonash.shinyapps.io/kea_tutorial/), and two links to apps
developed by the girls are:

- [Booknerds app](https://ebsmonash.shinyapps.io/booknerds/)
- [Zoe's app](https://ebsmonash.shinyapps.io/pisa-zoe/)

# Resources

All the materials developed for workshops can be found at 

- [Girls workshops](https://github.com/forwards/teaching_examples)
- [Slides for package development](https://github.com/forwards/workshops)
- Earo Wang’s package development materials: [slides](http://slides.earo.me/rladies-pkg), [code](https://github.com/earowang/rladies-pkg)

