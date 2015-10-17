# Class: freenas_api
# ===========================
#
# Interacts with the FreeNAS API
#
# Note this class only makes sense to run if running masterless or by applying
# to the puppet master. Puppet functions relying on the configuration here
# is only evaluated during catalog compilation
#
# Parameters
# ----------
#
# * `base_url`
# The FreeNAS base url, excluding the uri path
#
# * `username`
# FreeNAS user with api permissions
#
# * `password`
# Credentials for configured username
#
# Examples
# --------
#
# @example
#    class { 'freenas_api':
#      base_url => 'http://my.freenas.example.com',
#      username => 'root',
#      password => 'secret_root_password'
#    }
#
class freenas_api (
  $base_url = 'http://localhost',
  $username = 'root',
  $password = '',
  $owner    = 'puppet',
  $group    = 'puppet',
) {

  file { '/etc/freenas_api.yml':
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => '0400',
    content => "---
:base_url: ${base_url}
:username: ${username}
:password: ${password}
"
  }

}
