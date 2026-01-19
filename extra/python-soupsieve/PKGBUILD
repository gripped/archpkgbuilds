# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-soupsieve
pkgver=2.8.2
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
sha512sums=('85dac5203c2ef37afa7bb12a3459f723a1e91ee366f7e3c6d57c34a87305cc5a81556f3531cab30b6bb8ad80dcaaf6008f8a3d2c77a101ce1b793c0e5fb016b4')
b2sums=('72dbb085ee99f6cd520d49bba3c6af61fe45f47bb92d7121f03ab76d12e8026770904b8a04a5c8e50f2056b7595aa92af2e2e9288857f88f20cd9bdeab2d37f6')

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
