# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.2.6
pkgrel=1
pkgdesc='Subprocess interface that allows you to call any program as if it were a function'
arch=('any')
url='https://github.com/amoffat/sh'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/amoffat/sh.git#tag=$pkgver")
sha512sums=('4da55c2118a9c89bfb9133f4ff2a09b1d73a1c66f690f4b1176872bbe7e378030f670a6401ef8bfcc2d21c4ac4b6413e4fc5dfea860141555cef9dc0c14fb3df')
b2sums=('4f53c64bcfbe83f52069c2d03b24d975f8346db5ce072c2bf6c8cce32d0bef4fb9d4c8f142f3d1bb56563872ae6e972eba3f08891a1efa046d4fdb382d95e077')

build() {
  cd sh
  python -m build --wheel --no-isolation
}

check() {
  cd sh
  # export PYTHONPATH="$(pwd):${PYTHONPATH}"
  pytest tests -k 'not test_environment'
}

package() {
  cd sh
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm644 {README.rst,CHANGELOG.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
