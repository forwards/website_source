---
title: "useR! 2016 participants and the R community: a multivariate analysis"
author: "Julie Josse and Heather Turner"
date: "2017-06-18"
type: survey_report
knit: (function(inputFile, encoding) {
    outputFile <- 
        knitr::knit(inputFile, 
                    output = paste0("../../website_source/content/docs/",
                                    gsub(".*/(.*).Rmd", "\\1", inputFile), 
                                    ".md"), encoding = encoding);
    out <- readLines(outputFile);
    out <- gsub("/images/", "//images/", out);
    writeLines(out, outputFile)
    })
---



## Introduction

### Background

The useR! survey gathers responses to questions on different themes for 455 attendees: demographic characteristics, R programming and involvement in the R community. The separate analyses of each question in each theme are detailed in the posts [Mapping useRs](https://forwards.github.io/blog/2017/01/13/mapping-users/),  [useRs Relationship with R](https://forwards.github.io/blog/2017/03/11/users-relationship-with-r/) and [Community Involvement of useRs](https://forwards.github.io/blog/2017/06/19/users-participation-in-the-r-community/). A multivariate analysis of the R programming questions is detailed in [a companion report](https://forwards.github.io/docs/mca_programming_user2016_survey/). Here, we perform MCA on the R community questions.

### R community questions

Questions are the following ones:
 
* Q18 Do you consider yourself part of the R community?
* Q19 Which of the following resources do you use for support? Select all that apply 
    + Q19_A The R mailing lists
    + Q19_B The #rstats hashtag on Twitter
    + Q19_C The R StackOverflow queues
    + Q19_D The R IRC channel
    + Q19_E The rOpenSci mailing lists or chat forums
    + Q19_F The Bioconductor support site
    + Q19_H Other
* Q20 What would be your preferred medium for R community news (e.g. events, webinars, opportunities)? 
* Q21 Do you attend R user group meetings in your local area?
* Q22 If you do: you do: what type of user group is it?
* Q23 If you do not: why not?
* Q24 Which of the following would make you more likely to participate in the R community, or improve your experience? Tick any that apply.
    + Q24_A New R user group near me (specify location in comments box)
    + Q24_B New R user group near me aimed at my demographic (specify relevant group in comments box)
    + Q24_C Free local introductory R workshops
    + Q24_D Paid local advanced R workshops
    + Q24_E R workshop at conference in my domain (specify domain/conference in comments box)
    + Q24_F	R workshop aimed at my demographic (specify relevant group in comments box)
    + Q24_G Mentoring (e.g. first CRAN submission/useR! abstract submission/GitHub contribution)
    + Q24_H Training in non-English language (specify language in comments box)
    + Q24_I Training that accommodates my disability (specify disability in comments box)
    + Q24_J Online forum to discuss R-related issues
    + Q24_K Online support group for my demographic (specify relevant group in comments box)
    + Q24_L Special facilities at R conferences (give further detail in comments box)
    + Q24_M Comments on answers above
* Q25 What other ideas do you have for improving the R community?
* Q26 Do you have any feedback for the survey authors?


### Coding

* Question Q20 has a category "others" which corresponds to free text answers.  We add new categories for this variable by grouping common answers and we name the new variables with the suffix "_new''. For instance, there is a variable Q20_new with a new category medium_R-bloggers.

* Question Q19_H also corresponds to free text answers. It has been recoded with Q19_H_new to  Q19_N_new by grouping common answers: for instance, Q19_K_new has two categories Github_yes or Github_no. 

* Q21, Q22 and Q23 have been merged in a variable Q21_new since Q22 and Q23 are filled-in depending on the answer on Q21.  For example, for Q21 *Do you attend R user group meetings in your local area?*, if the respondent answers *no*, they answer  Q23 *If you do not: why not?*, with *I am too busy*. This is coded in the variable Q21_new, with the category *meeting_no_I am too busy*.

* Q24_M, Q25 and Q26 are not analysed.

* Non-respondents identified in the *MCA Rprogramming* document are also excluded since they do not answer to R community questions as well.

* Categories are renamed to be easily understandable. In particular, the two categories for answers completed by checking a box are recoded as _yes_, if the box is checked, or recoded as _no_ otherwise.






## Analysis

MCA summarizes the relationships between the categories of the R community variables.

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

To interpret the main dimensions of variability in the response profiles, we study the proximities between categories. Indeed, two categories are close on the graph if most respondents taking the first category also take the other category. 

### First dimension of variability

The first dimension (horizontal axis) opposes people that **didn't answer questions about involvement in the R community** on the left, to the others on the right. More precisely, they did not answer Q21, Q18 and Q20 and did not check any boxes for the other questions (_no). 
Individuals with the smallest coordinates on the first dimension work more in the industry; this is confirmed by a statistical test, but this remains difficult to interpret.

### Second dimension of variability

On the top, there are respondents who do not attend an R user group because they feel too inexperienced.  They 
think that they would be more likely to participate in the R community or to improve their experience, if a user group, a workshop, or an online support dedicated to their socio-demographic group would be available. 
Facebook would be their preferred medium for R community news. 
They do not use Twitter (question Q19_B), (the category R_twitter_no corresponds to the answer  _The #rstats hashtag on Twitter_ for the question _Which of the following resources do you use for support?_). In addition,  they do not like to use it as a medium for R community news (question Q20). 
They consider themselves as outside the R community.

On the bottom, in contrast, there are individuals who tend to consider themselves as part of the R community.
They attend general R user group meetings and they use Twitter. Twitter would be their preferred medium for R community news.

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />


### Relationship with demographic

In the following graph, answers about the demographic questions are projected as supplementary variables on the two first dimensions of variability. Supplementary variables are not used to build the dimensions of variability, but they are projected _a posteriori_ to highlight relationships between the dimensions of variability and demographics. Thus, supplementary variables can be used to characterize the response profiles described previously.

Only demographic characteristics that are significantly related the R community profiles are represented. An analysis of variance with demographic variables as covariates, and the coordinates of the individuals on the dimensions as explanatory variables, has been performed.

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />


It appears that people having an undergraduate degree or a master degree are located at the top of the graph, while those with a doctorate are at the bottom. This would imply that people with undergraduate degree or master degree are more likely to consider themselves as outside the R community than people having a doctorate. The same comment holds for women versus men. It is interesting to note, caregivers for children or adult dependents tend to be at the bottom of the graph, while non-caregivers are on the top. 

We represent the age categories on the map since some confounding effects with other demographic variables could explain the previous results. Youngest people tend to be on the top of the second axis, which suggests that they consider themselves as outside the community.

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

To get more insights into this possible confounder effect, we created a new variable sex-age and represent it:

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

It highlights that both young (men and women) and women do not consider themselves as part of the R community.

### Similarities between respondents

A clustering of the participants is performed from their answers to questions about their involvement in the R community.
More precisely a hierarchical clustering is performed on the principal components of MCA. The rationale is to improve the stability of the clustering by building it from denoised data rather than from the original dataset[^fn1]. Several rules can be used to select the number of components used for the clustering. Here we choose 44 dimensions which corresponds to 95% of the projected inertia (variance) of the data. 




The number of clusters is chosen according to the barplot of the inertia gains which suggests a partition with 3 clusters. However, this clustering is not relevant since most of respondents are in the same group:


|     |  1|   2|  3|
|:----|--:|---:|--:|
|size | 12| 425|  6|

We investigate the number of respondents in each group according to the number of components used to build the clustering:



|       | clust1| clust2| clust3| clust4| clust5| clust6| clust7|
|:------|------:|------:|------:|------:|------:|------:|------:|
|ncp=2  |     12|    307|    124|      0|      0|      0|      0|
|ncp=3  |     12|    208|    162|     61|      0|      0|      0|
|ncp=4  |     12|    231|    139|     61|      0|      0|      0|
|ncp=5  |     12|    212|    148|     65|      6|      0|      0|
|ncp=6  |     12|    249|    160|     22|      0|      0|      0|
|ncp=7  |     12|    269|    159|      3|      0|      0|      0|
|ncp=8  |     12|    255|    173|      3|      0|      0|      0|
|ncp=9  |     12|    236|    192|      3|      0|      0|      0|
|ncp=10 |     12|    271|    157|      3|      0|      0|      0|
|ncp=11 |     12|    273|    155|      3|      0|      0|      0|
|ncp=12 |     12|    428|      3|      0|      0|      0|      0|
|ncp=13 |     12|    425|      6|      0|      0|      0|      0|
|ncp=14 |     12|    425|      6|      0|      0|      0|      0|
|ncp=15 |     12|    425|      6|      0|      0|      0|      0|
|ncp=16 |     12|    425|      6|      0|      0|      0|      0|
|ncp=17 |     12|    425|      6|      0|      0|      0|      0|
|ncp=18 |     12|    425|      6|      0|      0|      0|      0|
|ncp=19 |     12|    425|      6|      0|      0|      0|      0|
|ncp=20 |     12|    425|      6|      0|      0|      0|      0|
|ncp=21 |     12|    425|      6|      0|      0|      0|      0|
|ncp=22 |     12|    425|      6|      0|      0|      0|      0|

We choose to keep 10 components as this will keep enough information, while highlighting a new cluster in the previous big one.

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

Respondents are grouped in the clusters as follows:


|   |    1|     2|     3|    4|
|:--|----:|-----:|-----:|----:|
|%  | 2.71| 61.17| 35.44| 0.68|

<img src="/images/reports/MCA_community_useR2016_survey/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" style="display: block; margin: auto;" />

From the previous interpretation of the two first dimensions of variability, the location of clusters on the graph allows providing a brief summary of the clusters: 
cluster 1 is the group of non-respondents, while cluster 2 contains some respondents who feel they are part of the R community unlike the cluster 3 respondents.

#### Cluster 1
To describe the first cluster more precisely, we use statistical tests to compare the proportion of each category in the cluster against the proportion in the population of the respondents.



Unsurprisingly, there is an over-representation of people that didn't answer the questions about the involvement in the R community. Using the demographic characteristics, we can see that they are mainly from the industry.
 
#### Cluster 2
The following categories are over-represented in cluster 2:

|                                                                   | Cla/Mod| Mod/Cla| Global| p.value|
|:------------------------------------------------------------------|-------:|-------:|------:|-------:|
|Q24=new_gp_near_no                                                 |   78.19|   92.62|  72.46| < 2e-16|
|Q18=in_Rcommunity_yes                                              |   70.64|   94.10|  81.49| < 2e-16|
|Q21=Yes                                                            |   85.89|   51.66|  36.79| < 2e-16|
|Q21_new=meeting_yes_A general user group                           |   86.82|   41.33|  29.12| 1.1e-13|
|Q19_B=R_twitter_yes                                                |   85.59|   37.27|  26.64| 3.4e-11|
|Q24_C=free_workshop_no                                             |   66.75|   94.10|  86.23| 3.1e-09|
|Q20_new=medium_Twitter                                             |   90.00|   23.25|  15.80| 8.3e-09|
|Q19=R_mailing_yes                                                  |   73.89|   49.08|  40.63| 4.8e-06|
|Q24_B=new_gp_demo_no                                               |   64.08|   97.42|  93.00| 7.9e-06|
|Q21_new=meeting_no_It is not necessary (I have the support I need) |   96.15|    9.23|   5.87| 3.5e-05|
|Q24_D=paid_workshop_no                                             |   64.92|   91.51|  86.23| 7.5e-05|
|Q19_C=R_StackOverflow_yes                                          |   66.17|   81.55|  75.40| 0.00020|
|Q21_new=meeting_no_I am too busy                                   |   77.92|   22.14|  17.38| 0.00071|
|Q7=Doctorate                                                       |   68.91|   49.08|  43.57| 0.00334|
|Q1_new=Q1_new_Academic/Govt                                        |   69.02|   46.86|  41.53| 0.00428|
|Q24_F=demo_workshop_no                                             |   62.65|   97.79|  95.49| 0.00481|
|Q9=Part-time                                                       |   93.33|    5.17|   3.39| 0.00648|
|Q7=Professional degree or certification                            |  100.00|    3.69|   2.26| 0.00687|
|Q19_L_new=web_no                                                   |   62.50|   97.79|  95.71| 0.00928|
|Q24_K=online_demo_no                                               |   62.35|   97.79|  95.94| 0.01753|
|Q19_F=Biocond_yes                                                  |   80.65|    9.23|   7.00| 0.01900|
|Q2Q3=>58_Men                                                       |   85.00|    6.27|   4.51| 0.02259|
|Q3_cat=>58                                                         |   81.48|    8.12|   6.09| 0.02320|
|Q2=Men                                                             |   65.22|   66.42|  62.30| 0.02582|
|Q2Q3=29-33_Men                                                     |   74.14|   15.87|  13.09| 0.02851|

The numbers read as follows, e.g. for Q18:  70.64% of individuals who consider themselves as part of the R community are in cluster 2; in cluster 2  94.1% of the individuals consider themselves as part of the R community, and   81.49% in the population of all the respondents consider themselves as part of the R community. The test is significant which implies that this cluster can be considered as a cluster with an over-representation of people considering themselves as part of the community. We conclude they are not interested in free workshops, online demos, etc.
According to the demographic characteristics, there is an over-representation of people employed permanently in academia, people with caring responsibilities, as well as a significantly larger proportion of men and people with a doctorate.

We studied the categories under-represented in the cluster. However, 
since most of variables are binary, we do not get new information from this table. We note however that young people are under-represented, as well as people who didn't participate in R user group meetings because of inexperience.

#### Cluster 3


|                                                                  | Cla/Mod| Mod/Cla| Global| p.value|
|:-----------------------------------------------------------------|-------:|-------:|------:|-------:|
|Q24=new_gp_near_yes                                               |   81.97|   63.69|  27.54| < 2e-16|
|Q21_new=meeting_no_There is no group nearby/the group is inactive |   78.82|   42.68|  19.19| < 2e-16|
|Q21=No                                                            |   50.75|   86.62|  60.50| < 2e-16|
|Q18=in_Rcommunity_no                                              |   76.81|   33.76|  15.58| 2.4e-14|
|Q24_C=free_workshop_yes                                           |   73.77|   28.66|  13.77| 5.9e-11|
|Q21_new=meeting_no_I feel too inexperienced                       |   90.32|   17.83|   7.00| 7.2e-11|
|Q19_B=R_twitter_no                                                |   43.69|   90.45|  73.36| 2.5e-10|
|Q24_D=paid_workshop_yes                                           |   62.30|   24.20|  13.77| 4.8e-06|
|Q24_B=new_gp_demo_yes                                             |   74.19|   14.65|   7.00| 6.9e-06|
|Q20_new=medium_Website                                            |   52.73|   36.94|  24.83| 1.8e-05|
|Q19=R_mailing_no                                                  |   42.97|   71.97|  59.37| 5.6e-05|
|Q19_L_new=web_yes                                                 |   68.42|    8.28|   4.29| 0.00351|
|Q20_new=medium_Facebook                                           |   66.67|    8.92|   4.74| 0.00351|
|Q8=Q8_Employed in industry                                        |   42.37|   47.77|  39.95| 0.01354|
|Q3_cat=20-28                                                      |   45.83|   28.03|  21.67| 0.01803|
|Q24_F=demo_workshop_yes                                           |   60.00|    7.64|   4.51| 0.02503|
|Q7=Undergraduate degree                                           |   50.00|   15.92|  11.29| 0.02609|
|Q24_K=online_demo_yes                                             |   61.11|    7.01|   4.06| 0.02707|
|Q2Q3=20-28_Women                                                  |   50.00|   15.29|  10.84| 0.02974|
|Q20_new=medium_Google+                                            |  100.00|    1.91|   0.68| 0.04396|
|Q7=High school/Secondary school or lower                          |  100.00|    1.91|   0.68| 0.04396|


In this cluster, there is an over-representation of those who adhere to most of the proposals to increase their participation in the R community. Most of them have never participated in a user group meeting. The cluster gathers a large number of people who use blogs to get help, but also a large proportion of people who do not use Twitter. They prefer to use a medium like Facebook or mailing lists for news.

From a demographic point of view, the cluster contains a significantly higher proportion of women than the respondent population, and a larger proportion of those with a master's or undergraduate degree. People under the age of 30 are also over-represented.



Note that we need to be cautious concerning the interpretation of the clustering as it varies depending on the number of MCA components selected. The stability of the solution should be investigated further. In addition, the number of individuals per cluster may slightly vary as there is a "consolidation step"[^fn1] which is applied, i.e. a k-means algorithm applied after the hierarchical clustering.

# Conclusion

Missing values occurring in the questions relative to the involvement in the R community often occur on all the questions simultaneously.

Two main groups of respondents have been highlighted:

* People who do not feel they are part of the R community, but who would like to participate in workshops, or an R user group meeting close to them (from a geographic, or demographic point of view). They are more likely women, people with master or undergraduate degree.

* People who feel they are part of the R community, but do not have time to participate to meetings. They are more likely men, people with caring responsibilities, or people with a doctorate.

In addition, since we recoded many variables, we could make recommendations for the next questionnaire. In particular, we suggest using "yes" and "no" answers for the checkboxes to distinguish missing values from "no". 

[^fn1]: For more details about the classification based on principal components methods, see: Francois Husson, Jerome Pages, Sebastien Le. Exploratory Multivariate Analysis by Example Using R. CRC Press Taylor & Francis, pp.240, 2010, Chapman & Hall/CRC Computer Science & Data Analysis.
