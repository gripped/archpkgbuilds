# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-py7zr
_pyname=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='Pure python 7-zip library'
arch=(any)
url="https://github.com/miurahr/${_pyname}"
license=(LGPL-2.1-or-later)
_pydeps=(brotli
         brotlicffi
         psutil
         multivolumefile
         pybcj
         pycryptodomex
         pyppmd
         pyzstd
         texttable
         inflate64)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(p7zip
              python-requests
              python-py-cpuinfo
              python-pytest-benchmark
              python-pytest-httpserver
              python-pytest-timeout)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('f6bfee81637c9032f6a9f0eb045a4bfc7a7ff4138becfc42d7cb89b54ffbfef1')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m pytest -rsx \
		--deselect tests/test_concurrent.py \
		--deselect tests/test_extra_codecs.py \
		-m 'not benchmark and not remote_data'
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
