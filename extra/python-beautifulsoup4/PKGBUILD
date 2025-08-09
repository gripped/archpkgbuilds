# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=python-beautifulsoup4
_pkgname="${pkgname#python-}"
pkgver=4.13.4
pkgrel=1
pkgdesc='A Python HTML/XML parser designed for quick turnaround projects like screen-scraping'
arch=('any')
url='https://www.crummy.com/software/BeautifulSoup/'
license=('MIT')
depends=(
  'python'
  'python-soupsieve'
  'python-typing_extensions'
)
optdepends=(
  'python-cchardet: alternative to autodetect character encodings'
  'python-chardet: to autodetect character encodings'
  'python-lxml: alternative HTML parser'
  'python-html5lib: alternative HTML parser'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://www.crummy.com/software/BeautifulSoup/bs4/download/${pkgver%.*}/$_pkgname-$pkgver.tar.gz")
sha512sums=('7763e7e8528db54c48d29cd300155fc6d5b69785d3ea7d6ca14427b81b384838c4015d952ad6111800aa0b50632e16959cc311f3ff25b3860d7600e3cd3a10d4')
b2sums=('7e4cb0156443efc18d11ddb20dfeb5b4e3338ea19d6f90a4e6ebf67d88441552d1b3bf21c51714c50c2c418d93b9a6fc085bbf531dffa35231e6e177dcf9d11c')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  local deselected=(
    bs4/tests/test_htmlparser.py::TestHTMLParserTreeBuilder::test_rejected_input
  )

  pytest -v ${deselected[@]/#/--deselect }
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
