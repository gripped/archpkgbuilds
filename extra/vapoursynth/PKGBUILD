# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile.desu@gmail.com>

pkgname=vapoursynth
pkgver=75
pkgrel=3
pkgdesc='A video processing framework with the future in mind'
arch=(x86_64)
url=http://www.vapoursynth.com/
license=(
  LGPL2.1
  custom:OFL
)
depends=(
  libzimg.so
  python
)
makedepends=(
  cython
  git
  meson-python
  python-build
  python-installer
)
_tag=c05906995662bacd5bddf853d8e68f19286987db
source=(
  git+https://github.com/vapoursynth/vapoursynth.git#tag=${_tag}
  vapoursynth.xml
)
b2sums=('78e5acdb175c878ad72b06b9ef73bb689762adf5578753a61cba389cd29fa9786868abf751f5b88ee393dddbb7788d176d227c538b9458ba593f8302153cb5d3'
        'feae23a22f8589177f30c36bdf21bab93d55a786194d3e0e958537016630d075b82178f60ac840f30ae316a8f87d3fb01f371211f62d1fee9850ee5063561747')

prepare() {
  cd vapoursynth
  git cherry-pick -n d398f465154ef141d447af78b2e65a025de28522 # Prevent statically linking libstdc++
}

pkgver() {
  cd vapoursynth
  git describe --tags | sed 's/^R//'
}

build() {
  cd vapoursynth
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" vapoursynth/dist/*.whl

  _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
  ln -sr "${pkgdir}${_sitepkgs}/vapoursynth/libvapoursynth.so.4" "${pkgdir}/usr/lib/libvapoursynth.so.4"
  ln -sr "${pkgdir}/usr/lib/libvapoursynth.so.4" "${pkgdir}/usr/lib/libvapoursynth.so"
  ln -sr "${pkgdir}${_sitepkgs}/vapoursynth/libvsscript.so" "${pkgdir}/usr/lib/libvapoursynth-script.so.0"
  ln -sr "${pkgdir}/usr/lib/libvapoursynth-script.so.0" "${pkgdir}/usr/lib/libvapoursynth-script.so"

  install -d -m755 "${pkgdir}/usr"/{include,lib/pkgconfig}
  ln -sr "${pkgdir}${_sitepkgs}/vapoursynth/include" "${pkgdir}/usr/include/vapoursynth"
  ln -sr "${pkgdir}${_sitepkgs}/vapoursynth/pkgconfig/vapoursynth.pc" "${pkgdir}/usr/lib/pkgconfig/vapoursynth.pc"

  install -d -m755 "${pkgdir}${_sitepkgs}/vapoursynth/plugins"

  install -Dm 644 vapoursynth/src/core/ter-116n.ofl.txt -t "${pkgdir}"/usr/share/licenses/vapoursynth/
  install -Dm 644 vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}

# vim: ts=2 sw=2 et:
