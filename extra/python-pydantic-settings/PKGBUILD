# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.6.1
pkgrel=1
pkgdesc="Settings management using pydantic"
arch=(any)
url="https://github.com/pydantic/pydantic-settings"
license=(MIT)
depends=(
  python
  python-dotenv
  python-pydantic
  python-pydantic-core  # directly used, but transitive dependency of python-pydantic
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
  # TODO: add python-azure-keyvault-secrets and python-azure-identity for azure-key-vault optdepend
)
optdepends=(
  'python-pyyaml: for YAML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('f88e74ddf15f7bbbec644557d5993f9507478e6aff647f233519354b760f058be7d0e0b7e630740ad0516f5dd023f5532c62a17acab758dd19a69049c5cfc4e8')
b2sums=('efce42bf6a7d7258f86b40f841e04879fab771ea5631416f70b2c5991d7abd49c45609164bf6de139ab8b7bec5a045ed92fdafe7c35c362201ebbf599dbbf579')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docs.py  # we are not interested in linting and formatting
    --ignore tests/test_source_azure_key_vault.py  # we don't yet have azure integration in the repos
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
