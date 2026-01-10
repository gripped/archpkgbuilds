# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-scikit-learn
pkgver=1.8.0
pkgrel=2
pkgdesc='A set of python modules for machine learning and data mining'
arch=(x86_64)
url='https://scikit-learn.org'
_url='https://github.com/scikit-learn/scikit-learn'
license=(BSD-3-Clause)
depends=(python-joblib
         python-numpy
         python-scipy
         python-threadpoolctl)
makedepends=(cython
             openmp
             python-{build,installer,wheel}
             meson-python)
optdepends=('python-matplotlib: plotting capabilities')
options=(!emptydirs)
_archive="${pkgname#python-}-$pkgver"
source=("$_url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('603bff01ab8bd0a9de5a3ab0a9351b5d7f5594594cc070d763c537ecf397264f')

prepare() {
	cd $_archive
	sed -i -E \
		-e '/meson-python/s/,<0.19.0//' \
		-e '/numpy/s/,<2.3.0//' \
		-e '/scipy/s/,<1.16.0//' \
		-e '/Cython/s/,<3.2.0//' \
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
}
