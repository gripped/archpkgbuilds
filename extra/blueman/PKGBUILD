# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=blueman
pkgver=2.4.2
pkgrel=2
pkgdesc="GTK+ Bluetooth Manager"
arch=('x86_64')
url="https://github.com/blueman-project/blueman"
license=('GPL-3.0-or-later')
depends=('bluez' 'bluez-libs' 'gtk3' 'libnm' 'python-cairo' 'python-gobject')
makedepends=('cython' 'intltool' 'iproute2')
optdepends=('dnsmasq: Network Access Point (NAP) support'
            'iproute2: Network Access Point (NAP) support'
            'networkmanager: Dial Up Networking (DUN) and Personal Area Networking (PAN) support'
            'pulseaudio-bluetooth: audio devices support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "fix_freezes_on_double_click.patch::https://github.com/blueman-project/blueman/commit/5d79787f5c413360ccd2cd88148ec464635097b9.patch")
sha256sums=('01acfb0ab717ecc803ee10de4adacb161af998b69f12633e1885bea2ebd5fcd1'
            '32349800d6db5aae61decd736220cf427a69b689696d0b191aca4e2ce786e920')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	# Use correct D-Bus config location
	sed -i '/^dbusdir =/ s/sysconfdir/datadir/' data/configs/Makefile.{am,in}
	# Temporary patch to fix freezes when double clicking the blueman applet
	# See https://github.com/blueman-project/blueman/issues/2378
	patch -Np1 < "${srcdir}/fix_freezes_on_double_click.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
	  --prefix=/usr \
	  --sysconfdir=/etc \
	  --libexecdir=/usr/lib/"${pkgname}" \
	  --disable-schemas-compile \
	  --with-dhcp-config='/etc/dhcpd.conf'
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
