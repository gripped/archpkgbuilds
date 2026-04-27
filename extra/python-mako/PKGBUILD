# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mako
pkgver=1.3.11
pkgrel=1
pkgdesc="A template library written in Python"
arch=(any)
url="https://github.com/sqlalchemy/mako"
license=(MIT)
depends=(
  python
  python-markupsafe
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  # python-lingua isn't packaged
  python-babel
  python-beaker
  python-dogpile.cache
  python-pygments
  python-pytest
)
optdepends=(
  'python-babel: for i18n features'
  'python-beaker: for caching support'
  'python-dogpile.cache: for caching support'
  'python-pygments: for syntax highlighting'
  'python-pytest: for testing utilities'
)
source=("$pkgname::git+$url.git#tag=rel_${pkgver//./_}")
sha512sums=('be4f5be938f1d8f8572110cf9cef47582a94843cebbf2bb6e675e21ed98f5bfdf1209f83f49f00c61f43aee56b798e3ec1c2de2696a85ec9a2aedbb6cfc5fc86')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
