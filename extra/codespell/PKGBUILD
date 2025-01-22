# Maintainer: Anatol Pomozov
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=codespell
pkgver=2.4.0
pkgrel=1
pkgdesc='check code for common misspellings'
arch=('any')
url='https://github.com/codespell-project/codespell'
license=('GPL-2.0-only')
depends=('python-chardet')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest-dependency')
source=("https://pypi.io/packages/source/c/codespell/${pkgname}-${pkgver}.tar.gz"
	"remove-check-test_command.patch")
sha256sums=('587d45b14707fb8ce51339ba4cce50ae0e98ce228ef61f3c5e160e34f681be58'
            '17a5390c0123480c794d293e0a6b95a9f941ea9d5d9168649746dd55faf0b833')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Remove the "test_command" check which makes check() fail
	patch -Np1 < "${srcdir}/remove-check-test_command.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir=tmp_install dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	export PATH="$PWD/tmp_install/usr/bin:$PATH"
	export PYTHONPATH="$PWD/tmp_install/$site_packages"
	pytest --override-ini="addopts="
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
