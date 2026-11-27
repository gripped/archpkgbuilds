# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.16.3
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
sha512sums=('a04e0b45a8559994a6e148e961aa13e45117c31ba8905ed4928b98b628b26f69b6dc7105a98691480d0fee081154e2f9c4c0c2c511c9f880f4315674baa598eb')
b2sums=('c9080236c8acb7fa573a81f8764fccfe392fd0b28fa7fdb9d663c5aeec6d71fec6d99689d4af188a64792a03fc36624c7bd6918c10b09e159aa97eba40e3c4a6')

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
