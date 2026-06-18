# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.3.0
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
sha512sums=('24923a21413f0c22b22514d85c6c59b5d1a7ee9e499c39c84a34f0866172bd4797c64747739ed81c61392c5532d1581babfd458c2c8891e185968b73e35b8610')
b2sums=('0449be263a22eecc021799fd8c529dead2e8fe401b675dbaa92efe5cdf568ea07ca1a948b2517492c626d17de9c24c820d35bc14827e7cdbc51088fd75f20716')

build() {
  cd sh
  python -m build --wheel --no-isolation
}

check() {
  cd sh
  PYTHONPATH=src pytest -k 'not test_environment'
}

package() {
  cd sh
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm644 {README.rst,CHANGELOG.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
