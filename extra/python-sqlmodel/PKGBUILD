# Maintainer: Robin Candau <antiz@archlinux.org> 
# Contributor: RubenKelevra <cyrond@gmail.com>

pkgname=python-sqlmodel
_pkgname=${pkgname#python-}
pkgver=0.0.34
pkgrel=1
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
url="https://sqlmodel.tiangolo.com"
license=('MIT')
arch=('any')
depends=('python' 'python-pydantic' 'python-sqlalchemy' 'python-fastapi' 'pre-commit')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
checkdepends=('python-pytest' 'python-httpx' 'python-dirty-equals')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fastapi/sqlmodel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9b140cf94c2f32b6d17142a59825622ea6f4a2a1f20020f08d4feb91e643af02')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"

	# Remove failing tests relying on old python versions
	rm -rf docs_src/tutorial/fastapi/app_testing/tutorial001_py3{10,9}/test*.py \
		tests/test_tutorial/test_fastapi/test_app_testing/test*.py \
		tests/test_select_gen.py \
		tests/test_tutorial/test_create_db_and_table/test_tutorial001*.py \

	pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
