# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-parse
pkgver=1.22.0
pkgrel=1

pkgdesc='Parse strings using a specification based on the Python format() syntax.'
url='https://pypi.python.org/pypi/parse'
arch=('any')
license=('MIT')

depends=('python')
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/r1chardj0n3s/parse/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('edc2acca17ed0f9e7ce41bd98eb20b5b1c16783f175b5d788e985aa11170ebf4')

prepare() {
  cd parse-$pkgver
}

build() {
  cd "$srcdir"/parse-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/parse-$pkgver
  PYTHONPATH=build/lib pytest -o addopts=""
}


package() {
  cd "$srcdir"/parse-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
