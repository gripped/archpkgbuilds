# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: PiC0 <guill.p.linux@gmail.com>

pkgname=python-xmltodict
pkgver=1.0.3
pkgrel=1
pkgdesc='Python module that makes working with XML feel like you are working with JSON'
arch=(any)
url='https://github.com/martinblech/xmltodict'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2c518d2a0cf04496d6f50c0e514c02854dde3e14b45e163f59ac5ec25364f0a5c7bd4a4336a5d3f9ff2c47a786b1dd7a3d7f0b95546ffc596f9b6c6f2f60831a')
b2sums=('f2427343a76dc503a10040067a72b4471f50ddce2b351cb7cb7469f1c38b37d0bc36842a1bdb6f2a3ed7913890b687ecce3ab5f31eb098ceda25b9437d1f1245')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
