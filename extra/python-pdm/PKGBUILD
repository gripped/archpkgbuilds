# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pdm
_name=${pkgname#python-}
pkgver=2.29.4
pkgrel=1
pkgdesc="A modern Python package and dependency manager supporting the latest PEP standards"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-anyio  # required by python-hishel's 'httpx' feature
  python-anysqlite  # required by python-hishel's 'httpx' feature
  python-argcomplete
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
sha512sums=('8860832b4b4afe9450f1f2eee307a9804f0f8f8fa8cde7e80df3fbbcb9dfee92f68c8cc6ea716646e282165f1923d29866f303e956b8ef5743b3a60cca7fd8c0')
b2sums=('a0b5c73ff6c532fdd1fb6ab36f2811024d461536f2fb34b0da4f75a940e14c5c59ace5514ea5a29914dc5a2fa3d667f22b0290acea6fadbfe9b326f3aaa6f84c')

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
    # downloads the internet
    --deselect tests/cli/test_others.py::test_search_package
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
