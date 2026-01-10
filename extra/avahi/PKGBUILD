# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=avahi
pkgver=0.9rc2
pkgrel=3
epoch=1
pkgdesc="Service Discovery for Linux using mDNS/DNS-SD (compatible with Bonjour)"
url="https://github.com/avahi/avahi"
license=(LGPL-2.1-or-later)
arch=(x86_64)
depends=(
  bash
  dbus
  expat
  gdbm
  glib2
  glibc
  libcap
  libdaemon
  systemd-libs
)
makedepends=(
  doxygen
  git
  glib2-devel
  gobject-introspection
  graphviz
  gtk3
  libevent
  python-dbus
  python-gobject
  systemd
  xmltoman
)
optdepends=(
  'gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
  'libevent: libevent bindings'
  'nss-mdns: NSS support for mDNS'
  'python-dbus: avahi-bookmarks, avahi-discover'
  'python-gobject: avahi-bookmarks, avahi-discover'
  'python-twisted: avahi-bookmarks'
)
provides=(
  libavahi-{client,common,core,glib,gobject,libevent,ui-gtk3}.so
  libdns_sd.so
)
backup=(
  etc/avahi/{hosts,avahi-daemon.conf,avahi-{autoip,dnsconf}d.action}
  usr/lib/avahi/service-types.db
)
source=(
  "git+$url#tag=v${pkgver/[a-z]/-&}"
  0001-HACK-Install-fixes.patch
)
b2sums=('2513fcc933cc6010888d1b43254846b1bbc91fc83d257055c82006010b393339b4dcf4cba2cc514827d764b9d7f820bec5c0a266c253ad2c58698746e3f46709'
        'a15b00c05cce3b6a1479d88b1393cd955a80c669fed03be5f624a8e8701f22fe327bbd42f7563a532ae8ebc39408f3aedfc982c42a2b6141ccc22af96f16293c')

prepare() {
  cd avahi

  # CVE-2024-2699
  git cherry-pick -n 78eab31128479f06e30beb8c1cbf99dd921e2524

  # CVE-2024-52615
  git cherry-pick -n 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942

  # https://bugs.archlinux.org/task/47822
  git apply -3 ../0001-HACK-Install-fixes.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --sbindir=/usr/bin
    --runstatedir=/run
    --disable-mono
    --disable-qt5
    --enable-compat-libdns_sd
    --with-autoipd-group=avahi
    --with-autoipd-user=avahi
    --with-avahi-priv-access-group=network
    --with-distro=archlinux
    --with-systemdsystemunitdir=/usr/lib/systemd/system
    with_dbus_sys=/usr/share/dbus-1/system.d
  )

  cd avahi

  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(libdbus-1.so)

  cd avahi
  make DESTDIR="$pkgdir" install

  echo 'u avahi - "Avahi mDNS/DNS-SD daemon"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set sw=2 sts=-1 et:
