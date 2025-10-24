# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-annotated-doc
_pkgname=${pkgname#python-}
pkgver=0.0.3
pkgrel=1
pkgdesc="Document parameters, class attributes, return types, and variables inline, with Annotated"
arch=('any')
url="https://github.com/fastapi/annotated-doc"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-typing_extensions')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('854f845e4ebfd2de8c3b6f681dc706b740b4c739380b09de3920148617ccaa82')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	PATH="${PWD}/test-env/bin:${PATH}" test-env/bin/python -m pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
