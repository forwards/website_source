---
title: Package Development Modules
author: 'Emma Rand and Mine Çetinkaya-Rundel'
date: '2021-05-06'
slug: package-development-modules
categories: [community, education, software]
tags: [community, training, programming, software]
description: 'About the project to turn the Forwards Package Development workshop into a set of more flexible and accessible modules'
banner: '/images/blog/package-development-modules/pkg-dev.gif'
tocify: no
draft: true
---

## Why create Package Development modules?

Forwards have delivered face-to-face one-day workshops in Package development, supported by a grant from the R Consortium, for several years. These are heavily based on the [R packages](https://r-pkgs.org/) book by Hadley Wickham and Jenny Bryan. These have worked well but our reach is limited because only those with access to teaching facilities can deliver the teaching and only those able to attend a face-to-face workshop can benefit from it. This misses a lot of people!
Recently, we have been modularising our materials into one hour long workshops that can be delivered online or in person. We hope this makes the material more usable to teachers and learners alike.

## Some module design principles

By December we had begun work on our module design principles. Just like the face-to-face-workshops, the modules would teach package development using `devtools` in RStudio. Our aim is to provide workflows to help people get started rather than an exhaustive understanding of the details (you can see [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) for that).

We wanted the collection of modules to be relatively short (~1 hr), 'stackable' and easy for others to use. We thought each module should:

-  be approximately 1hr
-  be discrete (standalone) but link to other modules  
-  have specified prerequisites and learning objectives  
-  be a complete resource for teaching (a person should be able to teach themselves from the material) and include tutor notes 
-  have a set of Rmd slides with comprehensive alt text and speaker notes
-  have slides with minimal content but detailed speaker notes  
-  use live coding, (minimise ‘lecturing’); include additional exercises for the speedy  

## Our Progress

In January, [Mine](https://twitter.com/minebocek) and [Emma](https://twitter.com/er13_r) set about developing a [module template](https://github.com/forwards/workshops/blob/master/package-dev-modules/slides/module-template.Rmd) and the first three modules. We limited tickets to 40 per workshop to enable us provide enough trouble-shooting help and allow some discussion.

The slide template uses [xaringan](https://github.com/yihui/xaringan), [xaringanthemer](https://github.com/gadenbuie/xaringanthemer) and [xaringanExtra](https://github.com/gadenbuie/xaringanExtra).

The three modules developed are:

1.  [Packages in a nutshell](https://forwards.github.io/workshops/package-dev-modules/slides/01-packages-in-a-nutshell/packages-in-a-nutshell.html#1) which covers where packages come from, where they live on your computer, package states and package components
2.  [Setting up your system](https://forwards.github.io/workshops/package-dev-modules/slides/02-setting-up-system/setting-up-system.html#1) which covers set up for developing an version controlled R package using RStudio, Git and GitHub
3.  [Your first package](https://forwards.github.io/workshops/package-dev-modules/slides/03-your-first-package/your-first-package.html#1) which walks you through making a minimal version controlled package linked to a remote repository on GitHub using the `devtools` approach.

## Online Workshops!
We delivered our first three modules over consecutive days in February (15th, 16th and 17th) to a great bunch of people. There a total of 51 different people taking the modules and we were expecting most to do all three. However, only 19 chose to do all three and 21 people did just one. Perhaps a modular approach helps people tailor training to their needs and availability?

![venn diagram of registrations for the three modules shows ](/images/blog/package-development-modules/regist_venn.png)

We're delighted that at least one of our participants, [Melissa Wong](https://orcid.org/0000-0002-2973-6279), has now released a package on CRAN!
The package, [pomcheckr](https://cran.r-project.org/web/packages/pomcheckr/index.html), implements the method described at [UCLA Statistical Consulting](https://stats.idre.ucla.edu/r/dae/ordinal-logistic-regression/) for checking if the proportional odds assumption holds for a cumulative logit model.

## Next steps
The modules we are working on now are **Package Documentation** and **Package Testing**. We also want to refine our first three modules then record them when we deliver them next. 
Watch this space for the next set of workshops! But if you want to use the materials yourself, please go ahead! And feel free to get in touch about doing that.
