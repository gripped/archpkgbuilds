# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: user6553591 <Message on Reddit>

pkgname=python-websockets
pkgver=17.1
pkgrel=1
pkgdesc='Python implementation of the WebSocket Protocol (RFC 6455)'
arch=('x86_64')
url='https://github.com/aaugustin/websockets'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-trio'
  'python-werkzeug'
)
optdepends=(
  'python-trio: trio backend support'
  'python-werkzeug: routing support'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('55a6968ae7a9d02db104733422a6e48f712aaea02e8758389b19f27b41e918697a4d7ed7533cc102eac94f4a025ffe7411d9e671ba2ecd69859450f70a1d1bee')
b2sums=('af60d77c44adc75b11b0fb1a688ea962a51e61dd5686551981d67758a92ed1b46401ed6d7084218f34a860c1394bc813e2b3a3c8098ee93978ab540a17f50405')

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname#python-}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover -v
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
