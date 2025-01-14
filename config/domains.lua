return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   -- ssh_domains = {},
   ssh_domains = {
      {
         name = 'SSH:name',
         remote_address = 'remote-address',
	 username = 'name',
         multiplexing = 'None',
         -- assume_shell = 'Posix'
      },
      }
   },

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:Debian',
         distribution = 'Debian',
         username = 'nukoseer',
         default_cwd = '/home/nukoseer',
         -- default_prog = { 'fish', '-l' },
      },
   },
}
