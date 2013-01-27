class sshd {
  augeas { "root login":
    context => '/files/etc/ssh/sshd_config',
    changes => 'set PermitRootLogin yes',
  }

  augeas { "add root login":
    context => '/files/etc/ssh/sshd_config',
    changes => [
      'ins PermitRootLogin after *[last()]',
      'set PermitRootLogin[last()] yes'
    ],
  }

  augeas { "fail to add root login":
    context => '/files/etc/ssh/sshd_config',
    changes => 'ins PermitRootLogin after *[last()]',
  }
}