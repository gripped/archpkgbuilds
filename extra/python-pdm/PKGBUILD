# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.8.1
pkgrel=1
pkgdesc="A modern Python package manager with PEP 582 support"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
  python-cachecontrol
  python-certifi
  python-dotenv
  python-findpython
  python-installer
  python-lockfile  # required optdepends of python-cachecontrol
  python-packaging
  python-pdm-backend
  python-platformdirs
  python-pyproject-hooks
  python-requests  # required by python-requests-toolbelt
  python-requests-toolbelt
  python-resolvelib
  python-rich
  python-shellingham
  python-tomlkit
  python-unearth
  python-urllib3  # required by pdm/models/session.py
  python-virtualenv
)
makedepends=(
  python-build
  python-wheel
)
checkdepends=(
  python-setuptools
  python-pytest
  python-pytest-httpserver
  python-pytest-mock
)
optdepends=(
  'python-keyring: for storing credentials'
  'python-pytest-mock: for pytest plugin'
  'python-setuptools: for parsing setup.py files'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('7e788f4ef1dc9780a4deb7bb73c15b069c114cefb3faadeda2982796125049e2f01e2b68f59793fd46617ec441b5b12109b754e12e12e501c8c39ec5f601f662')
b2sums=('0a5bb576f4630709c3bafbcc8a983fdd63ae35b29c61a57ac780cd7e77ad8fa7bb434e61c124f68498cd239de113a0476984f9518479707b82d71307f5e7e756')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we don't want to run tests that require the internet
    --deselect tests/test_project.py::test_access_index_with_auth
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
  # completions
  install -vd "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  "$pkgdir"/usr/bin/pdm completion bash > "$pkgdir/usr/share/bash-completion/completions/$_name"
  "$pkgdir"/usr/bin/pdm completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  "$pkgdir"/usr/bin/pdm completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$_name"
}
