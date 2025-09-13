# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.2.6
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
sha512sums=('46276c3789e48458aa6a9c241fa1f862f0e1a19b2f1bc5b69a635712c635b1ad8eb3d9ce3110dc4d4faf5bb4895bd77e246e0c93d422513e91fb0b2ab14087c2')
b2sums=('48e7eef620672aaf2a43fa39c3c19800a5778e5d83ec1faa77492f98ff6b4095b25c146312f199a5839076d8f6ee092ecd55cae8dd5744423afa3572d24f2328')

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
