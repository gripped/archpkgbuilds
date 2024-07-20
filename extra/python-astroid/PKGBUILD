# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Letu Ren <fantasquex@gmail.com>

_pyname=astroid
pkgname=python-$_pyname
pkgver=3.2.4
pkgrel=1
pkgdesc='A common base representation of python source code'
arch=(any)
url="https://github.com/pylint-dev/$_pyname"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-attrs
              python-dateutil
              python-pyqt6
              python-regex
              python-six
              python-urllib3
              python-pip
              python-pytest)
replaces=(python-logilab-astng)
conflicts=(python-logilab-astng)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e668c1d31790c6dcc4ab0ec6251cb02ed3c610a860d66ffeb6f72f1811f13605')

prepare() {
	cd "$_archive"
	sed -i -e '/^requires =/s/~=[0-9.]\+//g' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# Gentoo thinks this test fails because of pydantic 2
	# https://github.com/gentoo/gentoo/commit/70a46fcd283b608171fd5529619915e119b69405
	pytest --deselect tests/brain/test_dataclasses.py::test_pydantic_field --deselect tests/test_regrtest.py::NonRegressionTests::test_numpy_distutils
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
