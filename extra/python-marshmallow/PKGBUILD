# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=3.21.1
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson' 'python-pytz')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('1d2541000013bc989a9e3f261b966ebe760593aadd091b74267718007251deac7c5537247c731c6524acee74e49090eeb63bd0e025de037dfd4541d887eacb89')

build() {
  cd marshmallow
  python -m build --wheel --no-isolation
}

check() {
  cd marshmallow
  python -m venv --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd marshmallow
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
