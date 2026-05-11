# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgbase=thunderbird
pkgname=(thunderbird)
pkgver=150.0.1
pkgrel=2
pkgdesc='Standalone mail and news reader from mozilla.org'
url='https://www.thunderbird.net/'
arch=(x86_64)
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  glibc
  gtk3 libgdk-3.so libgtk-3.so
  mime-types
  dbus libdbus-1.so
  dbus-glib
  alsa-lib
  nss
  hunspell
  sqlite
  ttf-font
  libvpx libvpx.so
  zlib
  bzip2 libbz2.so
  botan
  libwebp libwebp.so libwebpdemux.so
  libevent
  libjpeg-turbo
  libffi libffi.so
  nspr
  libgcc
  libstdc++
  libx11
  libxrender
  libxfixes
  libxext
  libxcomposite
  libxdamage
  pango libpango-1.0.so
  cairo
  gdk-pixbuf2
  freetype2 libfreetype.so
  fontconfig libfontconfig.so
  glib2 libglib-2.0.so
  pixman libpixman-1.so
  gnupg
  json-c
  libcanberra
  ffmpeg
  # icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        0024-bgo-969412-glibc-2.43.patch
        clang22-wasm32-wasip1.patch
        encoding_rs-simd-select.patch
        vendor-prefs.js
        distribution.ini
        mozconfig.cfg
        metainfo.patch
        org.mozilla.Thunderbird.desktop
        missing-include.patch
)
validpgpkeys=(
  14F26682D0916CDD81E37B6D61B7B526D98F0353 # Mozilla Software Releases <release@mozilla.com>
  4360FE2109C49763186F8E21EBE41E90F6F12F6D # Mozilla Software Releases <release@mozilla.com>
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  cd $pkgname-$pkgver

  echo "${noextract[@]}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  sed -e 's|73114a5c28472e77082ad259113ffafb418ed602c1741f26da3e10278b0bf93e|a88d6cc10ec1322b53a8f4c782b5133135ace0fdfcf03d1624b768788e17be0f|' \
    -i third_party/rust/mp4parse/.cargo-checksum.json
  sed -e 's|880c982df0843cbdff38b9f9c3829a2d863a224e4de2260c41c3ac69e9148ad4|239b3e4d20498f69ed5f94481ed932340bd58cb485b26c35b09517f249d20d11|' \
    -i third_party/rust/bindgen/.cargo-checksum.json
  # Clear cargo checksums for glslopt - the glibc-2.43 patch modifies files in both
  # third_party and comm/third_party copies; clearing is simpler than computing exact hashes
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    third_party/rust/glslopt/.cargo-checksum.json
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    comm/third_party/rust/glslopt/.cargo-checksum.json
  # Clear cargo checksum for encoding_rs
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    comm/third_party/rust/encoding_rs/.cargo-checksum.json

  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

  # Set BOTAN_VERSION from system-botan
  _botan_ver=$(pkg-config --modversion botan-3)
  sed -i "s|crypto_backend_version = CONFIG\[\"BOTAN_VERSION\"\]|crypto_backend_version = CONFIG[\"BOTAN_VERSION\"] or \"${_botan_ver}\"|" \
    comm/third_party/rnp/moz.build

  printf "%s" "$_google_api_key" >google-api-key
  printf "%s" "$_mozilla_api_key" >mozilla-api-key
  cp ../mozconfig.cfg .mozconfig
  sed "s|@PWD@|${PWD@Q}|g" -i .mozconfig
}

build() {
  cd $pkgname-$pkgver
  if [[ -n "${SOURCE_DATE_EPOCH}" ]]; then
    export MOZ_BUILD_DATE=$(date --date "@${SOURCE_DATE_EPOCH}" "+%Y%m%d%H%M%S")
  fi
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZ_NOSPAM=1

  # Set remoting name to fix the missing wayland icon
  export MOZ_APP_REMOTINGNAME=org.mozilla.Thunderbird

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ./mach configure
  ./mach build
}

package_thunderbird() {
  optdepends=(
    'hunspell-en_us: Spell checking, American English'
    'libotr: OTR support for active one-to-one chats'
    'libnotify: Notification integration'
  )

  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ./mach install

  install -Dm 644 ../vendor-prefs.js -t "$pkgdir/usr/lib/$pkgname/defaults/pref"
  install -Dm 644 ../distribution.ini -t "$pkgdir/usr/lib/$pkgname/distribution"
  install -Dm 644 ../org.mozilla.Thunderbird.desktop -t "$pkgdir/usr/share/applications"
  install -Dm 644 comm/mail/branding/thunderbird/net.thunderbird.Thunderbird.appdata.xml \
    "$pkgdir/usr/share/metainfo/net.thunderbird.Thunderbird.appdata.xml"

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/org.mozilla.Thunderbird.png"
  done
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/thunderbird-symbolic.svg"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/thunderbird-bin"
}

_package_i18n() {
  pkgdesc="$2 language pack for Thunderbird"
  depends=("thunderbird>=$pkgver")
  install -Dm644 thunderbird-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/thunderbird/extensions/langpack-$1@thunderbird.mozilla.org.xpi"
}

_languages=(
  'af     "Afrikaans"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'br     "Breton"'
  'ca     "Catalan"'
  'cak    "Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'he     "Hebrew"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'ko     "Korean"'
  'lt     "Lithuanian"'
  'ms     "Malay"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'th     "Thai"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=thunderbird-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("thunderbird-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in 
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('bf3d33357965cd144decef7c8865b6c18043502aea8d090d93fe29555379b924e3925d58276411f38fdcdc87b54ab3ae7d6aa6619feec9b856f8f227225cb375'
            'SKIP'
            '470f37b6401c9a031d11b56ed94dacc3f3e36e86c27931c5924ec8c3ad8f9676970d7d29af8f288ac88081a2a785b088365412128076559e1ba4df1546026dc8'
            'b7097f0d620be87047f6f11f152bd096dc144b1745fe30dc75db7d7050242c4178382f7e504cc10ad3545a3455174ca17a83fa3113443dffe660f28de006cb0e'
            '31e13c70fa34172827b8a82dabc3b416496942c4ca7110833c1503017804f05aabe0f52cd2cfa4e30133604c788e7ee15fb82fb30a6e8d0a3c8a24d0ba0971f6'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'f528f2645c44648a8a42015923e51b8626616e2c66cc3ff870c27223002c802c15616e570d639f9c79b3affa4b7f9e9f2c42c780bbcb42a55bd87edafa8352c5'
            '7e43b1f25827ddae615ad43fc1e11c6ba439d6c2049477dfe60e00188a70c0a76160c59a97cc01d1fd99c476f261c7cecb57628b5be48874be7cf991c22db290'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            '0736eadd278f034d3000dd0947ef75c2eff60fbba520931481984dfcdd83ca5cdfaa30257ad9b38ae82ab55d7fcf5b6025091a5618896c75f2a1ef461da3a5a5'
            '2c6c773067e120af8bfa247a816516bc620bf337941366516721f29d9baa6469d3b6aa74a9a8c84141654f9302525f0f4ebad71f329b3c27bef2531dacc2c4c6'
            '52abbb23a97c11fcdb180b0f5e39dcb3d95130c4de5c481f8f6583b63e9288dec8f77fe4f2fee4342b8a4b9cbf88991f4092d5ae24d138421c225207908ca0c9'
            'f71f7e4ae9aa29443b2acf15187d4bbf2aa2a0d6a022dd2403858d0a6417efeca7023ec207be86644bc19c2fa28baf54bcc7bc5b3de892d61ac0d630bded56ef'
            'a276dd22538b060b1068dc498e01a9152320b15a2b4515c2f93186d5033b6860b387647f0e407f47533c237b0f1d1c76024f66f8bd1d9b457faaa596786f98e2'
            '1f93c1ff06dc261b566ae2e10be2a0dcfb773b04270f3f0294a891c04f1b87f21bb5872db308046b45f22af5db6b18663de865eff6211323b93a5ceb1669bd0b'
            '524179a99d065718bfbec7ebb6b675707a459c7460cde07e384bd56c7bac96e3bf8fe5d3924cfc2749756f03a6ad2087b8fcdbc459ac96a6817ac8bbbc2a326d'
            'dce7d814e9f8d8ab4127f951eeff17750cfdc5e5bfb9a2e14c9777638803954970e0416984e09b86211554a724125598cf738ca2035b711787c17982d7d59189'
            '2ee3232ee3524ea9069686b47dc95d08df5499118300bbeb036fe19db3f69667aae68d02c1b906bc901dd72048df6f9dc85d1b8087a59edb1dde4c2d573ab5ac'
            'f05ed7d524ee4bea1d890668fca3003c77e454781e00af712318b9f11794bf0a9284899e0ef80bfa72e702c5ac00407012f6603896e47420bd50200e4bcde6f6'
            '43f55519cc6853ba364eafccf3c44ec485aef465951f48fe05c84a8b16351c2119d8ac25a742e63446d402cf2c1ee25e8879b64d67699253a32d2add01699035'
            '9905432b03d823aaf3dcb6dca59d2d1481d88ac86e336faf2cc5cbc706c72d1dbd3ecc009e6cf19a9529c500a27bfeede940bec63cc1c7b4f5c96969aee82f99'
            '3326dad5b2c4171ffc0b88a4bf91e04b1892c65665082ae7f4f18af395c9fe0c1d9c3452fb494eceb5e219a15cd1bc3bab0b8f091c177064ae2f66b4d887f467'
            'b8e9d8c9640c0fb2b0dc3f802517b3e3ec4838c8dee19a7cf9ba1d584400d6fcb1f2be08816085c34e2a1578a5664fc741a2ccf377d4e706e7e05943cb8898a7'
            '08b8563f7f46539f417b58389358a4a99c8e9a4be47c285e0a2a9ca78a50a2dfe52646bd0a1bfb93c0d4ff000173ec39ca05b179cf71976b40073dae9c6d8871'
            'bdbe7f42fb539d819b3a77d0763c3cada49c3ac21fd5b022a051684c210ea7c80ec1287bc9987d11c801af135479c6a74757001e9b6d72c3aca34d3f63bb4f3a'
            '2a3930bfef008151aa98aa55d14a5c0c6030eb5cc9575a300a2aee6d1d0a67c1eeae6f177e27fb691208ac515d756edbe61f021fe964b0b7c916430d9330d4c9'
            'fc9ae3473f4c7bff56fdb457902da4d86dda60aeb75185d8053d84d5f8155813413d2d634530c15c54012fca4f663699dcad348d2769473373013f9a41a58b1c'
            '46a60fe08dd00cd98209ddf205f84ee8bb15490f749fd388a253cce0a235ca042177bbab634211f9a8bb1ea3d2a7ffe6b711854bea2279a9f5a11d11078ef178'
            '98c7884b24e192ffdf3837d8e99cf35ef5f0ae128b436ee26ff3b1c1aa27eafeefccd0443db64d3b1b85eb0f0ece1be7c95b837e6f83b9b5a717ab10e40719a4'
            '63f4d4717abd59d09fd34f3c28d88f74ad024863478ba54583836e31d8dbe185841e5499b17a727b463a9270db6c9f24ae6739bef4f81674ee1d996d1162b316'
            '4a3b08ada535cee62cb1e4939d321547b0e6252528dea09ba95ba3f2d4bdf3e3e2de003c77db8e810a0dd6ea4f0baee5941e5e86d42fb683cb68a96d6fd55d7b'
            '84d2babfaaf0593821ebe3f2f1d0651926bdec2f11f7059563b2c205ff7b78b1ca1485b88fc69e5f6e62134314cd94b01eabde298ee33cce741e478ebda33048'
            'd87162be4d84db52c25c1adba959d6bfaa83cea507667a3061e0c544c786fe2141877892f7d1571fd13f76cc0e95a761be8daed347389b3866f3353eed1b6a87'
            '43b5feb83f848ab0cd8fb47e20c919989f8e8fff5581fefa97a319a1729185252018956e321c5906c28786cf96143ed50bf2d84b63a48f286bdd804086f662c0'
            'cad4024aa2e260fe7fa422ad5db42f968b3dd5d2fa0de35fff3da4a4853231cced5f16032f40c91771da631067bc7f5407ca98bd5be2ee0df5f04870b6cf63c9'
            '3aa1529703cc79715d9a7de3e3dfbce2c05ae6958926fb58285159d9c6af3382ca5fa9e3ba2721aec936c742b7874dabc3e044b6f9a99c51346fd535c4fd9e43'
            '89ff0bd48848be46d971eefc787ac3f454c7a03c6baab638921ea7e6562bffd3a183129266493f1f25d948c1e72c7223d29a9924638077d49dd221273c2fa01a'
            'cf8d9b358b60edd89980baf645bc700c0e945823a2484042da6733e690765260a850072864f0b4ef6f941131d96b7234eb3deef6694551c88c91e0aa59eb0aaf'
            '4cc4b44cc7df48f925b28d4644ad334705527f8b90d9d3e74b6e13782a0b9375094e93e5dbea2dcc11db248cd2c450489825ca03a36316b2f185c207375f4262'
            '266426b00fcb291a93daad29639237e95a6a178f421f646dd6b939935c06b13d5b6bf3f27c2459d81bafdfd18f3b00251aee10d4e3d7dbc7d748be1534dd3c99'
            'e5bcf669656953af693ebd1e4ec7e6f4888b57215a8dc8e2bd2d1517cecb74c221cd7a1487b801999620ff4b8d1131e0c285add3e841ccad3226ac511456bc64'
            '54b25a1e830d64a241fb901092f01e1e6fe830f536ad2862cf668f2850ba7ae2a247fd8e588a492bc46e2e6f63d58b60388658e39270eb0bb85a8d744579be66'
            '7b0d8a9010cdecf0f3bfcc8549ea68f49cf90c4b42966947dd95d15ec8bfc73459bf444c161997f797c4a1b9590bc605fe6608ee33f6ecc4f610003474596b41'
            '0943b3d1ede8a1fdb4e675388b5438106810fa5571ac9f7c2826506c5d972e25e3e66b102a836fe05f34fade1cf6d1879102e3bda867303e1f1377978efef099'
            'dcb80a8b0efbdd9bcf4521a5ad789686f2d1ab4a2e0ceb43d3bb58359cd8bbf931089d670356f4edca58512fa889bb6b1c67ff335ec55a876d865d2a58690060'
            '7a638d3e4f2feef2391335ef6885805e3f282e53c94a1efff9bf76b253da58b79f77f7ffc2f97b70e52e8f770fe7174eea56fd5c9a0944f2571bc4b4fd5d4a02'
            'cd214b1e60976ecf85952407e7f0a45324903768615be161c2896348d8ab765ccf1b92050601e9fd9161b65233e8214c60bb3060b872ca70113845a046afb06b'
            '25cb602637bcdb70f0c8742a5bb6edaf33d68bd7e0aeadeef45a33835e79076e85faca1f732f881fd757896747c7f3a4ba3259bdc8565f25d352ba8bba1aba47'
            '0ea636cbb3c27cb44cc1ca0b9ef2385526e0d4da12ca176e62a9385d091e0f96cb7440e173a15fb126289365c1630ca4ef8dd27eec781f7ac0aebc425a17dfe6'
            '82fe9e6a1fd2bc5cd9cb16bc5e0c3ca1978bff5757c64728c560d72add68d228df5283c6a6e506a63d575805c7e7fe5a135577ddf4f2812d1e1f1075a156cda9'
            'e5b010e4f24a9f72f6ae9f8ef7ea0cfd332ae7f99ec6f87206fab625ab82f021c0aa99286101c5a2306f30a4013d9d46d1b5793a3aeddd6857adba8b72ace6d5'
            '34f33b1075e9d1c4594c48f757dcd3541cf601d1b520c36666305f42bb03ed39f0ba11f498440fdfd082393744a466e74ad6a51c3b5c81d026db479ae69d1df4'
            'b8ae0ad3269d77ef127ee235e3b07bf953ebb5749cca97a95e158a541b5d56f5c0222761bd6e0ef1d60e1b57a25a1760bb76bbe69af6f239c632a1b081336d06'
            'c8262f33e697a2567cab4c9c1b2dfcc8cbc6f04fe412c527269b3c1614c744563a2b66a151cbd2636aa0a3038a169ccf21a14867312f87bcb64803ae6ee07b62'
            '210fdf155e7cd3120c63bf8b030494af11f5c7b387c356486ef712421c7438865821a6dead6491f348154861033a366c10bc598bd813d75693655fcb79b87690'
            'bf0573abe9d90d18bbd7fd4aad717ef449292bb938f7f29d4b49effa955aef87391c28022e5d919c104fd81a7db1ca0651a8dfc9caff06a4e37fc5f23c61cb12'
            'd53069b25c61edc652dc3e302be392ea222621b9d0767b84ea06fd545319a20eac3bf18f711ed0109198bdfd92935330e70def4a792ad87127a64bba02cb4ffa'
            '2db95459e8d0cec206b3b62ec69f79815d8e6d8dbf121556583860c7db8b31f1582f99fb70dde792ab0eeea24e85ef8b481867c94cbb76b8da163d7604a62d18'
            'a3286fd579daf3aa42c729092b585fdac2d2e2c5b21352cdc21cc23f134ebf36419b225e5078d42af60d79e3767969836a294d1d8202378bac096696326c8eea'
            'a31c538e8ddf79af2df80d2bb3f055cf6a6eea686d717f819e261ace0cb6bb5033eb6abd9b75d330aff15a5acf6ed622906cfce06e6954896d1b9e96a86f6ff5'
            '30d306a1108caf0ac00770213f57474cae01194ba36cf24c008c10d69706f75f3634c6f5641ceaf71b34f0dd6469ac8c42626ebe8a69068c7d9be8c1acebfbc1'
            '12e2127c1e673924d09718c793b8eeff5e0e7e9afefeb37398491f912acbac22bea9711db4e94bd730707847165f75ce2214d6e98e60cb77ee4cc7cdab03e5fe'
            'e32127e4530a4714ec6ae67a797552c4516cb9edd032d9836085e63546a6183c61f26eca000aa15166b6e94f7809e73f3663a1506573cd593af5c889c5304d87'
            'fc110c060d9dee2ed410b6d4ab7871b3f27ca61feb496485f9a5aaf33a0d32c1622a143be29e86001c1dee363bdb986585fa505fd77a299b0d349f860414dbef'
            '0b560ce0a41d831b07808b4550a7f2771785831abc9445e0121c4838f983ef762c4341729a32b7ef17d7415ef63d7c73aa946e71c69dcafc82799d6fda5dfdf7'
            '34c6084c0df505eac62bbeec5976638268431eee5875569972f1c24016f8b7315deb4ae242e789700f3e701f89952bb2ff9127c73e27a4087e7fde3fed4f8c43'
            '2270d502e6b65a2989935dbb92412d218c5cd4145740efe029599ff3381ce57e864c4b9ebad6de3a211ffd675fef2c8623df764a5bdcbb275597f40b92ed4831'
            '2fee8790717efd79b6ffe324ffe88a7e574f63f33c8be72af6a8b14e890811d1f201607c2973336605875a209aa59fda364d9c30bff9824177c0e424b145accc'
            'b42e0b7112eb6945d5dc2cd080bf60436bd0c901d4a1e34eb77fa8a6bd7a1c769ed2b6b0bbef1ad7f503af222532bc013bae8fce366edf41054449f0578510f9'
            'edb59aa6e30c4f282f6af18ad3aaf8ad182ed2eb09b4251957837b5a82fd8d9cae0f1f253b4a09c8a19245c1c0ad94515a7a56aa23335b5ca8054a46c0d0cd12'
            '5574d7689fff2730a269e9c0d7223671f2239f4d13d3846b1661e898755f3c26012465d10b287307ff3744ba17787229347e090e793cef209d5a84ab7d7b403e'
            '5d20b8e128ed71bb6bd2d74ea88b7bd9a07dcd7ed1eb97f634e5c3fde0681db4242991f7fc59d429b4217bddc47bf5e513c0ad0b8fab41cdb828cad15ba2a1d0'
            '1f6009e523bf2f48eb254114ebbd43537a5b34a6a0c8ca95050c083289f6c5f2d007592022b2369cc66200e82f187c0f01d6301ff383f2a1fdd131baa7a0f83e')

# vim:set sw=2 et:
