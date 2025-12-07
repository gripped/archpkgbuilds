# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-librt
pkgver=0.7.3
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
checkdepends=('python-mypy_extensions')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('33c7eb2011a3683de0fd352f0e9ca60776f7a268de6452560d403ebe38579e9c8125621c0e4c72716d98d1d0dd4993c914f4116f3a1102351fa8de85e02ccdcd')

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
