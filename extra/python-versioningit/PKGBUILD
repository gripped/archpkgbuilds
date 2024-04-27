# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-versioningit
pkgver=3.1.0
pkgrel=2
pkgdesc='Versioning It with your Version In Git'
arch=('any')
url='https://github.com/jwodder/versioningit'
license=('MIT')
depends=(
  'python'
  'python-packaging'
  'python-tomli'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'git'
  'mercurial'
  'python-hatchling'
  'python-pydantic'
  'python-pytest'
  'python-pytest-mock'
)
source=("${pkgname#*n-}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname#*n-}-${pkgver}.tar.gz")
sha256sums=('7aac713c31a53eb367a6bbc2e8b3de8cc2b86d10d45c5101afd651446cb10fd7')

build() {
  cd ${pkgname#*n-}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -c /dev/null
    --deselect test/test_end2end.py::test_editable_mode
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${pkgname#*n-}-${pkgver}
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd ${pkgname#*n-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
