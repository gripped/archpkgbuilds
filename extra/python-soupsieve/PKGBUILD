# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-soupsieve
pkgver=2.8.1
pkgrel=3
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
sha512sums=('13d3e34394c3de74df5de33f5b4546c5976726e138621de722ce3e3bedac10e5831e62c4d81168c02fcf48077ccd06a484153a0c809e4dac2fd446242e3f5555')
b2sums=('499969fd23ec01d707f908970b1f7984d141c52bc1c61b968e82f0b0de019295d67417ad8b5fd397996229177a43082196d718a298e1358b9900179e81f559cd')

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
