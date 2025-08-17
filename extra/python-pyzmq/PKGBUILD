# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd at gmail dot com>

pkgname=python-pyzmq
pkgver=27.0.1
pkgrel=1
pkgdesc='Python bindings for ZeroMQ'
arch=('x86_64')
url='https://zeromq.org/languages/python/'
license=('BSD-3-Clause')
depends=('zeromq' 'python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-scikit-build-core'
  'python-wheel'
  'cython'
)
source=("$pkgname::git+https://github.com/zeromq/pyzmq#tag=v$pkgver")
sha512sums=('f76417ab0ccac163927310dc7779fdd630f5268007d519e7c36e3c51dcd6a620de1c0aa1631a8276c9db47de81914865ca77d0879ea01743fae9de8300b3bbe5')
b2sums=('31a8620aa66ad0c64448f678bab39a1fac8ced2aca2bb5180a90012d7b97ef24c2bd9a0e13f3fa6a2c645c42735b8c8402072308fb1fcc85109aa30d671b11dd')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
