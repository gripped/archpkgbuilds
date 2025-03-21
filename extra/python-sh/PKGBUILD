# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-sh
pkgver=2.1.0
pkgrel=1
pkgdesc='Subprocess interface that allows you to call any program as if it were a function'
arch=('any')
url='https://github.com/amoffat/sh'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
             'python-poetry-core')
checkdepends=('lsof' 'python-pytest')
source=("git+https://github.com/amoffat/sh.git#tag=$pkgver")
sha512sums=('cc899b52528d37ead8e11ff2d29c837986ee97827ec4a6f75a4b41bf0f9c27344b34432b561db776708bf9db8768ae03810978a80bd7e1e5c3313564eddac45e')
b2sums=('e42f968504c1ce1777e1167ad35a8eeb52be6820bfa06a19d666482964a991253a2856cb6b04a3b886f333ca1c0e5f912eb7ed28a78daba2b877ba64b34e1bab')

build() {
  cd sh
  python -m build --wheel --no-isolation
}

check() {
  cd sh
  # export PYTHONPATH="$(pwd):${PYTHONPATH}"
  pytest tests -k 'not test_environment'
}

package() {
  cd sh
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm644 {README.rst,CHANGELOG.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
