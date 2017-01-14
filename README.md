# Source files for forwards.github.io

The Forwards website is maintained using [blogdown](https://github.com/rstudio/blogdown),
which generates static websites based on [R Markdown](http://rmarkdown.rstudio.com) and [Hugo](https://gohugo.io).

This README documents how to add content and update the published website.

## Initial Setup

 - Install [blogdown](https://github.com/rstudio/blogdown)
 
    ```r
    devtools::install_github('rstudio/blogdown')
    ```
 - Install Hugo
    ```r
    library(blogdown)
    install_hugo()
    ```
 - Clone this repository
 - Clone the publication repository: https://github.com/forwards/forwards.github.io
 
## Each time you want to work on the website

 - Open `website_source.Rproj` in RStudio, or otherwise start R as you usually 
 do, setting the working directory to the repository root directory.
 - Build and serve a local copy of the website
    ```r
    library(blogdown)
    options(servr.daemon = TRUE)
    serve_site()
    ```
    The option setting here means that the website is served in the background 
    and you can continue working in the R session. When you make changes to the
    content, the website is updated, so you can see the changes in the RStudio
    viewer or browser (the site is best previewed in a web browser).
    
    Alternatively you can just build the website using `build_site()`.
    
## Changing site parameters

General configuration settings are specified in the `config.toml` file, which is in 
the root directory of the repository. For example, the details displayed in the
profile card (logo, description, social media accounts) are defined here.
    
## Adding new content

Content is added in the `content` sub-directory either as plain markdown files
(`.md`) or R markdown files (`.Rmd`). The `.Rmd` files will be converted to 
partial `.html` files automatically when the site is served/built - you don't 
need render either `.md` or `.Rmd` files explicitly, this is all taken care of 
in the build.

There are currently three  different types of content on the website, described 
further below. In all cases `draft: true` can be added to the YAML to indicate
the file is a draft and should not be included in the build website.

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
new_content("Extra.md")
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
in this case.

### Blog Posts

Posts in the blog section are added in `content/blog`. They should be put in 
sub-folders defining the date of publication, e.g. `content/blog/2016/01/30/new-post/new-post.md`. This set-up is a bit fiddly, but
means that the `.Rmd` file and any images that you want to include directly, can
be kept with the `.html` or `.md` files when they are processed by Hugo and 
content for each post is kept separate (unless published on the same day).

A new post can be created using
```r
new_content("blog/2016/01/30/new-post/new-post.md", kind = "blog")
```
Don't forget to use `01` etc, for consistent naming. Note we don't use the 
`new_post` function because the section of our site with the posts is called 
"blog" and therefore content in this section is of type "blog". This creates a 
template with the YAML header
```r
---
banner: ""
categories: []
date: 2017-01-12T21:59:41Z
description: ""
tags: []
title: new post
tocify: false
---
```
Note the date is automatically set to the date when you generate the template, 
which may not be the same as the date you have specified by the folder 
hierarchy! Therefore you may need to change one or other before publication to 
ensure consistency. If you specify the date manually (because you are adding
the YAML to an existing markdown file), use ISO 8601 format, i.e. "2017-01-12" (the
time is not used so can be left out).

The banner image is set using `banner`. Unfortunately the template doesn't
(currently) recognise relative links, so you will need to specify the full link
to an image file in the post folder, e.g. 
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

Within the post, files **can** be reference locally, e.g. use
`[Rmarkdown file](new-post.Rmd)` to reference the `.Rmd` source of the post.

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

<s>When you build the site locally, the content of the website is "published" to 
your local copy of the `forwards.github.io` repository. To publish the updated
website on http://forwards.github.io/ you should first commit your changes to
this repository (`website_source`), then switch to the `forwards.github.io` 
repository and commit the changes there. (This workflow could be streamlined 
using Travis-CI as noted [here](http://disq.us/p/1eyc771), something to change 
in future).

In general, you should not need to edit files in `forwards.github.io`. However,
if you have been adding test content locally, or playing with the layouts (see 
next section) there may be files there that you don't actually want to publish 
as Hugo does not clean the directory when building the website. So it's a good 
idea to delete everything in `forwards.github.io` and do a final `build_site()`
or `serve_site()` before commiting the changes.</s>

The above should work, but currently images created by `.Rmd` are not put in the
right place when using a non-default publish directory. Therefore for now,  we 
build the site locally into `public` and copy that over into `forwards.github.io`

```r
# purge publication repo
old <- setdiff(list.files("../forwards.github.io", 
                          include.dirs = TRUE, recursive = TRUE),
               c("forwards.github.io.Rproj", "README.md"))
sapply(file.path("../forwards.github.io", old), file.remove)
# copy over public folder
new <- list.files("public")
file.copy(file.path("public", new), "../forwards.github.io", 
          recursive = TRUE)
```

## Going Further

The website design is based on the [Hugo Icarus theme](https://github.com/digitalcraftsman/hugo-icarus-theme), stored in 
`hugo-icarus-theme`. Customised elements are put in the corresponding folder
in the root directory. For example the layout of the pages is determined by 
template files in `layouts` or `themes/hugo-icarus-theme/layouts`, with 
`layouts` taking priority.

To add custom `CSS`, you should edit `static/css/custom.css`.

