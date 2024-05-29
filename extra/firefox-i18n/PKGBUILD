# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=126.0.1
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

b2sums=('ea5712b23baca0fca63c6be2a2d208fc98614edd08ce93068adf4742a66e1f17244415a291e816acbe9eaabc85a3d0c03727421c62205b0c03079f2726030bf4'
        'SKIP'
        'b15137e1405cd3d5fac4817b25f35e4f263779a354ddc94c5e3a5fb1211fb3a4154c666b208b39d3ef51c762a0cb64a12cad7c7502c315e6f4061a0f70f51511'
        '4704effbce0002c6a20bf99f43dacc37a3e76f5d02fe02b13f820308d32793df314bcb225fb1df92e009053df68544bd61c74dbd6eabc299405f36b996552be8'
        '4dbcca143ed116c99f0e07c35bc73007abe42c4eee30677c502a442909350b2bb0a305dd0628f7fda97bc84ee6702baa98c9d7e6b6c825a227eb13e47e469223'
        'dfa38eea9d999f700b9434d47c32d6e1d1e6a1775b37b922e5019ba57e6a8491f4ce6b85267afe58630e3f5c4356bc316be4a0dcdba4c805585537e91e9f2757'
        'd7a8b250e139cc1d3f95313b24f49697cf28ef328611d3ad8d6a2a175787bd8883cabe50b7b71e858fd2911fc4788038e6d0f82f60e64ff4c842b228e45476a2'
        '70319dae9ec337878e64157d6333c84a61953c79eeb28a80381dd708c219948ed6e62cfec8f689c0149105ef11f012f8f7936bfb607b8c5bfa95d3902ebde6c1'
        '41a2162a0d6e695154859fe5f76f4ffb1d938c50d060d2b629ebcb45442870e2287bc2ad762c91b83475c6b9ace28f583a961d59a28a29c0d27fce51b0885349'
        '6de31d292e9e7af6daece21834709e4d0de7b2ce8315a6e000fbca9680a14b85193b5f4859109b69d61ddb111540357c2a128f70b39466715b02f1bd9f99425b'
        '789e20002fe2e54f12a0cc350a6cfb0e5f74927cef1497a6895467e4e231e381337be596725af3a6091a02d29b95274e59a04cfa0269e0ea886e1e7d26bc8827'
        'd52fede774aa48a55cc422f30f06de8ab7c30bbc6c81ea35acd48ce406ae6bf41bfedb375f52e7274a92087a23e9ba35fa2f61ed2591b86dca28884e15fc28fd'
        '64e1ffb3878a455d84e48bd1e4a82d39ca3af6d518d5b15397b58e9b3daa090f9466082ffc2dd7ace8ec08a3ebc96368354bc00b4573a37f5d40b25492a850fc'
        'f64d24d97951cffc8a9c86a6f0d5cf3d4f6f9c375a353c5c8e2c67db5cc38ba7a82541615b5505fe45dcf7fcca3a116967166ae6ef3c824c3d13f651575cee5d'
        '64dcf13efaec4051b0a3b6cb79d714399fa2bab927c7655a0a661afda06b16e6afb48f071434c3a373fd2c0bf9e799a786939773fb95c3544854311fb51ec385'
        '64d80ead40358eb9b21bf89663907d327e492b9f62e64e0587b888aa6895884fb9cfe8426a3f97892b48fa2724eb5a3929019187d017fda9494b76ea97fe6ad3'
        'ac8f43bf764c10ff8cb39e948a2347607a547c104f16726b71b0772f06c365124b6e247532263f14fd65458dc4f8de9b9f7e5a15ff26bb2a12f8b9247219222e'
        'c35e71a80b04f3f8a422f0888f63d780ac5dd14d592c5fed165a3fc108027564ed09b26c8bf51f9ad7558c2e8aaac5f06e77de75f05a405576e2180439733bd8'
        '7016806efaa576bc76caa3db8ebea86aaf675d3dec54c1adaf5624f614cf16451c3b7695780b5bef0fea222d46735123f0e95551909d44a0a54f97779eb38e69'
        'a21a882cea813fe3c1772b77ec384e5a511bbb7a34a23e68078de27a455af3eb117f27ecc27e185c4ac0acaa55d163e9bf047c8267f62942f12d9fd6daac4758'
        '666656b7bea5b233633ba2aad69611b8b069d0cb01a4f18d8c689aacaed88feb6888abe8745a04c7e74798711614ab9a967d3927243f78f860e6eeef454dd489'
        '3370a0a67da6e5289f96811930c2865ae8217da7b1f6d284c109173b4d08af2c308c8015555b10c21c9b66d9a152d1842ddb12649095182ce4215c91a9042577'
        '2bcc669fe9d3bad5ce24fffc00759b83a0bdd4b9756488fdcd3fb86f21efd85f5006c96869b159445132f0e5051210932014269d4841a8022da5d9af59d23420'
        'b1797210cdc3a73a28a79ea457bb26cb1bbef07f6142adfbf33ecca9a47b967a64207482935520ee103a24faa86cdde44ed21efe8b09379cf68ebcbe06e4448b'
        '6fc23d4a53fcf3489ff1fc2fc66dba56735e9a1de0374d2e58fcf159ea964639c8d70ef670b6bb626ebd7e90eedd0e104e5ffd0379040f84dbab340850aa649b'
        'e7a5d4b5efa87cb0565225199a48a25d40314990631c9277a5c8965401a18f7a4df9807a5beb503b6593897791d6f447f40cb020c842675472108716d5e72ba7'
        '133f958434a6811103a05a095ece2ce99fdadf108bf39ce6283299a0f8ad9882df0dc31d7f1ff0813eb1d5e304f2a79c2b5d59a7264d8ffb3d1e27933527fc18'
        '25dc7eac927f0da1d747b67caa3dc57f8f3d0e08e1c3b5d23f866c7ac2848927820119a7b5fd18cc19a42a7b9c694e7f700cd3f67227669eab9fb7b3daffb032'
        '54bc4e3e947cfce3793a8ea6cc583f6bd6102c179831978423f83a7210ee1c2900eeca4304ab767c557948466241e2e8c2e49329b7b4d0f9f70b75a9bfaec380'
        '219170782732f7d1248afdee4d46e449083ca79d816d5055d73c8509880b621d73807aa36b255b615b621dce54c043beaee5c3051202fb88214c1ee38c166ac1'
        '84118c499a3b7c8f146566849fb7f22b0f15ba9bc4221ef3124dfee37f00291d535105e8859ebd0484c51d1fca2c4222ea1c9bca0662df890ee5a33b194f3da0'
        '95d3066d267c7fc781890a01a7e7580bbea3fb78f22ee498680bc1cf7ec2c92cc457243c983347fb6bf050df8c9aa2fa0a5a94d1ade086944a2d7b45fb232cb5'
        '0bf68af7d115e26c1d3b88ed53cd38e8dd3c34c399250b231bf9b03d8e3e5e49682f3815da346c48ba2f73c524545c1d2149d6e048e917e1f10c65ad002d4f89'
        '6da91582e4323e8ceabdd5e56abe570156971df2ea61158a38b2f9c5adb50ce6ea0eb2dfbd4ed0533e181091579fb4183214e254625e457f0576258149f241b0'
        'add2cdbbc81654fca6b53b08dd3d0c04ac99ce09f32b1db555a941381d228b6cc34af2be0960fbe76f81048d3a53dbd80a4388d6c4ca43ae17ba0e7fe97d582d'
        '4fcf59d7b4f36d2871aec196a0b2d70631430d8a9b5e6917d549067fe4351e47e5e091239a0aaff3dd5113c8567b39d77194784482180758f5adb58811e878f1'
        '34fdfa03df0b39fdfe79a3dd38e1e2470bfcfc9047a7c53e8982f869711f98cd93b670ee4f741887d52854bacd85d9a6bade8fa022f99c4ae58a349db2ddce6e'
        'b41025b238b09d001ce3213601d594e6cba1ddcf77d36000d3a2fd73b2feb239a640c1a392edd8c51e2d673cc5cc96c63f5715b5b65f287b4116d67994b496a6'
        'b7d44dcb84fafc22364216474370057f5efe2ccaf38c58ca0d6a137e3ac8d42298f83b50a030cc6d40e446ef1a82fa2a1e86344431f42a97acdd909d420ee2bd'
        '473b3b6983230ad8eed3b23f98c36ef780cca8a3d364ff1ee7399c47a5511fed72baf023fc35a0690f4f37feeaee7dee2951b14d6c3a1ad5a0de3a3ec4d49c46'
        '65a10fa8efafee069ca87c25a4d6d3018a2678d79b4e14e4951203cade16b27e28e3054afd5982bc7e04ebb49a241129b7fa56d2b1e0846c6df1e533c8a2a7b9'
        '105045d3125791d0e9e5d6d6b46df1b849feb361eabf0c49693d69c0c9906cc492ada6f788932aba4bfd79934242c7ef117b8a45e24604a5f41bd22e036c8e3a'
        'a9cc86984120f854421c53485ea551cde4141ce76694ab6229b519b473e0171efab42aa6950cbe38af6aae1f39d9a590e091baff4b3b21d499c89601af792294'
        '6a401531d559b0c44b7be634547af8fdd91590bafdbd04c376fef7af0c64780404007429fa642a417fadd17642f32743cc5fe09baa28563282aa7a0ab93e105d'
        '8977dd5471e808c548da3e19d0a2f8a07383dc630e0ec58f46e7146a0f0d6349ac6284e95d273ab34f6a9bc6b78d7472d39eadecd66c65c0d34f491945d05cd3'
        '527f4411fd61225d6f42da07d410b7d4b860741a83024d9cc3fe481dbac86a4613d59d7fdac5e4c32cce08b6c9a7428ec6501910ae0f23f5fc8c8b6bbee91944'
        'd786f32be711faa01aacfd832f81e8e9a9066baf7c0bff6ac47db50ad205ccecb65b4afa7873583eb541eddfe7cb65662f4b9b990a413f88fbebc0c4f465169e'
        'd4f1bfcd5af1448e9296cd1b1564e564f9cb9042b40ae7845665c3c9eb8951434e150d5919c6a1f46f41540663e3710a763667f960649b9ea646c14b03281b0d'
        '9ead11a69d7f32df885828d2f1fc6f5eef8e9ae193015967858ca14acaa80e9dc929fa55f0f7947490b18f98ca2d646558388f6f1003f426b9ae0df79d1cdea2'
        'c6f2b8cb6191f1b1b1b9841ec77922fc707c2f08928cd5c3bfbbbfbc04b49643dec075124b8dd157692b99885e084ab91b8fdb31fd49f5ecb414d9afec6a0d1b'
        'ed150f4a9e19204f8e7aacaa2b7e7619e6a36653c292e7d1f3d71c7d25871079a8da3206bd801d31933bee8d020cffcd5b0b15af50d66a70f1ec24c42650dd19'
        'ad307e90e5b2febb7ea47beca78548499fa3ddf7c04e2077e50f6722ca0d592da73c090ccc73c4dc3b39647f70c38a09a54e6ea7ec8e87b14667af0a616ff914'
        '08ce89231e25f06db6fcab76bf7af0cd1a0149e01952de4f23d201f067a4316d621d5f67411a6e1ca0156455e73596959b6883f79c59043284d3152c93087f79'
        '1b0144cfbd43c783a73b131be3511909d16de4cc0e465d2207b50ca4cde9c6fa9d31017da57b2307cf70340622794438dbc71f6f1bb78a8983b4b27b939750f3'
        '388812ff6b67d6c1b89b6dc4c15f781b25d58c2ecb696a604736c3f179985b67db82544dee70bc6307cc5e94aa528ed7d89d00cbc796e7dca34f8f8be1afc087'
        '686aa0a16fd6b0612cf0a12d90b8377a5047e2abe552ee316ea1b53fbaee76a443e1b020bad37ca947242364cc001b5f22514350b86f5b4d355dfbeedc0630cc'
        'dff972f308516bf8da5b2c038cc3bc1a2a75d2dcbe75b57e4b24715a167b1754cc45d9af7936a1d3ee10b8c8731d23b534c3063ea60ceb83931c0fc73ff01bc7'
        '2b66372c147ea5ab39233a728fac6ee06be751b678cc476aff01c4c70ff20c75368656499785f0e0492888c597da9d1948a2582d624213f24bdb774cb47e8521'
        '402b9480a7a67fbe761ab79c45d98518fa99e058a4a5995ed90d5a78935b754ee1fe584a311c6ad39125d98956dbd7f9da77dffd622bc282a42f9fc3df4849f5'
        '96fabfc2720ad382f945988b8632b90b1688b0b62a92b101f181baf4c491b11bde14cdb386a3eb234b4f2907bec282ca29729d588a124191dc1d0fb01b1d0da0'
        '5e0397d6dd7f3d0d977f04aff09717a265fad399e4a85fad94f2be8a9f4f176250c359c38e6ffb32d2aada9e95c3d9105cc37cff971be357b31029c4aedebc61'
        '81880cd8f04c58e122033a3203cc7f63c4775dd6c3e57faa35ec8fa7ca0893f8a6b829a39604c48c13ab4b6e0f1c8c2342659ff247d20687b39ad68676119f24'
        '943d9b6444ce20223cdcf1933c2c5c799769894ddc8f8712d6db749b028d754b9d7569ced7257390ba7d216adc89069b9db3a79e38e784b6070d2286cf52374f'
        '2ec719d630b1c845c1e9b03111eb725004438db548d8f7c76557bab4dfa87c6b2e292ba694bbd1d0e23de964f45cea1dbaee8465c8d5b1098ad90360e9320a70'
        'baacf7e497ebd2fb91668c83d8c962ef816bb9d3d812f83d4532ef61bff70681e1ef1dde8347729c34ddbfc147292bfb7bcc35823a34226d319a2c77e0b55534'
        'cfeaf8d9663df575d1af9132a5c5d1603918ca81469695e2f7e9a5cf6614144cb189c7bba1d242c15097c77490a41356824dec662e4e1046a7c5a2609136bc4d'
        'f31af323b972773f944958d0123ba2fe256dc5e51b7b0d5afc4e3dfe016603e33bfc49a0af2e62492e1cc6c4c3885277d90527c934980b409414b6897b656ffe'
        '41a167b4cc466fdc736bc76a4ec3bedb8592d46dab0010aa53374b8f1d4f2e785a17343c1f66ef1db264dd22c15c19b7056288f8c18f535c39de1e0466c98662'
        '71496de9d47d7bc00615a12bc2d2bc819a0acfa9ab1266af0ebc2212a4eaa9127d5d2d39782d79a09acf35992224198ad0e4d8b8c092f1d0f74e9044d239d6ee'
        '47137fe2fe41b5d560e0c5873dd707a9c46052da0250d43ba9b070d2cb1df9936eefce9b79b819ead5183eedd93542c1bbc552d91e62ddaf24f36cf0b980e943'
        '55e4aaf1ab5fad956f1ce4462843d0729b9a9be8bbfbcd772dc45feb78a62eea8756450032920b2b8ba3838909874b7c618550e9e788888c9d8415980087294d'
        'd373adf2258306a329021c4325e7b28585346e7077045e718187eee203bd4414b6d6c00acdf1b0e88519fc2acdf74b6b207bfda8d3f17b2b287fce6428740cab'
        '0df6d5d8aa48ebb8989d6fb9b7e762cc494b1da62d069863b08cebe4e5647cad3f007f68818208fb95b84b060c14537f20b25f9a508263a04e9a6f8e4a815dd8'
        '9cc35a4bc60f882e77d9e6d2836155ed9298a0ac335d9ecdb822261b9947e258213a4e9ef6f07cef2a1039731fd88080bcb3092d52220c8c6db766b13237f14d'
        '39e8480dfd20ff9352730c95e2a748fda35ed863a0f0f4fa880ddf5b658990e60a7d1206ab11a53792dd7242372c1562d669e9189b0b7e0d1a627ccc97174bbb'
        '50a2a52c1f21ef9ba1ece6f8529ad3e383cd5ffc4729140d12b7f90ac6ab0327804eea42b97be457408229b57b0d9be18a32bcc03edd1ac166822085815bff7d'
        'dc38945f3e36f36f31369d82515ac69b5ece47aadb5d948951ff793ed0dcf497345b6869e18e9c04f25df3deb964d73d17e76bd95a1be106a1ecf703f67eefa3'
        '497982dff7c355b37ed02a790e62dcd919ca2665ebb5d82e15834fabf635b752d2430d7d2629770c87327d1cb9f9df65ee7fe3e0841ba3e7c370ee96e14da264'
        '694b5258df0143ab787babf528650b3403eac75032bf3a3080a881d6034a6a7b2d4b2ca2c75f88401caa785de04ae66047e268d39f523e34ba9d442b010df3c4'
        '7ca851d453c873b29026e04c2780d9548d11c187e7387dffd5eb267256446597d6c7ce983416aeab7aebafdfd92d330cc11eb16a232fcd2132809c5b1de70e83'
        'c097005b91a5a708d217d8daa225865a47daa2935b438d3495b01096dc7aab7d2b4f310f7a5d630ebdbbcdc8872e3f7dd934b324e9cbc37b32e7ebd51043c1a2'
        'c3908426e0d00645c704aaa82f8d7ee5c9aa1b5885d8fa06a3b3cdfee2b0dc0986a9205fef5782678488767c23dfd20cb1287c323e0b8883d791c409ee001999'
        '2ad507adcb7f1f19485409baf89bb995aa0a3cc03d9816804b84119d84953bbf95d776911e2226de20647196eeb3dc55b09175d9f2b052b88b7446fa0a5e9e7b'
        '828c0d270fb058031f3c9e9eb51afdba05ea945ba51aef9198c0c9eeac1ef7e3bf1729600ea7fd87f5ebc260821f6e2c342d4105bd9ebe124341897ce79b51b8'
        'f8b3d257da080cedc124a536fe8a79a79aba2041e0291c197adafc2ae20bdbe1371078030dc1046b29127fa99af8a3740b0dcd6fdf44d7ab62eade99fae88f0f'
        'eb4493329a5d9f0069ef96ae0f4b90f3fe27ae4edb214a111c274ba12ae0d989e255b208177ca6087a1f1c8aa1d6185a6ec550dacc9d42d11767e2dd7867acf9'
        '39964fdf16ec6024c86527e219b350b71032916bd524469a1ae79c99bc4b0352c3e1ce0f061c0da592019805a2e3e85cc1b38943c0854514ad8d3ac0f38979d7'
        'ba9edebbdaf0baba401b8467e9d90739782dd6b6fed995340fe6d7f5113bede99bf2e7f4e7ad9ec14e62e62a34320b5eda61e9452ab5a0d42a3586b987628ab5'
        '60d03261051546e12e2dd42788e1a50ecafb781be139e2d4cadc6d8994563983642af6da0625a259b04527500798c9be89d20a6874315cd4a1495799be0ce09f'
        '87372a62821b8fb7243c7d824d83c2be58220f7def4fd394da9539c5c26c64b978f6ae11a4266baba296718cf8ac1f1d735e61e79b9dbb1b202974c496ab2b48'
        'c8437f154dc946a4e44c838b4c2a8a1d99c68d0c5e7dee18e043fa6f0d6ad23d32d8da4edbd432aff5fd311ab98117f6f21a49c751ee23f6cb1ce32db5093e5c'
        '29aa5e24df4df61553e9cbdedaf605cfcee40aaf8b6c3c328cd97f545e19f483c6c936224087e29ce019a736ddafd8981cba8d3eaa13a8f63e166c017d824fb9'
        '5f898c3d71c6ecb11c465d4b48b6c645e0b2a715a4f386d7eb8cbe7d3b00ea34a0f793eace674cc520466534a14803a957c78f32dff201314a179861efa16155'
        '5f85f3728d4d2dee54113945300efb5dfe9db42aebf35dd4373b2e6e7c88927c75b03a07ee955269ff6594d31f5a367048cb1ce319198d8e2888e79218316568'
        '91b05a93f08efdf1bedff86a46651624f881663c6c457f50b90dd11d0ba46bd484e64537582765a77c974c74bc1336c541b6e9f6892efed2cbbf0d708146bcb6'
        '51f896ae2b5a1c428d67b154cc73bcf58b4034bcc3d49af6dadbc2309b9809d7ea46aafe7b49f23b0d6157674a8b279b039ac97dfed3a40499540eabd6318737'
        'ac2817e6f496cd42705c037bad6f53b7fdfadcf5d8c4a4e3ec733a563e30254bcfa313f937bc0da2b18abddacb08fe63b08fce8d9769dfa7d032b06a76af3178'
        '4e193486b0b7f4954f70f1775d6690516a62d36d30d6f4ea4725dc8309a86785298a47e403690019e659b3eb9bde0d802d5eb359c5e617d07c0e43cc3fb17e2b'
        'a368053cda808b085cb0308cac1fafd6148c70a85dd567df358efb28beb0c6d77b7e0204e219599685eae48e1193664eeb685a1b081de1fed81ad72a2f01c10b'
        'fb780d6bd51500f49bc378ff2427bbc558465f1030f8f0f1e82e0d426f69598436f1ccd32ce1e0f675295fdc8cad462ae8c691a8c8aff6c4261cbacff573a6fd'
        '0b435a98887f7f70e339fa1b62cb9de6a1c4efc1f999681c80af93528b8aca229bc833fca0e0f13751760536d43cf7481e34f30b1dc0b9793c3a225f5695af19'
        'e16119980966742cd2ba01fcf780f10dcbf50d65ca49fc49286a3d3e4e1fce08b20f1fbd43f5dac0fbc774a550a838b87103e5c3efe7707deeadff2c3a45823b'
        '616b18369b285e3469b47f6202b9c7c482ddc3032b6443a681477dca85089d38d078499f9341275acad630df1debdc459fa2cf79a3e366a42a2cab3316cd6e38'
        '0ade075f983fa77ee562b2b0d311ede43b44eb6151ca162341f532f1cf0a1f7a88d993492b19aa33122636713ba15cab3da1d6e935b14c07a70a12d53d71b1fe')
