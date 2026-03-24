# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.11.0
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pypa/pipx'
license=('MIT')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=(git+https://github.com/pypa/pipx.git#tag=${pkgver})
sha512sums=('4f6240d2b1185c709444e3257049756192336f3e93a294e761db036d22f0f8f8e704edde655c8d4e9fee33d38e2a57cb27390192b2e5e1e59c10f34745ab45c0')

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
