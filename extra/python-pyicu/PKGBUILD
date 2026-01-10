# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-pyicu
pkgver=2.14
pkgrel=3
pkgdesc="Python binding for ICU"
arch=('x86_64')
license=('MIT')
url="http://pyicu.osafoundation.org/"
depends=('python' 'icu')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-fonttools' 'python-pytest' 'python-six')
source=("https://pypi.io/packages/source/P/PyICU/PyICU-$pkgver.tar.gz")
sha512sums=('b237e90d542baba916c7eddb3d19ae5d7d42ad228d7a4a0a3df05edc21fe9fa3e0c52055b617b34db6eab14d649877a14a7c7cabea2e88bc85c724ccd8db41be')

build() {
  cd pyicu-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyicu-$pkgver
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd pyicu-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
