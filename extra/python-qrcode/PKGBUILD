# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-qrcode
_pkgname=${pkgname#python-}
pkgver=8.0
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
sha512sums=('14d37ef4fe0fca3253c92f39db7948f9d804f600ee3bf9ba053baf4e01488f340cb4977b94a338f448dd4f9007f9f0cb7c5cf1db5405d98a9b38a809c8ed8650')

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
