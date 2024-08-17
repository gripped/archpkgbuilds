# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=xonsh
pkgver=0.18.2
pkgrel=1
pkgdesc="Python-powered, cross-platform, Unix-gazing shell"
url="https://xon.sh/"
arch=("any")
license=("BSD")
depends=("python" "python-ply" "python-setproctitle")
optdepends=("python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit")
makedepends=("python-setuptools" "python-wheel")
source=("https://github.com/xonsh/xonsh/archive/$pkgver/$pkgname-$pkgver.tar.gz")
install=xonsh.install
sha256sums=('a7f6e540b2a4071262ca49ddbc9537ec85ebc90cdbff53e251d60e7c79a3dc55')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
