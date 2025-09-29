# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pwdlib
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern password hashing for Python"
url="https://frankie567.github.io/pwdlib"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatch' 'python-hatch-regex-commit' 'python-installer' 'python-wheel')
source=("git+https://github.com/frankie567/pwdlib#tag=v${pkgver}?signed")
sha256sums=('bef02eb195b9e994b786237e479266b7a9df59dbc96ea46a3884ed22f232cb96')
validpgpkeys=('857A2A1560004F80CB76929FACC9784053EA63DC') # François Voron <fvoron@gmail.com>

build() {
	cd "${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
