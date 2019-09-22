# Source files for forwards.github.io
    
The Forwards website is maintained using [blogdown](https://github.com/rstudio/blogdown),
which generates static websites based on [R Markdown](http://rmarkdown.rstudio.com) and [Hugo](https://gohugo.io).

This README documents how to add content and update the published website.

Please add new blog post to [content/blog](./content/blog) folder.

## View Build Result

**Non-master Branches and Pull Request**

Preview the result on https://rforwards-auto.github.io/

You can rebuild a commit by creating an empty commit to that branch or [restart the build for the commit on Travis CI](https://travis-ci.org/forwards/website_source)

**Master Branch** 

Be careful, the master branch is the production environment. The build result will be deployed to https://forwards.github.io 

## Local Setup

 - Install [blogdown](https://github.com/rstudio/blogdown) (>= 0.5)
 
    ```r
    devtools::install_github('rstudio/blogdown')
    ```
 - Install Hugo (== 0.21)
    ```r
    library(blogdown)
    install_hugo(version = "0.21", force = TRUE)
    ```
 - Clone this repository

## Each time you want to work on the website

 - Open `website_source.Rproj` in RStudio, or otherwise start R as you usually 
 do, setting the working directory to the repository root directory.
 - Serve a local copy of the website
    ```r
    library(blogdown)
    options(servr.daemon = TRUE, blogdown.subdir = "blog")
    serve_site()
    ```
    The `sevr.daemon` option setting here means that the website is served in 
    the background and you can continue working in the R session. When you make
    changes to the content, the website is updated, so you can see the changes 
    in the RStudio viewer or browser (the site is best previewed in a web browser).
    
`serve_site()` will ignore the default hostname, so it does not create RSS with
valid links to images etc. For general previewing of content, this is not an 
issue, but if you want to build a local copy exactly as it will be built for
production, use
    
    ```r
    servr::daemon_stop() # stop any daemonized servers
    build_site()
    ```

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

Use non-master branches for draft post. Preview the result on https://rforwards-auto.github.io/

### Blog Posts

Posts in the blog section are added in `content/blog`. 

A new post can be created using

```r
new_post("Title in Title Case", kind = "blog")
```

The date will be automatically pre-prepended to the title to create the file 
name. If you have set the `blogdown.subdir` option as described above, then the
file will be created in the `content\blog` subdirectory (otherwise you can use 
the `subdir` argument to `new_post`).

The Forwards blog has a custom template for blogs, with a couple of additions
to the YAML header, so you should specify `kind = blog` to use this template.
This creates a template with the YAML header

```r
---
title: Title in Title Case
author: ~
date: '2017-05-07'
slug: ''
categories: []
tags: []
banner: ''
description: ''
tocify: no
---
```

You can add the field `draft: true` to mark the blog post as a draft. Draft 
posts will be rendered in the local preview mode (with `serve_site()`) but will 
not be included when the site is built.

The date is automatically set to the date when you generate the template, 
so this may need to be updated upon publication (changing the date in the 
filename is nice for consistency, but it is the date in the YAML that is used to
generate the website links). If you specify the date manually (because you are 
adding the YAML to an existing markdown file), use ISO 8601 format, 
i.e. "2017-01-12".

The author field is optional, for more formal posts such as analysis reports.

The banner image is set using `banner`. Images for blog posts should be put in
a subdirectory of `content/images/blog`, following the convention from previous
posts. When the website is built the images folder gets put in the site root, so 
you can link to the images as e.g. "images/blog/subdir/banner.png". A thumbnail 
image is automatically created from the banner image for the "Recent posts" 
sidebar - check this thumbnail image still looks good (it will be the middle 
part of the banner cropped square).

Please ensure image files are less than 100 KB. Images can be optimized using 
the **magick** package - example code is provided in 
`website_source/R/optimize_photo.R`. Consider cropping the photos (easiest 
with photo-viewing software) to remove "empty" space, short and wide photos 
work well, so people don't have to scroll a long way to get to the next text 
block.

Add categories, e.g. `["analysis"]` and tags 
`["useR!", "survey", "demographics"]` reusing tags/categories from previous 
posts where possible. 

The description specifies the description field for the metadata of the 
rendered HTML file.

The title is automatically generated from the file name. If you change the title,
the title in the YAML is used to create the website links, so changing the
file name is optional, but nice for consistency. The title is automatically 
added to the body of the final `.html`, formatted as a level one header 
(i.e. #). Therefore use level 2 and 3 headers (i.e. ## and ###) to markup 
sections.

For images, the text in square brackets gives the alternative text shown if the
image is unavailable/cannot be viewed, e.g.

    ![Emily's R-Dog Abby](/blog/images/emily-robinson-from-social-scientist-to-data-scientist/dog2.JPG)
    
If you wish to add a caption, you can simply put add emphasized text immediately
below the image markup - in this case the alternative text is unnecessary:

    ![](/blog/images/emily-robinson-from-social-scientist-to-data-scientist/dog2.JPG)
    *<br/>Emily's R-Dog Abby*
    
The CSS will centre the caption - start the caption with a line break so that 
the caption is shown under the image in RSS feeds.

Links to external websites should include http: or https: e.g.

    [Github](https://github.com/robinsones)
    
otherwise they are interpreted relative to blog page (even if start with www).

The `Blog` page of the website is automatically generated and lists a summary
of all blog posts. By default, the summary is taken as the first few sentences
of content, to give a summary of approximately 70 words. All HTML tags are stripped
from the summary, so the text is lumped together in one paragraph regardless of
the markup. To specify a different summary, add a `<!--more-->` divider where 
you want to split the article (see e.g. `content/blog/2017-02-07-emily-robinson-from-social-scientist-to-data-scientist.md`).

### Top-level pages

For example [About](http://forwards.github.io/about/), [Data](http://forwards.github.io/data/). The markdown files for these pages are added in the 
top-level of the `content` directory. The YAML header should contain a title
and a description:
```r
---
title: "About"
description: Background and structure of the R Foundation taskforce on women and other under-represented groups
---
```
The option `tocify: yes` can be used to specify that a table of contents 
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
level 2 and level 3 headers (i.e. ## and ###) to mark up sections.

The title and description are used e.g. by Twitter and Facebook to show the 
summary content when a link to the page is shared. You can also specify a 
`banner` field, to give an image that should be used in a large Twitter
or Facebook card.
    
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

Commits on non-master branches preview on https://rforwards-auto.github.io/

On preview sites, the hyperlinks will still link to pages on 
https://forwards.github.io, e.g. https://forwards.github.io/data/, to preview 
the corresponding page add the slug to the preview hostname, e.g.
https://rforwards-auto.github.io/data/.

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
