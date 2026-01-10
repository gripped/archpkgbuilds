# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tony Benoy <me@tonybenoy.com>

_pkgname=typer
pkgname=python-typer
pkgver=0.21.1
pkgrel=2
pkgdesc="Build great CLIs. Easy to code. Based on Python type hints"
arch=('any')
url="https://typer.tiangolo.com/"
license=('MIT')
depends=('python-click' 'python-typing_extensions' 'python-rich' 'python-shellingham')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-flit-core' 'python-pdm-backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/typer/archive/${pkgver}.tar.gz")
sha512sums=('945c9a1412c9f5276aca45d07cde9b0ff9b0c1077791edd519c6f824d3a2253e4dad1aa9aa1239c96b8aa251ca0d656e63d8e234ec0cec65ded0aaf3d5585af9')

prepare() {
  cd typer-$pkgver
  sed -e 's|flit_core >=2,<3|flit_core >=2|' -i pyproject.toml # Relax version constraint
}

build() {
  cd "typer-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "typer-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Change the binary name away from typer to python-typer
  # https://gitlab.archlinux.org/archlinux/packaging/packages/python-typer/-/issues/1
  mv "$pkgdir"/usr/bin/typer "$pkgdir"/usr/bin/python-typer

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
