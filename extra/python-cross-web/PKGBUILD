# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Lorenz Steinert <lsteinert+aur@uraziel.de>

pkgname=python-cross-web
_pkgname=cross-web
pkgver=0.6.0
pkgrel=1
pkgdesc="A universal web framework adapter for Python that lets you write code once and use it across multiple web frameworks"
url="https://github.com/usecross/cross-web"
arch=('any')
license=('MIT')
depends=('python' 'python-typing_extensions' 'python-fastapi' 'python-starlette' 'python-django' 'python-aiohttp' 'python-sanic')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-django' 'python-httpx' 'python-python-multipart')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3351a83db39791d79b21c97b1bac3c97ce222b5eca545489c03362a6230bdb76')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	PATH="${PWD}/test-env/bin:${PATH}" test-env/bin/python -m pytest \
		-m "not chalice" --ignore=tests/request/test_chalice.py \
		-m "not sanic" --ignore=tests/request/test_sanic.py
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer -d "${pkgdir}" dist/*.whl

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
