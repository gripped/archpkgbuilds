# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-librt
pkgver=0.9.0
pkgrel=1
pkgdesc='Mypyc runtime library'
arch=('x86_64')
url="https://github.com/mypyc/librt"
license=('MIT AND PSF-2.0')
depends=('glibc')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-mypy_extensions'
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('90f106c5e36b72b84bd1340ac6baf2c32a61b0520702b88e4029d95e4ec74d3077a37f093a0499cae4def7279449714c829b322f04bdec6004b54c65af515ba8')

prepare() {
  cd ${pkgname#python-}-$pkgver
  # Necessary for building, see:
  # .github/workflows/buildwheels.yml
  cp -vr lib-rt/* .
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python smoke_tests.py
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
