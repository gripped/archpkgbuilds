# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
pkgver=0.2.2
pkgrel=1
pkgdesc="The proton-keyring-linux component."
arch=(any)
url="https://github.com/ProtonVPN/python-proton-keyring-linux"
license=(GPL-3.0-or-later)
depends=(
  python
  python-keyring
  python-proton-core
  org.freedesktop.secrets
  gnome-keyring
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('d0636a4b9ebd9231337e3e89f003ba4c06dd63b3690294e3786b5c21eeaa483d')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
