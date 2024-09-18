# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=130.0.1
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

verify() {
  cd "$SRCDEST"
  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
    firefox-$pkgver-SHA512SUMS | sha512sum -c -
}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('b1103dee1368411ac0eacabe6b49e7a6d0ffffe0fa38892884f2b1ba4056c9ab30ab02d78fa3d616b621152eff3f89f8b6de4af9e3473d438157b5d9e5734ad2'
        'SKIP'
        '0fb54abe50786f852b02b7be04f70f0925ba95293f702b4149dbecb80f5eaa44f0017772dbb0d30876014144dfdc8c388b34fd30e5e580d1bfaceeb751d4325c'
        'b752154782fb91948f0552f01c4be685509f7d87251af85b73c02cfaa8da27f93f914ca6f826562014a59c8d567b451c26087aff8462eb53b5d5df5c4b402f55'
        'c14b948c15b50b8c6d0c50e22404dd76ebf649fa3bb3197f17cbe8d8021021aa8299598c2b0c7a28c850c0cf41842e718d80b35d1949d131e661db2a263af585'
        '66af66551f2826772c28824bac9fe869e15dcb24cb905d65eda0a1a92ebdc71b0e55e0da971e23f12f2be682534133b2d2382389df7ad597a418189b9b422fec'
        '2178e72c80dee657341dc7ac50a38ca7a5db47a7e84927d4f247e72100f719bed992e25e262b4ab9b72d424f322b918a474ab50c0349b430bd16ea0b08cd36e0'
        'd3f79d4bea3d25405869bbd5651a722b8a4e221704fed963c50f97f0b1e61e520b888a867f1caca72f6dd478f6ac5b908b96c00849ba1fbc703a14005ed0f84e'
        '43597f04ee93fe67a0a8fd01f6f60b63f8d74f9eb846fc1259e7b3eee0ff9f1d8280859cc7b675e493c63645e8b9af8169a7155c0bea943761aeebe4ee1d62fe'
        '6cb96d904a0acce2b8a16e30a3ef46841a0d2cce86c65e3beaae519f5f13879d67ab30baa3b348f462a3e42b63db73341206f2decfc1713066662aac9304a847'
        '812000a6fab4296ef6b11ac07c6f749cdb8ac5ad70f394b2314594e0859d06b2454f416d0edd98706c63cb111cdb8649a37cb7fadf2bae239adffe24b2c9ef98'
        '1bdc7de29b19ef8126450f6db2b82c8c4b36997008dca781226e22f0574a94cf41f0c348e00d3308d18975840ee3756edd4b7bec894192221dd722e2b7b4e31b'
        '30c7c22875098dafcd045f4841818a0aca10a3d07f964369d65e1bccf58d2060b165de5243a2736b61fa15778908014dfa2a174e256a7d8bf9eb9c786a198a6b'
        '7dca1f77db1eca02bf59367d6d3587777f61ae839e57d73424dfc0478571cf88ee89cfa41a99da02daa81046620b05d0a1b1e6cc1c8265ce18c7db73860a346b'
        'd5cf7308f02579540e6e93f56ee512f5fc7aceae0a85a435995852463a065f03d3d6feadae8f5156eda7a4efff75603dd1543bd62b677c7abf550a5dc2fb7a2b'
        '141b69ce46cd89180e38a37520488e305e8d6d13efd0cbc6f3a3e2564c25d07e52c60ab706f5fb80b188130006148e4e292d1e83d258a8de925ed2611ec6f833'
        '25a91327b8f7307509de1c8992205b34e0a535d2a9d5d7d135a0da65662b31e66eaa260c96c37a453ce2abf32b80b13fbd9ce1a0fe17e0e16b1664f93fd9de52'
        '44e33256db532b13c763bc385a14e220e14e548da809c686495382e3c832bc2d03a1c852d4fac4e6c0ef85d59093d6c3da629f588d7a17fd5a53b908fffb3b72'
        'e2ef41fa724727a0f063c549db30c8379dd0ba0d309ea798c4003e0329581726ec863559e466e0d6738b7c93a39bc05147df2b537a9ee6354c5479c1ab4bf1a8'
        '3e2f926a8f66f11107d2e37155dfacbd36dcf54d6fd20547f0fb1ab1b497be465852d8fc527367e509e20bb7e89e3f8f50a8637e56c562c6a5152ee218f1562f'
        '1cd178709f0b96eb28f9f20546a505a5a224f8ec567d4ab7beea0765ad4ffb9dbb411c285b45f523fe9d787c103ed4ff4a5d637fe65936017bf62223e5e468c0'
        'e769a69498b374a30e92b62d20bb5fb299818767b31ab7717b91b325f4f2c69b082ffc50a6991f2a9298d940fe54bed6a961941704464af7174fc3b5366570dd'
        '9eee5fed96ed317341f74f2ff2acccbfb042bbdcaf45d1eaa7c2f2e36af1af0750521cf39ddde8284d453cdd4f2089b16f4a2469da3df920ebfb1d69799651b8'
        'ba2b5a07c433619a927b532cf22bfca1fdc1628d47ba6eb9bf502368067bb84877dc7390d4a69658508c48d84feb3b9be9e5da956a6b67bd8fee70b4e6b87538'
        '7b3b511e4ef9396a30c867fba9e74e361fddb049dbc9c03a2f18693cf995379bcb80db9a6578d2d83a4669a1f3c14b890b0229f83dceb9e8a454ea6595b4b012'
        'bde64541450572d0443d5aa982b890d731a57a19dfab0c00d95f5a176bdf0f3ad170702f005e2815e28aaa5e8e3b9d53adb1966f4bd6607292cc9c11a7cd5d6a'
        'c91694634945de4b642813d14ae3ce935df4f11d19274015a165efddf43205cf3374f90e09ebef20ba872467fd437102f213549a0eded9599a636fb94e1c63e8'
        '407304f29981c014b6fff5fcb7d3660a21152d07dc71b8b0f0ba10c662d23c73448d0e83243d5da6d10f4f0f04b25599213a89ac288ba91acf5c30f313e71638'
        '514b1a502740c8e2cf0b0f4e0563cf216e1777936c1d3a1fb33bd748debba049010b4cb82e37d82d672e81cfed947da55fdf904985709023ec096c52bee67da5'
        '63d18ee82da6b61e8a9e761cbdd4779739d920942465ada1b4328965b608405e1c6df4385d7c335beb211cf98f4cefe6a6da7589b72952c6d08c44c79603ad2d'
        '57650f794bdcfd093e7c1b33f8aa20634e8a919140a29c8b4fb6869f181120ed8ceb15e666fabec6862fbdcdfaba2cf8bf4b7677867d5c983fbf4b9a5d25063e'
        '2427b80fbe06c14e3c795195cb1261affcf17c4df0b848e16bd42c13b0d99fef93d1e612c5a0697b0d6ab5486c84190fa4394f9d722ac2e1f4c9e44891f75d30'
        '566859cebf579c53f3c26855b4c98b4e3e71ce53499a4248870e17c88f0150efa09cf160522e220e8a49203916f759981847bad0d7112c5e3572bb00d153a762'
        '9be1db7c76fcb22e8a681c67a2626e2beca8a4b82c77811a80d25d6a470756a42196c14f902d8c9cc8079d80b9c4981c936b56f28cbde392519355388ff74783'
        '8274dd333a51a5a1dffaa3302e4c488c20eb50193647f78cefbde66dcbf1b6ee4812bf45762f46920a66be7e2c85be106eb8dfd9949d1340ccfa27d176d5ffae'
        'a34004984b9c2000631e61942b58050887d298a071adab067d6685e52aea322bcf97bbfef054e77cc26a2e0cf17276552cf8b5120a02f543dd2a9a849b758b08'
        'e99928b47d810adc2163b864ec720eee04e8204bde4cc6bfd98b3f510f22e5492c833843ff4c54e288510c1db99534275e4d2b60e939f5a1af2fce715ce1ca1b'
        'bf56aad36530659f848fc1d416624e9d38392934313485daa6447e542422717d1a274903f7feb87af2946d57488b51f4c392e759927728a5d0f666b18c7a8b67'
        '417aacab8644c253ace1912f7983adc27d75e4d647ae11ffc3c557846dad0cf60b2da883603675bc8f096c1ddd158d8b6911fdbb482fbc244ba3eb42b8d04217'
        'eb2ad966e7c9d6b03af0277b9e5cca82cf0637f4301e7c04f862b21e2547ce6be0803b94d3acf97db18c2037f9aa4dc1f512b1005232953a2047b0279b47f8a6'
        '05076c4aa0ecfda164ce50781d9510122a7c84a5c6505d4d5c75672efe96c9f0504d05ab9d77515477f5a87ed6890ad6b79b61682718063a9268176b57a3760f'
        'a2e1d2dc0d41a4ebbc607e88f6a6fed18ff6f043ecba47a7131775c0497ee74dc09741b212e975db5241718dfab241a317fc50a5502a608a0db6c53fe10ff825'
        '630c78d645ed84df51a12d05c7e52a74e3d559707ecb972204cc3ff05a52cabdcaf2b8db191576dbcc0476aa09de0e6a388dc671a642442a498bbf967fa2977a'
        '480c4e6b662324e7d897f0ca725578559f54a58da8ad277561df6297c0e76a3f44c159d74e4224daa71e00ab33fbf453dd5e5012089f8c425004bcac01113151'
        '1f84a195c74fca08e9b2d0239968258cdaa064579c995e60f0a093a2f906416d6b4c736e6d94929d508f0627c18ba86067aa186b379e203960025e84f4a967c0'
        '8504aab835e705a9be34bd5e1830ff2af4b0d701acd33b1b133b87d7c70b67b3aaf07139e3f53be15c0494299be04b61e6a3db91f6b6774af8c734f4de19052f'
        '316f9d8a2b549e52633ac4b62100bfa1f41998811e4a80abd1c15159c0b5da82ec0d26dc3f3634e0f8d451589dd649b4bf2183ef560c60187e7b189f40b37f1a'
        'fc63ef314f7d0958bd0bb3d887f658bf4f163ec487dd1e74ca97b1d93549044c7db2913510c9ff349eeb344dc2fb31a1d8baf4f2a0195b42b06d38b1839e95ea'
        'c32e31364268d28bc875e2b0a2f127c8ef61ac1512e06311eb4f93f29ce2b640074100d164def7782b00878a5d4be71b8720a5a8dafc8797f387c230087bb336'
        'e8e1c43e2e8c5d720a2503a2fd0f91f368749eddb52cda373cee6d8db6379aabe9c47bd7c8f1c06a26d48ce13df141559c1757ec89f21d5162f339306afa20ac'
        'd50e2c34ae02e3c6ce9f01630e9a2d427256f5d95abdef893e57fe48d4b01ccc0bc6fb10ee3791a8dd91189afabcee54eca96231551b10fd429c6ccfe621144a'
        '31ed4d2974ef67b433d1e7e35b0e6cdb80a12c909554e5dd55a3086ea2c7b2bc0f1d2d4cbc7d0b41badca96d0d83d0b6ce997abb67e7580cadcfbcc742eb26c5'
        'edad2dbea5cf3ebf065197a73958266aba7c1569e9fbae8fefb605f67e7ed9337cb56d069199497b930f522ffbe0dd0b3cf5cb1d028baebad7e47d6bf1d2a954'
        'd64cb8eae144d29a7e7e76a30f406947eeb4444678fa95959317f8cfc6e8e6b53406aecf295151b2e3e0ea65790adbbba355804356c2be95cb8402edb6f68e17'
        '24ee42b6ac463a7351cd97b0fea19185e113cfc2f0b2fd11222d05ed9333e4172d16665a3fa96da4c23a6b3a56d658bd3600566c908ff57963f5b2709a3431e9'
        '6ec29037e455a60373bfd62abcd94019cec2e857c97e779a47104d132ab4d9cc15953314fa8eb85489291d4cb03a67dff754041d0a094e232395798501b5e993'
        '45bef13c6422fab51bf0ee18aafbc26b9c8dc01e114fa9fc7ede4ad46f2e97f09f4bd7b6205ba091fdde8cf1d381fa6a0c4989c09c4cfb9e1b796a658fbee5fc'
        'ee887ef84881457d801fb337ab753baa960dac673d905eb452d00b9581942f83fa91107e15d9324c42c32ccad4bbf6b78c3e3d49dd2cbb5242daa8f472a0a0bb'
        '3c2cfd4547c59b03bee49c9aa8518468d6426ae09e991f3d554737a3bd5b58a11ef8a2bade9de4cb34ca172ba75735f3b1cac3b866e886d16c96796a2b0d3744'
        'e03b83a81b092f8cd0211f234da2d45268c85010fe285143b527c50d235652d237d3a7095ab30cc1043764dccd1738af985b6d34a34e2340ff46d01b28bce3f2'
        '50353111353c5f1a7e561762f26f84824f30a4a3f2870a3aba6e0a299febfd6e51182fc3bcc0cd346591d94706b4708d30aecf39c2cd8ac7eb2b41d3f051466b'
        '964e3af4fcc5c16973a48d61676800ede6e61277b3b7a663b3f148220e0d322a24c3afe53a0fe3b7027d0f06fab14667f85abfdd0bde7230a1883fe0832f8e76'
        '9c3dc434c8d762922dcf0f95cec0bf5d7abcb68523d3cbc611b031a2b436740c816bca96bc3b1659698e9f0334cb9892dca3779799f8f39f74bb27a2c9d51faa'
        'f4826d63f30b898e7a6c1d717e17e25ae5cce009f1630b536dc53067278d2bd9d27cc1e065f252cfa53f25439b543ce39e6d90aff9ed9da4b5e2b2f8a370dc48'
        'a045e69d4402a77f5452cedf445712a8fa178945a67bff2eef23a6f9c0fe9e2b99058fdcf62b0a2721f306254465e35da76ba977e535ad888b6db5c289ff9c9e'
        'e423c978e20dd247b936cb4ae3ecbf5b4cea0a4f5df67b37c0c81b5571db673c1aff8b94265a95cc2cfd1fb274f8a2eab09e38d5878244ee04529e7c57d14787'
        'e310ca67f56d604987524cafc8eb4cadda5d527e7e9a5403671b36d014500cb6603f41b6c3541a8211fee70500b52fb1c4fac0c1378bcc2dc14f382b905db480'
        '59f08a15e7357ad6e792da2d314ea1df4024a3d4296e517c62d65b05a268bf20bc124f05973f15b7a75749c05ed8bb34d132017fc50dd3f8427b10ffa54bfa91'
        'd2ca2a2b6ace34acabe22af4012f46241a0697001c6ac67b4d1507531c36963c7432a979ba193b2f5ce408c8efded12ba903eb487a019c777aea41dce8e6b063'
        '83bfb345c7fc2e155cf8f275d8189f3af2b4a0a72d3ec83ead246891bf9c72caaa97582750e979028938fb62300cb7e1f8ea6a98ae3f3b895b08e2e34dcf08af'
        '50319ef57c82e2e3e33d5d81fe73ce9247545dbd5bb0990911ce90a8d71bcff0204660b3e8c455cf18ec2db5fa42d5ef6713492c47ff988f13c82ae8c04c1760'
        'cd8fdfc08bbe011ec8d64f43b08eae8047d0746d7b28a13215bcf99261617d515f2ad403d5b713f306ddb70c6ce3188ebb98f67e365be104f987e2962ac820c3'
        '22fc9750c0358932547988e1a361a4cd49d19542776243988f2fa5dd8a46ee12ec4cf6afecbb804eb5ed8ed315a0f598beabbe603b3eea478e1f1abd9ee16747'
        '7bb120b89df819babfab48483cd10d3a41eefa7eb61af4cb1ae1aa3f4d03981773bf5bb3ebf1de41a99598bfa533bd1d73a7343a5f0885c756f8bcb0e1ea9400'
        '65264c72450f54cfa77acdc782493c0137b51bf0a2a4b2fa911593617c3517882a448964956294db2de4a82714a4c29b9b3510bc822baeb90fe59c1f2a528352'
        '230be97b41f30d2987a0bc46876de69e7f2b2ebfaef80cb481740b8b8807c05b34df72ba124ca2850800f1e20730cb1e29cfd62700939208dd90d894e0ab95fc'
        '9c876ed450284515454a74a6e656b0469d910f5b46d6d69a48dc03c4284318849631975c8138bca35d5700f8ae4b908f14ff0336f4a7faabee6d346921f2fd67'
        'f13f5fff3f7c440ae60dfe217d8b9e32839303d283c97fe66efe85a28e7d6f82e8dfe6fc1301b3c1e8d3ae25f87b9ac5e2545a7f2aa59da905bc73cae84e7eb5'
        '4559638bfd7680452d09b4befafc140ecf7148211fae1d56ce34bca0ee9350ed8d6bbbababaf95e4db61b219e1be0698411b5889f85ecfc02f1494567dbafd66'
        'ca30a75ce97f19dfa32530f2ca96a9f0d4c9dfd9d41b8eeea3b873dc514bdc382d70fe26183a8240d1b26771b560bd5a012390d608ce6c031c8a43cee4f92d9d'
        '89edd099213495e02fd2b96095eefed7a2a50c58a795681f1305c72a02cacd7117f7beb2c7bc314ca87e6273acb5a8da1bff641f40964c653e827e62789cd995'
        '7ae309d3d3be073a07d77cca728cfc3d898301b117f44996c6e52a75317ef829d927946b62f7d0803535e2fd73b04f2dfef8433b9332adbd8a6765e63aecac4c'
        'da0365b8ce1657224fdafb610a80ada4cf01b60450be04f1024f11b90fc19c4e5c2adbdc2497bea3edae168b0e48eb0d4e6501a47aca92b9ffbd3d5992f99ce7'
        '8278c841a47dcde9cfecfe34a85f3fa8e1727b1a9f5c0d66f0e8865dea93ee0be253adf9e2a05bfdeecfe1f9d660b7720b02d08bc00bd1fba5e01c43198af6bf'
        '28cf1ac8bc85e284a9039aa2af08ef2632709776e6a33a1ee6b934e0d7149274acde8c5e058dbbb3533c33fb5eb816930d61dd181bd5106fae8a4e383703afe3'
        '9795beacadac0eb925702d7ccfaa8908b98607cfdfd2aa2668049faf6fb4a95d49bf63b63a8e9856586d0494b7b7a51f6c0e973024a796b760416b7e3649abfc'
        '0676cd8fbdeb810faf29739a551eda771627a00d86df4033fb1e4b8ae0a84397021f1774e7a560d085bfa87778050c1d80276145f065ae612803a4ae1f52d1f3'
        '1ce5960d609774d7ea81f310a8e155b30c95e0d546f24e6ec88f71afece0d716515af8b2780897356216fa6e06187f2deda2c88850d35c83384c93efa83e6561'
        '6068e52ead9e94f8a4645578da428b2fda54b406c942c1565d3893738dd15a4a7e8a3c5517e3e2bdc922d877e0383b39477ff9159443f22311729e6c0f9ad18e'
        '8dc9630a99f3c2537ae8a6a302014630a6a6ec2600e9109698514c558a4f00ea2d0023d0dfd9f65baeac7bb768f3f20c5dbafe360bf06bcd344af6564e053f92'
        '1b4c7cd3c4ff1b76a008e30af494acecdadad05fd6dad39898f60f141ddcb6b51fa42e74d8b422a565f841f6f2269df2db1aabbc69a08b74e71b28322f7ee90f'
        'c6c912d0dbd2afc736fb37613c0aa0900a97e0110d1b18f1fcf17119aa93072b90dc10db7c9f6e9ecdfa35487aac506a8ec8ff094552bb0c224b95d2e6ee2d5d'
        '04a91227c5b8e143a61be167ac9b42b6fb87117442f31a3768882d84bcb2dd2886694c656d1fc7b8a86dae0a73f6339730a799aa788c8703d2d2f4ad7b78899d'
        '2533745e1e8716df9217d80a6d235a3c2fc384dee6bcc9de774af0fa9342b343e0060bc28de25b4f3ee70afc4fb1978203ae5496dc9cb3a520081331b713db3d'
        'ba6cbf6c86f28d561841d44ec0ad132694258721fc5e82a8b3bc4172432eccc81faede575d11fcfaa688a0606fddeeaca0d873faf961c4ec180aeef66fbcccbb'
        'efd3e6fae426e5b11ea95536ad430dd826545f864b7d3f6e5fc430733f94072f5b54e60d2b0c44ab47c708fd8283bbd821cf90f5b2918b35cf3c0a1d1cd50f89'
        'b2219d1751bc340a98715c139335d1631970dbdc827d2f4b546c8b7d9eb6e9f5b7b8442449346826634895b3916698f2ed2da47d9dc78efec9961bd71ae3cd4a'
        'd7d3409856a152cf49b0444ca4ea63c5e0caabda66a0642ae108e868914954f2cbfad0d0740457b514f55e89422eb66b6df959c5f0de8b2743366d6935245e65'
        'a09677f81de8162f0838f72e85c46eab804daf2300371c74f23428778c98e6faf862a473f69c8976d32d761d3bf61954017910f90814ad1e16d85b866b7a934a'
        'b4436ab964892f80e19645b947de35ac02abb49acd66eccad1247cc0bbc80acea992ae81052a1a229834dfa16abd5c489a83d9c03b96ef627eeebf7876667c83'
        'ecf879c2c7e429306cf63cb873de262068878d82a2803da15a9bbe2a8e3eb85f3b31ff09b12c3b2fd9a86a1cab4ee835be1572bd342686177e681785ee204a78'
        'e7e53f6c7db79a793d09f3759c085c91470b95bba7d33c8993c96ed1639ee2a22defaf41a6c02e50a23a6abd54c2210c8bb9841674c57b979f51c541b758d73a'
        '2bf9207de33261efd8f5515bfadc7e02b58043f9b5dd369999214e1a3045ba38c5017d0fbdedb8f7332f0e1a996c09f139a33c8ef75d7d3b0db1fa67ae4577ad'
        '66ee8d30614ce9c37e2db50c8c033b301c3b0cbd97a52d694af8456b8c15f6b080a8d1354e03ce6137635c0b248d4ca171d412413df16e2d07904702f0bd95d9'
        '4bfe797d28c7406464406a6a6297227bb05e327a885a8960496c1740aa8787c88bcf04c48feaf3772e87a51f79ddd25f3896262e5cf91eccf52f3cd578dc794b')
