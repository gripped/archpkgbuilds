# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-puremagic
pkgver=2.0.2
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
sha512sums=('325812c8f070834ec251c2e9619c75849be30ad32375e01621142ce182bcd1766944d15b8a6af8ada8eabcbfa235188a591fd3ac29067fc3eb1b79740a9a8af4')
b2sums=('c6dfc98b448e8d6dc2604cb25fc143abe5e08b56adff2d0e437765bf339cf9385d38079f072635aca4e52cd8ceaedf928532d8eca9fd38daba779717dcf7f9f5')

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
