# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: PiC0 <guill.p.linux@gmail.com>

pkgname=python-xmltodict
pkgver=0.15.0
pkgrel=1
pkgdesc='Python module that makes working with XML feel like you are working with JSON'
arch=('any')
url='https://github.com/martinblech/xmltodict'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-nose')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('418f408573a9f8e80d973eb1ccbbbbc57653149e7ea45ac1089fdbd7b3b2385caec374a3810090b58d565ff9ec8fab1abc081ed2fd19c9410d5a10fddda5603a')
b2sums=('2752607ecb9404e68c1a0aa169e72877497d7539cb56d0ecdfb2198fb3d85b813e1ec69cace713b0548af2b43057a52daa8c93bedbf9d5064843912921de36af')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  nosetests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
