# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=ansible-compat
pkgname=python-ansible-compat
pkgver=25.1.5
pkgrel=1
pkgdesc="Functions that help interacting with various versions of Ansible"
arch=(any)
url="https://github.com/ansible/ansible-compat"
license=(MIT)
depends=(
  ansible-core
  python
  python-jsonschema
  python-packaging
  python-pyyaml
  python-subprocess-tee
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-instafail
  python-pytest-mock
)
source=(git+$url.git#tag=v$pkgver)
sha256sums=('9e15d45a8c285d8971f32aa9d17bec7e117c1cc65790cee63e30017b282782a1')
b2sums=('199cd0612e9baa4d458cce195c53b33afdaf9bb17977dd073cc2aa365f90ee848bba7c465b9399bbe7573346107a315705fd897bd7a98e2334957a10492d03a1')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests: https://github.com/ansible/ansible-compat/issues/210
    --deselect test/test_runtime.py::test_prerun_reqs_v1
    --deselect test/test_runtime.py::test_prerun_reqs_v2
    --deselect test/test_prerun.py::test_get_cache_dir_relative
    # disable tests that want to download the internet
    --deselect test/test_runtime.py::test_install_collection_git
    --deselect test/test_runtime.py::test_install_collection_from_disk[normal]
    --deselect test/test_runtime.py::test_install_collection_from_disk[deep]
    --deselect test/test_runtime.py::test_require_collection_preexisting_broken
    --deselect test/test_runtime.py::test_require_collection_install
    --deselect test/test_runtime.py::test_install_collection
    --deselect test/test_runtime.py::test_upgrade_collection
    --deselect test/test_runtime.py::test_require_collection_not_isolated
    --deselect test/test_runtime.py::test_load_plugins[modules]
    --deselect test/test_runtime_example.py::test_runtime_example
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
