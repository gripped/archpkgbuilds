# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools-scm
pkgver=10.3.2
pkgrel=1
pkgdesc='Handles managing your python package versions in scm metadata'
arch=(any)
url=https://github.com/pypa/setuptools-scm
license=(MIT)
depends=(
  python
  python-packaging
  python-setuptools
  python-vcs-versioning
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  mercurial
  python-pip
  python-pytest
  python-pytest-timeout
  python-rich
)
checkdepends_riscv64=(
  libxml2
  libxslt
)
optdepends=(
  'python-rich: use rich as console log handler'
)
source=("$pkgname::git+$url.git#tag=setuptools-scm-v$pkgver")
sha512sums=('5449a55f401ae2394dbc309aa106386e370a0c0e5d088937d96f26420597fecc111fa9ed48f92b0e95e1a3409f2826a74dcc062708e5fef134fd4eb90bb4b523')
b2sums=('4c6bb5dab65900d81a90292a28e2e11e8c3df6b7a77b7f90c2ee7a400e2a2e49ed3121dc089717823d368efc206ede2eef7a393d82f037562a174d1c1ee3f018')

build() {
  cd "$pkgname/setuptools-scm"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname/setuptools-scm"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_opts=(
    -v
    -k 'not test_not_owner'
    --deselect testing_scm/test_basic_api.py::test_get_version_blank_tag_regex
    --deselect testing_scm/test_integration.py::test_setuptools_version_keyword_ensures_regex
    --deselect "testing_scm/test_integration.py::test_commands_registered_only_when_inference_produced_data[not-configured]"
    --deselect "testing_scm/test_integration.py::test_commands_registered_only_when_inference_produced_data[version-already-set]"
  )

  pytest "${pytest_opts[@]}"
}

package() {
  cd "$pkgname/setuptools-scm"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
