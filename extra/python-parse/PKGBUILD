# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-parse
pkgver=1.22.2
pkgrel=1

pkgdesc='Parse strings using a specification based on the Python format() syntax.'
url='https://pypi.python.org/pypi/parse'
arch=('any')
license=('MIT')

depends=('python')
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/r1chardj0n3s/parse/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('ed318a9892560f4bd6ba72b1823445524ce023cccfcb112631b09009db02503b')

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
