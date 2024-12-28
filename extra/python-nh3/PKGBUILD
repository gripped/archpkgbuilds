# Maintainer:
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pyname=nh3
pkgname=python-$_pyname
pkgver=0.2.19
pkgrel=2
pkgdesc='Ammonia HTML sanitizer Python binding'
arch=(x86_64)
url='https://github.com/messense/nh3'
license=(MIT)
depends=(gcc-libs
         glibc
         python)
checkdepends=(python-pytest)
makedepends=(python-build
             python-installer
             python-maturin)
source=(https://github.com/messense/nh3/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5755a4688fb14dfd740316f99b047755ded9f7fdcae96e92b5d1296f92805df1')

build() {
  cd $_pyname-$pkgver 
  python -m build --wheel --no-isolation 
}
 
check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
