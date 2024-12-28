# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=humanize
pkgname=python-$_pkgname
pkgver=4.11.0
pkgrel=2
pkgdesc='Common humanization utilities for Python'
arch=(any)
url="https://github.com/$pkgname/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
checkdepends=(python-coverage
              python-freezegun
              python-pytest)
_archive="$_pkgname-$pkgver"
source=("https://pypi.python.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be')

prepare() {
	cd "$_archive"
	sed -i -e "/^__version__/s/=.*/= '$pkgver'/" src/humanize/__init__.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
