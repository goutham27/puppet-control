#class nodejs
#installs nodejs
#
#author : goutham

class nodejs {
  
  include nodejs::install, nodejs::config

  class['nodejs::install'] -> class['nodejs::config']
}