# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.22.4
pkgrel=1
pkgdesc="A modern Python package and dependency manager supporting the latest PEP standards"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
  python-certifi  # implicitly pulled in by python-httpx and python-httpcore
  python-dep-logic
  python-dotenv
  python-filelock
  python-findpython
  python-hishel
  python-httpcore  # implicitly pulled in by python-httpx and python-hishel
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
sha512sums=('48052b5230040e1bb8fd7224ea1fb1ef95559aea956add566aea72f1062be0b6fd61fab6e139510b1dc142fb5e45df66f239ce090c40fb248aa9fd6035f06494')
b2sums=('79b542a0172a6e15c71cafa8c47391dd3df73fe59336280f17fd06d3911bc0128b7e569eab1c2122f4ae63c087432e680d0bd9c3074d84284c34697369f04692')

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
