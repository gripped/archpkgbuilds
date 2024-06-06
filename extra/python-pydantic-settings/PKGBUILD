# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.3.1
pkgrel=1
pkgdesc="Settings management using pydantic"
arch=(any)
url="https://github.com/pydantic/pydantic-settings"
license=(MIT)
depends=(
  python
  python-dotenv
  python-pydantic
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-examples
  python-pytest-mock
)
optdepends=(
  'python-pyyaml: for YAML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6e924bbdb168cd7ed44d7bef4531d13644a8d6da7e67ccf7571d91bfb1ab1b3efee8dd0cd9b801e13cd6dd482ebb8817eb0f7b40d0fb753b8f683e9e6066d695')
b2sums=('0fc2ea34afe5280dfbfd4f94abc52a0394413e24194f9f7c0d03b25e8d2a8d4daf5a04ce968333b29c2f025a68ed577e7fc0765526912008d56264af55f61063')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
