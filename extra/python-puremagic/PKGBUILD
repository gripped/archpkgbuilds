# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-puremagic
pkgver=2.3.0
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
sha512sums=('c6346afa79a68141d61f53520af5acd429e03e46d66b9e63266ba17c5cd1b05da1898d5a8a5ef13abc97f802a111fa9e2c70ecc2029ad74ee0c54120650cbacd')
b2sums=('e33e286c8bd0d52d9aac32b056596467714ed2e373aa6899e5bf5c2e1c5bf74bafb05e36788af7de35d3898da6717198d9f3c1b94cb7d3adf08c1e0edf293bc6')

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
