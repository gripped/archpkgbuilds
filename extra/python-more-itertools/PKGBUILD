# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Germán Osella Massa <gosella@gmail.com>

pkgname=python-more-itertools
pkgver=11.0.2
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
sha512sums=('62b8c3c0ebc4be4749a7568da830538044c89a4b3d3d9d3eaf649d2d491fd541b687f62eb99c72d4d10f823690b2dbe48c9367eede6f093e63dc721209466920')
b2sums=('5a5f074a46923a0dc376d9b9312c12e3af4595d26eaefa06067c8a499b4f61c3878697b2535dd4636e5bba1fdfebdc45a4e3ad9beedef00b09438bbf89c2cd48')

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
