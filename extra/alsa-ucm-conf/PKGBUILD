# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.15.3
pkgrel=2
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD-3-Clause)
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
  $pkgname-1.2.15.3-dualsense-ps5.patch::https://github.com/alsa-project/alsa-ucm-conf/commit/31df87b5d77f3e02b6bdf61b4974654fdaaf9597.patch
)
sha512sums=('079aeb45bc3f98448f6e48a1267db5d3f46a51d7060eb8275d0a084574e23eec34f07108610538e898c397fa24941ccf1bb7722c6b4bb0fa9c48904addc03973'
            'SKIP'
            '1f5a32634b22ad364e0a952db095b467fd3bfd2a335d10c794e1aee10e439a394a0fff5a88e17fb1b865d150e9e347bb44c68ba55defce7aa3ef14034bff8881')
b2sums=('7b563fa4685988bf509f4accdab1146b49a807eae8d4ebff3d634c1086c70130930a0e09e08af0be0996dd56d4fdbd58e9d7daa37f762106fa493198589ceac4'
        'SKIP'
        'd84ef0b1ec68fa0bbfd32081a5f9f5684f3212c9e65f1c8ed876c8e126462e23e78fafecfc91a7aeb3470dfd63efa8f27d57b666868826d33043eae40aba2756')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-1.2.15.3-dualsense-ps5.patch
}

package() {
  cd $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/share/alsa/"
  cp -av ucm2 "$pkgdir/usr/share/alsa/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 ucm2/README.md -t "$pkgdir/usr/share/doc/$pkgname/ucm2"
}
