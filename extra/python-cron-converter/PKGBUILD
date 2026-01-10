# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-cron-converter
pkgver=1.3.1
pkgrel=2
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
sha512sums=('e85db02e9f9ec079ce4061c59b8d69feb5bc2de1894532db421fa502904bd52e9a985c40dab97928847fc5b65089342a2ee629a05ad7c193969c3b89b0b03ea6')
b2sums=('71cf8f7f6840ed0d3d0e9cf01d82ec69fd9c2c8f2b51006b892b4fb1b8be7addada2ce9f2359a6ab786d7aaeadd640ddf511ba3b4192e8788fdf9e41277d538c')

prepare() {
  cd $pkgname
  git cherry-pick -n 78a4113d6dd27e69dfe76fe9d2cd718a4c44ffd1
}

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
