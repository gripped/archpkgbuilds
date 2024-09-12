# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.5.2
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
sha512sums=('76e52d625857396bcd5f42f64362f914d638acddc6795364d7694fa8c71068e8f0069c2ff945e84e58f0032a33f08c90a931760673aaf57dc7375ded923c738b')
b2sums=('ee25800a6b242a937f0e66dc6c751eb26d33215bb5598213aae9248bbce44b2d2243332730f9b7be4c67cd87ae020d71ca2d4b6e8f4f936f77301c2b1e90b527')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docs.py  # we are not interested in linting and formatting
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
