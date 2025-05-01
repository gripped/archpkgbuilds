# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.14
pkgrel=2
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD-3-Clause)
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
  '010-alsa-ucm-conf-fix-acp3x-alc5682-max98357.patch'::'https://github.com/alsa-project/alsa-ucm-conf/commit/25f519f66c3e496b21ca1ad83ebc6114dfaa9fc3.patch'
)
sha512sums=('a224e890919306bdcd606dfb873b089950c9fa89f24c02947692ee8ab1a05c419f2a8dc174440d17c8a9575cab293806630f2cb43d74677f7ef0d956b7883dc5'
            'SKIP'
            '52a4a40e962e250c44472a77fe1ab8a3112984915abc8b05cbcaa2798caec72c5d51500ca59608828d27d22c83afe7c1a1528d73c331d80882f11e9595cac7fe')
b2sums=('cbb4b81db7670207cac5b85ba9cd4d9df93e4aca573da4caffe0f1e0386a9685b837e58b7ed85ddcfecf3c0f2469e706833dad6f0ef020440c943aa41520f8f0'
        'SKIP'
        'a6cf2b93200de1a8dac1a8f3b829aa86b6ba4258f011ae2cc33a4f6304f3fa04b06e5f8a4f855d8362b14920785406768d30dd56612d333054cd49505812e36b')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  # https://github.com/alsa-project/alsa-ucm-conf/issues/550
  # https://gitlab.archlinux.org/archlinux/packaging/packages/alsa-ucm-conf/-/issues/2
  patch -d $pkgname-$pkgver -Np1 -i "${srcdir}/010-alsa-ucm-conf-fix-acp3x-alc5682-max98357.patch"
}

package() {
  cd $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/share/alsa/"
  cp -av ucm2 "$pkgdir/usr/share/alsa/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 ucm2/README.md -t "$pkgdir/usr/share/doc/$pkgname/ucm2"
}
