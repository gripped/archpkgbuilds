# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.10.1
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pypa/pipx'
license=('MIT')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=(git+https://github.com/pypa/pipx.git#tag=${pkgver})
sha512sums=('7ebf4e527dfdfff292d43bc7d591e784ca4ff49259e771298923f3b24d74f7a248cd0a7b2c8d0c056d64b458f247c77d0305fb93bb2e3127de74f808e29af110')

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
