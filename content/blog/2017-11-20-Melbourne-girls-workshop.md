---
author: "Di Cook"
banner: "/images/cupcakes.jpg"
categories: ["education","software"]
date: 2017-11-20
description: "Girls Coding Workshop, Melbourne"
tags: ["software", "teaching", "education", "community","training"]
title: "Girls Coding Workshop, Melbourne"
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


The first girls R coding workshop was held at the Kathleen Symes library in Melbourne, Nov Oct 28, 2017. The girls learned about tidy data concepts, wrangling data tools, and built a shiny app to explore standardised test data from the 2015 OECD Programme for International Student Achievement. One of the apps developed can be viewed at [https://t.co/zlw3HGzOaR](https://t.co/zlw3HGzOaR).

And we had lamingtons, upside down R cupcakes (R downunder) for morning tea, and pizzas for lunch.

![](/images/Melb_HS.jpg)
![](/images/Melb_HS2.jpg)

Keep an eye on [https://forwards.github.io/edu/](https://forwards.github.io/edu/) for announcements about more workshops. 
