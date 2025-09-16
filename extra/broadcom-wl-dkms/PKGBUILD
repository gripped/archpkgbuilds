# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrey Vihrov <andrey.vihrov@gmail.com>
# Contributor: Frank Vanderham <twelve.eighty@gmail.com>
# Contributor: Jacob McSwain <jacob.a.mcswain@gmail.com>
# Contributor: Thomas Braby <thomas@mykolab.com>

pkgname=broadcom-wl-dkms
pkgver=6.30.223.271
pkgrel=45
pkgdesc='Broadcom 802.11 Linux STA wireless driver'
arch=(x86_64)
url='https://www.broadcom.com/site-search?filters[pages][content_type][values][]=Downloads&q=802.11%20linux%20sta%20wireless%20driver'
license=(custom)
depends=(dkms)
conflicts=(broadcom-wl)
install=broadcom-wl-dkms.install
source=(broadcom-wl-dkms.conf
        dkms.conf.in
        001-null-pointer-fix.patch
        002-rdtscl.patch
        003-linux47.patch
        004-linux48.patch
        005-debian-fix-kernel-warnings.patch
        006-linux411.patch
        007-linux412.patch
        008-linux415.patch
        009-fix_mac_profile_discrepancy.patch
        010-linux56.patch
        011-linux59.patch
        012-linux517.patch
        013-linux518.patch
        014-linux414.patch
        015-linux600.patch
        016-linux601.patch
        017-linux612.patch
        018-linux613.patch
        019-linux614.patch
        020-linux615.patch
        "https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
b2sums=('d87dc7c632a1fb8da58a62228bf607fc5020263476e582982c24cc67b7cf4cfa6aa70c9f3f48f33edcd7162da1f3db8af3160e962f5e8ab4a247d0d6a8ab0e63'
        '5d422dce31ef8c8a71f70f203ce6930775f89e92094c908668ff82ce50378ad31cd807c5b4d9a66be2324b6fd73d8303dd4b011b9992292375dd6716fbdfeca4'
        'e4d0858a2319a1cc7fb87c111d22ec6640f03d5f1618c188821cecf37bc1d2f20ba7317f740d9dd4a3fb9c2e6cebb5012cca699c58a299a668f4448fb0ad19f4'
        '80c271dc4a5038640592b2cfab7f9f2eb65d4624602356e66508263048356076437d2efa9fe57799664b070527e93d70470af0913a5e7065ab489a0c1efc3368'
        '367aaec19dd965e0410a837fddba959c4cd5bfbfdf843b1e60c774059e45144a8d65081accadc97280728048b5a039c39bb9b161f042b61cd4303aeb20a183a7'
        '87869c9ec4da9d94d4b70f30274792a50f71004b506955f7668a040e04a9867e49c564bc36636ce38805b910efa233f1b1649b7f25b0bceb82a1d10c30b6c416'
        'a6bb71b8485b9dc43f12779a398f5494cee5f2675c69af827f5ae97537faf408c1ca5acff5311f0da7f315ad2626abdff3507f0569e4833d7d33ac3ed4338d89'
        '6ab58ba7f11c4295f52b36164415c4e15b5b489ff7338bbc3cc8cc9cbc15996f4f967d25349ff5016bf1817d9c2a963e7530ebd054d60186dedf47cff3238676'
        '29b365a065ee9639ba4a93c62e8fb2911b1bd4703e6179d7b8c9b1bced4ededf8a480ca6de65087e107d702ab289094f2b706a4782d6d4f984d9a892391571cc'
        '67771ed493673b1d28ec1585631024a8aebb9f3f1cf09691f396ed10fcb08e90499b935c384e40a8ef22199df588c3b45f6490c99df9fe958d3a8f1085b89799'
        'c743b072dcd4f7c6f6c0d3ca7807f61a7593dc1f702c049df7fe9330c0e12e503b747eda027cd9276bd401e155f66b3fd026cb20f60624d450013a2f45146d7a'
        'e43dd28faade827f3acdeddfb10edc353521f2a9b22376fd9aa61b9f721178d1e0f345fa7b1cf9105fabb5352b643b8720e55d890984a9308d55b52abfd575e4'
        '329c809bfa0055529ae11adacaab8b158edece908e9316eceff35def671b439117df958536c799b2ab0ecd56904752a4bfc49712438d2e1000327e25a9701153'
        'f9584be16b58440bb47ffece2cda096a08919f484ee1c9ea29eda1b34011838d14251c40071bdd9fbfdd34e1c9e19ed2adffd35b311e9abc230155c05eec108a'
        '1d6b37630251dc5078eb73d61dc1a0fc9783a24b0ea2d93ec9b457bfd580376d87586dd52a42051644d1fd41f652a456ec4c81826c8459b0e58198f40dd6d6e3'
        'd4b06acc3c62cd7b1f74307a7479e14141e502482c8086826359352111fd5b9e19d57c261b1cc7ed45b316cdbabd72cc937f745594293c8f380ed4aa8042775b'
        'b28ecaea767688649ff6962723cd6d2d99dd015e2360b42cb849c2f4dae11346b4d9026dd83ee6b7ee665ab5d99ecdf50bd9c40e4b272ab917c7543602bf261d'
        '89685f339b46efc6258d3048bb74d9f554edfb3e1eaac0d95965477e26a32ab774199067c8e74afbcb76f753b308589b941318d6a6bec44b997987baf131676d'
        'bd83a1f4e4d3b29516de88fb3249ec136044413f03894471e941f6efebca26c26eb94e6ded537543d752ec60401d731da1da052939b3d4fb25a8f7ff39628925'
        '911378fc40cd9a71b0c5399f0a08654f4a7680749c0ba1d6c90eca2cbd7d49551501f053448d6c6b72c33fd12215a4e551a2e4dc6b316fb48760128db99b6530'
        '00529dd588cf334860718db8a14ae01c1d7a561b793b8b9eae2230d531c923770bfc4970978db29144d7cd00d7a8b63c4125c6b7fc8886f36f2b274f1bb0577a'
        '383366a9410eea47db6f31fd1cbe8a63e48a22121c2bee36e93a19934bdb8e7c71cf8171539bf6ca0f3f5bd060233405a2a7b708c55a298734881111757bff91'
        'e9d01c1a1a63c07f720e3ee53ee3ef634ab12694135300cb0ce47ade0e9e0084967a0b6df64d983e8184240eb3defb128f650bddb7727e901d50315307f3398a')

prepare() {
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "-> Applying patch $src..."
    patch -Np1 --no-backup-if-mismatch < "./$src"
  done

  sed -e "s/@PACKAGE_VERSION@/$pkgver/" dkms.conf.in > dkms.conf
  sed -i -e '/BRCM_WLAN_IFNAME/s/eth/wlan/' src/wl/sys/wl_linux.c
  sed -i -e "/ldflags-y/s|\$(src)/lib|/usr/lib/$pkgname|;/GE_49 :=/s|:= .*|:= 1|" Makefile
}

package() {
  local dest="$pkgdir/usr/src/${pkgname/-dkms/}-$pkgver"
  install -Dm644 Makefile "$dest/Makefile"
  install -Dm644 dkms.conf "$dest/dkms.conf"
  cp -a src "$dest"
  install -Dm644 lib/wlc_hybrid.o_shipped \
    "$pkgdir/usr/lib/$pkgname/wlc_hybrid.o_shipped"
  install -Dm644 broadcom-wl-dkms.conf \
    "$pkgdir/usr/lib/modprobe.d/broadcom-wl-dkms.conf"
  install -Dm644 lib/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
