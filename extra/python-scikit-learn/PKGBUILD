# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-scikit-learn
pkgver=1.3.2
pkgrel=1
pkgdesc='A set of python modules for machine learning and data mining'
arch=(x86_64)
url='https://scikit-learn.org'
_url='https://github.com/scikit-learn/scikit-learn'
license=(BSD)
depends=(python-joblib
         python-numpy
         python-scipy
         python-threadpoolctl)
makedepends=(cython
             openmp
             python-{build,installer,wheel}
             python-setuptools)
optdepends=('python-matplotlib: plotting capabilities')
options=(!emptydirs)
_archive="${pkgname#python-}-$pkgver"
source=("$_url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('03d387e2f98c9b34d8e18a8bf316dd1e4d143060f45d21710ccc4b2a816eb44d')

prepare() {
	cd $_archive
	sed -i -E \
		-e '/setuptools/s/<[0-9.]+//' \
		-e '/numpy/d' \
		-e '/Cython/s/,<3.0//' \
		pyproject.toml
}

build() {
	cd $_archive
	python -m build -wn
}

package() {
	cd $_archive
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
	# See FS#49651
	install -d "$pkgdir/usr/share/doc/$pkgname/"
	cp -r doc/tutorial "$pkgdir/usr/share/doc/$pkgname/tutorial"
}
