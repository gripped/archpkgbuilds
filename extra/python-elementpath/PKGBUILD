# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.1.0
pkgrel=1
pkgdesc='XPath 1.0/2.0/3.0/3.1 parsers and selectors for ElementTree and lxml'
arch=(any)
url='https://github.com/sissaschool/elementpath'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-lxml
  python-xmlschema
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('83db4ae1d102cf8063f86b399b3fed6b279b87a3206625665157b52d5dfc9993d65abc5fdaa42362904eab8557e67c1683438d52fc9d952d17f9141f2f589a59')
b2sums=('7d35d24e5fbde81166b389cfc66cb1d06c720cf28fc3e624e25d6d62b54b91c41e6a0e4feb5e6dd18ef810411262d4346df2a11aeddc0f5314c6a94439bab430')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
