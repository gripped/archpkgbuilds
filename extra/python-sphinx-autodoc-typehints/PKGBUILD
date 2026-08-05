# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
pkgver=3.13.2
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
sha512sums=('da8d310bfb32eef969172b47ac524efd503d1062667a2256b8d985da34803526aaf4b765fe872d28ad983a273fc82c4d4688ece79ead7951283500a059a8deb7')
b2sums=('b368a6360d7b88b53b9b2415db3c997b4348d52404e5df06da726d763614464a855bb86f9e714cdd844a9c5b93b1e3c9a9bb7790dad09c5fa378b59c70281bdb')

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
