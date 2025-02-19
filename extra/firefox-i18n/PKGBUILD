# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=135.0.1
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

b2sums=('a8275554d7e28a912677d48817ac1c777e445a2e4a199ff95b26acc22ca6162fd7f27c3585dbd8a901bd64ec5403f05e86e80e16dc41b75994b5abfc991e8f1a'
        'SKIP'
        '9266683415b54a5111841e2e1ee3d7806cecccbc0d18a81a6e28096d12837d562d86a74bb9a586c5f8d053109b4dafbf3607c7a86eaccb26a880f4160de9af5e'
        '58f1dd6c9351dbecea9738edba9f7fb9c686c919d09bb2d1f94e94d8404e26966c22c898131652766a81d628a510e82693c4fc06c4fc3a19339fa45ec138695a'
        'e6c9c1092a10568fe000bdf7cee6f5fea8151c7a61fa0471a799b75b1b89fcfa6b7b80a448b7b5554d867d55787ce2ca4e608a8d91bcc00cd454eee3a73fc668'
        '0a3d72ba3d91cc7f5b43ab8123f59fc86acbd59c545e2f72661a21fc5c6590cba47398630d652bc387102416ee6ff735ac95ae34685be31bd19f70b01bf0e8c9'
        '460177284538b48615a99b6b3b0dd56eb03600859b54a61d5cff2cfec675d57339e410567293c19e52d2269cc22cf66fb6db7d0bac9fdd6355b5bd5ff41cdc10'
        '8a03d36d7cbf4c4ad230b69bc8cddd67e3ef6b177e26f0c231bf14e29d8d94c15e1c877ff223c5a7a3f4b9f49ce878df34cf615706ef73f2d96e7faab1d6c1f2'
        'ff114ac03e2be2fb2a149aa6c307e23a4e39e0a64c40783d7c583b21e966b53a3681c2ac150a83519b225cc4db9117897ddd4497019a1d2043192b7c99782bb5'
        'b688402d2a4a600da7c7a2aa4f5ea642b76633ee48dffef27c7e26ffce150692c5fa48461fe2a76def89c942f2b7a18fee1f619d37964925cf82e53136dcb80d'
        '00b31caebe399b29cb4dd280db466ae693d6e82f4c2b9c353286d789cbeab9da510292e1fc143132160f539d1abbec28ef6e0de18dd1a4e7b5f3ad7b94c1e352'
        'ecb27ca8599a49eebcb6d32d2f3cc69142f6c9ed35cc5d8dd3ff88968998b7e57c40c9d24bd56b3eb99d30efc50addcc060ebe95bf67bf0f2d56e5deef0ff430'
        '32c7d57cc3e3b0e6faee5bbf820de17175783662f5bda22bd262dbe9d4c0c7ff22f7576befde51524c8079d109cda105cfebbc8410bbbd0b9b363ab44bff4785'
        '5aa9767b87b889d0fb5e0495e5e792538de95590e0e1fa003865b1b2996cdd76f60e2c2d3e91a81afd75afd4c2d91e9f32304dc2e91e2e5c2bb20cea2ffb992f'
        '9037f81892f6c2ea9a0f92065d73a753a4f3199b4e8487a133f57f825e92089716dfc5ba6a4688d18e371fd4c8156751d18e050022156c8f336748193762a1ce'
        '092cd57e297ab8f5604ea5f1fdfc8a5ac695a8f9c9f4452845f63155085bee2e2cfd3d5e0b2ec07793c0f15c864e36ea3f81fc4c02b9ffe38a2f29234c427856'
        '14e92a3bdc5fcb3eecd38b6cec5dbc5b990fb4a219752705e7cb42e64dc383f9e78f608471e2140e53f1d70e943f9e3be2d2860a52163415ad851a6afd5d2b98'
        'ff2ffe47894657fb8ca1b4fbe0bf3da5fbda85a13e24a62ea7286ddff0f63ad19aba473ffc98a0901475a94b3b74017e7f296f92985ca1a9bfe1b58b0d1be025'
        '1a58716ee9bb5be47beb8326d4e1727afba33b576243109f1fc52c9223438058c21da2d2c8015d453e113885653d88597b2dc0747464d78b0ef87fcc7942c0b9'
        '7fdc258b87c6748360da15dfa8c0f7e68e7c1b3944f3a416cd90c6e5faf1cf34dada37286f7822ef70b48a0821b573f25284ee324771fb2b98a848e37647a5eb'
        'f2dd2b7f96609cfb31d84a6553857c2c3d78109a0986ee59cd140cd8125110c93285e0d1a4dfa5930e1a2f2f292a2da2a99893ce02a71b4e9f3f6970dae3e712'
        'e98d15c3944e9c5db3ec346ab75abee39f8841144c5b444873c6d582e3e6421952408393c2097d0e0f75b3b3d863bf301ea854e06ff3dcebcf5ed543fbfac24b'
        '0ac36eeba4bb46dd5a69009f6c7384d7f2c6ae42fb6ac09cd59e940c1646756fcfea57ac224007ad144a8b556f3b40a372be5fbf4df3dd0f37f038c71514e4e2'
        '6f757870cc30b5ee97dc5510b09098b9df8729a426233d78c1cc69bfc0d8a708034ba63c6d579033fc6efb8bfad5bcb980de29f1da74ac4034154b01ca2057de'
        'b7dd9d125595c6b73bc1cdddd6998eefbe02be85ff472dabf5c52afec79f94e9e6db609a0d42e03ee0f13723a53563bef17b2c2c26f41de087c00a3143fe20f6'
        '1c73a84b44f57aa25ed2b0bb50a6aa78770728d0bbeccb0b88ba6af46bec41f20c1f3999988101bb07b627b6121cf7ccc62ee4dbfb7eb3855e91f96b2e31512b'
        '70d60a45c271f07b7b8c34e28b85e3e1601a8c906200f03e0ae560014de174dd6b39bdb68a7971f1363404395621e83c45abc32c2c87b71c304efe95a647b4d3'
        '777257309922a275a8060ce4afe0d2f7cd7f5514eb2a49a970c212aa3c1738322d43459206705279fd5bc49df360abd50db42a03d33b7140547437bea164d4f6'
        'a0e2d1b1d10503f15bb0d124b4efea91bdb8abf7f3d80679a75bc2c920428dfe97748a140533e9a2bd28659df8567491a3656de2083be5eb2d5785e9855263df'
        'd49ee5b9a5450917653968a286a51d1597050f006b4c30bc4e56d6e3d37928386bb823d4527d81edddd97450ac07ff1ddb96bf20648e9ab1a009331d2a46c72b'
        '15fafd5a270ca61cafcb7047ee1405372199a0bd2f2c29b391276bf7d9d658c54b60a60c1be4921b07a611e39dfb717872a271e99b8a001dac96e6c1b6e3dee8'
        '0f8e0fe544583d5d978c850c996e767001ade4799c8929dcaa47aaf4695fa6d4eef1c31ae3bddc8dd55cdc0ef74c54831fa1e7628a93d7b9535574e3c3ea2a39'
        '2fdaae28aa78d7e2f6988e3bb379c6706e42fc848474567fa0cbd92b41c97d818e90558dcfedafcb84c6fac3c265e14a2440e0d02c97325c7b3d6907b8215589'
        '84b015aeafecf3bb2eabff7a15f41af22a05220ebbc7907432bb0fb9ac6bea135308f6af1da7e925115c5c091ca19fcd3c6da7aea26bc5f0782f585ca5834826'
        '9a3cc6dd45632983dcdb423aaaf8c804c8de874f8f64925e3d8f60998bcdc079c4777a83e1a810c951e0725a666a22e20fa2e34ec45bff39e2f16d9da7a05ccd'
        '27fbb222b3d7b0ad625b75e2ddbaea66ef71df35dc743aac0117839098612c4cfed58b0869787af59c8bcadef8539b71697b343da8842a63455443a78b5c81bf'
        '0da6b7e3e37c4ed48b68a59884b0b4cd8346c79cc6405de443a080713aec906c7e15d84eb7b6d88829ae74919b7f499f0ab46149aa1a2fd5d11b9aee18642014'
        '3e0e3c5ffb2439cb1a617b8b65c75ca4763a7332122c13867e8072a1d22c171fcede6a77246e1b44e0e24f9db5d6a0bf4ac99472ca66e0fcc4f136f4c922dd57'
        'bb56defe64d6d9c5e2157409936202221fb2f196f6271d554b02db0c761e91b2c101eadade42e0496c1c32bf1e30688a832c1924b4ecd295eaa5f45f589e2554'
        '586f8901f2af14682425cb3ec608e9cba10bc64874172eb0e8c4da5ca030546c71ab8d80dada521e346c7487cd5aff284c689a131ca071f60be52d7b5b689471'
        'd144b68c1c35efca8d790ee6ea9f6d3a49f5848a7b237dcf69e2a89c096b619b29429feb6f017780f74d784ed093e45e32d75d444edb8e99c061e5a4a3434843'
        '0d8a2c70b8013b93bc59f724758f56952b000410474b325c372c5536912efdf86b93920c1106bfa9ea31f691304f6a2e95acaa7be3e6e149b3719bf59104f363'
        '5eb316e45df8f2536a9e42c204434488bb593517c6fec22f559b474ab0b8300c0dd549d091366c39b289c9436eea7de2a575532c9baa88d8cbc66caadf44bed9'
        'fb4c83fa9bf79dbb5f2f16a3dc53a68c1eb063d2c6de7ef26c05e461d5339137840418f38fffb15b78929fd799ecf9b2414799fb640b8bce4a4bfcedf3350eb2'
        'eb58499c10c9363eb819d461d1e902c2091158a2656be57f324318964c6dff8e632edfa6a1c6cb3527ba2699862e8970453f592877a8efef52ea43393cfcbca0'
        'b27786d3a0b31590d6ceb263a3d6c2a3b704fa2b6d34747c18e62aeeef94eb8ae164d0abe64ea34af47c445baaac3e32d64e07d7054d1de33681122832146e1b'
        'd52ca5d3fdb397b2ee0bd8885063d0d4885d7a518f4158514adf8830945c1b6d233958dd51db0010a95c521ef45e8d0bb780476d4007ac4869def8a59ec3e257'
        '34cb4e1ac7c32aeae5720948b4c2621cd31e2ab8181c9f4e60a248c5f91a0535633279eccc617998f1cae21d0680efa7ed73fa03c6cbe25d2ef2f32539f0d536'
        '25bab7d2b64380d8ed901197147cb10ddcd489022460c6d49971724be91144619b3e052f3f9d60f5f03caa9c7d06fd05a4d20238a7558384a83fcda0d142f383'
        '333200f54d8a7f61c8ac38b9de93bb94dc4aab046a9f7693631a61c6dd5907018d303d5c8334e8213d0a5d72c7f086240a7afc2c0bac26f481dfdfecc04cc24d'
        '6265bcd560b1c4a603414924c490a89c7dab14be59b8f43b26dd1859c0e726ed42ee45b114db61a0514af4520242192c7c94d018495be89c1c26c221835acf3f'
        '03b308590d8a6f4adcd918402996e28945c73f6632693c557f449e990894b9d7b84605974fce122b5ad47152ce9b5ed2216f20a9ed602443d49b316e1f96258d'
        '3e7810e42e6ffed790a05f9583f542155e7d23aeccf883d4cf28661e305698b9b16c75a5991c2ce5772b85c9f222fef10b43ec37b4c111de6e61aaac418e8ebe'
        '26c2e5e06b95226d20069f215a19a109e5d80e1df680d3b7cf2e990ebd970fa445207c9ed60dfdf48ab5e8ad51cd47b60e2970b74a84d577931a9a12d7ac2149'
        '51d6757f2a6b15452023ad2a50ecc03ef459ee296993102d75dd16320f8f225f879ad6d6c4953320f33bc8eb023d879701fd1249a60b238a95fa18dfbf1611e9'
        'b96c1eb1b95f7425f5d7107405a526ad0b5e4d92a512616ebeab5931dfb7fa4a35a3299a198c4f1d1db70e3937d6f20d157a3df07673812f5aca7a9cc0abbb70'
        'e7a908a5541ce16ce723d6059136605ab49bf820e2699cb6ca868091b6bdc9c372f0b170036fe23afff56cb0ffaabfe42e34376d81e3185ce73ea7a6c3df7226'
        'a470a7b0764ee50ed672aaaee6bd8dffd197be5ad4872a031a97c6971244607e5a0a48c108915588480e9c142add17f57b1054a9214bcbbd2865c8986e292ba0'
        '85b66adc4fbc29917e28672e16ca16ca2f8133284302e04b367d10cca1af87d7a6f49fd37cd8c58439b4a477213c7bb13dd17b1f60d2802f40ed88520a0d7d8c'
        '23c8d4ee921e803c0fc2463e8ac26564df733603b07b0ef2539fed68b990a0b31d2732f3ce606cd50bf7faef500a1118d64d97b6ae967640978c86b8c141c852'
        'dd35e6b10c04fe2a4bb31f2a4a239d3b2bcc181760833b7b74d8870da44167115f991b29f145737575606fad6234dfbbca456d667c15b3b817d158166b2ee8f6'
        'bf75958d89d9f4f2527471b72bb114597bce00712556b441491e68ec196bdcd176177de70f7382de19010e6de3aac716dc023f2afd6fc4e065ab1424d32943be'
        '66b64e9d0129bcbd50080746ec58ea93a44d31c8052d15da7ef6bfcee9b6afb003b35548063f8a8921761191389ea791b036308dd13306c8085d8b8b3927ee75'
        'f41663c68d2d54747f788c763d9cbb91017d0a996845d34f0fca77dbbc9bd0833ee72236ab4b1c12b116c3ab246ba096ef7891f16bd764b40671d8b7436cbd98'
        '289061c3958eaaa5c8f42856156a2bc04d61c54b4cecef2d9f57a5c562f24ebb35b591e3762cc2a3fa712b84aa7fa5453d738a8fbd4c8d484b1e02c3d4a3448e'
        'c519b169235d8a4e4789d074b1fd7a62f650b98146d68097cf747f71c36a3da566bc9827e79c4547df9bca7a9d07bcb1e7d131d11d23b2877930460c4c31fa4d'
        'd0e81bf98c516d4962c3d4301bcb94d48a0fe950178d8f3e16324255e19ace60c5a2273558d85d58710496fcff486729fb4cc4e0553b0d62b7a6488d625519d3'
        '3a9e84d08767131b41b344d4e25cd070ff9a30c7147abe26675c3782f3c427301822be57e933ed15f58bf964e01f839609852b2333337819afe9bc08a4ac2356'
        '83406798e6487b270d83f8b500df7f9da43afcd618494b7ca9cbd4744c0f8eed1cd49ff424dde60f7ee2cad308b3ff1e7766f220505fb933b5dacfda71d2ca35'
        '867929b67b4b3981f6f7b9ea316e3e7d3f980bad4334e197420d71d067ba2abf56041f70dab4b650a2201962f8ca3d589b98c1595a5629060eee7637010fa242'
        '6d6d2895d26857187e54c23d7d548bf2289c9e7a1f9d2d3b8af3310f93eb110995e0e2090617fdebcb679639b774f60ade52db6c8370c93b84316802839cf37a'
        'b61a537b95881dc45213f13124994a53fe05163b142041f32a1ac1b7fcabaf1b32769ffe48b20ad809dfea2013a89ad1266a4cbe08a5068c58d9c218ebf3bc2a'
        'a1ac050989fb8645b44b63465dfffc2437204ece22579568c9bb591163f0178fb37401720bf2dae95bf76ab43f1245dcd5f788b9eae663bf541630f7ab0b0482'
        'aa3a4c4eb5d54538e43c82aa5cb56a72983addf2afee6a196e95cba79612855c4e59a48aa030b3e3e3f335f77681f687a1d3b4a1cbf2d4aa1023d300e1566866'
        '6dc142a80d971b2ef3346c1be4000669c59753e0d6652c719f2e0835d266ef061628cdd7de00831de39eb8312a2259c7f1508b9266e6234b7d572a93b8e03797'
        '233dd7cdbd42ddf9255df7f238720d0493812dc3182723ebf08c9e86accf98fbc5f06bbed51c9b1aeff2b5264ad392a77f657035c0356b06319fabb590e5f15a'
        'eb28c37473875a9cb65640a647c1c2278939cd2bace2566f2fd561bcfdd717560c9c619b7e7dbdfc4e81820828b18ca58f78bb239b28334c382de1c9d9932ea5'
        '922a43afe59eb3ee2c7e015695e307bc74deab2bddd1af8e433231e3f3cb4828e3ebf81227faf4086de2943cc2303c7d87bf465c4026967d4a484ef48a72ba2b'
        'dfc0c3b877c8640213e9592902c6d404ae9216399f22ecd590f07769b91d262f7bb1b99c8a9333dd3ff66efe2c10a1c5cad96f20e9dac9ba3accb29568fd69af'
        'c0fe9d7c9f085ee278d8da769c9987fa306ea578b47b8428336362a15f21c1074e32dc326a9a4662cdabf57285f3038ffd2412fe394809c816c32aad2f531a74'
        'd091afed20b999120d7a4f379eea9e79533a9cf9eb5c7d0848f3e62f02daeb2b690e89fe93ae36d1a1b20f363de1f09c74f75ac247d4ccc44aeadfa6f64055d7'
        '0b5064898e64f814895374a51adfbad227f36225e19a0c8804a19debb1f790bec64ab93bf4f5b37b30c6ef4099a5d21af2c20b3489515480cc278587ab648462'
        '7dca36d8d6b7d0f76532528b19fdcce25493d140747819b27125bdc4c2c1a1e1525fecc91ca37ee027a460ab9333da2175d58355a01fc7c216556f725b1d669d'
        '273ef0de9c606eb0b9c3f0541b744ba10af3043d2c4e1b8b26115a2a8b276a00497c4d0f97b19da8e7da8a79f43bdfa0faedd18a4a8f9c4b4139a5e1e24e7be9'
        'ec16698de5f740395ec57181dea47f9d5936b10c047a2f3ad08659c76d8b86f25c25628f2f771a93928dcb3597bc81c27dd58bdc634b78df95703c431ee66af8'
        '7e842a70925cff5684a1607b7648efaa5c086026d75278cd60bb38635c55e4f6d9bd736ce854a601f5d896855bcdccbb8cc7f22c0c7cf15d3e21f2a05ce9d4b6'
        '4ead134d5ef7baa1b8f49404211e22538db3fd65587598e5d24187531be74009bb22dd772c4101840cc8195e73e08d8a5fd1d8e1a7033ff4893a28cc10af30c3'
        '3ce600adf9ade78343828b778b8dd31c56859e80fd74039eaf637b6fc01876e0ef30d5b45d846826354e426d401f20065db240a2d07858cbde8c187a911f3344'
        '0d0b48fc433332805989a0b16c68b830f9ca8828098033067e1222725525d712e3ae380be70e1f9e286932ac16c573c35eb77c41d6672a0f92c532f744158a73'
        '13b8314dabefeccda2ee37fb1db979909c0aaef174706c48428af025f1fb1be66c0198eee7a889da178d891ead19e5f30f3126df3f01c9626909154b675a4e67'
        '4244ea4c5b787eb6e589beed9329cd946e9468b11c31a039126c3bb33c3fe419109fe3449952a70ec27c7d1996e72ff11795ae70d25c9cfca43f7f5a42b04031'
        'c8ece74eb41fa40ea94bd513e0aaa50ca0e7061c99ce3cac1c7e59895e0bdab34f764efdda6d71da2020bb8752c46187eae66ac3aa792597b90121abd55fdabf'
        'a7fba0938c96bfc6079a329e8cb07b8105455b3f09b51fb5792e2c127aa5f73250ff57fd9a903752b5735e745a1460642e0f1bf8c17055e88cc2b63dc294ab2e'
        'b0d1fe0830ad78a1ff9f7b3d17a162f71fec33d693d6c9fa1f58b2c33fa10a6b6f88b602735eee9bff6d5441a7f00bc5f36ddd5f5008f85ed07c1348474b6e63'
        '263ee9f621c05eef8b1ffa136b3335debb29564ff557b45302c2554104539e9e9b08e258e1e162d33db4c1b29fae3a5dcb6f7436072e591f1de1c5f54d28ce1d'
        '005bfe6466cb7b41150c27e087ded1e7233248bce2cc16ee9ec747d93d23de30b7a6a139fcee4165dc7f2b4f9ea0b04fad29edd0e16593077ea0613c1e5b49bd'
        '4132cf0fdbd8aa094cda35742b0688b437d609c85883935733cb424f6f452f3e40e26f088a7e18182cceeeb0257320722bbfd385bbf10140d86a4c0a4e6ab55d'
        '6af7d12d61786f2367dcbad7661e624b4b17362529180330324dbc527980005001fdc205448d7303ff3ca6efac3e391c64754cfef295e91684358e1be5d2ce98'
        'c7a5809171173bc37eb40b7e7578d9e24623e697f9005857ae8d7860e9012ea289c9f2cc8abab13a82fcfdb19cb12c3b91faa109fcad768fb6eca7e91fe65bac'
        '807f1abf458fbe556008e0994f7c0b4b44bf7a686aeec922bc030acf97c159e081890a6d017ae4c02132a6329bb5f1be0502cbe83fe266a68b317dc069f7c6bf'
        '4472b2d57393339db2cd52b9e1c94b72a90e549fef8263b1313655c1dd0c40f2154efb54779c6243733c7c5218a9d013143282fee0c860bda2e4bf94ae3c68f7'
        '10c4bc27ed3f084a0dc666d5e7f475bc342e9232da5ac80066999a69db910dc48f33d463a9a57164b92a298646162c2888d979fdb2bdc13acc1d1243c3410ba5'
        'e1205d67059b0750a2250608f44f685a573e384ff33889e67045bc40dc2318708819a870b069e56f7bd6f1d89d34d7d7b1d017280b7d69a9ccb9e2ef6d979cf1'
        '80a380df7f7333fc27a6c1c499c778a8c6a8fd12f703cf1249d95dae43fa21336ce7455555342e20d347d5e0a99b40e161b44727014d91cc85bb07f98a0a7961'
        'f8c7dfd90b89c2f59d283c5f9d9299de81a6354ebecb91557b3fc1f286550071a624f9959416f890cbf1b4d38bf2ab3d83fd4ccced1e238339b0a3b15ee7340e')
