# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_pyname=ytmusicapi
pkgname=python-$_pyname
pkgver=1.10.1
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
             python-sphinx-autodoc-typehints
             python-wheel)
source=(git+https://github.com/sigma67/ytmusicapi#tag=$pkgver
        fix-build.patch)
sha256sums=('2a2b4c92dbbeb84d1450b11e3288e8a36d2cededd28a90d6b38f3414f3133c6d'
            '1c8fb566df792172b0ac2aae1735029f7390fa0139ab3a2b9a0dc29aac5a862c')

prepare() {
  patch -d $_pyname -p1 < fix-build.patch
}

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
