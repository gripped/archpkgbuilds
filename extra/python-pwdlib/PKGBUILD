# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pwdlib
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=2
pkgdesc="Modern password hashing for Python"
url="https://frankie567.github.io/pwdlib"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-hatch-regex-commit' 'python-installer')
checkdepends=(
	'python-argon2-cffi'
	'python-bcrypt'
	'python-pytest'
)
optdepends=(
	'python-argon2-cffi: for argon2 support'
	'python-bcrypt: for bcrypt support'
)
source=("git+https://github.com/frankie567/pwdlib#tag=v${pkgver}?signed")
sha256sums=('bef02eb195b9e994b786237e479266b7a9df59dbc96ea46a3884ed22f232cb96')
validpgpkeys=('857A2A1560004F80CB76929FACC9784053EA63DC') # François Voron <fvoron@gmail.com>

build() {
	cd "${_pkgname}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}"
	pytest -vv -o addopts=""
}

package() {
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
