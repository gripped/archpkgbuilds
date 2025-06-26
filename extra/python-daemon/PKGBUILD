# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: gilcu3
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=3.1.2
pkgrel=4
pkgdesc="Python library to implement a well-behaved Unix daemon process"
url="https://pagure.io/python-daemon/"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-lockfile')
makedepends=('python-build' 'python-changelog-chug' 'python-docutils' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-testtools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-${pkgver}.tar.gz")
sha256sums=('f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408f0877757be5afbf4')

build() {
	cd "${pkgname//-/_}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname//-/_}-${pkgver}"
	python -m installer --destdir=tmp_install dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	export PATH="$PWD/tmp_install/usr/bin:$PATH"
	export PYTHONPATH="$PWD/tmp_install/$site_packages"
	python -m unittest discover -v
}

package() {
	cd "${pkgname//-/_}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
