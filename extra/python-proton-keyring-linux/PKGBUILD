# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
pkgver=0.2.0
pkgrel=4
pkgdesc="The proton-keyring-linux component."
arch=(any)
url="https://github.com/ProtonVPN/python-proton-keyring-linux"
license=(GPL-3.0-or-later)
depends=(
  python
  python-keyring
  python-proton-core
  org.freedesktop.secrets
)
makedepends=(
  git
  python-setuptools
)
optdepends=(
  'gnome-keyring: Gnome keyring support'
  'pass: pass support'
  'kwallet5: KDE keyring support'
)
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('c434c0af00802da82289a8ae71d50c78d6e19be51157461c84e288158534adaa')

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
