# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=3.0.5
pkgrel=2
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('9fa19b40b4470e1e19d08d01a3432a983829d11d455d4c5b0ffcbdf7c9c67ad1')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
