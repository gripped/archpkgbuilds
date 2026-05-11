# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.41.0
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
sha512sums=('6edde4d3ca85b57677af6d24a1b763cb1e12e838064e255c2218d6419ea710ccb9fa632b6c6ad42de88a95d6827a75660f264e27a99bd8ee9f6851641e61010b')
b2sums=('c16416d0e914cff4b873182cd187260a65e84315bf3cdc7db77aacedb7be18e7a60e7b6aa49614f940d90c6415506c65fb1adc863f1385ff15398d232f8f24bf')

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
