# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-mpv-jsonipc
pkgver=1.2.3
pkgrel=1
pkgdesc='Python API to MPV using JSON IPC'
arch=(any)
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('05428957c7ae185be6f1eaeaddae0b9c1f42af122e6648b39ef49af1770349680f250a8eca49e24a8af58ba58ca71c7683b8fa26d1579818ee55c40158defaf7')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
