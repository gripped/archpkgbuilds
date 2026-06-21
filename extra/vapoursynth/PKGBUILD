# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile.desu@gmail.com>

pkgname=vapoursynth
pkgver=77
pkgrel=2
pkgdesc='A video processing framework with the future in mind'
arch=(x86_64)
url=http://www.vapoursynth.com/
license=(
  LGPL-2.1-only
  OFL-1.1
)
depends=(
  glibc
  libgcc
  libstdc++
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
source=(
  git+https://github.com/vapoursynth/vapoursynth.git#tag=R${pkgver}
  vapoursynth.sh
  vapoursynth.xml
)
b2sums=('ae5d05679969783d4fd400c6fce88646ca935b176699595050a1beb2adbc10aaf1c8e5a7dba771f0e81205d8e60f6de3e0e63346745adcfb076589ee253d193e'
        'ad7eb96f7bdb170ad6452739c0ea2a93841d81d63fd180889ee87460575da21314bef28083483db49a858a82106d447b213464afd48d8e2b74bc1c1bb6964445'
        'feae23a22f8589177f30c36bdf21bab93d55a786194d3e0e958537016630d075b82178f60ac840f30ae316a8f87d3fb01f371211f62d1fee9850ee5063561747')

prepare() {
  cd vapoursynth
  git cherry-pick -n d398f465154ef141d447af78b2e65a025de28522 # Prevent statically linking libstdc++
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
  install -Dm 644 vapoursynth/src/core/ter-116n.ofl.txt -t "${pkgdir}/usr/share/licenses/vapoursynth/"
  install -Dm 644 vapoursynth.sh -t "${pkgdir}/etc/profile.d/"
  install -Dm 644 vapoursynth.xml -t "${pkgdir}/usr/share/mime/packages/"
}

# vim: ts=2 sw=2 et

