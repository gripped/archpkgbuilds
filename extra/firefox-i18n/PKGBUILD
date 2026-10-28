# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=159.0
pkgrel=1
pkgdesc="Language pack for Firefox"
url="https://www.mozilla.org/firefox/"
arch=(any)
license=(MPL-2.0)

_url=https://archive.mozilla.org/pub/firefox/releases/$pkgver
source=(
  "firefox-$pkgver-SHA512SUMS::$_url/SHA512SUMS"
  "firefox-$pkgver-SHA512SUMS.asc::$_url/SHA512SUMS.asc"
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2026/08/10/updated-gpg-key-for-signing-firefox-and-thunderbird-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

_languages=(
  'ach         "Acholi"'
  'af          "Afrikaans"'
  'an          "Aragonese"'
  'ar          "Arabic"'
  'ast         "Asturian"'
  'az          "Azerbaijani"'
  'be          "Belarusian"'
  'bg          "Bulgarian"'
  'bn          "Bengali"'
  'br          "Breton"'
  'bs          "Bosnian"'
  'ca          "Catalan"'
  'ca-valencia "Catalan (Valencian)"'
  'cak         "Maya Kaqchikel"'
  'cs          "Czech"'
  'cy          "Welsh"'
  'da          "Danish"'
  'de          "German"'
  'dsb         "Lower Sorbian"'
  'el          "Greek"'
  'en-CA       "English (Canadian)"'
  'en-GB       "English (British)"'
  'en-US       "English (US)"'
  'eo          "Esperanto"'
  'es-AR       "Spanish (Argentina)"'
  'es-CL       "Spanish (Chile)"'
  'es-ES       "Spanish (Spain)"'
  'es-MX       "Spanish (Mexico)"'
  'et          "Estonian"'
  'eu          "Basque"'
  'fa          "Persian"'
  'ff          "Fulah"'
  'fi          "Finnish"'
  'fr          "French"'
  'fur         "Friulian"'
  'fy-NL       "Frisian"'
  'ga-IE       "Irish"'
  'gd          "Gaelic (Scotland)"'
  'gl          "Galician"'
  'gn          "Guarani"'
  'gu-IN       "Gujarati (India)"'
  'he          "Hebrew"'
  'hi-IN       "Hindi (India)"'
  'hr          "Croatian"'
  'hsb         "Upper Sorbian"'
  'hu          "Hungarian"'
  'hy-AM       "Armenian"'
  'ia          "Interlingua"'
  'id          "Indonesian"'
  'is          "Icelandic"'
  'it          "Italian"'
  'ja          "Japanese"'
  'ka          "Georgian"'
  'kab         "Kabyle"'
  'kk          "Kazakh"'
  'km          "Khmer"'
  'kn          "Kannada"'
  'ko          "Korean"'
  'lij         "Ligurian"'
  'lt          "Lithuanian"'
  'lv          "Latvian"'
  'mk          "Macedonian"'
  'mr          "Marathi"'
  'ms          "Malay"'
  'my          "Burmese"'
  'nb-NO       "Norwegian (Bokmål)"'
  'ne-NP       "Nepali"'
  'nl          "Dutch"'
  'nn-NO       "Norwegian (Nynorsk)"'
  'oc          "Occitan"'
  'pa-IN       "Punjabi (India)"'
  'pl          "Polish"'
  'pt-BR       "Portuguese (Brazilian)"'
  'pt-PT       "Portuguese (Portugal)"'
  'rm          "Romansh"'
  'ro          "Romanian"'
  'ru          "Russian"'
  'sat         "Santali"'
  'sc          "Sardinian"'
  'sco         "Scots"'
  'si          "Sinhala"'
  'sk          "Slovak"'
  'skr         "Saraiki"'
  'sl          "Slovenian"'
  'son         "Songhai"'
  'sq          "Albanian"'
  'sr          "Serbian"'
  'sv-SE       "Swedish"'
  'szl         "Silesian"'
  'ta          "Tamil"'
  'te          "Telugu"'
  'tg          "Tajik"'
  'th          "Thai"'
  'tl          "Tagalog"'
  'tr          "Turkish"'
  'trs         "Chicahuaxtla Triqui"'
  'uk          "Ukrainian"'
  'ur          "Urdu"'
  'uz          "Uzbek"'
  'vi          "Vietnamese"'
  'xh          "Xhosa"'
  'zh-CN       "Chinese (Simplified)"'
  'zh-TW       "Chinese (Traditional)"'
)

pkgname=()
noextract=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-i18n-${_locale,,}
  _pkg=firefox-i18n-$pkgver-$_locale.xpi

  pkgname+=($_pkgname)
  source+=("$_pkg::$_url/linux-x86_64/xpi/$_locale.xpi")
  noextract+=($_pkg)
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

verify() {
  cd "$SRCDEST"
  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
    firefox-$pkgver-SHA512SUMS | sha512sum -c -
}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  provides=("firefox-i18n=$pkgver-$pkgrel")

  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('1273ef8078bf59a80f7fc30dc4fa2b2e37e30cbf228b46593b57466284c1cc1dc7a93937bea7b1be32ec761b12939288069060807fa0686dc9569c93504a32a1'
        'SKIP'
        'eea1a0e28f0091ccb47463dd8338ba4c71d820a692cbd175b806598cbba62884538f0a6b57bc8a37426e8cec09b8dccdd4debdb5cf51a284a4f9f46b1bd315ca'
        '28a95cd226dcf834740c69c13176cea6056740a0708e4e8285a4542e1fe30e5ea1f6ad0fd603a26bf1997dffc0113f0b8f75d9ce9ced8bfc402ab19710a9ceec'
        'b360bc57436ca78caa1f94e9406aa3d8c9de4ff3a9a545d047fadab042409476d2e5c5261d079d8e1fe852879c9464ccd9bb587588a805c278b13bb8447bc9fc'
        'e932208f234ce5840be1dac3875c8cd9dfaeff34cdf5002d8394b0025f33353b93b0068e6c6c27b872aad4e41eb2ac602539033113fc3a522b0fbfb7bc0ff62c'
        '2129efdda55b515dfe3eaf9ff086c56b1160d11b4e3977eb7879b82e360797c4efb9ea9000b0eb93272f3d14b282472d8308b07d24a614c6a5196adb130e0a0b'
        'b8bbf97e1ec045fe55c907f0d95fd60155fea3e952d983933297a28defe7b838d578f4af4b9575f7a48e9cfd45b5edd28fb235c3bac4052feb50c1d7eb5bd66c'
        'be011f33ab5bcd4b7b128739863127160b3be768ee992e99893b89659d952818f4b381e3d300a995c9030b9da19050d56bbcd466e4533d773965acdb0964a796'
        '0da3221022bca8003387e52e52d78ce641c22e45b0d4211a0d49590ca66281b60560fdc79fe43caf5770e65590e36bdeb1dfef025f04d54ad756d2c029cc71eb'
        '016686aede3ed725b73c1d8aa1e5557a13addeb4c25e92e4e252c66b2bac12b7acf37cfd426a702e8f58f96c5762384fa5d34738df3a75c0e5b628c94f91bc10'
        'e588650419521eafcc76a27e3fb9e3f085f3c2fa672f6725b51eefdb68430c18b5b85caae36fcedc319bf05a1f2beded503905ca698cf01c6cf754ae8c17244a'
        '000ffdb3e82e10a4e0da91f47cc3e3964b51802f8e58ab9f89fe02848b3f6bcd8a02602ea57f94551c2d8b85fc317c371bb2f4bf5277edb8f2a2f5210ba3ebb1'
        '5ed2fdd1dda9cd113218e00d44c0b45faeb1bc103fd81af0835ef5912fe6e70ad6c5a9109b4dfc5794baa054542003103ae20800d1afcd07c5cf864300b8e8f9'
        'cb5fb4c8719ac2f9c8aba31f650ba5c536d0786d2c271902d97894befbed5172f0e179a3d8ac0e291b6fa1c50fa026ddff29df242466156a706172d8795f4e60'
        '17cc5ef55ba8ad8287f6006250fa05df4ffc90a87e6c1f37ac9672337b83f730e251f363e655af2d55a0426e445b2eed153fd8f576ec6ca2313691b45b833ab0'
        '731cba6c4721f617467c6868bf0c156d0d011404162e3aaab0dac8b45d548db3e4767d5348e1fff5bc3dfab4a7794b16417b4f04bcfca9d2c049a93ff25d6ae2'
        '5ad5a82454f705f2d38113195513fd485aa4f5ee7a8f34fb93f4803eb6b2de73a8834c597376f83080512e86a8e5107637a6a3a3eeb94d47c38414035b20d534'
        '5ecfec1cc8a8a1e310165bca4eb257bf6bee52790f011d7d84cdc28fb8b0470cabe025b4703c77ca0192e05afc834b4db5b5f8f799fba3765cd88e1feb9cdfc2'
        '33559abc165d278159b3b4cb073dc84745a6edd93485565bd36e8c51e5e3061e5fba15ee3fd32c00356c91e91f646b74faa074de6b29133f67069cc60ab3c4f3'
        '4bb59c52dc4b259e07e774fdcb30d2ac58ecc6745eb3d68ac254cf6121ebe3aa60c6c5d7737c1e7670c36c3887e01777fedd63b361720fe06dfc03c4768fb496'
        '659f456d471c095e99d56520a5f47acefab9424f73f04b44612783fe3045434e0ffd75b321544140fa33d04cfa09909326333eeeded6852a89cbc0e0b18f7d6e'
        '6e1c72a77d89e05e7be458c1f93716fd842f14572420ae0981fb02232eed5cae27fd997454e1c5da7319c830748d18376b1b2f2ff50385169d5725aad50a4738'
        '3ed047ec8fe36d66511635e961fb9245421ca6fa5643a2de08683a9cf2147f5ea9be4a926afc8312d8bcd015bedc4d45c7c92dd469a7ef10735cf62546d7b437'
        'd52625dd1f551938f014ccda8d0440785bc462c47bc25682e4f5959c1704dd9b31e7eacf6fd3458bef68a502940d37fe4c45b2758d5a0b9c10c2adff8e737d8c'
        'c806dca007e995f9cd0d53fdbbf012d0a6553a5704e57dd90ba1cb6563b183066c16c38af30503a2c9a6859707ef65866b3f5562676647c1216859f70e291c57'
        'c5f2f18f616ff20fc293346abc0e8f9be814659c97bcc35a0f5293a44fb6df17a305bad177ce9066b7c53e1a27622b07a62357f570a8c0dbb91a484d05a7394d'
        '44c06f5688b6fcaa7f421d0f6968459bd3a584f6f005caec4e9981f1e07dd952f3d41bd213c8d95191bf0e3db58a0ec62c614865860b4ea867b205717c19ec2f'
        '7417ac72911c4b3a8cf35314a1dfe2ad58613577c203f717bb30a2e1863b6da8a3f57d0e44c99feb9852c359ccd697633022aa776f4f911d3118b8f705c39e11'
        '443065a96f9444042933f168ccc87bc370f342ba69cc202305d7ed1d70e642f0d59fadeec2fc14abd4e9f3ff736866c517deeff59d892074fbe2b9ffda9ca495'
        '0708a091f29ba2c6a9a585c09942f4c0f1b4302e09510a7f1c747d8b9f7413ce204ce3eb13ef3d889137b8cf6b719633a8b8e9ee7e82473a856908b71655a6a7'
        '7362cc6020445b141a45abd2285dc2274f8ff426c34d9f94259381dfe22443ae739e49c9d442aa488da371b8de176d86aa93df9997a367dcbe2259cb0ca0e68e'
        'f0c1cb0f34905b8a7a2c485c06f30ad7d1e2388a8c7a9fdf794e882898b2487da369076897c35ac00af35f1341b57fb0c26e14f559db119e2ca5e803a1f6e54f'
        'd9f29a44b4eae0682684816ed27ee793bf6ce2e4c386048769a9a6d2955e30a9fbd20c746b8010a83d8ba5cf739537ec4acb5551c6f7f62557f6d5025add6224'
        '596d9bf1b449fa160c7ebbded4a1253aaaca16d5103a94d8a2820bfd8cf5709e6e1a7114231ce137f22a9ce7d3d51f16f3280a98ee455bafa77b2b6bc8a04220'
        'e7de8082ad1bab524c12c9673e776bf9abece90d9cca48f4f306ed66cb69d480ee479b4057dd02bc5902c377ffe725056aa5ff18315ffd0f5f3a3afd1030a1d2'
        '6911da2965031c4172039acceaa463cefd23a0ba7980dc70b2e781f4d548a4432668ec1e12a8a954fd94d2cebebbd8b62392e9190d7821ed4a078ba79c732b68'
        '665ed03fd02d1bb0f73c10ff38bc926176269ed18401ae852b2b3ee53882a7139e4582a891839ec1b9f860d975d45535dd91428d54cf81c4c645798c5358edcc'
        '0b57abfa1a3d1f5282bbec5de5204461eb5165bd4f29b90b766a3ed8adf62b9a5d3aa2d40a1965d0670f1bc2073a605d1b7c57d8417b87de92875f906cb06b36'
        '78b94716e552325210723ed5887de4cd77f5a717090a7d0aff6bbe737bad145a22dab80492dded5de47e02cd79d14d45fe11aa0994441fa94a41ea1d19a42e30'
        '494eb655afb3bc223099fd653adfaa1103c5a89cd74c148f925fcd9113d4791bcadca722460f191c659bdb9590fe14db8bb0e415992ad03bee6ea63cf1ac8b34'
        'd193555e13987d8f8eaa5feca558e1cfa7a6f63c8afcb3aeae6e44d1b98309d54b69833fb260353346b791cd53f9cddff34e34d1eaafdd240554a1d0bbac85c5'
        'b7c25f567cfc50c9f5530491be531643b63c8f01d25984a276a0b51315aca997520dd083427ff37188d7f3e002e10eb053fd69772717fd1ce1daffc00aa5a596'
        '2f6d95c3b5cec71e801b7f2f20f81f684b7ff789b5b1cc2deb9be647869c82b6303b24e0b21c354abe04cc418d30d7edbdcc7684a8cb751cd7e82420cf83dfc7'
        '20fba390aabde2a1de73be6e37019bccfc40e6a0eee515c38eb0f867f76bc84fcf3b3a558cce7d3bc7abcd7e3e3f44993cec4f8bed002006113a736bf97121df'
        '42291ab5280d84a49746dd4de7f94ca82d0acaaee7b812373ee098c922ffd3e11d85a2d9c577361e4a3aa3c452c5f0d8bbc390a66d53ab67528bfc5dd83bab2f'
        'e21df8d0eb001d60fdebb9d5d4960b05e520d70277013515d296c79983faf1340f6098ba71e4d8fd8e32f3c3df8f82a73f3ad4a129cc62a2a234029eee691d51'
        'bf21c27a1ce24d9961a9ef7d2bffcffd7c7ef3931297c8e0b9c836e853a4e664c031c570c43445e42777196eecf950a6ba047b0ee5a0c81a81531b9d927b5a8f'
        '83d7d2825b8e15db925ea06d3d1d43e01e97a6cdc7113345cf96eacdf869e541aa83a8d082083e86b48ca271ab3ae1b78eef142c65ff59764dc1fabd19b74a2f'
        'df478c2c5ce58d2810b6c435b96a0197e4818cdc367ad301fb8c1effdc5717d99f5183d90fd7eb623b263358ddefe4fc0581a659e882121039e8178c9db3436b'
        '3e42ae51c65661d8aec453c8974bdc67f220fda5f6bee73afe9ddfbad0407326c75e010cc70b01f4ac217ef53d36ed340f187703977b75caafa3eb1de4936681'
        'd15e1f3dda04cf7878922fd3e68f4aadba20d3605b6a2f698f0ac72e58cd05f0e014458697b6f57a25040b3763bd3c3890192667dcc67aa33212ab6d576dd1db'
        '54c1139feee72b0c077dcb3bbf1ca48994946a4c7442e95f5c45275473134e59e72f1b3775bad1b15d457229371d44db410d556c4748f4cbec2a7452a8a4e2b0'
        'd92f36c4c2437bcd650892b20dd37f55393ee7e4aac22072fea6d5e78bbec149e34f7352ff099838a5d507974729cbff5bd3524dc07223e2eaaeb98462680da7'
        'ce4522e0b31646d1142c21c86aef7eeb29f802b556a09a81acc95e4cc617bb10024780efe0e5d148da5ff363471516c0c766a2853b0da803d4a1f8123b5cc6a3'
        'e56dc6d575f8771c3eb2479e652e94de8d964239931b284486d8e7e38254e8777d2adaee01c27da4e01a8949dc20ed664af71490ed067b4c8aa499dadf14d04b'
        'c36b1e93ee92795de43bc381944ebf3968f1f86d2f5c103fec303bfadd093885984b7cfa43cdf85a39f89e3325e04e65dbb517999fc8ae12cdfbc8d132feaed5'
        'b4d6167f2974ce40a283af4b1c60c892092de6a93b39c3fe3f4bc10606311c0c9dd1c1fc71d2c7f75f167834cdece4f980965491b959379d8fa7fe4cf357dcfc'
        'd2f231633528762f4abc4e9b50fc8753aabf436481174433b5d8b4f3fe3eb07fbd01a3d07155b858d62580f967a44014db39496b672a55a1cc8737e78e0a0e21'
        'a2b49c82e9a3b4090079132cbfdd0a76e7dad57c488ee26302d2479b6b871525e0d08e149639757110c21057a628d85b48ceaceab7fbe7f03e2fe88093edd57d'
        'baf98fbaa08e420e966d5224157c329cf57148b9d163c446ddf02038c05581e1b23dc1202de2d5118d76c8d173fee1bcd6423ccdf2f8d9a0b01c5f8f59f1bb6c'
        'e7989a64a1494cce65817e6b9748cc6d8fa3e214fe894a5e1d6d324b862a10777cf512228ffb9b1a6610652ca0fe2dd95ffba8e89b2f50bb3accb80df417ff5d'
        '8fcd581925e2244663e8133f1d9cabb0298db906cdd5ee588cdb7603da2fba124a4ddea9dc176d52f2f4607e2c68d9950576378d28a216f8f91c12ce940074af'
        '26f545d6241bf8bd5b1836294206bbf9669395ae95bd7ad28a8e738f0783022db989dfcbdc179c51b6947e83f17237cf7355177c94e2b16b88976077ba6ed51f'
        '60d44403c9a3cd2545e24f2c49f9929ae0b581e0874e2e342087a601ca9ddaa510cb46b58fdedaf77427acce67a28dd20695902581adcacbb23ac9c2348a4636'
        '1626c979e72cfe227fa2d54588e5d37f58f5257f62b825b9e378e1d92c28766d471672397681431449efb7e748c0e67b51e426eb5cd1f1ef338400337c20f463'
        '07e0a894f42d2179cf118555b049d43a23ee3935927048863629daa51afbe87a5d87b94a465114d70211eb4ccd765bd0a2cd86651484091341b0eb773b9fb749'
        '2fdb5484d2facef754d52da139e85dec0128e6638052cda33196a81750c0df761ce8d5089818e11802859be3665453a75c9f5e55e5cb93eaee02d573c67fa259'
        'b5d2d1c01029dc7cec28d5b2a746c216d41786508ea44096fc3e7d0ed69d683d19b834f2666fc15c96aad1c582fa115093273f5db9651e312663bbef0b45db17'
        '9464796fa744a4fd6fbfac3d9c5dd222db266910c92c2b152dfd6a92d0a623a858a663743cbaceb7eb903e07fca6028a47d05303b87b04824c3fe931c839f668'
        'c4552d4edec716e3e02f88afa13fb01ad8899460ef8281be7d1e01fcf077a9d00eee9542616e978e6a08cc23f5df8694a6b13b2aa34eb43ad03416f0cd5dade6'
        '392876754e694d99e8bcd26168058622147b2dac33b197f05349c0e74829b6f2d0d3bb41a2ecc6c98fe09d1308c9bcbc36d24d30320fa59ff0850ff1a46b7fcd'
        '9734a0919d2b844729d999868181d5e2c3884c28d96a4762489b5a58629bf57fbb741f5ecb9efaf29e8852bdc774ed6326b32b4db4b0ca622d5e0b06cd4c7327'
        '43d2a511f0cbc45bddaf5bc4070a72fa23888870d40b27712d294893d968cd5991fd132cf32b99d4847fb64cca4ffd567226bffbc36ac020d7f84b43f85e5d60'
        '7e7e5ba6978cffe2e87157ed7cebb694e312f7ece357b4b6ba4b384e3140159d298cb99e4710d83589be38f810ed4da2a965c9ff313a0a1fb22aa25a076c27b6'
        'd54d43c7cf3696248af7650874adda96097275b266fba946f3de258112762a0a9e07c1aea99c7207ce576e0f7206345f832fdd29eaacabd1d8d1377031a12a8d'
        'c136696ca14dec0f1def6440440214c4fa1b92e2e6ed23cadc7cb4f1eca056d85ad7d24ebbf6f17aef01e5536c0f67ee64d4114adc5d1d6a0f7c83f2d5428b5a'
        'ca402fccdeae80cdc5f3ef7792ffa4366e93b2e3335fdf014f14b057a2c9ac19b9f27a4f6c14ecea282b53430b4e07b750ddf1bb4579f4af6ce9ae61bfdc4130'
        '2507c9ae6b8873d62a47bf977ae359d4a8821681284846e2a5b4522d23ab1c3a864c4cd86c5ed1a8bf809e2bf0f2f7de96397a66c75c1a2112559c72a0827fe4'
        '7c5eff35a746cd38e0580c64976985c8f0622057c152ecfcbbfa59c8fd3e9f9390b79b6ef19c2d8f4a72b4ee7351706817e614605a7cdf9249dbc5b45c11976d'
        '8706647d2c1f14bd680cf67f616de3d204afa8b1765ca400ab483d3b25bd9b26333f3da4d225842fb4c8f819615316a8a550d50a61d0ffe8ee4b102e97075c55'
        '6b8e0e4a47d8b79c732303a32140add65867b04e720db8a07758f610f6962ccfcef2e0a2ba57198e7cca6eeeeef657609ab228f61b2c806fc84b72c6c21f781f'
        '7eefbf841f02cfa46f07c3006ab437385385386470c8ee19a1bd86dec5420c5dbea97d933f9b5aca6927d183d9d7aee71b6aca747e52dd88d655edf1e9eb2a37'
        'a7ff1de24df9778a330b3f020d9206853d4f3899b7a50bdec165de1862ad8dbef310c2f222cedc6127f159fdccbb119a0bc6ce72adb5ac306466ca769bd298e0'
        'b544c0e5a2b7e273fbdf29c10fff24907508c719fbc8e60c38942318a6b4b19a7ff519dbe0c0bc6cdb41a6d5b230c162b272d9ad57f899f7e96f25e3405738e9'
        '28607358a067877a2503bafc3b836d4a82d045649eb58ddefb59087160dd21632854e18f743fed6c22bb0659b3bbc81696382f534da0cea37dc563f79bdeba58'
        '469c5543bcd87cb5358e085d95d856686d1c34dc6d1637ef861c19f9657827d4d5b4c206f314c27c4ce21b6894d482fda8cd651d287a4f8138e0701af470cfef'
        '21e2c77cf9b9dc2e7fa8eae30e1b00ee41a1f75a154288bca382e6aa72139cafaa9ee675e5b8c36c90c4d8a5a5cf24147225b5a6c2cb21b1288e09d36fc861b8'
        '066db8ff915757664f6bdb6f8e51dabdad4591b569f9568ff3fee97f24c3d1b6dcc526411b7790b04fcdb3a527218c7f641d1d0b04890fb99ef841063b6f519a'
        '9228f9ef7a5872483a8858181d2ca4508b55728fc8b57653f5e069c2c1ab87b8884bef72c534a2baab9f85bb8a19f2c6032fdfafaf9fb4cc24e636e4a3604bc6'
        'b99752209f062a183840c6699c6213b01d19d5dcf60581b3a1ec9713f6c3ebdc12ef25bbcf609324ad24786162049086aa896eec0f667019fd940162aa460597'
        'ab66db687817e5f78183c8292d21a5a4007a3f10f8749ec4fda84dc6c3d0e3a23526c125d03f7306614489edeef4a39d7fa60db06dab5d4194f0ef8bf48d0469'
        '151a986eacdd782ec26e6e623fd6573ea15059122609f3a0e024901d48153559a621cf5c23b4017e8221657302f70d4c605a789aa9378487aada22ec1607af66'
        '609dbf6023b12fa1d38f4ce6a0d4d3c632829eabccd6e6446c9bc6c2d18f4d5a1a3956977a675c158f51433ed4366ef93d5d703193a6c99e3e5fdf2846a5c670'
        'e9a73e3cc2af7fbd0239951ff5f35d861e1263bd2a0a39df31778b77e23a8c6e0030897244615b329a3989e52d7c5010753781e06f797451d8e0ad91a609d749'
        '93720715c2911242a2fd33e39279f7bdeed586a7250c15d3d2d97592643228a50ab8c0a3f388cead25aa1afb8d13c28700ffca5244f8bcf77f53328d8085b9f8'
        '3ce2c645761640d95dfb4f19bdbafd727572a525e79764950f289d3e455600d818ee100fc150119986a971ae1164597910b8c50f6ca1f6457c29847451816ad8'
        '9bc08a5bf3212d23f66275a16a145f5ef83d5b8dac970cea97f9985c0e168e3376a466183410da9626a3f566ced18ef956b7602560af2feacf07ee485606200e'
        'cb7b321c371e5304135097d8219d7c22226236bce5f7efd28149d13310d43c249389438c2fc934ccd874d3a40a63b394cb60a98a089b90dca4d06608e650d13e'
        '656c90ad889ff292385e72592f5205e14628cf3ce2ffb7d469b4c967efc025549dad191bbe277a4a17b78e14e8d5ed48b03befa9b69af10216d36bab0740f00e'
        '1e7136ad85aff144bccfc6f905ff66d4fcec7de2b6693dc6796adad6d70cae345ab2ea5be26c0afcb9589594e601282694b6c5d8caddd43b57e44c4647b2abab'
        '162a114da128f92021e4de3cf1d53c009232721351034fedfdf80ee2b6a9906ae3ecb543a5c9bc48f86609ae29ba3713c511bf4803f8905f72d6bf62c2951008'
        '7e85d22f0a8fd3a8390fef0f0ce05eb8ac3e804d5af6be1da3f661c1af42968d7b709ee14cbf3ac4ede7d4d4e7b1e4619aab12e5adbfd1408d0d4a59b18948ae'
        'dc1772b1348d3e2395f644793962aa6d8e4e5fad747a71df7bad78191d32bbb1c188888f270c2d0db14df57f8a9184ee83dde1ea0d289c22dee4e85e8032a6df'
        'fb7531b6a301314da2bf5a697cde23d268be88c1c445b68b1fdbf2a0a82c38139aa7542a0144991177b9e0f830a592ea787cbe85188f4c30ed9a5bae0ee2e1ce')
