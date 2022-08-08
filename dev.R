bmsvpn_proxy_sync <- function() {
  httr::reset_config()
  resp <- try(httr::GET("http://mcd-server.bms.com/mcd/proxy.pac"),
              silent = TRUE
  )
  bms_proxy <- "http://proxy-server.bms.com:8080/"
  no_proxy <- ".celgene.com"
  if (!"try-error" %in% class(resp)) {
    Sys.setenv(http_proxy = bms_proxy)
    Sys.setenv(https_proxy = bms_proxy)
    Sys.setenv(no_proxy = no_proxy)
  } else {
    Sys.unsetenv("http_proxy")
    Sys.unsetenv("https_proxy")
    Sys.unsetenv("no_proxy")
  }
}

