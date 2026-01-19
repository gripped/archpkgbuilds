# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-py7zr
_pyname=${pkgname#python-}
pkgver=1.1.2
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
         texttable
         inflate64)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(p7zip
              python-requests
              python-py-cpuinfo
              python-pytest-benchmark
              python-pytest-httpserver
              python-pytest-timeout)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('a1b6eba3150284112ba9eeb370e8580bd459514d6cd863aeb4bc7497532b4937')

build() {
	cd "$_pyname"
	python -m build -wn
}

check() {
	cd "$_pyname"
	python -m pytest -rsx \
		--deselect tests/test_concurrent.py \
		--deselect tests/test_extra_codecs.py \
		-m 'not benchmark and not remote_data'
}

package() {
	cd "$_pyname"
	python -m installer -d "$pkgdir" dist/*.whl
}
