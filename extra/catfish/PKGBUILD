# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Fehr <pizzapunk@gmail.com>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

pkgname=catfish
pkgver=4.18.0
pkgrel=3
pkgdesc="Versatile file searching tool"
arch=('any')
url="https://docs.xfce.org/apps/catfish/start"
license=('GPL-2.0-or-later')
depends=('dbus-python' 'gtk3' 'python-cairo' 'python-gobject' 'python-pexpect' 'xdg-utils'
         'xfconf' 'which')
makedepends=('git' 'intltool' 'python-distutils-extra' 'python-build' 'python-installer' 'python-wheel')
optdepends=('plocate: search in locate index'
            'zeitgeist: search in zeitgeist index')
source=("git+https://gitlab.xfce.org/apps/catfish.git#tag=$pkgname-$pkgver")
sha256sums=('ffebf68df7ff2fb52d34b662bbaabde6727bc9b3589f2651a8d6c66de461374b')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package () {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
