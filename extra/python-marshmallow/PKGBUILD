# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=3.21.2
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson' 'python-pytz')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('0227ca02d87119458721b21d08b5c7fc027944dc913de7e179b036929940f6ab7821068e1c5519ab7f773ddb2dd3967d87a6af03b03d69db6f241096ae69e237')

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
