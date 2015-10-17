# freenas_api
[![Build Status](https://travis-ci.org/jlyheden/puppet-freenas_api.png)](https://travis-ci.org/jlyheden/puppet-freenas_api)

## Overview

This module interacts with the FreeNAS API. It is currently very limited in
functionality so contributions are appreciated.

## Module Description

The module only exposes a function, get_jails() that returns a list of jails
from the FreeNAS API. The main class also manages the configuration file
required by the function.

## Installation

```
puppet module install jpl-freenas_api
```

## Usage

Creating the configuration file:

```
class { '::freenas_api':
  base_url => 'http://myfreenas',
  username => 'root',
  password => 'rootpw'
}
```

Functions:

```
  $jails = get_jails()
```

Using the future parser language features you could create rudimentary
'service discovery' such as:

```
  $jails = get_jails()
  $jails.each |$jail| {
    host { $jail['jail_host']:
      ip           => $jail['jail_ipv4'],
      host_aliases => "${jail['jail_host']}.${::domain}"
    }
  }
```

## Building

To test and build this module

```
bundle install
bundle exec rake spec
bundle exec rake build
```
