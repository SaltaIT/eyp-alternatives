define alternatives::install (
                              $path,
                              $alternative_name = $name,
                              $alternative_path = "/usr/bin/${name}",
                              $priority = '1',
                            ) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  include ::alternatives

  exec { "update alternatives ${basedir}/jre-${version}":
    command => "${alternatives::params::alternatives_cmd} --install ${alternative_path} ${alternative_name} ${path} ${priority}",
    require => Class['::alternatives'],
    unless  => "${alternatives::params::check_alternatives} ${alternative_name} | grep ${path}",
  }
}
