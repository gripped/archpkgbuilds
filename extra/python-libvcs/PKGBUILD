# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.36.0
pkgrel=1
pkgdesc='Lite, typed, pythonic utilities for git, svn, mercurial, etc'
arch=('any')
url='https://libvcs.git-pull.com/'
license=('MIT')
depends=(
  python
)
makedepends=(
  python-build
  python-installer
)
checkdepends=(
  git
  python-gp-libs
  mercurial
  python-hatchling
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  subversion
)
optdepends=(
  'git: for git repository support'
  'mercurial: for mercurial repository support'
  'subversion: for subversion repository support'
  'python-pytest: for pytest plugin'
)
source=("https://github.com/vcs-python/libvcs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7fa284b07fcd77f634b43a60057ef264b3960c56b052561c06ca1a9db733a0b07af85a3f2e50f502d9e3a93a306161cdab4bf59e14cf592491101a9309585881')
b2sums=('d75d18ff0b3d0a1cb93a91e6da9b59ff9b2401fcd30c8b0ef70e1e62e125975e725896bff4677a82665e48b10c8054edc203a818505a3d0afc4d9b05ac32e15f')

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
  install --verbose -D --mode=0644 *.md CHANGES MIGRATION --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
