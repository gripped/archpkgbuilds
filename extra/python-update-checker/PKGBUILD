# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-update-checker
pkgver=0.18.0
pkgrel=10
pkgdesc="A python module that will check for package updates"
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/bboe/update_checker'
depends=('python-requests')
provides=('python-update_checker')
conflicts=('python-update_checker')
replaces=('python-update_checker')
makedepends=('git' 'python-build' 'python-installer' 'python-requests' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/bboe/update_checker.git#tag=v$pkgver")
sha512sums=('564a8e5489afbd11b134ad7e37dba5176343b668b85fbc99d294a84eb5affa12c74882e01958599b9421a251c1d2dec83fd3d419f1d58a933c676b39841f1442')

build() {
  cd update_checker
  python -m build --wheel --no-isolation
}

check() {
  cd update_checker
  pytest
}

package() {
  cd update_checker
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
