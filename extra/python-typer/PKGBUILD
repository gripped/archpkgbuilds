# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tony Benoy <me@tonybenoy.com>

_pkgname=typer
pkgname=python-typer
pkgver=0.26.8
pkgrel=1
pkgdesc="Build great CLIs. Easy to code. Based on Python type hints"
arch=('any')
url="https://typer.tiangolo.com/"
license=('MIT')
depends=('python-rich' 'python-shellingham' 'python-annotated-doc')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-flit-core' 'python-pdm-backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/typer/archive/${pkgver}.tar.gz")
sha512sums=('f1c83e436ab3419e5a4fd2b479d85cc84db4e526c4835697a0adc692a307bbdce9e27ad9c309cc7a1591f17d8280ff2c07e102ab907b5d7f8d02e83f30bc4e49')

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
