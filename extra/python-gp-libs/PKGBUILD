# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='gp-libs'
pkgname="python-${_name}"
pkgver=0.0.17
pkgrel=1
pkgdesc='Incubator for pytest and sphinx helpers for git-pull python projects'
arch=('any')
url='https://gp-libs.git-pull.com/'
license=('MIT')
depends=(
  python
  python-docutils
  python-myst-parser
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-sphinx
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
)
source=("https://github.com/git-pull/gp-libs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('41f03b45802204a28174448f0a3433eecd172725bc08753b0d334363a9474c916947775031f0c5fbceea30734cf36a34e65fe1a40c71a33da1c80ccaae51810e')
b2sums=('e7a0368e22fdeb42b9565c61e2705aa9a2a3df4492f4b249339b1166b0536de17ab1bcd0d01c9f6aa2d805f980d9f2d86e56cd3741142c8bbed6c69903d44852')

build() {
  cd  "${_name}-${pkgver}"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd  "${_name}-${pkgver}"

  local _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  python -m installer --destdir=test_dir dist/*.whl

  export PYTHONPATH="test_dir${_site_packages}:${PYTHONPATH}"

  pytest -vv tests
}

package() {
  cd  "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md CHANGES --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
