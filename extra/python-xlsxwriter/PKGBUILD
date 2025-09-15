# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-xlsxwriter
pkgver=3.2.8
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
sha512sums=('b02acb5acc288a6f6f8e3d935c767e2bf2e50f515a7d655c1c593a2e0af0b0a0317a9a8d632eb97efe8273293e0e3f16910523b6cbff12e9d7284f566d7eb3ac')
b2sums=('f8fcd2bdef5d4c8a381b20c8c3a14a832503b076db43e2c04a6a00ab7d0a2d0ae27d5a8a4c9054fd79eaa2403f14ce3c24de653b26c040e660e9b5ff0ce59afa')

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
