# Maintainer:

pkgname=meson-python
pkgver=0.16.0
pkgrel=2
pkgdesc='Meson PEP 517 Python build backend'
arch=(any)
url='https://github.com/mesonbuild/meson-python'
license=(MIT)
depends=(meson
         patchelf
         python
         python-packaging
         python-pyproject-metadata
         python-typing_extensions)
makedepends=(ninja
             python-build
             python-installer)
optdepends=('python-colorama: colored output')
checkdepends=(cython
              python-gitpython
              python-pytest
              python-pytest-mock
              python-wheel)
source=(https://github.com/mesonbuild/meson-python/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1f464e7a1e15971b70c8208d537fd0193b33c345aac5887af2806e55426ca571')

prepare() {
  cd $pkgname-$pkgver
  sed -e '/ninja/d' -i pyproject.toml
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
# https://github.com/mesonbuild/meson-python/issues/397
  test-env/bin/python -m pytest -k 'not test_user_args'
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
