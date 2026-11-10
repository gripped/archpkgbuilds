# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-inline-tabs
pkgname=python-$_pkgname
pkgver=2025.12.21.14
pkgrel=1
pkgdesc='Add inline tabbed content to your Sphinx documentation'
arch=('any')
url='https://github.com/pradyunsg/sphinx-inline-tabs'
license=('MIT')
depends=('python-sphinx')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
source=(git+$url#tag=$pkgver)
sha512sums=('8398fc306feb073e91edc9324f9c19b830f12474a8b869f57a0c3e057ef25fc5a00b5b3c3f54fb99747ad14ee8039486a8f21bd267831776dee58250bb01fe1f')

prepare() {
  cd $_pkgname
  # raise upper bound to support python-flit-core 4
  sed -i 's/flit_core>=3.11,<4/flit_core>=3.11,<5/' pyproject.toml
}

build() {
  cd $_pkgname

  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
