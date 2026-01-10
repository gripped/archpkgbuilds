# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
pkgver=0.2.1
pkgrel=3
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
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'gnome-keyring: Gnome keyring support'
  'pass: pass support'
  'kwallet: KDE keyring support'
)
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('4f436f2b6442dbb40ef006d449c2fabfc9ad29a3c53c06ce69de23b4951fa206')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
