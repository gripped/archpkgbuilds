# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.16
pkgrel=2
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD-3-Clause)
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
  alc4080-spdif-fix.patch::https://github.com/charleskeepax/alsa-ucm-conf/commit/f846a8bba8fc2d21d23caf7eafab5f560f9196fa.patch
)
sha512sums=('37b5209783f569d231cd4d29b93e1c10b6b90debe610717cddb679642a7f3d0e3875c8c3bdced9ac5fc578f292d0e1c5d21a02e41e78e49a5f9eaef2ea4cd9ec'
            'SKIP'
            '967efcbd3484ebab76a367fd2c0f62fb647a301d927fbca39e28e8043f96f358772a6a6f03661c0534ebc24c4e65ecd8e058a56048c6188f28a493516de9f07e')
b2sums=('e01e5e62914f93bb79b84b241ec7e35d58221035d22842cfdb261f3010c7a8dc1431581607697277d5f6f512557a71ce9b6fa6edf495055849b59a838ded9e05'
        'SKIP'
        '30b665026d3f2f4f48ae29d097c3be8a5f30ab58fc48dea31aef5f27cad32c81698105e1ba72d3a99dc9d0c91224cd2eb42cf274197b22bf3ab8f14b06c38547')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 <  ../alc4080-spdif-fix.patch
}
package() {
  cd $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/share/alsa/"
  cp -av ucm2 "$pkgdir/usr/share/alsa/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 ucm2/README.md -t "$pkgdir/usr/share/doc/$pkgname/ucm2"
}
