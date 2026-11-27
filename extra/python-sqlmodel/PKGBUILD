# Maintainer: Robin Candau <antiz@archlinux.org> 
# Contributor: RubenKelevra <cyrond@gmail.com>

pkgname=python-sqlmodel
_pkgname=${pkgname#python-}
pkgver=0.0.50
pkgrel=1
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
url="https://sqlmodel.tiangolo.com"
license=('MIT')
arch=('any')
depends=('python' 'python-pydantic' 'python-sqlalchemy' 'python-fastapi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
checkdepends=('python-pytest' 'python-httpx2' 'python-dirty-equals' 'pre-commit' 'python-typer' 'python-alembic' 'python-aiosqlite' 'python-jinja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fastapi/sqlmodel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5361685c2f2268e5899c82fc864c6c2af13d3bec74717d80391ddd567530b440')

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
