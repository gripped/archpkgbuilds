# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-librt
pkgver=0.8.0
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
b2sums=('6958ebac26188b2357089b453e32dac8ac041b40add711e8a070f8a9b8fab31eea132d3d482b4b34562403fb2aefd51318fbe4ff27fd693d46220643205afde0')

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
