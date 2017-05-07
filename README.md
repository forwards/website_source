# Source files for forwards.github.io

The Forwards website is maintained using [blogdown](https://github.com/rstudio/blogdown),
which generates static websites based on [R Markdown](http://rmarkdown.rstudio.com) and [Hugo](https://gohugo.io).

This README documents how to add content and update the published website.

Please add new blog post to [content/blog](./content/blog) folder.

## View Build Result

**Pull Request**

Preview the result on https://rforwards-auto.github.io/pull

You can rebuild the pull request by creating an empty commit or a new commit to the pull request branch.

**Master Branch** 

Be careful, the master branch is the production environment. The build result will be deployed to https://forwards.github.io 

**Non-master Branch**

Preview the result on https://rforwards-auto.github.io/draft

The [rforwards-auto/draft](https://github.com/rforwards-auto/draft)  repo contains the latest non-master branch build result. 

You can rebuild a commit by creating an empty commit to that branch or [restart the build for the commit on Travis CI](https://travis-ci.org/forwards/website_source)


## Local Setup

 - Install [blogdown](https://github.com/rstudio/blogdown) (>= 0.0.17)
 
    ```r
    devtools::install_github('rstudio/blogdown')
    ```
 - Install Hugo (== 0.18.1)
    ```r
    library(blogdown)
    install_hugo(version = "0.18.1", force = TRUE)
    ```
 - Clone this repository

 
## Each time you want to work on the website

 - Open `website_source.Rproj` in RStudio, or otherwise start R as you usually 
 do, setting the working directory to the repository root directory.
 - Build a local copy of the website
    ```r
    library(blogdown)
    build_site()
    ```

    Alternatively you can just build the website using
    
    ```r
    options(servr.daemon = TRUE)
    serve_site()
    ```

    `serve_site()` will ignore the default hostname.

    The option setting here means that the website is served in the background 
    and you can continue working in the R session. When you make changes to the
    content, the website is updated, so you can see the changes in the RStudio
    viewer or browser (the site is best previewed in a web browser).
    
## Adding new content

Content is added in the `content` sub-directory either as plain markdown files
(`.md`) or R markdown files (`.Rmd`). The `.Rmd` files will be converted to 
partial `.html` files automatically when the site is served/built - you don't 
need render either `.md` or `.Rmd` files explicitly, this is all taken care of 
in the build.

**For `.Rmd`, please make sure the files are small and reproducible to build on Travis CI.**

**Replace large `.Rmd` files with rendered `.md` files will make the build faster.**

There are currently three  different types of content on the website, described 
further below. 

Use non-master branches for draft post. Preview the result on https://rforwards-auto.github.io/draft

### Blog Posts

Posts in the blog section are added in `content/blog`. 

A new post can be created using

```r
new_content("blog/2016-01-30-title-in-lower-case.md", kind = "blog")
```

Don't forget to use `01` etc, for consistent naming. Note we don't use the 
`new_post` function because the section of our site with the posts is called 
"blog" and therefore content in this section is of type "blog". This creates a 
template with the YAML header

```r
---
author: ""
banner: ""
categories: []
date: 2017-01-12T21:59:41Z
description: ""
tags: []
title: title in lower case
tocify: false
---
```

Note the date is automatically set to the date when you generate the template, 
which may not be the same as the date you have specified by the folder 
hierarchy! Therefore you may need to change one or other before publication to 
ensure consistency. If you specify the date manually (because you are adding
the YAML to an existing markdown file), use ISO 8601 format, i.e. "2017-01-12" (the
time is not used so can be left out).

The author field is optional, for more formal posts such as analysis reports.

The banner image is set using `banner`. The link to the image must be given 
relative to the site root,  e.g. 
"/blog/2016/01/30/new-post/banner.png". If you provide a banner image, a 
thumbnail image is automatically created for the "Recent posts" sidebar. 

Add categories, e.g. `["analysis"]` and tags 
`["useR!", "survey", "demographics"]` reusing tags/categories from previous 
posts where possible. 

The description specifies the description field for the metadata of the 
rendered HTML file.

The title is automatically generated from the file name. If you change the title,
it is a good idea to change the folder and file name as well, otherwise the 
published website will have one folder named by the title (as the permalink) and
another folder as originally named, with any additional content (e.g. the banner
image). The title is authomatically added to the body of the final `.html`,
formatted as a level one header (i.e. #). Therefore use level 2 and 3 headers 
(i.e. ## and ###) to markup sections.

For images, the text in square brackets gives the alternative text shown if the
image is unavailable/cannot be viewed, e.g.

    ![Emily's R-Dog Abby](/blog/2017/02/07/emily-robinson-from-social-scientist-to-data-scientist/dog2.JPG)
    
If you wish to add a caption, you can simply put add emphasized text immediately
below the image markup - in this case the alternative text is unnecessary:

    ![](/blog/2017/02/07/emily-robinson-from-social-scientist-to-data-scientist/dog2.JPG)
    *<br>Emily's R-Dog Abby*
    
The CSS will centre the caption - start the caption with a line break so that 
the caption is shown under the image in RSS feeds. All links to images and other
files should be given relative to the site root, e.g.

    [Rmarkdown file](/blog/2017/01/13/mapping-users/mapping-users.Rmd)
    
This is so that the correct absolute links will be created in the RSS when the
website is built.

Links to external websites should include http: or https: e.g.

    [Github](https://github.com/robinsones)
    
otherwise they are interpreted relative to blog page (even if start with www).

The `Blog` page of the website is automatically generated and lists a summary
of all blog posts. By default, the summary is taken as the first few sentences
of content, to give a summary of approximately 70 words. All HTML tags are stripped
from the summary, so the text is lumped together in one paragraph regardless of
the markup. To specify a different summary, add a `<!--more-->` divider where 
you want to split the article (see e.g. markdown file in  `/blog/2017/02/07/emily-robinson-from-social-scientist-to-data-scientist`).

### Top-level pages

For example [About](http://forwards.github.io/about/), [Data](http://forwards.github.io/data/). The markdown files for these pages are added in the 
top-level of the `content` directory. The only parameter needed in the YAML 
header is the title:
```r
---
title: "About"
---
```
The option `tocify: true` can be used to specify that a table of contents 
should be added to the page.

A new top-level page can be added e.g. via
```r
new_content("extra.md")
```
Due to the default template used by Hugo, this will also add a date to the
YAML header, but this is not used in the final layout so not needed if you add 
the YAML manually. Don't forget to add the file extension: `.md`
or `.Rmd` to create the desired filetype.

The title is not displayed in the body of the rendered `.html`, but is used as 
the page title (e.g. the name shown on the browser tab). Within the page, use 
level 2 and level 3 headers (i.e. ## and ###) to mark up sections/
    
To add a link to the new page in the navigation bar, you need to edit the  
`config.toml` file, e.g. adding
```r
[[params.menu]]
    before = true
    label  = "About"
    link   = "/about/"
```
The setting of `before` is irrelevant in our layout; `label` is the name to 
add the navigation bar, `link` is the link to the page which will be `/filename/`
in this case. The filename should be lower case for consistency.


### Documents

Reports and other documents can be added to the `content/docs` section.

A new document can be created using
```r
new_content("docs/new-doc.md", kind = "docs")
```
giving a template with the YAML
```r
---
author: ""
date: 2017-01-12T22:14:57Z
title: new doc
type: report
---
```
The type should either be `report` or `other` - this just determines how it is
listed on the [index page](http://forwards.github.io/docs/).

The title is formatted as a level one header (i.e. #) automatically. Therefore
use level 2 and 3 headers (i.e. ## and ###) to markup sections.

## Publishing the Website

Commits on the master branch will be published to https://forwards.github.io

Commits on non-master branches preview on https://rforwards-auto.github.io/draft

Pull requests preview on https://rforwards-auto.github.io/pull

## Changing site parameters

General configuration settings are specified in the `config.toml` file, which is in 
the root directory of the repository. For example, the details displayed in the
profile card (logo, description, social media accounts) are defined here.

## Going Further

The website design is based on the [Hugo Icarus theme](https://github.com/digitalcraftsman/hugo-icarus-theme), stored in 
`hugo-icarus-theme`. Customised elements are put in the corresponding folder
in the root directory. For example the layout of the pages is determined by 
template files in `layouts` or `themes/hugo-icarus-theme/layouts`, with 
`layouts` taking priority.

To add custom `CSS`, you should edit `static/css/custom.css`.

