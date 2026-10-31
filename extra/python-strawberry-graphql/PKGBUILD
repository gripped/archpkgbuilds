# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Lorenz Steinert <lsteinert+aur@uraziel.de>

pkgname=python-strawberry-graphql
_pkgname=strawberry
pkgver=0.339.0
pkgrel=1
pkgdesc="A GraphQL library for Python that leverages type annotations"
url="https://strawberry.rocks"
arch=('any')
license=('MIT')
depends=('python' 'python-graphql-core'	'python-dateutil' 'python-packaging'
         'python-cross-web' 'python-rich' 'python-typing_extensions' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/strawberry-graphql/strawberry/archive/refs/tags/${pkgver}.tar.gz"
        remove-uv-build-version-upperbound.patch)
sha256sums=('7296b585a015c65c1f1fe66394e98dfe11bab6161059131b7d8609a1c0cb69a8'
            '0272761c912686bc4791c88947975a4f0c50be2fdb214ef36cde397915657a96')

prepare() {
	cd "${_pkgname}-${pkgver}"
	# Remove version upperbound from pyproject.toml for uv-build
	patch -Np1 -i "${srcdir}/remove-uv-build-version-upperbound.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
