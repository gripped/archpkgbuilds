# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
pkgver=3.0.0
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
source=("git+$url.git#tag=$pkgver")
b2sums=('fe29a87fa0b4cb333053d508b79b800656ead11e116d5831f9e5e48e4b4327d823053588bce0fd80e31374eaf0bd91e67a128d60059ba80fea259730ece93e54')

build() {
  cd "$_pyname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${_pyname//-/_}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$_pyname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
