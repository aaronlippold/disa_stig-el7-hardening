EXEMPT_KNOWN_USERS = attribute(
  'exempt_known_users',
  description: 'The list of documented maintenance or cloud-init users that are managed as part of the platform',
  default: [
    'ec2-user',   # amazon init-user
    'vagrant',    # vagrant init-user
    'maint_user', # spel init-user
    'systemd-bus-proxy', # known systemd user (should be removed soon)
    #'nfsnobody', # known nsf-daemon user (locked account)
  ]
)

  users.usernames.each do |user|
    # filtering (fail-fast) on non-system accounts (uid >= 1000) and 
    # permitted long lived users or platformed managed users linked to 
    # token keys
    next if EXEMPT_KNOWN_USERS.include? user
    next if user(user).uid < 999
    describe shadow.user(user) do
      its('min_days.first.to_i') { should cmp >= 1 }
    end
  end
