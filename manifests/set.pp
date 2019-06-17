define alternatives::set(
                          $path,
                          $alternative_name = $name,
                        ) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  include ::alternatives

  exec { "set ${alternative_name} alternatives ${path}":
    command => "${alternatives::params::alternatives_cmd} --set ${alternative_name} ${path}",
    require => Class['::alternatives'],
    unless  => "ls -la /etc/alternatives/${alternative_name} | grep ${path}",
  }
}
