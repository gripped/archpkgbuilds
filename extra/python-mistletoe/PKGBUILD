# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-mistletoe
pkgver=1.5.1
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python'
arch=(any)
url='https://github.com/miyuchina/mistletoe'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  python-parameterized
  python-pygments
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('6f65559fb1d0d59cbf9ac82baaebe2cdfd99a33ca1e637743c04611489a904c6c7563674c68657574d45a048bdd27a56872a98055dfe0eee431845d322f0b293')
b2sums=('cd962c89367facde2d7f742c427864168b2688aa027c30111c42fe57a0add649c0cbeecd29fd1f1e05129bfe4795723dbd9352315cfaf5667d5d3d15248945c2')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover test
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
