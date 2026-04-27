# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testscenarios
pkgver=0.6.1
pkgrel=1
pkgdesc="Testscenarios, a pyunit extension for dependency injection"
arch=('any')
license=('Apache-2.0' 'BSD-3-Clause')
url="https://github.com/testing-cabal/testscenarios"
depends=('python-testtools')
makedepends=('git' 'python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer' 'python-wheel')
source=("git+https://github.com/testing-cabal/testscenarios.git#tag=${pkgver}")
sha512sums=('e94d6c44330ca9c1f4cb5c7b3bb2483f70a49bd5cb19b1d2f27a1cc147bd1ab28f99fed7d4e1e90bc372c161575ed4825514115c6b57276c0166fd09efb21b6c')

build() {
  cd testscenarios
  python -m build --wheel --no-isolation
}

check() {
  cd testscenarios
  python -m testtools.run testscenarios.test_suite
}

package() {
  cd testscenarios
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 BSD -t "$pkgdir"/usr/share/licenses/$pkgname/
}
