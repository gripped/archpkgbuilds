# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arvedui <arvedui@posteo.de>

pkgname=python-retrying
pkgver=1.4.0
pkgrel=1
pkgdesc="A general-purpose retrying library"
arch=('any')
url="https://github.com/groodt/retrying"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/groodt/retrying.git#tag=v$pkgver")
sha512sums=('ed8c675fd1f60e34d4a4f632e885c0c215f65a9a1e9fbe10d23d60172e00b772499796c0bab9b42bba9de17821c0729603906d1d6b77dc7f2602986e21229671')

build() {
  cd retrying
  python -m build --wheel --no-isolation
}

check() {
  cd retrying
  python -m unittest -v
}

package() {
  cd retrying
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
