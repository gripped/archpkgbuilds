# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.17.1
pkgrel=1
pkgdesc="A modern Python package manager with PEP 582 support"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
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
  python-pdm-backend
  python-pdm-build-locked
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
sha512sums=('e20d5fec1f0aceabce28298c57530968f38078745fdd9350b3d12e3eb00b460763ea1b57b3c8aab2f86479c1b6980993779b16c55b08139784819063aa5e40f2')
b2sums=('96995f1b4a7d1314ac96bc3d0718c1539f454967061d3debc188c36a62ac51f39753e80a6ee71c4f3bf82af8274f2a09ce07ff7d7d713ea698576a321a4aad83')

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
    # unclear issue with no isolation build
    --deselect tests/cli/test_build.py::test_build_with_no_isolation
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # completions
  install -vd "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion bash > "$pkgdir/usr/share/bash-completion/completions/$_name"
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$_name"
}
