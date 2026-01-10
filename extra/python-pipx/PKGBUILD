# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.8.0
pkgrel=2
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pypa/pipx'
license=('MIT' 'BSD')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=(git+https://github.com/pypa/pipx.git#tag=${pkgver})
sha512sums=('e3d42b2e486318ac56205aa2770c0a636866d2d4a6f195a6a510777b18ae8f3152f626c3dd7377247d08375603a33342a4b4e220a53108fa80aa15bd7c02dea3')

build() {
  cd $_pkgname

  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build -nw
}

#check() {
#  cd $_pkgname
#
#  nox
#}

package() {
  cd $_pkgname

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
