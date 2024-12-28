# Maintainer: Robin Candau <antiz@archlinux.org> 
# Contributor: RubenKelevra <cyrond@gmail.com>

pkgname=python-sqlmodel
_name=${pkgname#python-}
pkgver=0.0.22
pkgrel=2
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
url="https://sqlmodel.tiangolo.com"
license=('MIT')
arch=('any')
depends=('python' 'python-pydantic' 'python-sqlalchemy' 'python-fastapi' 'pre-commit')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
checkdepends=('python-pytest' 'python-httpx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fastapi/sqlmodel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b9bffd6db6c4a5428e23f4d53dec305c45ec19e58875a0ed1061e963748b2ee2')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_name}-${pkgver}"

	# Remove failing tests relying on old python versions
	rm -rf docs_src/tutorial/fastapi/app_testing/tutorial001_py3{10,9}/test*.py \
		tests/test_tutorial/test_fastapi/test_app_testing/test*.py \
		tests/test_select_gen.py \
		tests/test_tutorial/test_create_db_and_table/test_tutorial001*.py \

	pytest
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
