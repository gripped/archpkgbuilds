# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy-importer
pkgver=0.1.0
pkgrel=1
pkgdesc="Context manager for portable, opt-in lazy imports"
arch=('any')
url="https://github.com/pganssle/lazy_importer"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pganssle/lazy_importer.git#tag=v$pkgver")
sha512sums=('6807d7d3f2b55a22c31a7a64d1752dcafb01e74338f4c673c98dd595c7828a6983d00d3cd33f8576699fdfee638a44b8362dfd97a32b9d7fc8bff946e2ff45f6')

prepare() {
  cd lazy_importer
  # Allow flit_core 4.x: https://github.com/pganssle/lazy_importer/pull/8
  sed -i 's/flit_core>=3.12,<4/flit_core/' pyproject.toml
}

build() {
  cd lazy_importer
  python -m build --wheel --no-isolation
}

check() {
  cd lazy_importer
  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd lazy_importer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
