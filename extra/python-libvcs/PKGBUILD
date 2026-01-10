# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.37.0
pkgrel=2
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
sha512sums=('2d20208dedcc07ceb73c5d2fee96783037ce8300827d518b4d935bcda0e982045908a122fd88ef4334e5171e456db6d41a7321b1e05c972477d0f1d463ff7a1c')
b2sums=('0beabed2d4c9b7fa3d4e6ea64e7d80ba06683cc84ab86839aaa39a53940d9f0b13436ddb06b9ad3875a80df5196c2044b66a3306a89c986e2cfae65699da71b0')

build() {
  cd  "${_name}-${pkgver}"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd  "${_name}-${pkgver}"

  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git config --global user.email "custom_email@testemail.com"
  git config --global user.name "Your Name"

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
