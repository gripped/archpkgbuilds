# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=132.0.1
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

b2sums=('a5b58d46620f46aade963db2c355a6c1ff95597cc5af37b536ede4f8be388114f694618245bcdb6513c8da5a306c0a467e25c8d7199f2ce6df9a214c49e45236'
        'SKIP'
        'cad4ed35bfd827d5e629cf478d46b85b9547728555aeccc684238caab763149eabed9771f05e4906923f1b7119190022e39e32fbe3ef0d41a95c1604a6582764'
        '7b03a69f9f0181c196e3abf7e34d21c377d1fdf7f6b88c78b651447afbdfc73c8552185196dfc7d8c9228295c4db703a85e59646ff1aa134b7a5e66543c570f9'
        'dfbf3a030c2e7771676828253d2f6afc0f8f3b03afbab29a2141941ebb3638eb7fd9bcab09c1500181e997f77394fb3dcc740bbdfc0794edb13d9a26f1765744'
        'e9b9edecd15c110f59158aaa1043a617d4d5126d4d620e48f6bb60731814f4a91d3dd1fb304e4b93bca6423ac69baa67bd1bc7c2ac626b5dc3f028b580d10344'
        '12fda1efcf96ec43ea3aa06a1231146b94328c97e9ef58f7ef18cc0b8c8581e3717a1a8c9f9f657f3a353bac7863ab65fb374224dc0d188de74e49e460d4ca59'
        'ab3a7b21f23e10a75311c6773f21dcaa38809cf2cca160353684d41aa205b9a5d6b4d4efd6a254767b7e74c1ca244ec131816d313775482989cbc6835bbb2147'
        'aef7174ea4c1d9d25fd4aaa892875d9309709df44f4500faacca6624212e787677b5745d8075b31a6b6378bfe2f2dfd3ef9534b90582b178a7e7cc702894a90d'
        'c3d48f914d4d9470184c9517a6f9926a85d30f62d88090213cb6dcee246d71201d759f374f7ad38ebad87fddbde53e4eb70100e673290914669905a28a60e680'
        'dcec1c192869aa23633a662af23947b15ae1dd1dc02e761f0017687bc84f88182edd1e50d60a82f881d28d806f886a7240fa1115792fdae4cb90ebf7d697e261'
        '5fbd49a3efd5b57ae468b94c15deefb251a57016c562aa599f290f1bfa2fccdb8fa57c471a6d6dc35f8307cca5a8e261bd372bc0bca88cd176631484f1dead2b'
        '624134c79173386654ef573a4b1c919a02ba72e47d6d4b0eb64c8d60a58a2e6f76890cce85447fdc0431637674449cba4e0c0e4364acbf283878e1bba91cd617'
        '66fdf5ebd13d62f4ff8c83f302a5254f569bb37f759d0ffdab46e640a9b4c0b24a274bc605533246bf1e614a600fa3abead01459a32073f1e41372271cffea68'
        'caccb0a89804c1d12a067aac3627d19ddd09769172894a09d66ddf3cfa6b9dd76eb6a69d78db36646d46e9ba2153b882caf342fa2bddf155cae67cf76d8a3bcd'
        'd464885420fd14dc326a816eb057993ada21294170a8f2f171934728fe3e493951b1a24771c544c8b5d79cb9776ca4024ff77d9b9a9b60a2ca007941cbea0a2e'
        '8215998453fca5baa2a7fb2115dbaec0d6b528b35ab9475e087756184fa214be1429f821e824e309186795edeb9b2a03dbbf19f9e7eff97ea9da36096400bd2a'
        'c26b9fabe57776e71a4cd63f31e8614cc73fcaf38659a8ac99ee5c86dfd7cd0df2fd4e109fcc6d1c6161ce6b02668dde363c3c8b15e16839236cb55062422828'
        'bc2cd47159e65481b06a82dd5c36288c1f160b368d1c4580b6223f1eb30438ea5baaef408bfe5e931b429f55becf7ccc21065f153c2fccf3261bf0c9d5f5f500'
        'edeb9de3e10da6d10d6c3eafaf76e52598fb4a08bc843c8e31aae17b2f74c84b25a5f41e42bd797b1728c641a1a12b5e83f15455b24b11010bee07106fe599be'
        '9d1e5f4dd97cc2867f1ad64820c37e3a1c95f0f666139be675e2f7cff8a89ee29a7e712a0861575f5f5a741d8621dae2cab9647bdd4f62a7f657cb94003b4c58'
        '4070e664c7d97d98d4f6604523bd65fc489c9675ecfddcc82b6408547733028086d2d61662ca5b92c3b18ef5da2980f476cf03ba9af4aefdaa1f8f3078655b4c'
        '8ddb37c15cc727fa90385c15da4d96e95adc153c16070db352fd4f77a295eb0be9fe0556ff8ecaa3a7871450e26ddbf146a958dc89f466baf41a1d5b5e740bc8'
        '733146bb11fae31dd919a2fb0331276340bc6130b2419ab646402392e14f980069e1e814c1146937e1bc4dd43cfb39473b9a22c7c894b58af79b8a19be096c0c'
        '052858b845ac7b4a28f5c77b1bc3348dd108dd147bdb79a4c7bb94d975c1ced755032a4ef0b4480b45df3a18a997954a2df48cd22bc477f93f27367b0decc113'
        '6b34005058ef3466439761805be0c66118755d128e031c37792165f7e207b8a4ae6e126938b553b1e8047da5620f1d647e5cc00a08c05a75ccc73ba5a62f9549'
        '54160f1b9188cd2b8c945784ea8bf5c8340f6a782cdb4030b3ea7e45814e35832e3f56b09548572d75bd5aa9e0a6fd3bfc767fd2abc0162c83a133f0f59c4245'
        '2d72481aa80dd70868d0dee1ab0d7902c6f41397fecae4e597b3022a709c93d757df5be8c3928bea995ae9b5b130042b15039e003fa4f750f8a2330c81828aab'
        '038974a641855ec65806e8a0b32b254426ee60ddd5db29028d850f231cfacc2b730e4a3edbced53814feb8b3a24ff16164b8f9c5f40773826b85ed865cc83d5a'
        '5f5f98fa857caf31d993e30f27e03943865937f7a9750b9e5c3b031929d5b9b53bf0d4940eb15c0532c4c7b247c8402f4643f06d80e5fcfd4daedb37467a6e6b'
        'a1a8e7427a77bb240ea45bbba0093f37f8165ec6454cc7bef797f0602eb52bc95cee2ec1b82cf1f6b45a35594990c51d38a245422b34f325e54004cd9dba80f4'
        'bedbbe8aae8f1fe38c9d289963b44fe7f8d15f537aaefaa54d39b821b81f90c7dd7bd2a378816f2efa22deedd1a49971c6898995ba3b11771b891ceddb8f92e0'
        '49ea9c0145fbf38f6fd308baa5b95d98cf9a0a0bebceef22127cc6e4ac4b914cc0196c5048dbe5044a1b14e0ca4935d80bb5b31f9156c76b52d9a5f9847337d7'
        '233787736f9a9d8991099dec7831e2fd28cb098169005536af9b96e8dd7b970c89da7e9aac197661580043312c5935e268009dd7ff2a930f4d00633ec124987e'
        '7611cd70cdccc3fa2731132bde6d8af8c6dd0f0a1669572c81a6b3f5526590ffa86091c56bbcafe6c8f103138c13639983982c42803c70ab7a79f52b66602482'
        'cc5771f05cd237951512ac763d8d7c1deb2c1a5c71fce532934ba6da4646ed12d37eb75001c1dd576bc24306e3a9716b935cc8f28e328ecc8f47803838791eea'
        '1e98fe98a7ad5a01a6403cbebcc9c3055b6c4c2d907ccb14741a0a25117c2739fd13e3a6749fb20a364d3815cd3619a222d53d332163a13e2e2aca732e84e76c'
        'bb1e8c1d5dbd9c6f3b7ed11ffe978fad5d1a266317341ea36649e95495d4cf3393c676b518e93b3a83b2ed935c9a9b7105eefd5e6cddfa37777e859f61a5f976'
        '4bacc4b7dfa88b4de032dbacc2eb903399a83abb971cf44c8e88e12b3f685b9e8f18e42bf754ee6954ee0f40a748a460970d3fb2892660ff64e952bcf6afd456'
        '4e49b0caf6871aa85e9a1583581698116cbfdba82c957805f5b28bf6a6a8bbfe7f36fafe46cafff23e024c8c9a58075d05ec4ae25496c0f3900b82684ac28a99'
        'a77dadc2d540e24b2368f4817d3888160d51b0653bb5caafdd34ec5edea3cf79ae1fbd5ffc555cee453251161f12485b6be3716ab0f34c98bb148ff841cc7894'
        'c12c994c0078c3fa569a64918d59ed9992721d750885b6041e5906e5640626103e66179ca323dfdc46025f245153c50ff55056a7cbe01eccfdd14257758dbd40'
        '511d395741f35e520695366bc87947cd11cca605cd20a3620924c07b1c8b212c7f0ea1eb26b1cac7b19cb0e5f4d833881d6947bb5d5f39ed87fcf024f982821a'
        'c495d0ea2c1f959c85970dca222f8431322c2c3d083728c6231c1ca06f2adc8d922bf4c8b1ae823e2dd613e723bbf2c570080ccc99bb6d9acea0d135ea94db4d'
        'c7f38b43b9d51814fa4d4b12025c40906abfe7f99ca2dd168059d688274e1ed6dba3557a5ef74b926ea3b30e20f653f497e6d6319bda35733d464e36c47dbce5'
        '1bbf6aac86f480f5e656e161e9c936328027ef7653d3e57ec4d2091b9d7c07443411bfe8804920abf18e3110344a38468c457b81cd63e3ffd00c7f89abe4944b'
        '07632236930dd4cd982f22ced34c5ba821842f640ed5e77ce7e048ce50af8a0abb0fa634433eb99d7e2d98fa6bd70c87aa9fbbc2c885efe5a4d90303d86dadc5'
        '7f5caa9dcdd0735c06fad8971511f8206598fe7126dd740ffccc9babbd4b10e1ac8a180072a1bb215d9e349423a794c67195d86bcc5115c57e21429de70646dc'
        '6fb3ecf18fa00f5e32ad3ac4cf121474b99da31639466516f330d7ca4886c875d25c29ab66bb63774f3e7cfe584799e2177f26ed866c51041b1fb0c2892eaa62'
        'ec24df61d0f34d2d923d3755cbf1d1670a5b9f608f42f2938671ce11f1135f44f669c07252031db118e1158647c6bcb55ead39c631f49370338aff09a0aa3d74'
        '8d1372c4cd83754a2463e32f179d951b1b5e5271d877a7b081ff41c688a434a1c8998c4da4dde8bc9c153dfd45bab9d2c92f1b9161f7bb3618277ddd353d1714'
        '1f0294d3f5424edc31e45f6d526dacda3cfb668cc44b7256f593407dbf89be7babdaa1bfecb4986aa371cb58e8f9e8ed333da6e1fb3907545b7f744c26e8350e'
        '31c3a37c74298eaaf645b0f1b4d9a8ad7debae2feef199ef0b532c72f8034e99e55336d8b541d519734849eff63e29e769e22f9a4226478e070eca02f5d64155'
        '3b6f4cb5bc6af384e57e262beea2a8ad8e544e9646d7463fd01ca061c1a3a02cd3a88303d8ce0f74dbc1c8c94f50522ed47f6cf759a13ace219c2d5ba80eddcf'
        'cd15f7b97021d60395ddce0785fe987e9ade35319c92a4c01f4c707ddd8ce6975d76700df9a1592ce9fe5577a659c05a568c39392889c86605688d5b98d32c6c'
        'bebd9b53eb5a6cebf3af9c1c47ebeb632cb5ee472a933c09da576c9f9e97b7690b9e653565e80e6650e25b8d8f7c782539c508107f2e6af46321d127a8205d77'
        'edb262f19e77eabf856d3efe98893b787a41b53d2ae9e2626a82a58b054de0ba1a99b5245ed02aac63513eae60ab5e994aca73ccd409c72c7e941316ee497f78'
        '84781a8afcad95bfc838e8b76f5406ede7c3948cc4cb840d4a895b4e37e390ce0dc7f3d2b49eb451ce925d363bd9d657942db8e7aeebe140cbfbac7c9c223eca'
        '006bae2cc522e77b8928866d18bd1adc7736338d2ac2848825b7408311a38cde0ef2e221bc268b09530e154e59895db4c19f9c955bc620482ad415ba22181100'
        '670ac3dfd8216a3d05bf06ca598b1cbe87d90cb6089d81c491999a90778b0c99d6d5ba9eb410a6c1653ce3e0da8ee22cceafb5e8142b76cb4b7887211847b804'
        'e10d9d1e4a5f0625e8754feb698bfc1660792d0b0d8444558ba75d48bd7ae22d55baa0743ff6c9944a65d3086d3fa98fa358e80edd428150b909f060eeb6e955'
        'bf94ab89c2c61b842b20e71cbd016ee5b36f1c5a46d5721ec60d2d7a96b9fe9cc73b9e3d9e20f8c806cae2f6a544b760511093fe001964a51a4d527e25375796'
        'b60abbc36e1223b963e4be882089e1cad41053a46363be28026bd2136803800e91b32a4196363ad7ce5aaeb758408a9e4f2372b7db98cf1740710f5193c1aa26'
        '99016590aae48bdb2dd0d81d87cc12c15aa7e871b50496013766234e194776d09c8865d6af6abc3375ffce91cebb1fd870697f1ac973c042a4a78a8ada7c050b'
        'b143dc02f12412a2f6d27fd0c3c7168be09360fb94ef3c21b8a91ed95b7273541c0f1cb3640223727b4cd12222793e84907271e850567255fe6ffb6890d789a0'
        '36db375e962f933fc1fb3a9174943f5d87b7e64adc070fe84580ba64282f7ae39fcc2b8af8b2cd2ceb80e9e60ab123b87d1ba8c02d1877648796c5bedeb65b5f'
        '75e1221a6658a1bdf0a39ae47d8585b47421e7342d3cf6860b5cff660e5aabe419711a35bfe4ec1107a435e02605c17964cfcd6a131c5435e30e1748fc1a68c1'
        '463e983a9934faf0ef5464b795077258a7779557660fe674965e868be2c245a2355e377f8270113ad6e24df5dc390be82c790e0f44e3b0f97d491a014e2d424b'
        'f63627809362723af0782061304648db96fb51c4c5dd7b225057019149c7ceac1702a735985f26033e0118e2a048dafd93e2002f26d9aea2b047c0006d4d4cca'
        '41a4eef87c026a0051ec674f66235471f1948fb9b13893c313195a2b43d57dea13f1004c15daba1885687966e00a8b99e2182328bd09a3f79348d90a079df70e'
        '1c4bfbe06932a5bf0eee861ac5c5ad1a73e0430c3509bf0e6c8a83c3a41b7ee317e2faeb000182800504ad665c63bcb568c6ee041c94ba709084f23297bab33d'
        '22b4e51a6a5061f22af04d1768e80a63d5aa31e909612d1654ce7125e980afac115e9ac0cd77ac016678976c9a854bb3006a2c24224700df874aa4736159539c'
        'dddc62907cd9f3baa3244772b110a08cd6eb8bed88e864406fe3e6a28413f0eec8f37bc66a5ec5e8da989796d5755ad7b542ebaffbfb851170e58f2c6619498e'
        'c6bd324e7e01fb48039cc6ac3b2136c7e2a04c2eb45f5805f778374d3800e063cd1b664f1c2ebd516da33055e8dd2967eb617de6d4c2dee00448285a72bc699b'
        '0a20c1431fec648ad5a36d25c81640dbd42652c5db623bb84e150c9ef558e04e9be1f582a78b20ad3556ead00a634d036ba1463b6752a7a87c57458194f3a4de'
        '6397d93e9574dc60ca8e1c6caf1c0fab5c664d867ba73921e236923b5195030309daccf2f37867b7631d1da598ab0925b2c60a1c3018f39d18f703d74d2a41d9'
        '093f23e751fc3fd6b98fa6ba72ecd57a59715eb4479aa90a699e2e393d0c4e741068083f350d01bf73941115391cf97a7e29d06472762477ac806e32303b8bc5'
        'b0f65c321839eb3eaea2ff9e581921c04b1a83bad5af7896770500195605a3d1ff70ff2ff0e4b7dfa5aaa01b6431a04a21b358da207835975f1bd839f9c5ed1e'
        '8f680569b90922588b59ed2e3395188f26724d793a289cbc16789d9e183faee894f0bb46cb5a302a1b61f4cfe8f1d8356e89dfbda8bf1ce4ab61a06b8aba31d4'
        '95cf52d999ec37c3a9f8accb3c2f8b4f989109c5147bd546290cd861645d8ce9fc2681336ecb32eebb20f00278cdd3436c8569959846bb3c39e91d7edad4bb79'
        'eb8cc97ebd2a72c4c267c8da3bd21b91bd6852cf766a360ca14c69f1950f3e715aaa1373fd6a633745ed2f62441ba8d352f5dd5a411b1ba9d040f39f9d91c785'
        'c13595673ab1145f9cae2a6d5d8c54d1c7cc240a6cde566801492ca01059c7d3581db5580ca90c7d240f6e0554295a7695dc7df47c1ebd460b3cc1ce0665c984'
        'ea4c6158e0d58faf07a203990b6a7cbc4cb4870df5dd3a40140bb424c701cfd5921f7accfe0339a1a6c324d02733f97de303b9290ba8846afa2d278ba942d816'
        '6b18a86579e584d161a2f461de55bbfb211cf2c89b1ecdfa4e9f0b025a1c892a23a4fb97a7d8932c49080add3885cc4a95f3337d5c808cfe80abbb96a9948852'
        '59a21ec30bb0db0f5545b15ee8b86db68d0df999340fdcc9c54c2cc965cc3370cfbff33b306cc9d4dfe30860fb277256882851f62dcaf036635a9b089f27e9a2'
        '62d2449f9a3358aa71b311399579987c36e42fdaf65340d0803d1e7488db947d599c019cfdc71b6d68d3e75ba95107ef04565808a3ed0a44cbb48acba4d87775'
        '58d2120791cc379cf121d41dd43e773563771f1cbc13b676ab0d3bd033a948788ed6d7936e0f8b20827c7d9c16a8fb7eee7eeb7a7928d2c474ddd313fdec884c'
        '72068ecb909c1ddd3cbd486ca5d95aaaa91a724c56cc3a5eed6f430a14df9e4ecad1b5d928511244d4fd1fe8d5fd9a17306f1c269ee69769f4453dd8b86b1b57'
        '85b5f8130d68e16e860ea5c99731044193d441579c2149c748c59bdaafc4fc733b3b3b2ad2724f2d7accb7a9ad31aa9ea339d37fb8b8a1e0f82cb501fc5b36bd'
        '095a22ec1a3b4e48bcaa174c4c3a3620558cb838096a454d819a1cda1bf7abb27824293053c710a6cb1a187b7cff4f206439f2ab8f716c4928fb1ea7fefbac90'
        '33d661adb367efbe0e06b073b43e519c5bd15d7997be7ad2b2831986db70e8a4ecded45deacfb3cae0c4333dcff0ca463a2b1556fb685342a7d4aa8fbf77f7b4'
        '8d8882bd58909b16a1cf1b229104c1e64dbdea27bb649f620382c3ac1d4b792f8c132691a3ad99c73bbc5c07f29e5d6414087e821f4a66c863ba745ab917c9fe'
        'bfd984db6ec15954ea28fa731298e3b0f00e759fadc297278236657916aca6c1d613400ee7f2802153644df53938740080d56922133628081ca530544c3f5810'
        'be6f59327282bcfab4fe4423b0bbcbc5af890e8540f5e49aeab95cb80ad70488cc06b919b2fa383bad76c20d68ee79594650d17dc5be1b213034adadd67f1ce5'
        'b17cb841ed2508c54d5cf3afa6665befc159e8def983ca4e1bf133cce727dca08d3bf927abe71aaa3648d6787bd72fab713abf40ce1988542d77452c0c546fee'
        '3916f8860f00945b7438d435a68c0b6243d3ae4677300ae9b0432992ce96c2587aefb2e7e915ee27faad7afff3d26617df29d4ce006deb19fd116069a8be0f39'
        '55edfbeda470f12e5990163bb35304ed230912b79aad50af760a0734c507ba2ce3016c11a00a44916d1c385d2d1acd960b753741997f019a36951d929aa02167'
        '5f8bf69a00995fa8ee27c190c38a1441c696522ae7753ecbf8c6c4b377f545c2bad0eea826a1143139c9126e9c9f2f74f5e0efe7b9abb5516c52bc736c9631e5'
        '017a001f11829395da95976769c83b1dd801742b2239e3ad12aea17d6a909e25f0b131424fcf0574fc593d65ec4dcb0962797555712018f598e6994cba7e3ce3'
        '18f90a4d66eeb5e4eed72279c9764dd7e7656bb7b2ee2ef724e7342c399c09a95b25ee2b82e006e6313dcd66a2cf0b18f32b9ae0da0ace4005fcbe656c85e8a9'
        'f3a9d35d17a6ac36dfddd530e17447bb2e841db643187bae4756f4d329b3676dc15b64e7945372b01926141ee4a77717866afa0f62e1a5905b1b4e6ee5970b23'
        '6e2f106fbd615633571d11b15ff2d48dacf86b1e6ab89228420450ac9821b9a297b9a89d84efd1dedc10b60ecadb6fe6f47af95d41a9c8dfcd9d58e841c85a07'
        '7b694f65dee0962e9429532d6887815705ef8d8e6b128f67497cc5a5edf1199e13a1e7253f8545b7b9c6bfd79de002e7f77cea21466f53ab38bf48c71479ad73'
        '103aae4cfa0847f6c6d598ebc13e69b30d51c510002680f84f2a04cde6ecaa76f71c9bcd0e45833cde4ca1ae3d0f8c5687cfe95edba842e455197edbd0f1d932'
        '6f74de755ae7f3f87dd9fc2d905b77595c27c3698cc8ee214414ff704903f5ceadcf634b6407506143b541bb30918c92fe1cd8e855d149da0539404bcb67d10d')
