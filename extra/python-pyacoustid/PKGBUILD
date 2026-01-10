# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fernando Jiménez Solano <fjim@sdfeu.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=python-pyacoustid
pkgver=1.3.0
pkgrel=7
pkgdesc='Bindings for Chromaprint acoustic fingerprinting and the Acoustid API'
arch=(any)
url='https://github.com/beetbox/pyacoustid'
license=(MIT)
depends=(
  chromaprint
  python
  python-requests
  python-audioread
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('cf2dab12fb7bcdaf5cd47c8fcc57f1d1994cc3bdd0ca506f70da23db33895878c2bc2f366873e7d7feaba623d7cf00744d424c000cf9910d48e2fb81294d100f')
b2sums=('0b0f01d19e23f8d72c69a3d1b5a833483bf4e7fe366edea9d43d2b073454fd513c2cd512e8c2b346c89e1a927973239bee78d0af4e494cd0cdec9cc8a09c3d0a')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim: ts=2 sw=2 et:
