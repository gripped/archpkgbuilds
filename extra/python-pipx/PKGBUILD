# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.4.3
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT' 'BSD')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('423310d4a2523fdb0eca69fd5ee861f8cad144f458aaf63008ca018fea0dc3b6a4274f7cae1ffdde45013dd85eee05a4a379589a93f4c369376e122a5dc4f23e')

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
