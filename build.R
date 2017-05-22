# install hugo & build site

config = readLines("config.toml")
baseurl_linenum = grep("baseurl = ", config)
print(config[baseurl_linenum])

if(Sys.getenv("TRAVIS_PULL_REQUEST") != "false" || Sys.getenv("TRAVIS_BRANCH") != "master"){
    config[baseurl_linenum] = 'baseurl = "//rforwards-auto.github.io/"'
    writeLines(config, "config.toml")
}

print(config[baseurl_linenum])

blogdown::install_hugo(version = "0.18.1", force = TRUE)
blogdown::build_site()
