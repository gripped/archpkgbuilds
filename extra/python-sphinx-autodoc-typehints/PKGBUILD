# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
pkgver=2.3.0
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
  python-nptyping
  python-pytest
  python-sphobjinv
  python-typing_extensions
)
optdepends=('python-nptyping: for numpydoc support')
source=("git+$url.git#tag=$pkgver")
b2sums=('8b6f6f63db891734771e67262192b23f9a4e6a060c19aaef410e874a312268b9be3993e8213be4840bd9e39805b28b4e85cb7ddb932461779b88c796ffc2f3a3')

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
