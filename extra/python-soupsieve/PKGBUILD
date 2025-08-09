# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-soupsieve
pkgver=2.7
pkgrel=1
pkgdesc='A CSS4 selector implementation for Beautiful Soup'
arch=('any')
url='https://github.com/facelessuser/soupsieve'
license=('MIT')
depends=('python' 'python-beautifulsoup4')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=(
  'python-pytest'
  'python-html5lib'
  'python-lxml'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('bb69c96099ae070b7c86bd9831c57c4a10e9019f6e7c436c595e43c41b9ea1b8e97db665f49c38f4ba293cd3f120625a359640b4a631abf8fc858cd56329327a')
b2sums=('5c0bcd0a113d76abac8405cad735b02f6aca6abb67ba4aabc889df462269ffe6df3ae533e722ce2cbfb6f5721e655698586e2097a3869cdeca06ab35ad4b92ec')

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
