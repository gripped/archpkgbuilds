# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-mpv-jsonipc
pkgver=1.2.2
pkgrel=1
pkgdesc='Python API to MPV using JSON IPC'
arch=(any)
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9f2eb46e2b6ef5e56e2d52f00e09a6cc711127ef312d9eb7e70a4dd46ecead531db32ef7dc1c38806768c318a6a3926a57edc4cdb377f6ed7520ce9d4b335fde')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
