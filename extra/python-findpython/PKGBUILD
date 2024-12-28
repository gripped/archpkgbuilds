# Maintainer: David Runge <dvzrv@archlinux.org>

_name=findpython
pkgname=python-findpython
pkgver=0.6.2
pkgrel=2
pkgdesc="A utility to find python versions on your system"
arch=(any)
url="https://github.com/frostming/findpython"
license=(MIT)
depends=(
  python
  python-packaging
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('10d4ea7b5815dfb05d6319ab1a9476a83ca44daf8aff27efed592fbeb782f0eb2ae9279c5577e30f07c46391967edfd3676af751722f478271c4a86d6664062f')
b2sums=('21823b127d63b7f0b799e4164cc46218a8c195a9d0f8b95d540787cfcd59a89aaaf382cd6a2c3d3f349748be96f06de3798d8fca597cf582fd80daa57146e489')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="test_dir" dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
