# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tony Benoy <me@tonybenoy.com>

_pkgname=typer
pkgname=python-typer
pkgver=0.26.0
pkgrel=1
pkgdesc="Build great CLIs. Easy to code. Based on Python type hints"
arch=('any')
url="https://typer.tiangolo.com/"
license=('MIT')
depends=('python-click' 'python-rich' 'python-shellingham' 'python-annotated-doc')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-flit-core' 'python-pdm-backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/typer/archive/${pkgver}.tar.gz")
sha512sums=('c57ffd51e82b5d37f448936541b7d2abaadb60a849098129b27af46dae270a3cb10b7e96074b31e5804001133ff167c208c19fb3cc7f1ea635aa61a21ef31e00')

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
