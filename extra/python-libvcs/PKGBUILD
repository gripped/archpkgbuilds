# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.38.6
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
sha512sums=('d1c179002ba78c1f791014b7bcb289b6c5eb989006e5572c96faaf9cdaa6d13ea3069b07456377d74605b3c0533d6e3661a47920d36c68a62c674b5d055a346d')
b2sums=('c0f40de15f4ba69528724a0d0be19def9410e6f0338d272dfd3cdf8a6a5f4a80c8886fb44595b12959dec99f4e763b152abe2676b823d30f55d1862cff6b5146')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git config --global user.email "custom_email@testemail.com"
  git config --global user.name "Your Name"

  local _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  python -m installer --destdir=test_dir dist/*.whl

  export PYTHONPATH="test_dir${_site_packages}:${PYTHONPATH}"

  pytest -vv tests
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md CHANGES MIGRATION --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
