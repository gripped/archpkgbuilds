# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.14.0
pkgrel=2
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url='https://github.com/jvoisin/mat2'
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
checkdepends=(
  'ffmpeg'
  'python-pytest'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jvoisin/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
        ${pkgname}-${pkgver}.tar.gz.asc::https://github.com/jvoisin/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz.asc
        issue-26.patch::https://github.com/jvoisin/mat2/commit/690e01d475117a4e0c85f26154b26ef332f036be.diff)
sha512sums=('7b1f2bab7879e0ac3e60d07c3003ce8b7565c927bb658a7f34c062ee45b2a67f2830a55b518c77e953c80ca2296fed2567b70660c7c0394386616de2d0bc82cc'
            'SKIP'
            'e7564c9ad76d3a9512149ebcc31248f5908688225527475f4e442278d25858f05deea2beffca1cdab43da47b1965b025249b95ca6d249f39a69a3ed9c1a70c54')
b2sums=('dd209912f659ee95c1d26051003152c09dc97d45680c608dd73b0b3a001411ace437745ce3c465d55461c47cf13e30cfdba533fdf9bdb4e749b8db666616c589'
        'SKIP'
        '877716268c5dba627e9f76d7be7916e28479bc8fe4ea39e1f995ecd2ee3ef268242c96ae065f09c4754705606f13d2b2cbf13a24ef9f3271ddce519c88c5a1e4')

validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC') # Julien (jvoisin) Voisin

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../issue-26.patch
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  pytest -vv --deselect tests/test_libmat2.py::TestCleaning::test_all_parametred \
    --deselect tests/test_climat2.py::TestControlCharInjection::test_jpg \
    --deselect tests/test_corrupted_files.py::TestCorruptedFiles::test_wrong_tif
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kio/servicemenus"
  install -Dm 644 data/mat2.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
