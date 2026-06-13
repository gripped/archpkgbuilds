# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.1.2
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
sha512sums=('27f8ebc7dcf7e2790554aeee93b821509a9abbdfa6d604a0c3144a8119ec2a89dd030ae258ab0cfd6821d28d3ff98d798ac7bc32c6f19a980a168d0ddeb96889')
b2sums=('d5c00ff11764e4db03dc305b843ae79f8fb064beafc86715ce881ecc5bd330fe4f48ccf90301bb68faa25c357ee53b8354c9b3ac854f9bb325a2ab92daad1d0d')

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
