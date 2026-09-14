# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-librt
pkgver=0.15.0
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
b2sums=('d382f37f4f56689dbdf17d4ce49e07b20e8616d2476fa7f56f210e1c73a736395be6d464f60aade2ba8b460cdb02775da85a06642a31ebaa77a88dbbaaeb61d4')

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
