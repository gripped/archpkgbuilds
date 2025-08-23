# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sentinels
pkgver=1.1.0
pkgrel=1
pkgdesc="Various objects to denote special meanings in python"
url="https://github.com/vmalloc/sentinels"
license=('BSD-3-Clause')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest')
source=("git+https://github.com/vmalloc/sentinels.git#tag=$pkgver")
sha512sums=('7b0892b756fde3aaae1cefcf6a955553afe6045720243121fdf1cda477c056c02b64819d3c85397a2676ec9f4eb1a3bd712afab1389192a6a86dcc505ed4e37f')

build() {
  cd sentinels
  python -m build --wheel --no-isolation
}

check() {
  cd sentinels
  python -m venv --system-site-packages venv
  venv/bin/python -m installer dist/*.whl
  venv/bin/python -m pytest
}

package() {
  cd sentinels
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
