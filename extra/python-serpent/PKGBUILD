# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: razer <razer@neuf.fr>

pkgname=python-serpent
pkgver=1.42
pkgrel=2
pkgdesc='Serializer for literal Python expressions'
url='https://github.com/irmen/Serpent'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-attrs python-pytz)
source=("$pkgname::git+$url#tag=serpent-$pkgver")
sha512sums=('1d2ded16b73a1b22f491edbdc995deaa7790a6bded290a9966601b99aa5de0826ee8db63faca64b852f4fe0d07b6efff499cd286804327ce686da50a0b8d6dac')
b2sums=('2ade945a56d2646fe75ee79bc7ac0bedd03310d1747c00bcffac84347b742d1d5b45beb58681d87c0996748dc48ca93068f7993dad9e10be86d51e64e5752e45')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python3 -m unittest discover -vs tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
