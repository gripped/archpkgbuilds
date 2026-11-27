# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pwdlib
_pkgname=${pkgname#python-}
pkgver=0.4.2
pkgrel=1
pkgdesc="Modern password hashing for Python"
url="https://frankie567.github.io/pwdlib"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-hatch-regex-commit' 'python-installer')
checkdepends=('python-argon2-cffi' 'python-bcrypt' 'python-pytest')
optdepends=('python-argon2-cffi: for argon2 support'
            'python-bcrypt: for bcrypt support')
source=("git+https://github.com/frankie567/pwdlib#tag=v${pkgver}?signed")
sha256sums=('c8033c1d97db6c731695629df4ee56a11771186963697eb0013ac3ebf9072abe')
validpgpkeys=('54D275CAAD0B4AF869D2A65B98CAADC2D251C56F') # François Voron <me@fvoron.com>

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
