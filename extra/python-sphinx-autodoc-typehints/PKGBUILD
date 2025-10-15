# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
pkgver=3.5.1
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
b2sums=('97ca73a27551fa91416feb975f163e368efc34aeaeaa08fc7616d3beecda117a6ea01e7f9f8bdad7cd5d52a9f58e1f9645198a9fc8bc7224ff11de93e961dd7e')

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
    "$pkgdir/usr/share/licenses/$pkgname"

  cd "$_pyname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
