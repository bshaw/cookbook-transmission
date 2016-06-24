name 'transmission'
maintainer 'Brian Shaw'
maintainer_email 'brian.b.shaw@gmail.com'
license 'all_rights'
description 'Installs/Configures the Transmission BitTorrent client as a Docker container'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'

depends 'docker'
depends 'firewall'
