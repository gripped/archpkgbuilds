# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.16
pkgrel=1
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD-3-Clause)
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
)
sha512sums=('37b5209783f569d231cd4d29b93e1c10b6b90debe610717cddb679642a7f3d0e3875c8c3bdced9ac5fc578f292d0e1c5d21a02e41e78e49a5f9eaef2ea4cd9ec'
            'SKIP')
b2sums=('e01e5e62914f93bb79b84b241ec7e35d58221035d22842cfdb261f3010c7a8dc1431581607697277d5f6f512557a71ce9b6fa6edf495055849b59a838ded9e05'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

package() {
  cd $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/share/alsa/"
  cp -av ucm2 "$pkgdir/usr/share/alsa/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 ucm2/README.md -t "$pkgdir/usr/share/doc/$pkgname/ucm2"
}
