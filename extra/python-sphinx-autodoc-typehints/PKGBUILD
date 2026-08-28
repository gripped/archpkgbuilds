# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
pkgver=3.13.4
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
sha512sums=('13115b96b36d3e2948fc1f6b18ac2c95a509553e5fa7803345bacff3d65bf92be147c4c1dc3cfea29e987cbb59ce13d88547f09bebde1678e25377da10524d97')
b2sums=('7b0f0b92076dbd1a13722a2c8d113d25b1e0427851964fa518942cc3a080bfdaf7d06c9c6353b2268921d8b8cc6ecb38dbd113226770dcfe09a136e8d8b21df3')

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
