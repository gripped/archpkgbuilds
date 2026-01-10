# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-librt
pkgver=0.7.7
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
b2sums=('aff5fee4629af71cb56e317fd7437616adefc86e5751dd74a47c9454c8ffaa38dd995fc2589832e6148c87ce0912ee54bbc8528ce0199890211307aea84ef6a1')

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
