# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.2.5
pkgrel=1
pkgdesc='A Python module for creating Excel XLSX files'
arch=('any')
url='https://github.com/jmcnamara/XlsxWriter'
license=('BSD-2-Clause')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$pkgname::git+$url#tag=RELEASE_$pkgver")
sha512sums=('205269ee0162d1e7c620a7e42807fb8bb2b846e4d39544464526bee1ce1e82fb9fcbb8812761619cb71a8eb43cb73d98823ca542988a6f3b028c9c3952971bab')
b2sums=('e896cfbcbc55f0fbbab947364df01de9188f7dc6cbaffb456c15eaae18354d8698e4b70e0dff7b7f385c0a20ec1f801c86138607637713e8347479edfc087c29')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
