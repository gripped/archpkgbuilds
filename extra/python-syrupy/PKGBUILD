# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.3.1
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/syrupy-project/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-attrs' 'python-hypothesis' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/syrupy-project/syrupy.git#tag=v$pkgver")
sha512sums=('663e66764529d85dd0d40d27ce73b15c94d65725753f4ff9bb033134581af38d3d48da94d852f6fda7615e85d246810fe139218ade4e8bacfb010177488e7068')

prepare() {
  cd syrupy
  sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
}

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
