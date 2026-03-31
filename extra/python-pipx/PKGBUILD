# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.11.1
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pypa/pipx'
license=('MIT')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=(git+https://github.com/pypa/pipx.git#tag=${pkgver})
sha512sums=('1c8df33a93395f0faf75f33a843bf5257f2b3c765523b39781262fd2a3b0b5d57b1abbcc0d17f9de8449a169254bc94e6b00169161f95279a32f30cb4781f5dc')

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
