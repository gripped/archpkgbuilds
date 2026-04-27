# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.14.0
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
sha512sums=('b6e71da8988927be97064e0ddb79fc38ee69aa5a65853dc5e5c4114175a203dbc78529461b5dbb5dcb5940e8e03889b3c4388f4653a3ee4d28f9c27b6ca52f4a')
b2sums=('cd2a7e6eea4dd60b557efc6db8137b93f449ac4e3a995a94268c6b77fc92606008257d90c74a3660a6d447424463008ede6ff7d597f7fdb3ddf9421c8fa28311')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we are not interested in linting and formatting
    --ignore tests/test_docs.py
    # we don't yet have azure integration in the repos
    --ignore tests/test_source_azure_key_vault.py
    # we don't yet have gcp integration in the repos
    --ignore tests/test_source_gcp_secret_manager.py
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
