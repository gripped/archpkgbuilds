# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=spice-vdagent
pkgver=0.22.1
pkgrel=5
pkgdesc='Spice agent for Linux guests'
arch=(x86_64)
url='https://www.spice-space.org/'
license=(GPL-3.0-or-later)
depends=(
  alsa-lib
  dbus
  glib2
  glibc
  gtk3
  libdrm
  libpciaccess
  libx11
  libxinerama
  libxrandr
  systemd-libs
)
makedepends=(
  git
  spice-protocol
)
checkdepends=(procps-ng)
backup=(etc/conf.d/spice-vdagentd)
source=("git+https://gitlab.freedesktop.org/spice/linux/vd_agent.git?signed#tag=$pkgname-$pkgver")
b2sums=(82f0ed08f898d8fdefc43433c56a0dd6436f84cb9071e15c8f3179176708bf52fbd648a003a977706475c1ae9137443c820743824d47a89407d86b7a34605b8a)
validpgpkeys=(206D3B352F566F3B0E6572E997D9123DE37A484F) # Victor Toso de Carvalho <me@victortoso.com>

prepare() {
  cd vd_agent

  # Apply fixes from upstream
  git cherry-pick -n spice-vdagent-0.22.1..8b0f9cf1e207eb1160d8b453a77b662e783ea9d7

  # Skip broken test
  sed -i '/check_PROGRAMS += tests\/test-session-info/d' Makefile.am

  # Set proper paths
  sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|
          s|/usr/sbin/spice-vdagentd|/usr/bin/spice-vdagentd|' data/spice-vdagentd.service
  sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|' data/spice-vdagentd.1.in

  autoreconf -fi
}

build() {
  cd vd_agent
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --with-session-info=systemd \
    --with-init-script=systemd
  make
}

check() {
  cd vd_agent
  make check
}

package() {
  cd vd_agent
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/etc/conf.d/"
  echo 'SPICE_VDAGENTD_EXTRA_ARGS=""' > "$pkgdir/etc/conf.d/spice-vdagentd"
}
