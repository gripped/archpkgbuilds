# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=131.0.3
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

b2sums=('7dc9ff5e8e0175555ace404ccc5779496ea32b5a688d66351029a4b16f39428e86ba8b31becdc79f4516076c2c7875bc7f4ba6548f676bf20e552ae7b35c3486'
        'SKIP'
        'fa22dd76d0786204d412d061b24d8285a526cdadde32ca4f3c1cde022a62a7412597c164048551561030807443b4b5fbbb2c9912b7f1933b1ecb9f5db21de7ed'
        '802ac5526873fb14efdadf3c4d02f25b29dc04d2d78c8728f87aaeb75fe30cc6d389d4aafdc79b008fd6dd16d998be865daee34c3051f71f47977f90c6db72f3'
        '9780e3274280a2507db391ecfac7f567eeb5dc764bfb2344002b13eb9d805df618c93df37d0a1f044d7af2c909ec668452cedb12c76e53dde663bb7c192edee8'
        '4c0b55cbc57de761551e446e921ab4f75ae9226c68d869cd43aa24d8083e2a76f08a136015d1f12859bdcc806ca8fb0428cbacef6a27c4cd86a61f7d315efdff'
        'fa5af1d3439e4d2e54b6726a5160e879f0ac9cd5a8845f088f88084c03429623b0a93a5b1aa54bff073bda0225d34e826a7ef7051c52df3b799b10028b2a96c2'
        'c78bcdd340b38a54b0e8386e3a6f70fefa995f2b34c464547e26db4a78614d05f7200380c2bd43813b0dc1014e47f6e5cf1a8493cd3c7f1e2a48b9aece57109f'
        'aadb4eebc2ed241fd7d3231ccdca5eeb81dc3c790af669e3549e809a3d3f81b9e284ef98b89ae258827064f205370d910c96db5e2e60e17cfad1eded6d5a521f'
        'f810a380670b48a00d2520b72fae696ff59b16e02400f4aa891bd80bcec1607e06482276d74aa09667a35ee4ae4ce69d1a51e08ee9236ecdeefa18a1cc478fc4'
        'c0d293a5be5c83eeac85efb022bf5978d014480b3346c9e05f55d336cf5d1e65f2f4d3d306e5f0acd102f67423c2baf51845d7038e792a98dfbf85ecdfe6b34c'
        'e9ec101079a561e51d66b2ae2ff3815626495fed952cf157ae8db79e9dcd5494b17ce9e3fc9238d8995854dcf24e88482f04e515c28c9d3a5b9f69a83e4d4f95'
        'e1ab4d46cb52399e6dceaf188f0e35cc45249ecd9d30cfd42325f028a6a5ceeae288b69740313cc0823f7a07327fcf6043d420a6ed1db5b581e8fbf42f393bfe'
        '06ef6ef988e09363c574a0e3ca68f50623a485bf925f8b458d5bee9edae431c93b488267bb13a535d74ac93aef06d4a0bf0def152e09d44d0e31ed840ccfb799'
        '682946e572a14633793e5cbfc4665624ca5ef0f77fac64872720a02a7df3a99e05e4e964633471d2dbcd939198223c60fbae8932948cb710da89b879ac306115'
        '67ca9cd2514a0fb0e7af6c12c89ace4687a92a23d53bbeaf3e4072e4c2add7ff8cc80896087580418ea675bcf68fb65b46400c2f6406ebfa5eaa9a55787bca21'
        '00d2b6f2f3344a3c81b49b55d0a2a2e72c4fbb33990f7e1bd384af793bb1828df59eca3059f3ad51996b3f7c781bea37f310ed42dbc7b8cfbf3762d754f3447e'
        '1f8b979ca8997b64d596d1d76851dffb8ad09e0e448bda48726e9b83e2ded27235954daf94d667840c6ae9ec0bacd4ae27c1123e0803bbc6277d4d18c4756be7'
        '97f6b1a106d6827c583d2f1e80979ce8bf7559997796d60f2be27ac1d8a1abde5531d2804ec7dc9e9fd31981a10c353076d74b1b0429c64bc82da360fe5d03e5'
        'bdb7043fec3541dd52edd522b2fe8578c3ba08e5027a6e2b3920d865b56c4df5a436522b628042ec7e8c1715ff266f6b010c8ecba5230af56035b449d410a84f'
        '747644bf660a39b8650c458d300b810cfe3d2aaf9e3af0b15db55b14dfd0222a9c5b94173e54254eefee68266dad4d19cbe7a058504fdce061e68788c17d88a8'
        '41ee4b88cf796fff2fb068fc0daacaad53c9c84d7d2dbffe11cb10ce7ab6cdc2cccce9061717aa616468a7dd61b8cc1950cfea6ef949438f80ce0ce7eedb59b1'
        'e58fc66a4a140834586dac9e36cf08e6fb34a15c70f54dad0fb42eea4c5aa0142f92cb7eb5e77f901e3f42b392ebb30b3fbeb1721747b70b97c66ec19ca1b616'
        '4d44a9d70c31fe225dc6ed0eb65676b112855fa8223123eed0deb106c2024b17a195c87fef6c8303de64f1954ca551b6668166744b46fc9bb0479bf505a40a93'
        '262f169b2638c7070237ead16c44fb15ce0cd59f36f8c16b2ac14094b96ce2b8a85df372f76e94e858e641f94fddfc8b8ad5afb8a1b68c7d1d0960e02fe00473'
        'f6f8f7a1933fbee07db565615fdee52b67aae6e39d48c218ac5d552a1386394022035ddaa4b87e3b0e8b29757afb4fe0d36c51c259cac0316670db9b46063565'
        'd623548480dd4d539288def6a746a24a1e34868edd0cb396b9a82c02499eaa267e1c6593bc5a73ccb458772c3d965ab7b2f9704491e4d009782db8c4cb3acda6'
        'f2863dab3089f1fd18e21b73b973122d767782b790d3e656a895888eba66ab13190024e08e292d4ca1fa816e68db99cd8649bf746e39e276b0efa4aeeb3631fb'
        '11035cb951aa719db562e787d5fa65dd8db472bdd21ff008152a072e78b478edadfcde2f685f2e6be91122629f90a4a1b4a4e8617020cc3884cc8a06ac5287ed'
        '934e69644c08f4608fde5421fab905585c0ddaeb3ba91da17e0fbaa2adf88374192efca5ccce752383f673cd390e49dd0cc6b3d31969d36201e532874435171a'
        'f97abf84188a5215c31a34961546a00944db8f12db828040248e5498bdb2b5c9e4a1bfb37d2b9fbb97cf42096018f3bd31ec19c1cb9ffdc1091b0ab1cd4299c7'
        '1aecc8a7db1c77c4e2f3ad4e76dabbfa97bc1814e1d5fdd173c4d8671e523ff17143c2e74243955f605ef5a33c9380be50eb99d0d9e8d62060259ea2c9d606da'
        '3a7865ec35d1013722e39a5a19869f0fb964c9f3ba44c67a21b9abd086915bed264ddf117783af610ac46b667fdb035148727a778ede7c2046f23bb1caf3a07c'
        'aa2e5381c2ee85fc7fb9529727c7cfe29d00a4a5fd273a405610f234e8191176a063425cc6194014b6ef5d8287383fee20e45937b43c5200f133e8c5f5e7e8e9'
        'bd3ffafda3015a8b8d5515f8720eb5bbf6005ae5180bdc25c38b564144355107831eac73f780af443fc9c073f44bebdd33255167d57c73d4b749aca32d330df5'
        'fcf392b9b6a4e73a219df42732bc7cdacd0c01bc735d569b720883af1120efd6be5098eff8f3f6a5056351949d836b42d097130c2b8f0d39e436b15006b63612'
        '5fd059ff67ab46e685a2440edd14941dc658c7e5cd3138bddc4d22bc108fc31e1e858bd453c7ebbd338380a3df2c561f951300eeefc7bccb0535d76a0ae58767'
        '2fea9da7547badde7d7f4bb44b09c25455bcd3e8e48e4b0593bbbb301f009f9ea40a4834982f80fbbf65eba6f4852129a6a009f174a823bb2315b095ca7e1c65'
        'f5917602a36d72196b20a9532e90fd41ccf31b5c84a8d28e2c2184e617d2267ba6b7f47ebfc76fd7696288cd8f1d0a1609dd574ebce5e77ff0f65402cea25744'
        '720332dabdd62a5e9c2e3cd2dfdfd5e63824dcb1752bd5cdd94412e7672e40ec16e6c20d11417aba228f7db2db3a3e72b5633d52da9f429891f278d204c3b2c5'
        '1150794b9df67e479493fecd90b6c30749ea3b7fb947247c7e4736442f3ea5a08252c36b494f3da2297a8f3e564e2be2c158c201e6d3d2af1236bd22cc477221'
        '6da610d49c67c9d013277af5035b70df39807a1150b931baf3b33b6301d629dc5de41e174ceba6d749d684eb149ba0b802122487592e30850beb1a95ebff9ddd'
        '345f9443258dc5b41c262ea951fa52ad96d94df31c66b87837fbd49d4bbb865d6b82678d7a02d07d5f715e97dbfc9b45e625a6f86f16e95242f791b62eddac08'
        'fa8f1f5a498271125940819d140bb36bbea96d63dc92e624f4fc20ab77eab86f04f6659e3b57f7ef7b0fe1920f18d0d9ca6a8f6cb20b29e96cfb0dc92979fd9e'
        'd9597a0c6be9e98186743bb884dfd5a945d5bd26fe7caf381de7968eb25ae26fda50714d0c20a0bf19a1915455c5bb91e1b2c3c97936dbd756b275fc089c34f8'
        '9e0c979bfed45ef40d3263b0f8582897143d9c7b041ef6f165358db56a18319a7d4e9b7db9a55c89bbfeab568b888cd69cef756563b96e83ffc4d382a23705ae'
        'a58b4b26084dcf32daeeb10bb329f10090550919cc5ac55f46fb28800481576fc7032b910345c42ad5fa1b9ef4006c10e8ee99399fbb958649f55a21d9857590'
        'f5a5e0178a6ee20c45c5ef33195b0f30d5e638684003622314cdef8c4dc19846e389f3ffeaab3f38462df1aead79e94f954860ee9e34497cbd145aa6a0c60fde'
        'e9d7124e662d40dbe65128c1146a0278ce21162477922f356804ede03cd6ea8b9c2566371e90d923c9081097b6748afdb2aed7fc41d913b90e0e13856198a868'
        '24a5640669e00e62b13267a3d85913b08d60f32c062bf04a1d61cd69f259f97b3d6a271a67c21156bea030f61d3af83060a62d589b105d8ac569d0e153c6933d'
        'a241b60552041b4d9b314449b5f5fc8ab695cd806199d27e8292d19689f25e8e182f44750ab3764e0cebd5832ee4931d7bdd6097a9160c2be262eab4aca427fa'
        'fb04bca98dc987c19db33a8da329e1b59081fa0481c705516f5f37833be20985cfe9504976af27cff6c72fb9913c643645d1eec71e3439cd874e5bcc33ecd3b5'
        '674f54446503c49e654ccabebcc8fb9c2344bcb428e1ecb078ea3c18423d147fba0db6c3333e1dd0ac21b18bd705cec7d5dea831869906b68441de7a1aa1a615'
        'ca9478976a745a859c9b318b1d7d29c9a7cdcd5b1db52ef0e5f9eef76197b7658f51ccd11dd74966d0ea50c96600ebea30750bcf085e3deb15667ee338c29ec6'
        'cd08cae80bab57cfee0e918c46fd22dcbbf78d68cf1958a38ada5369952deaebd28a38e91af4aac5076112e0199cfe04b21b06d346a9999cf39c2819b9af9c1d'
        'e9d20337ccaa9d71130aae848d18a6a30a108c58cfde132064efaaab65f5dc633fa0f41b3f09e039cb9d54d057f60886f345c398ffd1bac6d6531f9a45f8a070'
        '4d22a8861a7953e4eb0286731a63efe62bdfe8470c48faa2b8121d6a80c0623a34fd2ba7a6b2a7ccba665bb666c9605d1c74a3848a48dc89b00729d43f5d6000'
        '06b2861f7a0a8b831aaa23bfd432db9a8edf4b5454756465215c71b058b296191204e7099a440e4721ef32214f1d0e04591f23f6779facd8ae27ce3fac4ebe09'
        '02bd1748ae9e85de74ab669a7ed9287f677a00c65d6804f539453e5038eb6d3e68d8451aff0669bca9a42803124826c5abcfdf0d7095d3ff25d187128409d6ae'
        'd10e856c88b308a45dc47dc3f2dd6fc13663fcb72f6d6488678a01a5feae4721a0660c238d0f7392e39f382e7c0f0c602963560148d677b5fa22a7cbcb8546d9'
        'c9639f92439ae4b0e44c614fba245abf013a05bc9782026f68ba3a8792a8331d8f17f72672556cfe7a6d10ea127b08702b57e0d06110e1b6c3135ad0add5e694'
        '9b2081da790fa8ec54d2f00317b7b6575dd1b582e86292dc366286e54dc016d4c16cbd487a34295c29deadd9d26e9a5c23a21816362ecc5bc6c7b3c54802f4c3'
        '44c77e6113cd2e567e619d4d82725ab7c9cea4155bb91aff3d70378f1b8b26d47c34413b4cad5b6f06309708a11927a5a5bfeb398b4c16bbc60540df1a3cfbba'
        '6b8e31cb0c2945cae3c2e0b6690622f721d318f54c1b38a840f3d72111294757a9d61abb36581871537a2abd10d14b02cff914932ce09b756f8a035acfe04b6c'
        '62eb8e525fde2c04c7eee566c63c24fd7366d5667602835fdfe75e14a57ca18dc973a21c7935e9747f4b2eb6a3b2999218550126684cc312b1e9b8b108ea50d4'
        'da75b60157cd743c30accb20ab46aab54f7ce8a3eeeda97eb405fee201e09a22c1804662193b2723a38fe05c3569b2db07ce6000463dad13873aa4d8c7d13f68'
        '52c408ea552e862ac78088e89afa5a0dd67eb83210a2f961808b218aada1393e95a5d8dc14cf86456eccba2e67f439ce8a76548b4bf2e4f9a34786a4b14e85af'
        '7cddf9e7633c9973959ac174e3cafef3e347e865255812e7593fd9e678bbadc766971275adc985955bd0e3e6bfb149458db82de179824c796d8b0cade2f32ed4'
        '64c61620cd38d3147fba316c43db88033d7311717bd9935e6993f20f2404feee52f62945706c7358eb86dd0e350ff28797b63a952a22c232ec6d86f814615828'
        '249ca633cdcfac5ae903c7beb54ba34a7793a68377bac45af8ade86f5727a89680ca96ceb6486f798df77082d34f1866a7d1af7345659d5fe4402e4147fc7c02'
        'dee5627657fef1d96700ad29de23ca3d438ced95e5ce1a9d027b61e671dc8c8ed740f38bd493ba68178cafb4bd84ef2a9678551f182e821d1c654835dfda4d24'
        'c210dd818704d3184439c6e26b89478a4485da94f59b3b63a701976fa82bf0ff4ca44a38722531fd2d925ea8eb5ea0088d84dd571156d255d981c487cda91eb5'
        '9f2cbe31cf6bc24c3f08c99057c3c4f43fe15bfff6b1c335a5d4598b38a4ada39811d31a4d5b64097b09adb66097d7ef07cf44daa083a328b55e66bffeb03151'
        'e5f97afc3270c6dac70f0c935212e310d8cde05627f70a97ab4a0462c862a9e61fd8fad340f6441741dfb42862014e9195a85e909e77588ddff79033155c3cd8'
        'bab13a34a2aba8692447d0c97ff59f43f01e03f4a7dffa10e0819eaa72c37ba4b0d277d0542fc409d4f358a557e760a7e23e84802b2c1159e1c2aa63ebeebded'
        '3810d737c1bc59e0e19321881dab7b7e11bb81e81e844fb20061a663d8e5948f09374d0c06c9515db14249a5ceb4292e7716b80260f41bc6a75b95b5424bc873'
        'aed46a6a86b226d35db9e0308e60d686a0e06905a618f51425329e449fa59ee135da8badf042e971900ee2a92dadd47b9091a7d7d93eabb271e7c94cc998f98a'
        'e5da645d7fdb355ff7f59436c3d3b2a8ffb764b33e0bcee69a350453e7bbab3ef04c5be08d787f076c91e7ce71c0f0719d3defc14bc8560b1b48f49b8e4965d5'
        'bc3e9d0e2657141d741ef09998284611345b93c90a5d34dd7e45ca59983feb062dce6eb86f1839865609617875254bae0aeba08e8d2044346fccdb1475d9b6c0'
        '8689a8b2fdbbd5440fabc5732b90ae281842cb0ddd7f6f1be2f9bd68bcc604cc2329ab6beef031c69330f64311e76ff661ca865e9ff11ee21f63e24801578ccc'
        '10d23a7f091766a23ff6d62c6a868c8c746d5e09e97a9459fac90f6812f8d3d6957adbe9029eab74565dadcab86fe05357af73f00f7b83b739c7c275a7cc634c'
        '5dc41d4504130812d070c33e6d4aab835f58a00f1b1b79b1035c34ac1a314c2ed39e1cce0fb8acabd034a1e03e9253a7e9707dc50e49195019f7e4c8e981924e'
        '81e9cfd5d0dcad8410df5edd826b25e524e6e431bb22e55029d5154bbe9dfaa614e41a883dc284a08363e245119c9c41bf321cabce574f646da6d3714a6ab51b'
        'e9dde2f1500bb36a0f34f8a17e025ca062ee4aaa549f64f6ab74b979e6b0088836ce8e45fdbad7338225cfa19d8cbcce6ca9b8befb8df6898883f89581704df9'
        'c1ef05a21fda37046de8e2d015bea56783af6905a3453cb84b2d41b83d1dd1f196de0db96690040766c8c9cfeeacc2168bdc3dcfbde47190d3d05b1e53bd7f5c'
        'ce16afb151233c8be6af5f184562e036b3e9231f29b953c2695147e30821cba35b884719430ad187ff9afa70f6c835d9db12f50d7225f9fef23e12af7893ecf0'
        'c3833ab5dac80717f9a041b19abc0ac095e8b7a62f152b0250760dbef3cc3232da5bb20949bf29d439bfc0b5c989cdeed802692c6c1b48b547017459be556b02'
        'daaeb5ad52ac6931c09ca8e779c0aa650ce1923a382bdf76930ebe6116c5d83f72d1c0d0c0d95b422ecc4dd57efe88e5869c7a178d78a4269c023f3754477876'
        '7602a3645c355e1e0cc1abdded695b52aa33329753cd0405eac3cc0386410547f498df6eb2113981ad4439444865eca49e4f021f6a6b3cb8fb458c7bc9a0294a'
        '0f82a62556664a73ec9d4e18574ed331f66eb914304e7d98fabc0c150d89d784c7f6066211cfe2b1093704606c24265be69f00e01f9a39169ee460ebd64c5d13'
        '52fda725d43f6dce7ccd57d383b8af7e055306c5abf0d03e2dabe9bfc5235e5a174cdfb9051b4b31be99eede42bcebdf045bd07625eb9cd401354a6de8c25694'
        '4da43b32641f257b10e02731cf4a6b5985bd8bbd596f92e4edd78fc66153c4c42d7abcfff8dce6d35c115e0372545c057f322ff8e31e3c764832f4b8c42cadae'
        '38c82c40e028def6696d2da177a6b4b0996e15c057a1bf5c81fbafc4f16903372a30199f8dfef0f8270d4887146b2b07e1d8a0648d54a314fa7fa0370cf2a39a'
        '075920da53a66a3068ebf2f0c07ef7e8a0d5d025b906612485dd092a355e5329ea6aa63c3199cc90260d26410d6019b9e91ed183f122106f6cc9660d37ddb11b'
        'bce1fd16abc1f251236d54808c0c86a5954cd15c9dd8b0c60bb815f9c249ab4e5362ff224d57d0b57bdc75e16bb886f993bf29e04ae2ab96c50b51d4fcaf2dc9'
        'c9d42ee8f144b8a04277e9d5473422221e970d0ef1ac251a4f63c695013ccca1e89655e5c58060866ff3b037f88ceacdfdc6b04167cbe777ab75bb7bf7431b8f'
        'f6202186a782c6bdf68e5f5762cbce96eb70fe7e6e5a27fea49054ccd43aee046b5a424803277272f9747eaf139852a6af4a566f0cec8919499cf3ad2811fa09'
        'f68c5be59a45613b096dc26d348555b46a8b90fa7afb4a05a916c64a7f1562e3f3b858a5c078cca64f99c8b0d837de22f600bc6ca0f9119264fbc40f56aaad11'
        '06ca129585bf9bc1e6fb2c4e124b3a2dae6a37fc4439f14eefc0cb2404603966a8cfeb1ae1fb2ef369229cdacbfdf8427f0b294757448b8a851e8de967ebbd25'
        '4bc7db2c547f4dcaf164fccfc172ff5c1afc41168cf69c6111ef8e324e534ab3503c3d02294a91d8118ad5ec2a5e34038980f722ee8c0f6fde3650caacc32849'
        'b4de5e4bbdd57669ecfb56e10ad6317c5c2173608e558c0f22d18a8582c3d5f6f100969c4974c5b6d631c88d5f7ff7f859d1136f8c11cf7f20887b74c5ce1a8d'
        '08fa6b2d46bbe6fc7cf8e3541df5d4fe6ad6152010b174182226e0f9d6a9c175cb4603ecf3110643bacb0f7fc458b23eb0e7372cd0e4c700b757dc57a75eaa84'
        '7ee9f050ec3914426642969cea98ac20981c8da9e878447c264c862ee524f9ff7e9af585abfeecadc64717dc5677eb108b3917f3aa2839a3edcd83a2f707de10'
        '5809042234e4bd240f2f0267a0b9c6a965123f686d0a28dfc4d1e6c2ccf9a5c9b3eb149cc210e3f07a742c1f634c1ccc23d6fc9aa17c16a260c10ad58e40e64b'
        '5f70437eab66ab2fbe3a20177687cc2cf48e44c5bec2e44a9983504fadeb77464f2091d3a9037d54aa462939cae796d8b9ab4a9332bd65b62c3a6f8b076092d4')
