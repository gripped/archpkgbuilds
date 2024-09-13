# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20240913
pkgrel=1
pkgdesc='Arch Linux application database for AppStream-based software centers'
arch=(any)
url='https://www.archlinux.org'
license=(GPL)
depends=()
makedepends=()
source=()
noextract=()
for _repo in core extra multilib; do
 source+=($_repo-$pkgver.xml.gz::https://sources.archlinux.org/other/packages/$pkgname/$pkgver/$_repo/Components-x86_64.xml.gz
          $_repo-icons-48x48-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$pkgname/$pkgver/$_repo/icons-48x48.tar.gz
          $_repo-icons-64x64-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$pkgname/$pkgver/$_repo/icons-64x64.tar.gz
          $_repo-icons-128x128-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$pkgname/$pkgver/$_repo/icons-128x128.tar.gz)
 noextract+=($_repo.xml.gz-$pkgver $_repo-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
sha256sums=('bc6148b9c01a13878149351ee9f6f5ba386c58b6dbf07c5ac7dcddf5f005c1f0'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '35109cf98eff293dc26af10db2c484271a6679db0462afa1a7965f50ae441672'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'ce3ce96a2aaafc281d611229521c5a39833c4573e1e85aa733215aa3674ee07f'
            'deb5579618933ebbab0e01530f86dc29359cffcd703f98820fa1278240967630'
            'c5d028f4c585dc3e97af436d9d85249b1d27119879da4ab47a0071f4077fc6b3'
            '2fd49c8c87b07e8bcba80fa091d5fd6b4b69a3916c9572cc06af3cae95194e67'
            'd100da424c7611ebfc9710c0e1d4f6da95615335c67ed33f265004bb91ba2025'
            '2301ee29c01db64f9e120227b7a6be1cf3898bfd9523f498d71af966b72367e3'
            '450c282fdf32feb92a5deaea99a7c43d3639e8dad9e67f03de1b04acbb94387a'
            '6c92976f6d4b440169575931c8374a53d6ffb0578e3bd9f80e3d15570d37da56')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
