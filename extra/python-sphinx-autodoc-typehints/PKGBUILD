# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
pkgver=3.13.0
pkgrel=1
pkgdesc='Type hints support for the Sphinx autodoc extension'
arch=(any)
url=https://github.com/tox-dev/sphinx-autodoc-typehints
license=(MIT)
depends=(
  python
  python-sphinx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-sphobjinv
  python-typing_extensions
)
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('19c13aa5b40d55fe43669096534a125cbbf92ce255031184a381919aa587ecc7639b177ff4ebd02e308613d7acf2c27e0db88e928a432a87a73972e8af914ae9')
b2sums=('54a8ed8b7df185796be77b8957c6c18792d0ad5dd3b90f2da2d0b8377a09eef65d71dd2a79557daaa203eeafbbb9e6b15cbcbbf7bd2a0d42e87b277dc519b00c')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
