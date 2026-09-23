# Maintainer: Sébastien Luttringer
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=virtualbox-guest-iso
pkgver=7.2.20
pkgrel=1
pkgdesc='The official VirtualBox Guest Additions ISO image'
arch=('any')
url='https://www.virtualbox.org/'
license=('GPL-3.0-only')
depends=('bash')
replaces=('virtualbox-additions' 'virtualbox-iso-additions')
conflicts=('virtualbox-additions' 'virtualbox-iso-additions')
noextract=("VBoxGuestAdditions_${pkgver}.iso")
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VBoxGuestAdditions_${pkgver}.iso")
sha256sums=('4c6ba898e37b307cf9088be8ff480d9aec13bb0e395aaf31c78d564bb35916e7')

package() {
  install -D -m 0644 "VBoxGuestAdditions_${pkgver}.iso" \
    "${pkgdir}/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso"
}
