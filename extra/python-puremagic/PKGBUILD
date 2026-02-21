# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-puremagic
pkgver=2.0.0
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
sha512sums=('a49af84220f9cedad0f1914e947ccada59e2d1cae4b17f5d11e1ce99117bac842d6ee5ce8c4e2985d11ba42803524ea67d17233df4811e2a975da66102f6f558')
b2sums=('26a3892f60232c3695e0b788e7ba5c268067fcf8e622c211d300b43855b8ca40870c8d3db2627ff84f3ceb189ac7f40c8d55e8f45806bba4f94d823042367f8f')

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
