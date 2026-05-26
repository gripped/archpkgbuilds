# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-soupsieve
pkgver=2.8.4
pkgrel=1
pkgdesc='A CSS4 selector implementation for Beautiful Soup'
arch=(any)
url='https://github.com/facelessuser/soupsieve'
license=(MIT)
depends=(python python-beautifulsoup4)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-html5lib
  python-lxml
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('c332d89138f11f26745f81d7a1b6985662f3d9d17b619356d9119cf67b05ad12768ffc536df1e44a793d1c963f2c7ba8e9d696a3473d5f8f6a9f9564e59cf21c')
b2sums=('a5e68794bb4a91aac0b7a48e6c27cbf3dc4a9d8e7b9254ef10001c28899640601a764c29b34505eda2d3154c1c08d5b6f79c31d628f8fb4d37746ba6a7b2f11a')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/312
  pytest \
    --deselect tests/test_extra/test_soup_contains.py::TestSoupContains::test_contains_cdata_html \
    --deselect tests/test_extra/test_soup_contains_own.py::TestSoupContainsOwn::test_contains_own_cdata_html
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/licenses/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
