# Maintainer: hashworks <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=chatblade
pkgdesc="A CLI Swiss Army Knife for ChatGPT"
pkgver=0.6.2
pkgrel=2
arch=("any")
url="https://github.com/npiv/chatblade"
license=("GPL-3.0-only")
# https://github.com/npiv/chatblade/blob/main/requirements.txt
depends=(
	"python"
	"python-openai"
	"python-platformdirs"
	"python-pylatexenc"
	"python-rich"
	"python-tiktoken"
	"python-yaml"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
	"python-wheel"
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"replace-distutils.patch"
)
sha256sums=('90b34945758bbfe66f746a35dc38953836ab261e51f7059219d8e977ea047d56'
            'b7cd4ef4f26d7481fa3a07a9cc512dc3858e50eee0fcfaec71e10e9e4518ee1b')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Use remote assets
	sed -i 's#<img src="assets/\([^"]*\)">#<img src="'${url}'/raw/v'${pkgver}'/assets/\1">#g' README.md
	patch -Np1 -i "$srcdir/replace-distutils.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
