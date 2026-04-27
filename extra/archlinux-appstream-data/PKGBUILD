# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20260421
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
sha256sums=('689e5297bdfa93a6009c842ac5f50eb7cb974c8401f5818bcaec563fc291c658'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '433a496d93175f79c9b764230e4a044a420e0bc8b46beb7177ff40910dfea362'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '858c5e727fcf16dfa2f439b25b048dbfdecfaabed93b5bdc381bc4121d45a156'
            'fb80256e45fcc8405610bcaa68a9df288d48bdf8a6d09d7bec4c05a3074403d2'
            'd678e7df9b6acad056825857d5434a1467521e55e46a8c14c58d4f491e7098f1'
            '21f573a7c3dcbb16bad22036ca7819bfc74cef69218f15ce3fabcb05483af9e5'
            '874363634b0d454386fcadd577fcbdc902aec4a8552d215bc5abb7184c863ea8'
            '680873c91a2f79e3c7ada01ac546825f4dad64461f5d84810ccddbed11fa9f80'
            'f1fdea743aa74faa5bfd94b377fb48d14cae90dc3105326dc2af33dde56d7628'
            '1b3ae021ff2e6fad9fa938a5eb50916b8a9726a880ad66dcd99b730e0d7d27bf')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
