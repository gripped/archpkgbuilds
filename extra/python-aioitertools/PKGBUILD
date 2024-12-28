# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aioitertools
_pkgname=aioitertools
# https://github.com/omnilib/aioitertools/blob/main/CHANGELOG.md
pkgver=0.12.0
pkgrel=2
pkgdesc='Implementation of itertools, builtins, and more for AsyncIO and mixed-type iterables'
arch=(any)
url='https://github.com/omnilib/aioitertools'
license=(MIT)
depends=(python)
makedepends=(python-flit-core python-build python-installer git)
source=("git+$url#tag=v$pkgver")
sha256sums=('0dd8849c3eca0558b95cf7e63294114587406a64f15e7904538f2514f742f38d')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m unittest -v aioitertools.tests
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
