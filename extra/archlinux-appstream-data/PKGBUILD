# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=archlinux-appstream-data
pkgver=20260722
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
sha256sums=('541ee7a841e32579be8d10b77fc8b4c34b7d6c40815ae79ace5ae214e5ba7e29'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'e319501aaf7b7eafb553442d02dbfef4d58778596885e27c1d5c6feed7f3ab3e'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '193a898794647e52cdaf765e0009456a28914e48c58db3a3bf0226817759fb89'
            'a389833eea0ab6e32fde42fa85cc305d36f7b2717cc81c27b792ba57d2755420'
            '82500d857c8470b8bc81dfb2d0cc80c3bb891c588e937b37636e3de3eb2fb681'
            '42a04a9a938d854de01fdf51835ff05e24aafec2c0f63645a8fb33c18a41a34f'
            '53986bdee1ed03b09bab81387aeeb32752a2ffb2d7fb63847832116be6b37124'
            'a4299ecffecf8975e347c8e74a184ef47f81b4e2bf89782576e2c9868bb8ae62'
            '6f9f3502d2c003b7b75dfa198d62cd094a713a3f6168b0047da0bdf1645325c0'
            '18fb012246eb590e55806f8e1e7ae754ad4455b7c614f5434050125072e10226')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/archlinux-arch-{core,extra,multilib}/{48x48,64x64,128x128},xml}
  for _repo in core extra multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
