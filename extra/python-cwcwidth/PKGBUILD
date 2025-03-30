# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-cwcwidth
pkgver=0.1.10
pkgrel=1
pkgdesc="Python bindings for wc(s)width"
arch=('x86_64')
url="https://github.com/sebastinas/cwcwidth"
license=('MIT')
depends=('glibc')
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('e397913df5eb7902488f609161584c51f3f545336d59d141007a9c2a23be520c')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -r tests "$PWD/tmp_install/$site_packages"
  (cd "$PWD/tmp_install/$site_packages" && pytest)
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
