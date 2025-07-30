# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20250730
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
sha256sums=('be7d3d7f26e3713fc70d4c47fe36694ddbe784ec90713d3a6d2ff5d0765fe5df'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '1539d56c5fb1fdf58ce3149678f0ab8c04ac2e8365cd6e247ff5e707b56afc0f'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '9845241defe9f398d0e4ededdd2391bf30625fc8b72339f4207423b7aa5c4f68'
            'a35a681f671829d37ee2189f6c2678c5e7f2ea749db52cd3b964f59eff2c1dfc'
            'f267bce108e05a1dba8e8e406f408a26388d7f68d9298a39e99e92fe5295b094'
            'f11edbbf18f121892f20d7b23b35521524a74c9d9929813cb20140d5d210f54c'
            'e2a3f68d51a71e3e982f6f831840e7af2a73aab396e4cf32031a7588e27def4d'
            '0df949ab725357834f2f8ae62b7f974167dfbbfdf7744d81b1f8cff9be256f42'
            'f40ca7ca71a4299da094113cbf30082ffff7209cb85a90aceb7cdee3b949e8ac'
            '1b2808ecc0ba67a77624dbef2cd0540246f6d97ee6c4a1bbb6ef60c7915b635e')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
