# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=ipykernel
pkgname=python-$_pyname
pkgver=6.24.0
pkgrel=1
pkgdesc='The ipython kernel for Jupyter'
arch=(any)
url='https://pypi.org/project/ipykernel/'
license=(BSD)
depends=(python-comm python-tornado ipython python-jupyter-client python-psutil python-nest-asyncio)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-timeout python-pytest-asyncio python-flaky python-ipyparallel python-matplotlib python-debugpy)
optdepends=('python-debugpy: debugger support')
source=(https://github.com/ipython/ipykernel/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('58bc071233c79bca0397ee2426cc4c7f25d6ac309f0fcca85b705c0286b98b02')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
