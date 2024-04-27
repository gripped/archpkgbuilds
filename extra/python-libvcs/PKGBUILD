# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.28.2
pkgrel=2
pkgdesc='Lite, typed, pythonic utilities for git, svn, mercurial, etc'
arch=('any')
url='https://libvcs.git-pull.com/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-typing_extensions')
checkdepends=('git' 'mercurial' 'python-pytest' 'python-pytest-mock' 'subversion')
optdepends=(
  'git: for git repository support'
  'mercurial: for mercurial repository support'
  'subversion: for subversion repository support'
  'python-pytest: for pytest plugin'
)
source=("https://github.com/vcs-python/libvcs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3bf453267d3ccae2f60731328cc4d96bd7bfa575f951ada6a96b15541d398f0dd7cc880ac86d3389c3add1bb716a017d3d28ccfe3d83086e7a70264d9f630bc2')
b2sums=('91222244f989e0f1c4cdd838f37b95680a2564d29f555d2d652842d3fd5cb76b47d72656de66504a3316fb6d13afef35d567418eee80ddaadb3900bafe3502d6')

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
