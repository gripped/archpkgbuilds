# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_pyname=ytmusicapi
pkgname=python-$_pyname
pkgver=1.7.2
pkgrel=1
pkgdesc='Unofficial API for YouTube Music'
arch=(any)
url='https://github.com/sigma67/ytmusicapi'
license=(MIT)
depends=(python
         python-requests)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-sphinx
             python-wheel)
source=(git+https://github.com/sigma67/ytmusicapi#tag=$pkgver)
sha256sums=('36d5c30b0529b97763c1f7ebdd032266dfb32c0733f02b5475d31fd292d219be')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -r docs/build/text/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
