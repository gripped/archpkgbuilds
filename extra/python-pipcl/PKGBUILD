# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pipcl
_pkgname=${pkgname#python-}
pkgver=12
pkgrel=1
pkgdesc="Python packaging operations for use by a setup.py"
url="https://github.com/ArtifexSoftware/pipcl"
arch=('any')
license=('AGPL-3.0-only')
depends=('python' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0f5b04b6992fbd10d1517dcde9b4e12b20bafd42b32e3f180c73a08df2ea021')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	PATH="${PWD}/test-env/bin:${PATH}" test-env/bin/python -m pytest \
		--deselect tests/test_lint.py::test_codespell # We don't care about linting
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
