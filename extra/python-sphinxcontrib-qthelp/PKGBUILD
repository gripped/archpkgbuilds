# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinxcontrib-qthelp
_name=${pkgname#python-}
pkgver=1.0.8
pkgrel=1
pkgdesc='Sphinx extension which outputs QtHelp document'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-qthelp
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-defusedxml
  python-pytest
  python-sphinx
)
source=("git+$url.git#tag=$pkgver")
b2sums=('d461e81d0530b23e772b84d5935effdc04e0b90191e82e7b9be5942557aeddff364cbc55ef993c66ff07420ef32f76b925cf14db67a91eececb85bc7b4a5c4c5')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"${_name//-/_}"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
