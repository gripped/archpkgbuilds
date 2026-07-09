# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.1.3
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
sha512sums=('52edbf30d2f3477f4a0f7b840286ac28454ad3a0652cf1ab7b363aa1d10fc31dc9061371aa58a846441d16b338bd50aae3dcd195f41226eb6e9ed32511c9778c')
b2sums=('1429f8a56af2c6941354f542374aec07413fba64734771eee033daea04cd3bdb7047717d020d943a679488572d5da84ee9bb0ae3bfc8bc4989faaee5b45634ad')

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
