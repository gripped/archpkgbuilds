# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_pyname=ytmusicapi
pkgname=python-$_pyname
pkgver=1.11.0
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
source=(git+https://github.com/sigma67/ytmusicapi#tag=$pkgver)
sha256sums=('275e992c758200525873bc7147b48541b6ce0e177341a62eced1f7d0a488fab9')

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
