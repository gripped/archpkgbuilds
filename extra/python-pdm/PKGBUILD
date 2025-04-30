# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.24.1
pkgrel=1
pkgdesc="A modern Python package and dependency manager supporting the latest PEP standards"
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
  python-httpcore
  python-httpx
  python-id
  python-installer
  python-msgpack
  python-packaging
  python-pbs-installer
  python-platformdirs
  python-pyproject-hooks
  python-resolvelib
  python-rich
  python-shellingham
  python-socksio  # required via python-httpx 'socks' feature
  python-tomlkit
  python-truststore
  python-unearth
  python-virtualenv
)
makedepends=(
  python-build
  python-pdm-backend
  python-pdm-build-locked
  python-wheel
)
checkdepends=(
  git
  python-pytest
  python-pytest-httpserver
  python-pytest-httpx
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
  python-setuptools
  python-uv
)
optdepends=(
  'python-cookiecutter: for using cookiecutter when generating project'
  # 'python-copier: for using copier when generating project'  # TODO: package python-copier
  'python-keyring: for storing credentials'
  'python-pytest-mock: for pytest plugin'
  'python-setuptools: for parsing setup.py files'
  'python-uv: use uv as installer and resolver'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('23e7f31a2964a79abec3298dec068d159b58a016024a1e50a2af3a1e0029c8e464c06137e6f8631f99a6b43d5ba9e73df9c2e335adfad0cd0e40f595ec0e5275')
b2sums=('a8127f5c1cf0ac7bab138a53ea1e2ab72ad22d6020a0a4723a8c1f99915c42ebc4bb14558b3d807369fdfb9cffc26f096c49d307149571c11c37187d97e13656')

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
