# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.26.6
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
sha512sums=('1824ba4cd59ab83a5a1895e5fc68e8627c326ad27039df3733238d91886965090ed8e0d69cc61541eafa45e5f8c3613f19d5624d9f738920c2578c5c0244c317')
b2sums=('add4a0568f2bab511e6340869f7f073c0f3856eeac1aee7489f9f595e7bbc11461d0e07462223179655defd1537d0f43bff9e6026f3133e2f5c039277bff775e')

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
    # issue since 2.25.5: https://github.com/pdm-project/pdm/issues/3590
    --deselect tests/cli/test_install.py::test_install_from_lock_with_higher_version
    # issue with uv not supporting non-virtual envs: https://github.com/pdm-project/pdm/issues/3698
    --deselect tests/cli/test_install.py::test_uv_install_pep582_not_allowed
    --deselect tests/resolver/test_uv_resolver.py::test_resolve_requirements
    --deselect tests/resolver/test_uv_resolver.py::test_resolve_vcs_requirement
    --deselect tests/resolver/test_uv_resolver.py::test_resolve_with_python_requires
    --deselect tests/resolver/test_uv_resolver.py::test_resolve_dependencies_with_nested_extras
    --deselect tests/resolver/test_uv_resolver.py::test_resolve_dependencies_with_overrides
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
