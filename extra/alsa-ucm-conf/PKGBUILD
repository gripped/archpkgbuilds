# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.15.2
pkgrel=1
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD-3-Clause)
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
)
sha512sums=('32781f28814b360c1ddabafa23ab989be18b284990dbc013cb712a9c6c12d5236e493b1fb33582e5edfd73f282a6f2db82adf0754356a8337e1fa4bd2a656dac'
            'SKIP')
b2sums=('dd64708f61d6e404cce6f97e03f3e2aa1417e31c31f9bbb0f4c0ffe174955a0e1f12fb263829c9584c4316e750210da770ac8d2a82b4054a58be8a2627538d06'
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
