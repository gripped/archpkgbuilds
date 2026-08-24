# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-cron-converter
pkgver=2.0.1
pkgrel=1
pkgdesc="Cron string converter for Python"
arch=(any)
url="https://github.com/Sonic0/cron-converter"
license=(MIT)
depends=(
  python
  python-dateutil
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('3880ecaf02c37a831636c230d8a2374d831798515a0a55e3647805fc615ed42f938e39d83ffb7c34df917a571da722831ebd2c1d566e039ebcb07f3627e736a7')
b2sums=('d0a3d5ae469076edfd7b72bd9e6a35c8eab2980f5395624db69c3d819d0f27dc8e4d5e8fafa72b9a14899a5266d8d0b22e98ee646eba7438cd61f54be375cf0b')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m unittest discover -v tests/unit
  python -m unittest discover -v tests/integration
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
