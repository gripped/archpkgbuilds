# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.13.5
pkgrel=1
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url='https://0xacab.org/jvoisin/mat2'
arch=('any')
license=('LGPL-3.0-or-later')
depends=(
  'gdk-pixbuf2'
  'hicolor-icon-theme'
  'librsvg'
  'mailcap'
  'perl-image-exiftool'
  'poppler-glib'
  'python'
  'python-cairo'
  'python-gobject'
  'python-mutagen'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'ffmpeg: video support'
  'bubblewrap: sandboxing support'
  'kdialog: dolphin file browser integration'
)
checkdepends=('ffmpeg')
source=(https://0xacab.org/jvoisin/mat2/-/archive/${pkgver}/mat2-${pkgver}.tar.gz
        https://0xacab.org/-/project/1139/uploads/060efa77668fa7f6d9baeb8a327857af/mat2-0.13.5.tar.gz.asc)
sha512sums=('a700f5c136b20203b5173c685b49d589f75082a067b9a6059766dd3d78d7cf2988080c5e523e0d35e6aced79790e9a322c3b0d4a8364bb83af6ce2490acb6abb'
            'SKIP')
b2sums=('d8fd5007c65ac6eab4c493f5f71e9c5dbc56f4f89f04546ed861aed6142026cf3a013fcfe130dcf3879d45ffbe4144d51930cfc320d9f31479b3bee5fc5a103f'
        'SKIP')

validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC') # Julien (jvoisin) Voisin

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m unittest discover -v
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kio/servicemenus"
  install -Dm 644 data/mat2.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
