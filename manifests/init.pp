class alternatives(
                    $manage_package = true,
                    $package_ensure = 'installed',
                  ) inherits alternatives::params{

  if($manage_package)
  {
    package { $alternatives::params::package_name:
      ensure => $package_ensure,
    }
  }
}
