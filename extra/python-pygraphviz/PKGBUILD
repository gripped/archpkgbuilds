# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: alienzj <alienchuj@gmail.com>

pkgname=python-pygraphviz
_name=${pkgname#python-}
pkgver=1.14
pkgrel=1
pkgdesc='Python interface to Graphviz'
arch=(x86_64)
url=https://pygraphviz.github.io
license=(BSD-3-Clause)
depends=(
  graphviz
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/$_name/$_name.git#tag=$_name-$pkgver")
b2sums=('9013cd96ab59fed0dca920b1c70294fd12654f82ca4c167c24bbe6c6ed76ec50c10eab5e082f7eb77ec0cfea31a120d03f1771a3ae4b0dacf5b95a1585dfb0a2')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
