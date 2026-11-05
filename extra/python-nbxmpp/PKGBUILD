# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-nbxmpp
pkgdesc="XMPP Python library"
pkgver=7.5.0
pkgrel=1
url="https://gitlab.com/gajim/python-nbxmpp"
arch=('any')
license=('GPL-3.0-only')
depends=('libsoup3' 'python' 'python-gobject' 'python-idna' 'python-precis_i18n' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5f3ba2f73b00a1dc6a4e064b366b151f32a93170dd33f632b5d21c4cf9198cc')
b2sums=('6c714bff1dc1323f6d14b06aec89bbb4f69c32408237a3d40224901a3cc647bf3e662c904d7014f509d865b2e57aeb3292f4974995f9b4423a845d822f8c8a18')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
