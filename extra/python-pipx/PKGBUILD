# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.7.1
pkgrel=2
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT' 'BSD')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6375d413974477f488eb8c8d95594f39cf7c54e4c09639c95cb82ed58467266c0124259b1a1fc07596ac0fbffc9fd2ff2fffe58083d78e67ca9f056f2353852f')

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build -nw
}

#check() {
#  cd $_pkgname-$pkgver
#
#  nox
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
