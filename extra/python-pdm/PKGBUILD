# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.14.0
pkgrel=2
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
  python-socksio  # required via python-httpx feature
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
sha512sums=('3e9e653cf6cca42a6f3e90e5f1b5f4fd7a9dfe91b4760f69eeb3414729b06191d76e9f9eda8605cf596c12a8c047d3dbc3082fa8432503f51b1c9f41be0c022d')
b2sums=('5985c3ac68c394fc8b57951c51056346df3eace0abca891889b147646c71cf2ecacaaa957da01c61a00ce1d8653e91cfefe86de1ff2fb54863e8cd68f8061eeb')

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
