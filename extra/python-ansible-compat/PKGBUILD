# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=ansible-compat
pkgname=python-ansible-compat
pkgver=25.12.0
pkgrel=2
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
  python-uv
)
source=(git+$url.git#tag=v$pkgver)
sha256sums=('58d97a654b7c455955c7fcbbbc69e5c24a7cea0ef58278b71dd84db46b970fff')
b2sums=('2b57194a02245d47ee1d48964fb0bf062f499fbf01e69e272df2874150b45b9ca8289605ce3ecdbbfcce7dad0d0baff846c5556bdff4a05dc0c838451a6498d3')

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
