# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
pkgver=3.13.8
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
sha512sums=('0e9123543d103ac4340a35eea5ed234cf4dfb8d1b3d4af949fd2eb4bf564e81d61a19ec0d7fced890bf5fde3c45e71ae0bdf836fabc59a9c408e2a7d5e6257fc')
b2sums=('136e7c1becf712f3680d3a1f40f4c327ca324e7e68e45d456163e5ac0aaa6f75b766d90c18d7db97feca0d3e4e447e5ec9d48e13ef6f489c88b5fabf70d2dbea')

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
