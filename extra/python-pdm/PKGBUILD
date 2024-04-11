# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.13.3
pkgrel=1
pkgdesc="A modern Python package manager with PEP 582 support"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
  python-certifi
  python-dep-logic
  python-dotenv
  python-filelock
  python-findpython
  python-hishel
  python-httpcore  # pulled in by python-httpx
  python-httpx
  python-installer
  python-msgpack
  python-packaging
  python-pbs-installer
  python-pdm-backend
  python-platformdirs
  python-pyproject-hooks
  python-resolvelib
  python-rich
  python-shellingham
  python-tomlkit
  python-truststore
  python-unearth
  python-virtualenv
  python-zstandard  # required by python-pbs-installer
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
  'python-cookiecutter: for using cookiecutter when generating project'
  # 'python-copier: for using copier when generating project'  # TODO: package python-copier
  'python-keyring: for storing credentials'
  'python-pytest-mock: for pytest plugin'
  'python-setuptools: for parsing setup.py files'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('11c575ae8b98aded0b6172f5657717cc1a535aa1f8dd20facd2f79b38f55643630331db2753ca47554b50401066d290007f9161a486a1486f08eaa18283579d6')
b2sums=('461bae94c5672b208cf3d1bd3f5e3177af52db4b70b409542bd83b35c295b75542915bfab0036c1c0fd415fc26421a3d240df4b25a187f8526f37484b83a2634')

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
