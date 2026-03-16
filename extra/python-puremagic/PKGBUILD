# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-puremagic
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python module that will identify a file based off it's magic numbers"
arch=(any)
url='https://github.com/cdgriffith/puremagic'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('30cdb298ee49bd2aa22c94dfdf423a331ef97eb5f559839acfe15722dfd69966e4f57fe4ffe6201fc8430665f921934e2883412f91816fb2faafdd35f82a7b15')
b2sums=('cc83d055b0e1b8c373dc5a24d44e55c91cf312c0741f7fe5c85310aae9c5d42de7ff654f0ed4861b3d7475ec9b66a088f823ddab1cfc249246000ead1b063131')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
