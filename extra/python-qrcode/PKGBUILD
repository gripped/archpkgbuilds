# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-qrcode
_pkgname=${pkgname#python-}
pkgver=8.1
pkgrel=1
pkgdesc='Python library to generate QR codes'
arch=(any)
url="https://github.com/lincolnloop/$pkgname"
license=(BSD-3-Clause)
depends=(python)
optdepends=('python-pillow: faster but not python native backend'
            'python-pypng: png support')
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
checkdepends=(python-importlib-metadata
              python-pillow
              python-pypng
              python-pytest
              python-pytest-mock)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha512sums=('e0cfde2e81329e49e74a0e9d953e12656e92f7a920beb5c7ebbc8e3737dbb345f83f3326d69f0addffef3506acaeb180ff22b9fe6b81f987e8fe26d223257d7c')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD"
	local deselected=(
		# assumes access to dev tooling
		qrcode/tests/test_script.py
	)
	pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
