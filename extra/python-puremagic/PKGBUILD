# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-puremagic
pkgver=1.29
pkgrel=1
pkgdesc="A Python module that will identify a file based off it's magic numbers"
arch=('any')
url='https://github.com/cdgriffith/puremagic'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('e13fa02728e6cad3d29219d45f777a56442bbd2a4d4ca467a2d629e3b09e4651421448637ea423c52928042a1e07183db065daf513edc52f359fb56673ca9a6b')
b2sums=('b875e28a0823ef234fd833caedd71b29272e31eb1e72c4fb294b8f7422896db149f9bec9005cd8e58c87ccb5217ffbbda34239c7127d8d23a426cdba8c241fe0')

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
