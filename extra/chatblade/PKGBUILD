# Maintainer: hashworks <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=chatblade
pkgdesc="A CLI Swiss Army Knife for ChatGPT"
pkgver=0.6.4
pkgrel=1
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
)
sha256sums=('519d5c4a8bd95052f72d11f2cbac735065f940bcde88e74e6407b53730800141')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Use remote assets
	sed -i 's#<img src="assets/\([^"]*\)">#<img src="'${url}'/raw/v'${pkgver}'/assets/\1">#g' README.md
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
