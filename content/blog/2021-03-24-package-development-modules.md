---
title: Package Development Modules
author: 'Emma Rand and Mine Çetinkaya-Rundel'
date: '2021-03-24'
slug: package-development-modules
categories: [community, education, software]
tags: [community, training, programming, software]
description: 'About the project to turn the Forwards Package Development workshop into a set of more flexible and accessible modules'
banner: '/images/blog/package-development-modules/pkg-dev.gif'
tocify: no
draft: true
---

## Why create Package Development modules?

Forwards have delivered face-to-face one-day workshops in Package development, supported by a grant from the R Consortium, for several years. These are heavily based on the [R packages](https://r-pkgs.org/) book by Hadley Wickham and Jenny Bryan. This limits our reach because only those with access to teaching facilities can deliver teaching and only those able to attend face-to-eve face workshops can benefit from it.
Recently we have been modularising our workshop materials to increase our reach by developing and delivering approximately one hour workshops suitable for online delivery and easy reuse by others.

## Our progress

### Some module design principles

By December we had begun work on our module design principles. Just like the face-to-face-workshops, the modules would teach package development using `devtools` in RStudio. Our aim is to provide workflows to help people get started rather than an exhaustive understanding of the details (you can see [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) for that).

We wanted the collection of modules to be relatively short (~1 hr), 'stackable' and easy for others to use. We thought each module should:

-  be approximately 1hr
-  be discrete (standalone) but link to other modules  
-  have specified prerequisites and learning objectives  
-  be a complete resource for teaching (a person should be able to teach themselves from the material) and include tutor notes 
-  have a set of Rmd slides with speaker notes; each slide has minimal content but speaker notes are detailed  
-  use live coding, (minimise ‘lecturing’); include additional exercises for the speedy  

## Our Progress

In January, Mine and Emma set about developing a [module template](https://github.com/forwards/workshops/blob/master/package-dev-modules/slides/module-template.Rmd) and the first three modules.

The slide template uses [xaringan](https://github.com/yihui/xaringan), [xaringanthemer](https://github.com/gadenbuie/xaringanthemer) and [xaringanExtra](https://github.com/gadenbuie/xaringanExtra).

The three modules developed are:

1.  [Packages in a nutshell](https://forwards.github.io/workshops/package-dev-modules/slides/01-packages-in-a-nutshell/packages-in-a-nutshell.html#1) which covers where packages come from, where they live on your computer, package states and package components
2.  [Setting up your system](https://forwards.github.io/workshops/package-dev-modules/slides/02-setting-up-system/setting-up-system.html#1) which covers set up for developing an version controlled R package using RStudio, Git and GitHub
3.  [Your first package](https://forwards.github.io/workshops/package-dev-modules/slides/03-your-first-package/your-first-package.html#1) which walks you through making a minimal version controlled package linked to a remote repository on GitHub using the `devtools` approach.

## Online Workshops!
We delivered our first three modules over consecutive days in February (15th, 16th and 17th) to a great bunch of people


## Next steps
The modules we are working on now are **Package Documentation** and **Package Testing**. We also want to refine our first three modules then record them when we deliver them next. 
