# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20250529
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
sha256sums=('7731ef8fdcf5030c7b3aecebecc62a35d27cbb9fdaa3526a061fe986e899cc7e'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '3805ad9f1a730cfc75c885b01fe3695929dfb2ae19fdf154a5f6dbe37239b90e'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '011d0096cac9cf01c08a940b1566034b816d7e1fcfe6ef3f882de49428b2d030'
            '0bb31a4f92404194d3420c17b2eb57bb71c3f7684248ebf46c254e64cd6a8a89'
            '8686e2c03c0baafa882703d9c63f3ba8926c1005e1f11128ccea127265a4fea4'
            '9597a3ef8c3995d4a5fb59c68bb6f3e7da58a0e346b9544425f0269400531f81'
            '8a7d8c2d5c6e02e4f56910d0db94a630783dbd69e55ba45b4dd68c3ddfe1c5f1'
            '8d7594d875aa9024199519d24e6a840020c51739ae5136e8edc41ffe1ffac03f'
            '04194deea42a79ce241830ca00163d6c62d88321980fd95daa8fe975e9a1c780'
            '29926298584952dd24518147ab9075b60850ce559c36d9b3051f2be2cbc1c8b7')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
