# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=136.0
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

b2sums=('483ad7f3eee209a7324581c62a91e29109fb3947d4967c276150bef20c72c371d7598da95284a09c0f7e7a3f41e94153a35f588b45aeb00be9f8dda47979e470'
        'SKIP'
        '0fda96bd10aae73f01d47b33a48ccf16c678bbcfec98e679792d55428df54d1b43f5cf9c2c1f61fc1f427f0b965b3c7979626287e6b380bcbb83f3f84148034b'
        '863db129ce37d85769615d882b83a3c4f1763a9c610f9b2d13e81d9583b06faa2b49e585517bfee7199098adecd2f4bf2da00be0c352e9f8aa96c92f23628973'
        'f0c0adbb05292f85bcd05df172c7d3fe31161f7a1fafdaf8afe02791c79f1f7b45464a8fd8f1d464094a1ab2e19ef24a8dc5e73536618865ecec809c2d20f9ac'
        '9fd71b89609b0c371140b4063219fac86f795d4c465291b809e3645a26c03ad7c920fd64fbec6b5aedb20b16cec555b672e3ba4213c510df69f4e63e0448d785'
        '47603cf9e093e37459ca58d775a0e4cbcbf08e5b3acda9bab78de47172ff5397ccf5bc58b1d9680eececf94ccbd29b2c83d569ede1c32e5b8877ea01c0eb4437'
        'bdeb51de0e9c92e0780b57bfadc3a6e6f20b6d0a0be5e16577bd5aa6cee17955f0e9bfdc83025afee198e15bfffbb67b53f9a20d1eed0964a05ff3bd1b78a045'
        'cd94b7d0e4abf465f2eb47e8d16abf78c199140b25c333d33f98f241d4ac2a7d1d8cf0a24c842e9b3da0c953e1778a7690a12ec309dfb89ee65b6ce7b2aa26a3'
        'fd147851b277a23d51ba8cd4bda64bc3bed9189f92be414192f99b3f6dcd831fdf1714182de603e9bdaf2051fbaa1043d42ef7dffb27953cd11558ae16330633'
        'b2a7f0bf78f3f9ba7956c96580b0f325ffc19847c1c074ceafdeb61167b57732e99fca474b946abe0d99c70249bfc3d5b88aee876aae79745704257bea696cd7'
        '5b0aee632c04f0a869c342a37c64af60e3d0af96ed4c4cbb8eab6902d388d88974fbb5bdd28b3c00a23e701834d425fe28fd2f8666a87535f4ae751a9f8163f3'
        '42e05111614233aeeba82567f82b37baedebc6ef378e485a51466e664679b9d71577083eae75d038457c667514638d998779b0ae767191c661f5455c5ce08e4b'
        '6d1862a6d91398756aebe745732eea47261aaa6e6da68197242f5a668a39930ac636c5db083f184417e8176a192f9c656763642d165bb02a8ed14c7a098654cc'
        '38cdccef670a76f435d7619566ff1b3915c2ee4afc15864d98663e3730b587db9eb698dfbbd016441b91a96b2638166ddb041966c561e13752ffbc3e255cb3fe'
        '2883828b0c88ee55e64732b75dbfb1642a28e3e5be3737d043dca7dbe150c17d6aefbcac72923fbcb1a1f06f74a551b425db7838dff8a83c8863996612ef6b07'
        '98545cff3dfef6a39e622ea4d97241d0bdba33220f8e3a6aae6db80046f40a494ee1843d74d5e55c6f06081d86974158141492dbf2bc6f552b5c54a55bb66cb8'
        'ceb467ca39486ef40b84f389abd88485260748ab7f0667edb7973a4105c0bfb4b2cebe8548577fdd801d457988b8c903e9c2600a51f5af8349f627fba91dab8b'
        '12f7d607b1349d74d772ec98f0a30e3a825606a2141b92b5ea2c2ab83b07dace151ecacf161bf634f72bc7eb521597fb803340ad36afa6e9b3b089ecaf2ed338'
        '31c7cdc11702360a53cc92f6c60339dcbef5c6a2d2f8f42f5b517c24ac4c60bcc71c38126ccbc27e0deb898dd8f56d30a0364be979028da9ff55680ed324cc0f'
        '49fb910ac7f741d034d8590617cc746b3157fbab02ff3095d6e0702598c234e42cb94d16c6dd352cb6ba9fb15a3caabb3a35f2b6e1ef1ac15a78ce4d08f8d5b4'
        '3c032f65e8b3c271d337b0066a333400ac14b9818f7f7b15f696a1a36ab406f23e0658ed3ea26e00b27a6c014bd44c7da6f6c0e8789f3dd4ad7022a074ad7a33'
        'aa8420ef2782f02bd50d88985c975e81ca6b4f27a2f5f7c5c325911f14b4b7211cec751338b2b6a6f643e4c8a41ce9def41965d2b15c5b9dce7d9da86e28fe43'
        '9646c9a4399788c491be2e56c1c1aaf335f2e3a891e82958f32fe1528e5391b31cd5a3d766e1c91228b8eb59414b5f2db7b10f04344760f6c0d75642a73f8111'
        '07793504d846588fe6e53f1073df72ddd796d0b914d3fdc45bfe70e0e117728cf413427d49787f1f697e9be5cc47a85d49584c1d0c5bb1f490f2585e86eb06cd'
        '566ea60090f630cb74114b7b08d2d30617066d176fa45e37254e8ef854f921ef7d1bb96916256007cd1ce922f03245f2fbcd8b3977482e377bf40ab743e2c31d'
        '1718258351fcc537af3a4a2d5edbae5143a2a5f00d78c2ff9abf090a92ed6d7739f5a0765cb6050a472a841a61dfd24b58660c95467abc141e2807f829c64994'
        '710f55cc2852177f63b842eb936036d7835f55697032e16b81563ceb24812db35017ff0bbad8bc2e9b66e1b3650ff8c2e01aba7c468327bb17a054f0fdfc3187'
        '137274aa951aa6fc749ebd0275ce498dd11856678addcb7bd518e22f4765631a3ade688922214dbd3ad4a39dde437f10fc84f8f2d747a3d297f6a665a4fda3a5'
        '2a67c7e57aef2e7654d256384dfaf3937cab0715f3838dda7a2c21074538e4e383e85ea50b725caec82e5b2568e23d54251327cf8af9733dc5ffccb81033928a'
        '6c85398ebf54ecd025e7dc17e045f2d6dd77b380bbac1a72dd2678ed856405ab8bd36cf59b28ec885b2692f8cc093efc15cb2db526841e9a49043af9462cdc5a'
        'c1659ffe3ee85a7284786ccf34da0179ff34d0ed08093f7306cfc03bdc7d283c5bebca64de59b96c225a6be86f0232ce45a56d1e415a8de7407d991f8e81a460'
        '6bb2c83a69761558f62d64630ceb08367dc898f69b778b1fbe90167d690da1dc7fce7ce21181e708cf94e5e8a4c64da6313a108cbfd4f57bc0234ee22aa30947'
        'e81c9a3625a77c36806b64e3a91339f0a407b577352317661fbd8330a67b5a626e3aeb5dfbf41ff73b79b14137bd846c88ffcadfabc3a8b21f0a41b3b33c22af'
        '4f31a6ec02f07ee4072f814d65d209861b3bd08ff5d31919b3df051c7837a0444f6ae21c15fe50f7aa82991dec1a0a8cf0642ea6d006163a9cf8fae53305d037'
        'edac56c922b4eb2eb3fb516e5031c91153b21b67387d145cc7a8c25012c135464f8e0f43087404ce95ba6df97e1387b82de49e960368324157a73365c2425eea'
        '5298048cd0bf5ea594038b4f75b33bea7cc8bea72449a345105eaff3dd278748afb2d8c1445e41334e496bd225de445a60c84bdc8bd36cab7c20eb5b79c4568b'
        'e82f824905e10e73c37953d3efd8fd9b81bfeef304afcf0c484f02f8a419c2d0c06dfbd0a3303f22a434d4950fd990a3059ba7b2298de069a5d1b996cf2d6cef'
        'e1658870113c9b87bac37e9c5c00bbb01b3bbcbad6ae1db46def3abc9b1282a754c286782ce54885dfd53687b981f91008c0576cb2461195cc403ec42fa372ff'
        '1938ca49fa7d46d2930c241e2249e5fb516976f28f0336c0214ee04e1120a09c49d63bd8a022ed922eeff9332f72af1914270f3ac77c9c5cc92d912b14ebb601'
        '4c44128e5f21b2f33945aeac52ebd0ea94a01fed24c39b7ec1ed2d34563a493cf5b37b898f580710da1f7d9b163ac7090882484929eebd5c8fde7a9010fa0087'
        'b45930be545bd092157419043a8a39b91a89c469b9c851ea584cb8dc8d2290fb6d0b9595be29a471686bf0e83f5f78679034fe03429c4545900dfc3b004450fd'
        'bb7fafa345a985de18d605c83863e47cbd917536a5f9c0b8514e7b1f734056314a2f973709c413291ef63e179201811ddc5bef3e4596d2064ad60a43e17a3837'
        '006b938e80fa7e566041d4aae352e48f95ed0d83bc2930a46fe0d571f58680efcfce5c0b7d9233d7485f69e5714f28848a03a95044ed813b4918e6a9db9d32d9'
        'ad821579e3792ba46a6e83eecd95e8760f45423daa18712abfc02b5b7cd12fba6794524064da8f1db9b1a28974fee0573a66711e26fe1c3e8e42c95ca222c15f'
        'b33b43cb162b0739a6fc92098dea8c295527d965610b36ff4a7fe6f6c60d9146717a3bfd78cb8e26a4789b871f76093a79a4abcd39a5e8c034eeb1e96f95c0d2'
        '0c7bffd5eb18d1d40373e988c0ef97594efdefbdc80e3b3a36aac06cc401c4b497252c413f1a796e3fd11c1335e1f755aaa36f9f98b09fd8287049621941fffa'
        'cb3c84ee66db5b3917d3033617a3ddc9cca4842112f0670c2dbc6297d96c17ca06cd36af5774c9b108c00cf24f0c1d36dd02bfb0722488f34caf00d16e993f71'
        'c25f107e9eaa18bec7065d6ab3c7a7db88696e45062c0b2e0f5dba9cd763b38e355080b9c44a5685f5e471fc22959608f60acb6b9bc3a850aab7a87b7dce9262'
        '969540911918ccf969114d194cd562c95b5cde476f753ae68182c63a91bbc94285dbee896b3f1a73cb2efa477d2b51fe557bf029ce8146495a66b3adbe266b42'
        'c1523c1b65745e2aa8c5513c73e729c17598f53edf75b22e6380664dc7482391ecb21ce266b8ad06fd3988b06e0cd2e1ade03f7515c97ba89077f65bafbb2f1f'
        'd8f3e5656ba34156b52976f8a097424da172b1d25d5422b07ad976e4dcf0e9651b5da5b83438f367bcdbb977048f302a0bedca102b3838d17dc678a0e0e20419'
        '9e6088f8a9bbac3e432140999b2a408c6225294715ee7d67bcc8a9b110add6285dde861ae34ca1cb210f51bf9a16e3747398bb6e148dff9c3aa5ab0f09ec9d0e'
        'dd0490a64127d6f9494f58182cc715f7407c321bb21ee284c662d83dc3dc032dee5afbf68c2f5deed85e6e9b75b94ac861d2532fbd76835d83394a774daf22ee'
        '32f1fda4d9a539244cd3c69f235e81d069cef27d4d2c75ef7cc9e4a728f0f06f5ff1ec0d1b932f378d0a23e31d85408f9db6a643ead0fc5068c2b5d777bb633d'
        'eb9a6032693cb6220322e2f8767dd35b15895a0a82b1efc71e62ed384f25f2865a21dafebf172dd3fe87173665203cbd6cc40833a7177c096c8edc1d1c053c4a'
        'dc51fff935a23931033fd30f816031f2e9b1f8bed2a265101935068e4db2ffcf26b4a445d3c8aa8e56ee81169f6e9b2f253c02625ab993c3552ad0e21675a38e'
        '48d261c6c5bd298e1cfd3b44e1105d7be693a28367091a04f9d959e7cfe3473c3800de064dbbd322d8cce1a4e6bf09309aee1e2eeedc74477ff31cd5eb794803'
        'c12bbc1d7159088d04cefd1e27e4b7157941db2cd5d677c4c7c75b18b4227668d34ea8f810d65a2e7c48cfdbd0eb7062b9066b142beba4d428e8ee080e99aff1'
        '410f8d3d0e7b75e3bf4c5d1e515f246bfd8e89e9d7e227be1d8193bdcd033450f4ffa939420abd269e051ae978d433131ea560e0871394926e0467e75f8dc8c1'
        'bb6ad00bb731b926a3fca9ed1ccbabb7efd24210bac75f38810bcb36a7f676403cf0f63346ff9b55fe1444546ff335616e501989138139656d58b6a8c41482af'
        '6908d26e52f541c51c7c62c7eb689c1cf1109df4b51e1489b549233dda6168dc2bdfca57540e52e8d479dfbd9da9a88201eed68315984fdb95ad35c3c9f144d4'
        '0b19333ef1e973b877f005f91ab7a1ab270b18071fb7bc5fb3672ceb0c7f7f3276dbb124af44f70425e32d2d84140a2c16255285bd48710e2f27ecfbde627532'
        '24b6c9df0410de521e7a2d6fe853e918fb94c198d49635931c63e4a299b31d0c56557828800563fbd2ba6e40cfce63a2988c64229bebfd58b39b1d0b68be3bb2'
        'f23d0925b2814a6fbd61ead36751ffbe2e917733b96061d93cc2e3d9fce82475741dba952517ffd0200cf9b6fd6a405c6862ff16c7bb5f002efb6e2a694361f7'
        '3d8dea11b1daf2363dbf8b9f97c6939f9b17ba443b97d6cc5428593840435d564484d85b6d22a96829f3bd4dd63fe5305828a033e492d799e4407aa27a72b686'
        'b197a94d2ac58cb167e241e0462641224336106c22c1b510b1f0642de606fd1624a808e56b24345af251b295ff6f42633a8566aefe8186cb21a783f659607d9b'
        '61099b7a4038b1d99eaa3c2c0b47a990edd11848bb94443148b92ee9397df70d920e456508d1b9370689cbed11c1db06f3c4bcf5ebb094a98cd5a5d35919a377'
        'aa647bcf423f75091dbababc8c4a5adda5717967ead3aaa9aa44a8a6eac490d6e6f3070faac233325471b1ca5fe9732da1cd8257f1596faf278f867fd3539229'
        '5ad55daa44b14937f62131e199c718a3aaecb5a43967ea8c3b453941dd7427200f94cce3509f23711a46dfb829135d33fabd9e1fc11cb6933003767043fd3e5f'
        '8999d5cacfa0a21dd0b66b51a95afac1025eba88e1ec55ff8e6c76f4a78123d04ca78a76bc0057b7b2d09cf44f740471f972cd3a2c9165e8783fdd9a4b1ed876'
        'f78288717da8792918acde0a07713a4e38bd8421e129882e4f7dd74f32b4ec9df9d00a5972051deadc8365281aa620c06d46d0a3b35eb8d840f1bb3923869a40'
        'd6eaf8b3e929b611c6baa84b52115dc80668a6e8e44fccfc2d863f17a42b72494e4d218a8bab1693e255bb77dc66cf4d4a725ee925a43c524443d83cc571f84e'
        '8cac1e8ae62fdcdce0839eb9dc161e9eac9e6cd2028adf7bb0becc5b296a1a8ed8853c8a65e0988b432ba0c35962caf44fec9a32c2437f6c13a02986c3536604'
        '6c4186b3d9791ea2fcf753401f4fb192adf87c784e143b103526ee6423a07bcc2f883f8200007564e081f7f653bdaec126e46c1804dfb6cde7baa9034c1e0d38'
        '7f53cb5582d713bf0f38e6a99b2be57865fb14269f1257cf346d85a30550220f33e9ef3bbed219d6ba807ccd16c1f764ea217dd0ba0dc5e8f3cb6093106df3cc'
        '69e2fdf6d8c31e1ec5e35b6515a54a41c47fcd5b85c50327530d5e946bf04989a790888169f8f2cc733e057cfb8d20599ea81b9a41f3fbcbca8f0bbedfbe60af'
        '065751dd554cacd96fb35bb41d86274d59ef14b5c13e221b6b2f9a44dc866e6f37acf7f7d3f425aec974b2371252b29545c6cab7fe61369bd64161a92ebba955'
        '9ea359d1c3c3a1f52ba015c8875cf88cfce66cb818cdc36896bf0f4ee07309eadf37e5967d6d542d6e9dde2cf097f0d38d774f949499662b629c970eb4ac9231'
        'cd55175aab530da8f538b19f97a5fd74982217903dfe358016c5c460a8e6bc9b6ecc0f105e58b6d07c616ad18ef6598d355cc12f525ffe5423ea283095a4c2e5'
        '7251595e550d865646eb68e9859dc00b341e7a00cc7980395547606eabb9d72e49222103678d022aa58b01ea482d0a0cc00cc1826936ad7e7a56ee8b2423e798'
        '72fc99fb43f7ca8db28284f687488886b3f5b76386aa79c1585793297cf409c0c0453486ed105d078a9abde33bb8e9f2abe7fd1b4ac6de176e41dd9da2d4eddd'
        'bed111a876ee33a9aff8da1c30242c8cc3e12912d75c031f195641b70178ecbdcc674ac4b1320112f89d3eec9b79d14062bcf52a5a0c46075a8060b902a4bb6a'
        'a7d5aea1828fb9996aa528bb0b56a1527db95d129a81dd025874d2e69d43b71cb30bab86912a0452633c52c4dd4a93d11e7ce9b53a1f7a868a3ad59292e6a7ff'
        '9ba7a83105ed70163d3c791518833d4b9a8680f98e227875de2d9090f574d0e191f8c1c07748223314cf9d920166bbdaffd4fc3d441b0fe2654ce54a93ba75e2'
        'e20f9541ae5f249a2bd9371fc3c08e1c0cfd6d69cbe393feb408ac7865baf34c7e03096cdc48b74e8e38e517a3bcab7fce82c0560a0f0787018005afd5a83b22'
        'caa3d19fe8e1176f4efdbe1dbeea0b192f25014d6fc5a83c598e9871811c5f6212aa06a131e98956a3d8156280187da6ef638a065374083b26c2cfbcbcab9806'
        '8ba19d3935dc85fd6d84539a6fcd8e2105be6b8d3b23a9403940c9485e9e71d6cd7d6f62eb1f602322cb299b43ee2bfdee0a0acda9c8dce641353eefa1109c98'
        '890cace6fd48fdcabfafa5876ad42c4e04260733e5dd4bdacfbeade549822129d024ee7227e63707e7f60d71f18be1fbf40cdcdff9bcf77f9eabb54e924a3ea8'
        '42a9c591967abe16cc070db19390d44f0fd277de4f86e02c31bfcc9ffe51a2714acaf96243d258d3d6a811d9be68ebce91c41dfb8f7bd1ea986b2081e5857c2c'
        '164952698b365c8bb85367fbc46fabcb5d528ca64a27c4f436682188536d684cf7810748d3181d74f454e45e9c86d888297b03f89e1d8c102042b56fda36a138'
        '183ec42483bd7346eafd8ae74c6b8749de97e973623244feeb1f445d66f2e497f8707b9058ba144d7293e840567b24e39d2b78578f416818941a17be1321cd00'
        '11df17668e3915be13db59647e94eecca0049b9b418babb3c97c960059f7c49850546e0e865f80a62c706d9db736d5cd403404d9d3b9aa135c9937f401763835'
        '7401de2ce02ea3624d9a75dfa95317f24bd4013efae4ab512707b54c201676107595f5759026fe6ccc07652c5393a4dbe9de08364fef4ecd3493dbd863acb620'
        '5ae3066449b8455b0258295e98e77c7e93096437ebe16f3509bbcc4f78b9d76f26785edf372a4046d6792a21ab65dbbd46eb2c29ac780aaf4f7f672be0415838'
        '7d5fe613a9f02d309bc200bd97f0e9634310600f93fb182bfa8ffa39efa2355815a1fee01b3a016e0e6e49be9c07d17a55d4871a99044a00b91b5b5709aed3d4'
        '5af3d410bfa03c353b1a4a8acbc8534f07b5f68f44c66e6785d3f8f3aff9f0113b534b07bee7ce19668910f725416482f4797d8349b26e1113e4381d494fa810'
        'f43fabdafbf8b5cbeaf47cc28b55945b0289157e3744411d498038bbd3aca872aa6527cc6844a804351c4eb5522d8c9aaed6dba3e4f3652e57c4ef166516f356'
        '1ebf50de4621451dac2f991ede68b895c4356dbda41e4baec0295dc610da808d39165e59a96d68ebb6270690b141c5675256c6556818c4b01a566fec6f8cbaec'
        '6d79a1cd2a38f1a409cb5060cea86270c2b62f5ec255a93a6f0ead9ddf7bb4baf140ab715c982c748e5acbcdeae87bef60e858f8b329efa3c122f99826f17ab2'
        '7da1080018a8244cd59a33cffccec8e777757c7bfa9ee4f5ea4ecfa25d1b11d645792e4fab1fd59d6d422e88b57c80e280790cabf0dcb075e7d5270ca892bff5'
        'a6cf4482db5c4de4287dcfd588deab08d318df43eefba780ac3b641488e2bb658bd860cc6e808499fa89e19c0e0ffba9a81e44b36ac4f333b03d5b3b17dd20fa'
        '84b39837494eb27e02c1218d571a42bc36cc0b8a5ad638a066d3df2da745361c77edf7207402a924dcfdcb4d55980782b8cef3257a90ddb9236670102c6d4b51'
        'a42369fd948e6b1a2eda3cb26e7ded75369b15fb75c5ed9e6ffb0479bdb6f684fb76d791dd29bc558023d7a696c09938dc04ccf6344391a30f48a8278d8961ba'
        '5c2714f86e81806d8dc8dcd5f4d874a0dda090213d8ccbc621492cb9f48b1b35fcabe7eb88b7d4468b54863a1b0e3ae00d2125d09b748d11c8f4a3b10ebbc890')
