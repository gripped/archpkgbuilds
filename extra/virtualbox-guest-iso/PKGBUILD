# Maintainer: Sébastien Luttringer
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=virtualbox-guest-iso
pkgver=7.1.4
pkgrel=1
pkgdesc='The official VirtualBox Guest Additions ISO image'
arch=('any')
url='https://www.virtualbox.org/'
license=('GPL2')
install=virtualbox-guest-iso.install
replaces=('virtualbox-additions' 'virtualbox-iso-additions')
conflicts=('virtualbox-additions' 'virtualbox-iso-additions')
noextract=("VBoxGuestAdditions_${pkgver}.iso")
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VBoxGuestAdditions_${pkgver}.iso")
sha256sums=('80c91d35742f68217cf47b13e5b50d53f54c22c485bacce41ad7fdc321649e61')

package() {
  install -D -m 0644 "VBoxGuestAdditions_${pkgver}.iso" \
    "${pkgdir}/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso"
}
