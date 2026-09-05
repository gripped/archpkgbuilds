# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-jsonrpclib-pelix
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python JSON-RPC over HTTP that mirrors xmlrpclib syntax"
arch=(any)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
url="https://github.com/tcalmant/jsonrpclib"
license=('Apache-2.0')
source=(git+https://github.com/tcalmant/jsonrpclib#tag=v$pkgver)
sha256sums=('c12ed44a66a209160173550195f0cd159f315c683179a95a8074e984da5b81d5')

build() {
  cd jsonrpclib
  python -m build --wheel --no-isolation
}

package() {
  cd jsonrpclib
  python -m installer --destdir="$pkgdir" dist/*.whl
}
