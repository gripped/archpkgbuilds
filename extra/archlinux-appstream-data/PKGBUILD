# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20260910
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
sha256sums=('8a13a89c7ea73ab81d39b2d121f53cdd32919defa001fc1e303d13ba44033146'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '477329002e53b24500bdb1a0447464545ca44536c46b65ebe9630a28ac8d50e8'
            '4ce96bd9bc0a83df1a8b8d0e545a4bcfe996f0acb2d5e5d7ce5809a41eeb0866'
            '5683fd93baefda2a4310d977a1af4e6c66331cd70aee388240700ab88c994929'
            '16c3fd11dba41c9d4d78e460a81ec7f92edb6663e033f63e19f111e43213022d'
            '8baafd3d360efc33c40d0e3215ff10182ecbc02476cb1e2c8179f184e9266d2e'
            'b8eafb7612638a02813a9d3d092fcebf89c7369b114ac69d1f1b3d31de92377a'
            'b22c32091f089e87adb25a2c9b741996e8ea69b8e52aca2fd28bebe4ee3a2021'
            '347971518bb28fc585dca290c081ebf5dd039c53f7d1924e0c132028ad0ea9a0')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
