# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Germán Osella Massa <gosella@gmail.com>

pkgname=python-more-itertools
pkgver=11.2.0
pkgrel=1
pkgdesc='More routines for operating on iterables, beyond itertools'
arch=(any)
url='https://github.com/more-itertools/more-itertools'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-flit-core
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('70ee639211e65f17b93f165ba5169e5e05dbe3b93482b48896294ae83168a0c17adcc85907be3e6a53f6577993242a5ab0f6fa8529a0167e7cd86fc8c55269e0')
b2sums=('4b3062063cf6e43bf6fb2925d71469f62e6f1db3735e91d6857967cbe961485066bd91ad386dd4627a8316ec3aa42c47cc44895e01256b1f7ec0a2f69d8f9f75')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
