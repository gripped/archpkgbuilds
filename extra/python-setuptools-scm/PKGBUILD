# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools-scm
pkgver=10.2.1
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
sha512sums=('470ffff539255cbe37b7ddfad6fdeccf02d9f6585d27d7f6250e5e0027b0cf4d0d4ac86d9769a19076c6eb519e548144508912485fe52693a23e127a082dfff8')
b2sums=('a5efa9609594b52339a0428f147487e495d82dfb76e33fa29d18a87bbfce7162d39bd80de0d6a1215e682f9f417f35e465582060815160e979c783a9a5ddd3b9')

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
  )

  pytest "${pytest_opts[@]}"
}

package() {
  cd "$pkgname/setuptools-scm"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
