# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tony Benoy <me@tonybenoy.com>

_pkgname=typer
pkgname=python-typer
pkgver=0.27.0
pkgrel=1
pkgdesc="Build great CLIs. Easy to code. Based on Python type hints"
arch=('any')
url="https://typer.tiangolo.com/"
license=('MIT')
depends=('python-rich' 'python-shellingham' 'python-annotated-doc')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-flit-core' 'python-pdm-backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/typer/archive/${pkgver}.tar.gz")
sha512sums=('df767dfb5b0f9bdfaf7510f4c73df7b3d5deb004824ebc64cb55a6d9c863fb4d7973a0bea9db7a7feed0ab1730cfcbc2e6a70d61c30cc6a056f646d3bdd2098d')

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
