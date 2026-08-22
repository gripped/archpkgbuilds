# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20260821
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
sha256sums=('170ef4957375bbcc323742b52c7bca6ad87dcf15ce6a5b0ef57992c3e0f19bee'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'eeb7667241ac81e266de1c8246384ec25722ed2b942293bb4d2009178b7fc4f2'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '60716951977b405d9dea4b8c3c64dc73eab40d777a60cf22633fb149af3bbb93'
            'ca1abf84f1c05f407cf64b6f3d096b736b420931af685ff4dadadb49d1057f40'
            '0afb0aaacb5ef3fa988d54ca3d062ce82e14f14feac8385981c6ba2b0db650a6'
            '272ab715b8f629e5245f892cfb3938f6630f2d9ffbe6dd7ab70a17bce4c79e3a'
            '483b5dbf75ca736388d98dc1845538238a3d210dda825f6315c4341ee0761f9c'
            '1b5c3906201fcf47e78969262c4c4de3567819765e5611745384583c32c61761'
            '63fc7af8ad16dbecea0477ddd0257518a1c8f411432db87d8254e8431464c3d0'
            'c83722fc4d223ae4a7cb64e030b3f94812ca69d133aa768cef01f50102f2e737')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
