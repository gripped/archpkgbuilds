# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=129.0.2
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
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
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

prepare() {
  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
    firefox-$pkgver-SHA512SUMS | sha512sum -c -
}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('248b8c8067b0f4af42e47eae3b09b7523c0a277b6f044dc03a8fe73ec75a73b35a9e34ae637bf4923b5c78ed606bc95b0d9aab64d74108eced6c6d84e518ef6c'
        'SKIP'
        '102d1397136e012f3f4d9c1d2907828bd4b3e1f8da78c36ccd222ae39e2ce0000765a163d30c5f226c3bd823b9f10f72481080455d3b6ffd651eb1580ac88ca6'
        'd73fae55bfd931f7959161e479c4dfcc6bc6a16e8e331d36ae5d2fde87f86a5dc95e56f4bb09406e947da43a76d1845b69f1279b1fd11b61ff1db980c079801c'
        'adc0f1e1ee5cf8687dac9718755a76618ad5930a7b0f7d786301cbce1fda1466bdf38c017dc553da4fcd5659395a5b9f78e2278edf7bffd668aa7a3aecf2c105'
        'ddbf66eb5f028574e6c3acd41df3b809278f93bbb207c4bee3515d103b107f8eeea4be01e1200d97f2c1c8229a179502e93e3e702f43b80ce1340b04fc9646ca'
        '54a1cd9538e733cdba215c586315ca6d1d827508ff465d29b11d97505fe56d1c031a9a4e7bfa2cf4c5d507590f10b3a6e323819942ab5dd860a38abf518e77a5'
        '83ad3920ce3f671eb1a07ca372eb9d3553d10e31560142289601a632ec6a9c85622f06e3b6ba3cd0ea0b6b51a471fb387ed02fa4723cb9465117ddde5ab6de30'
        'e22bac86b86ff482575522b284429a46c2887554543a86a6f933850510bd27e488624549e491babecf6bb04a279e06fe6ba353fa9b9eff93bb84cf7faeda005b'
        '8b56549ed6e49bf1ab2ed6a4471090f94e31ae9edbdfea25db9819cb7df7e3a97e5339773e52e5d04add1d32d34281ccdada4a5f2905d30b69bf52bddeb23986'
        '6e6fe8454b9c58f2348f74eaca2e89f58a8976de40364c9b6542e45eeaf1a466f39b99951bb769be4cc45ad08b2d4719a609f8cb0cff94d0df045ba77940632d'
        '9d6d7bea067c76f222f5e49c61f00bdb6b952faa523154ff06c85acde6e4209d7a31a36654366e16faaa0f7ef33608680d0b2bc1dfc45d9ef86c34d2bd397b7c'
        'e417c2b894ffbb60b63dbb8f22dc4e2cb9848fa75c249bd7277c883dffc172e0acdfc9dd67cfb90223c6f3026a62f71c16527c63ecf1693813e08151159b84ac'
        '594a99715b86a2066f76e51e4e7760efac00cfe8050bdc2ec798e0e61a29e442dae32d91db36655f0f1cc84b797ac1c010d09c70ae49028f1218fc6a692733ef'
        'c86806de8835c63ac5e6a3a4ffa38075693f91fde3b558409614513de91b89cf9b49c534c8202ecaca53053e44587c7b8b7dedb68666a1e89ec34eaf66ba9179'
        '8a182a7d11939696750045e19cb2f8e8ff2a00ece338aa1c9a7ed4cebc343ab88bcea4cc371cef733bbe3c8f5e8345c7632bc03df867047386e9e56dfd3600e8'
        '0e4e3deaa2c06544488a06d34ea82b5e1f73b31379106ec6ffffa310ca1bb2f583f4b97255968a8aca22e9593d2e23800dbe49e3e0707a2d4de2a6c251dacfda'
        '96ddcf5a5a3e29f8f84c7f047593df0c3f2507d5dec284c951da23e613555a96e1304cd7b380e9f1f9f4ccfbd09f388541803620c0d7d7a44fd1ce9d23e59f74'
        'eee497614c456e8d70383c007ed76df60aeb52a49e95caba86877a1ec4eb5e552027470fe026b455cfce73872b8fd652c5462a20e280325d56aa2f72fb434ee8'
        'e70024becf96f155f6c3989c9283613be997077994ceaa10ce6a3385a903eb1ac0b5c3b913c144eeb1cc47c1116bec0c211f71652267942dd667fa698fa15551'
        '2607ad2b81e1140d28a89712d04ac8b451d719ba1eb217be801b39d84e3305b3ce4b7afc76836851fd5b7280ddf6c6511621959ac7da00e646bca5f35f7f770f'
        'b177f6764370ee7b1f754afa5a0e124d8b5ca5dd74bd97d5a1fd4b1278117d89b2c123fc894fa2b1cb9fd0b29d2e8ed9ba80127d63740b4a176d4cdfcb110bd0'
        'a582bebf94a1dc822038aba8733dc48b9c7a1732c09dfa51f9eb68f8b3e1e4c55dd0a364945b1f2f85dca8b35ede2ae7af93ea6fa94227e93e4b831cf43c29a0'
        '2ababdc7f8bdd649ed1e30dcefd97d0d1674e121afb89fd4299da9958b3fc78c6996486bcd4b6bacd5c34ad3682b7e69bd7e1c5456c35fec22101de7e7ef8b1d'
        '96afba59e5af4a600a2a94c8141f68eb881f2d8e1bbb2609e74a7b47fadb5c32a5e488fefb9f5689114aefc555a7b47540607c5e69d06cc68ff52b24295cbe4a'
        '0fe77a783001266b53c6a107a23bf0bf2a16b185df7d29e6822a7bb56b2219bd026e773f9f13f83d7088f1738538f4ed0093011896a70a7d0c1bf61030504b43'
        '612cdecd44012d6b2b9eb646fe362b5da8047cab8e36adb6c1cac7f831f4843a07cd06d5657fa0f6e1bf62d82d3fdc04b592ff79cf7831aac27fd6b1133b5ac4'
        'dbf61deb0420db01629d1ff7c33fe527cbdee558bd2a05a606e40ad2a9fb7eb4d3943fb6c13e79264dedce59404d431ca766a3b0dbd9183cb655e9ab443288e9'
        '7b513f286bf2c8876d33ea0852a740a283c2139dc01c3801f3b5bb57d1be5e8ba0763593701d25723882158520faece622cd8237b7cf54aa28d815bc8187b277'
        '09f181eecb37709e25cfb03e843aa640c109a799043f6efc8e1f386866afbee750db6b7835d67c53d5beab150153409a28dfc506221337a75cc0bed9929f013b'
        '4c6ba9e7df79bfb79eea47bb111b38b42bc1ec76c23fcaac1819fbe4e86fe039ceae66ea3724b614889504d8148afc0e1126e2e0104f377dffc3c246e003fc03'
        '434e332af110adaac2af24c2a84c802e0577f2dca85b537495d89acbbc198827f96455b084ba54a9570596856c370230c36ac9b494afccc0c10204eb0473b1d7'
        '27b495e6e0282713850512725a3511f8ccb834561641726dcdbe688cd3a6210e474ac926ce8b8849fadc417b925d31b5e12a77b649977cf7c62f0081ad6a1172'
        'b581a4e5f72ba76b9c0c9aa00df4dccdbe386e3ef038f48ca24de6dcf8adb68d3f67be573fe3ffbc9f2bda5daa18c1add5ef84e86482cd6f14e936dc29b7ed55'
        '256b90bc809dba3ffd6d0929b94da8d06290b9b1d7c673139f2177d30debcf7fd10064fc871ce4eac5dcc33d2b03476e5a00f93ecf4ce784e9b79315a2db12a8'
        '537cc9cfca9611bc46daa6521386953af9f1e5e862989339dc5c4ee04c56ef7a290e872b4ee15f9d9f0e5dc5be87a87b7b77d4f6a4c2fb2338eabfc8713a29d0'
        'fb72de84ed3c3fea824bae11245346178920b2832d7e69a1d82005515a456ff39a3fcab80e78ce17cd4c64baf0e0b1f259cf24a11f68921d0fdcd39ba760bf63'
        'e01b2c023b59df1281571f1250887513bd596fe07417f6975a119720f429a2f8747b77af6a06d58e5113c07b0177e852c74ac87cd36687b2ea3e7350b0e2a9c1'
        '602e304bf0adf879cdd85eaec1685cf9c09e4703076834dc0d43f70bf54d23d238ceb3550cf8efb6fdaf2b78c005eca2be3ddc41e6f7bca222bfae791c22691f'
        '4b56389094be8b36dbe7081ce89d15cd99b173398f54ee4f0053cf7908e4a38f7d0435f1f09a497f45c8e1ac808ce8ead3c1e6b3e8f218f9d225b94a8c851d8b'
        'b61b1d5ce6ee9d5c7ec3541954cfbb48b9218ceba40fcc444fba5138f6315c2d80010e06080895b67d30db99c739c188e7c0e292f572bdb2f8236b1e990a608b'
        '329bc9791d633ba953125b613607f9821d64dcdfe6d797b61b0d5df77b029e13a8eee9acd734bc2e0023869c8ee55c1dc55da037b01d8bd36a46466f4b5eaaf3'
        '3dd05f79ddc2b22a0b51f44c859fded8d58b7345c286f2bd7a146f14e62f8f18a0fce7f0ff44e536c27e17dd4df79052d25c7acbffeb0da768d0df5fa076ffc9'
        '328aa5fad81bf432cfe63273539ca40b3664c5bda0359f13e013c8eeba9b8c93f677bacbcdf664d8071959c021772bc8ed4e955eee066efd5d751d1054554e6f'
        '59e82720a05d5c2756d3111e733ef186197f89af8cfafac603f0b48394ab21e9a6f79755bba1f5d7a6dab277847fc0304c076b8f0cdf07f541e4cab3a4eec4f6'
        '36df4131488e47e87d1db02717aee1791511a898e96f0dd106083c539fea96ee8eabf24459b60e584a5cbd1a5347e5246709372c80006b6e498262d0d149d997'
        '16c4eee1f137345ff2d412e958c605f7f9063d53e82460c09be6b2f49bd81b976c7a416a22befaf184aeccf1f08382dd002987282cb03a5673c36850f4968e53'
        'f843750f92ab3d2f91ade5720a94a1c6e4a2d89e613fa6f13b46f84ffad1c38c39a6b70d59e904496fb1ab3d4f9d48d26719d835f0dfe1e2f0fda06bcb45630f'
        '893d7f07e8fe9afc49d746efcfecaaf1cd3cf04b3f2fda58393608c27e612d66c98b7a863056733cc7f7771c6b477db3b0fffd8ee1287f9609b85d33afa5603c'
        'bce6e4419e1636dff862df8c619acf395cb173ea05129bbdcadd51824f0eb54cc9ae8a0c3c2aabecf6f1b2bc2189b8df5551af9b75d29b534cc0f35ab5e9ae17'
        '986abc7e3a328c44b6426f9b699f918698e3c3d981c79ccc42687ba6681c19ad581c69dfc01035667c8319534fb12f341d3902c5b86f7fe9cfa4cc9ade61e798'
        'cc0d9b5327640d8e3f2e0883064750e260be4032212802bbe6ddd4f98d87488430d632c8a6245910e6c6b95049bc423ec5301be96673e8464c96ae90d88cb066'
        'e7f84823502e820bcfdac83c5f121d50ecb7f42f98d670fda0183c162bb5f09694985dc5c6e291158ec7609b175a0e36a22c42dd3891e5a2888312fde97fe73e'
        '3c4cc3dc189dc753cff8b428e43ace1f0d40a9b8c8bf2eac183c7bb8afe8d2c05da932c7da480ebcab8187f9f98dafc1827eef3401a80497a4c6fd0690ba5939'
        '21026eb13d85cf0011468af045d08c464469a8772ae63a2e053743e13cf9dc6c9c25b195db2eed32566ebd59f61c62c640734912342dd924a01ce779553c091a'
        '9a55c2bd0643e4ab94b19921be64578cff9b7c5549b616c3b9c61e5c837eba55f9cb8bcc60ed8e90eaddc74e69c94ab60dbf050acd3afe88e4dda18dd9c5c5c7'
        '2fd68dffee9d8e20e61e454081499f80c00a33db60b2064d0c76dea055de2c0cf444d80b8bd3ec995974add95b0d2288b7f331bb703fdd438ea4e18cc409fef6'
        'cf41e4a3a5497bbcaf186318dd5c22d44d37e68763dd8a6dea2a7d6d01585ba057a16c4ce7f3124c8dadd4a37ed484beea8ae9213111cbba2c16bf2798ba8dfb'
        '5194fb9db98f7c957b8856dc5f8d14a2ef997300b65d94c6207d0b71fe4eee78c61f468c71f7038531d714bbb1d3d67c2bee76e29115001990a80ef81a7d44a7'
        'f80dea58da6b378bd4d7af5dab37a34b9e1c1ac4bfbac5c7bcb09f2ee7df90c33948116771b72869fc4aebea8d1bfcedde2887d29197a271997bbed6bb56a3ec'
        'ea47a7510f1ca634c9b56e1079cb7250d318ae7de20e7778f163977409c0b22b418b49af694ead337f549121eab869e43d891eed1d0265de3597d876860d57cc'
        '548842cdb6a11cb349e3bc43024e66884084391ee8a353e62ad9a6951ad615d6343df97a9bdaf231a6299df07c7c48f7188eba917eb6d5f67101b02462ffa320'
        '534a289584f456d2280cf088167c854ccaea6c7fac468ef07a3b3f197aa3ff72dd1daee43c28e0bfb3b95329b311c9bb9cefecbc5cffa9bf9dc640ad60e1d277'
        '0f3396fabb203c8721e9ce5589adad2d34d43380bd9f109f09fc6ad2437b12e2f3cd5efaf5dcee5a01d50c7ce23022e269d05bc831249053736338af2e89a7f2'
        'bedccfd886d8f074059adfdeb3540aaa1e4ef8d900a25cf08c499d0a90ebfc8540e3d7ded960a9689013b0608d3777716241a7aab7932f77678853aa733abe31'
        'c177084b02ba95f42edd38148c6d0591df8d9364984cc69f78cf5ba7efa16aae5b60e42df0b3f45658b50a4a6b75f5b511508e4da71f677cf8486f230738326a'
        '36a7e2d49296f4fea575f48aebb662217637a6677fed17d434bb207cfa6d0e2eea5b252296d99d3c0fc9ff32793d6a92d6613c9d4f9d13ad9b35aed56c99780a'
        'ed6b7b42ac6e2d2044de9436304b40080020e945b2c9a498308b1b8c8336a3c70087371627acdc2a94c6c705643dd54fcca9466ca5b851fc1cf3f310ec52f688'
        '194334c4eec2973118a01b756e53b773ffd06d6254dffdefc391304908271643a7046f70d8d47a849cbe4bc7661a97f49f9d22d472c0192149beb516ef295c0a'
        '567e88328c2b9fb1fda7ff00465f006b57c569f95b267b6fe910f000ca124a861c58cf9f680d164502daac5f1493f369e9ba8a8c4dd0ae6458f15693bf78bce5'
        'b9afa26ab2f6b56fac128c38b50d371e7572b5aa48943f956dca1b187c1270c1234c613ac7a4a332ced8b480a966e03f664fb82090f1dc8cb605cc21b3337cfb'
        '3c8713360925f7f54141fe04c7da07fca7e8288c84ba929e59b55192f04ad23c3893de109ee80b7b90ea6f6b607b10a08cda82a21820c388456324ba0ef4a715'
        '970555deb5bd18b2ac3e03c1d74f3229573c624f3266478faf8ffa6f773acf0acedb1d361cad5cb9ae7c945848bc7c1c8b3034d6170eca498bd6f4ac29b0f69c'
        '6d8e0a5aa78bf901c0e5c145f47e35b6392cabc24c2f8d27369fd6411d292ba46a7b55fea49d087e6cdc5423d3d60f807cfe5e7502c505cf78de4996322af362'
        '5b9cd4eb951acafff59f4d20ab6650562efbe0219b4319a045778dba3c440918402bfd39d4fe5cc549ef8e8fc0773b1629cf10eec0bde58d13218cda5e427952'
        'faa57d6c4931ac1b2b5303c62bc2769a5a6e4d6983d004bc6f9ffe6a1c83490ba26b7d3f3e2522df0541f2d6d707208930d7e4799adc0671ce005531502dfb0a'
        '1334b9e1bf97cfdbf172ce61819d20162082fbf70cae0d660da3290cc93319ea77b0336beba87ce4a99ff8d3b62630f011e6ac7aca9ececeb653a33168288999'
        '9b1b3f87cf09eaec5724424fe3eddda56d0bb911cef968869c3c134453b53aebe9da7828cf564bd78be295b82d62fcd4439eaba74458273d69c9eb03b2ff3679'
        'cf002afc7113d20f2dd985ee6f8de0ba649a70d751d496fff4b947659cf4a1e3224ef193e4230bd0a72293f205dce55c11c8ce703485b0456033667353b8ebda'
        'c8f58aa67aaf9c21199a44b752ad0eaf9c718a36877133227c80e4ae57c3c146abb6475957a67b67b0c9c258557371db57931121becd5bd888370b8757452e8b'
        '0dae163fe3e8e025eaa7c4b71e555b0bb4cd90745921f2edc4f03f7194abf3b5c5eec3145cb0ca675111718a077a1d224c6cbb244e0ee5583ecc170404a8cb57'
        'f88ee1709563d75e42e0047499251e493b8d8efab37fcb873f2f6df18b82d1f4cbe1ceabf40b8ca5e7cde555f0c8e67dcc71c1c3fb5211be9d906d5d824bb02d'
        '728946f784cc4168e658e795f1e0a285fb3a3af7dafc8d466ae95c796e8999c31399fcd7cc4ab821c88fcacb1aa53f257fafa99b3eb456cab74048a856301896'
        '32df4c74074abddcfba968f58049256855224bfabf7e930239c7f69658daf4874926f4e58bed4f79ec0a6da61f370d9d4fc41711fc836ae3589ae591be84d6df'
        'b54066e96898f8f06196ddbfe9cd9fbb234a96e3dd13c77dbd227997ae78e57a5702bf771c6e57e7e1b27a8fdfbafa24a4d02620a9b176186c624cbff8729b4a'
        '437264d28844f079f4c19d2c2b3fb4515b1d1fe138cd6138a16099ef2ea194af82f5caec2c2b04e34a43f6dd3b76d73be356a248cfa041f721857c9a18367d49'
        'bf32b38c94dcb9a80c269bdc254de65882409e7cce30d235fb75fd6ae5cb2aa732cbdbbce35e39cbcf021abdda037d3a19061a8152be8820e75091d14c7da92b'
        'fb2b868042dc6c68159351e9bb44073a7bc0b3fe994e1354957344f182d7ba97c8114198c6481a279f12df23f30509f85e61ea7c6edd6ddf099784b920f99102'
        '717330d7ea4ee42b3b4abfa5d0ee15f8173e96efcedee7882acc992c4a8f0b7ac72c10544bc8258d77bc699a8afb13330080cc6bae25464d86fc6356c075f186'
        '77b754cedfc3fa93090e0cfa8318ef587f4af2d132f55637ad444c781050589c5847cd77691c8c63a8c509fa8bd7684f395470baddd0bbf303efd890e64e10db'
        'd3d1bdd55c25aa165e4f724c35cf3920122710de1c3673ab01f7a996a0a1f04db5118607cf14e44f07436b234505967055b15f9206d1c148fb1760e118a5a88f'
        '279282cea6c447eb02947e87580ae9acdda87b67af6b9bbae012397f01ebee0d4072fc292580fdb5a42256ef33257a65882775ddba2dbfd6a3e4101ee2336fd9'
        'a4f05d5d829c1f29609ca1ccdb219127cbaba2372a791cb7b48d9eaf934ff085f5bea584a885f815ab469f3600320ef569d07354ee0bf8f06e2ac05d215a6e8b'
        '43c110558931cb43fa1c9a253771d821bbe19c1105e6fd857508f0fefabc59ae36c317a314258324202f6dfd7f5047aec105da5f81db072447407d1cd74de714'
        'dc416a97d2e7ab328d85a84ffb09e8402785c2f0a5efce82a1da830ce74f0f00f0870aab57cf3a972a1d0ee5d98a25aea10138f985db5b6ab9d348bd410aeeed'
        'a3deda14d38464f39490f4de574ff4ede856ffa2cefa591b5bd91fec7a0ad51257dad13570a73ce11612d07d4c3aca3c4a2d24b9f441e1c4fc9a215dc15fc9e5'
        '57f4ab646ad0a00f7d63494a4e18c22ccabed44204a9c39a963c2b445d3510beabdd2e331517a24a136dc6efdfd64ac0402cc73c6fdaa338dfd7b1e48fec2259'
        'b4f901835dfcd58ef4ba0b374d2d94db4543f69808ba47da3e187c58397421a208d47aaca364552174f352bbbc26f9bbb58a5a1aa903d2a0f0ed95ec96c9cc9f'
        '84becb348a62896de33ba6e0859265f118d0432be5b2df56fad3b531f0347a1816950575a07493b06c4bcf4f58cc43b2d927e4b86f7819769133226643a8a27f'
        '3c287a614016f36b85688c55b49d40191313c7de63cc1db5b86b3d1b58908ccd00970c2f1e9b90efaa2c2259049b4652754bd0c68b632db8b04b5de3e6d8b577'
        'eee502cfb1804847661e91c10363f44a75441df81b8a87dfb88701ad0783bee9f50f8dd7ec0e8007701103a55275fcea62c9e09d5b4235b53463d210a4d95652'
        'c4270754419a125f05094000afbcfd3cfd4844333a531e03bdc6f81c375f1ec5146a4663ce2c024f26a2fa481a07f1c8d081841781c53af9325b40e590ef5b15'
        'f7e5832c8557d13d02b1afec6da0a277ff1ef3ccd9da50928a345792073f7a08a9d82ec7a01eb9d1513fd10f63b2c8055703db6e994747b7a4779e518f0ad840'
        '9ae434ddbf71f457f35104064d014915be20139f612867b5da10d028284676e9156fe01e5f66b7df411e521e21a57d4a6d1b005eef675facbe254cc7160a741e'
        'e93e814e9096baf65c99011b62bbacded0c9820cac8272ea16059e458efb686c71d9ae110d9ae365fdaba15253dce825a3cd884e9d18b84457a25fcb58a7550d')
