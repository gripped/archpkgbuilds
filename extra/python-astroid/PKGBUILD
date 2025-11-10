# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Letu Ren <fantasquex@gmail.com>

_pyname=astroid
pkgname=python-$_pyname
pkgver=4.0.2
pkgrel=1
pkgdesc='A common base representation of python source code'
arch=(any)
url="https://github.com/pylint-dev/$_pyname"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(mypy
              python-attrs
              python-dateutil
              python-pyqt6
              python-regex
              python-urllib3
              python-pip
              python-pytest)
replaces=(python-logilab-astng)
conflicts=(python-logilab-astng)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e6e00757ba15393b51143e9c72d6d71ad047eb1f9a822061991dbe5e598d1c71')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
