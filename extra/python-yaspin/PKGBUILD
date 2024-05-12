# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yaspin
pkgver=3.0.0
pkgrel=1
pkgdesc="Yet Another Terminal Spinner"
url="https://github.com/pavdmyt/yaspin"
license=('MIT')
arch=('any')
depends=('python-termcolor')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/pavdmyt/yaspin.git#tag=v$pkgver")
sha512sums=('82cf304a451c5af9d11f6d054ada605eb3f7877e2199bc50d442e4ff42798b571b4ed49d7ae0846f0c582479ca4556a2d8be7e0511fd1c685e325a54e27e6730')

build() {
  cd yaspin
  python -m build --no-isolation --wheel
}

check() {
  cd yaspin
  FORCE_COLOR=1 python -m pytest
}

package() {
  cd yaspin
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
