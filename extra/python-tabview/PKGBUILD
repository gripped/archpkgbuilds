# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tabview
pkgver=1.4.4
pkgrel=8
pkgdesc="A curses command-line CSV and list (tabular data) viewer"
url="https://github.com/TabViewer/tabview"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('expect')
source=("git+https://github.com/TabViewer/tabview.git#tag=$pkgver")
sha512sums=('e08f321e6582e1e11b637b7793da4e08785992f4ddd56300e9edbc14fc2b422729dd8c9f63ae385abc38af9db283354799152f464e79ce5a525f005ab7ddfa61')

build() {
  cd tabview
  python -m build --wheel --no-isolation
}

check() {
  cd tabview
  unbuffer python -m unittest discover
}

package() {
  cd tabview
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
