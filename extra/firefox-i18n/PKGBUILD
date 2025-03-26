# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=136.0.3
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

b2sums=('a155fa96d52f2a5a822e15409b0ee3e9ac748dd05852ea87ded05b216bab56df108766c32cf109695fd87520536271243fbb55359d93e8b14c6a49ad926100ce'
        'SKIP'
        'cb3aab3e218a01ed05bc6cc583f98ce9f7a988d6b576bb9b8669fc9ede0546647ae03eb5dc4fa36582849ce7065429484815d72bdcdd37973e34d092608da230'
        '68186f1df97c6efa82fae5b729f2946a97c0351989d97277b6ebaa06ff2504e3ffb44b40941e06fce7b92cf3dca604e2112f6e27e9da1fa168f46ded579a9735'
        '24f317ceb8452c603dd4e975799b96afafacbf42c43d93b1b0c55f6970666bd70e420c509ec96282513bbf27a228dfc8a8ced079a3ab8a1a44a26b2316292f6b'
        'c6ce7e343744aea9dbcf4fd4d0feadc0a23a0e84fc5c74b4311c1dbaeaf7f55b19040797718a3fa023cc88cf20a6dd52dfff2d2e1d5ef6f94c085a4cb9fa67c7'
        '7b63029451ac09999d43fa5673af62235de871e1c9dfaeda0109f5b7985e9daca53a5268bf4ae76b9e67b7b344cbc0915191a3caeff8e8e1a23881898b8d7985'
        'acd438fbb074aedbf88beb9e19b899a0537775b7c08c0a7f61bd92804dc39c81b322b4ce52027607e315e62afc4591454423f09d072ba783d034c2ea4c0e6fdc'
        '1c8878a4ccc36c21be524cd4de2de3442860f70f3e2469751f3cb5bfce707c917c9cb59d14793775059ecc993ac5e3426a52412d3e80b2fbebc1e74272169ab9'
        '2cb878f21c5fd7a0d536d8cf138269ac0f02358169bf2da592574098c8aaa73de87da9346c7f1b3b59aa98370e5bfaca106e731f243f541f7e3d957b001d173f'
        '2a179d210c82158b550fc35d9b6769a803b25820e1c24806ac3403e413d74258ce8736132579c37b3bb5e7e53bed57b4661ec8fbf891c20e0f7c304d428dac62'
        'a9f38788718311b17067a76e20f720d5c7565443b3b81ddc6e539f56e4804ad1047dd021d3a205481002eb44a6dadc28367ae6796430006fbccba3fe56876d50'
        'c474f2840ac46ddf60a4b14502bd4b207dee8d8e3a428be498eed12a22dc743d3a140bd8066d9ca920d83c01a22b31305bb227134187111f7be8e93002bb6c20'
        '2066456ff67981cd6f669a7f6ed26ea2d521282377b3ea543b06c3b98511e1f9c3a653c04c3a7f37664b857035000dfa1379e9b4e00be08358f327fc910fc11f'
        '9e8acb79d1389cc2d437eaa556f2f068ec60d213406107ecd7e2b2a63044757db746f4b025be4d190df5e85349d40f44acf233e3dce23dfd6e422902fda0b9b7'
        '881cf0b9ccaf6f2dbba3e216ebef7e7d81595972210ba7bb1a1f59710c254cfc01cf15de1734b065cd2fb389f38a9778af4e34cd38f77cdd36c474b298401b5a'
        'fbe670eab500aab3cdb171e848edaa07cb1ced9a74b0bf62b4eaa4ec6d7d30c4556bb1db5b47515b9c78f434dc2d7cc04eeaf8355399281ebead09a490eebc72'
        'd57fd07b8e2af79f9ed120c6e3ab361d00730eabb0d6f77bbbd6b5f2b11d3679c31263150217d5d3987a4a0e41e929cc7b83e65ec06aab9c631aa8d17c887f2c'
        '15a34d0599b84b7d0def13da3411a704f783c867d2e68697fb2485f53c491cc208fad0c22efbfd2696c25ab909ede5869b4ddecf927e8a5c671e6685befeba7c'
        '359fcf9678ee988ac4634c422e36ca5d813a5ccca8b53b7ae864d853a215b2462d7c20ebaffb9e8743d2a29570fa261c350ec0a700ab040a23be89e82b1a4a73'
        '9d6e4f9b4de3bdc768816aebe5c363978696320f6c21fa75963d502bf42e6263fd751e7a3287e6fc2f23d74f5937ab846c09dea9a1eb3dcc60e5f88d4b55d31a'
        'b99daec16db285aa2c80c0e16f27604055c361edf843eba0bf7d7e2cd8c523a3f4ea73ca2208b4cf1d66d4a33a594bc06f38a7abfb0785dbb4cd42366088f791'
        'c6f42bf11f750ea2031745642048328dfbab0f4eae95510e99babef51acfff8a0e3a8560ebe87c09234a28be205593a99f3f3bdb7d2e4f62263cdb26f5dbed8a'
        '589273eee2c8c242bbb43e772ac943309c48d4d5681e4afce10d979cf56a1b1292cb4335d07a88473af92f63734e7216b152d8280b754d40ebb816c02c25eaa4'
        '873a02456a980ef07e239d2bdcae8e1c1dabf1262c31643f1139953eb74f10fab1350c5a563a0ce37e7cd7688f7b64f0c7e0b4805885112bff3ec1509d1c3d4f'
        '4abecc1e078db27427c41270a3ae6d97d0bad1003c644c20fc08ee31d184a72bfc958556a0ebc5a13018e1fef2c65af50b3589386df981aa3a825a275ad05596'
        '9402505b5be3094203fd18e547781950ad3da49af8a8e610303fe85dad852f6975aef8c08a86a42507210e1894e7b126c0e57ff7e187a78396adc24129899355'
        'fa86b3ac4cc08feec05b11a796857e790b31f3971021df610b5c70074c84402f69a20cc75b2e615db60e7aa2e6917b913d79718a22fc0e9431267fac44d52266'
        '29a7f8d43e98cfe0fd31708cef24b461faeb317320b97ca8f258e573166eb406bead398b07d6732275f94e438707e9b6e35334d214643ffc0d4b173261fd90af'
        '957450f745b15736d5d5ac1b6cd0ed243595569e07f60502e8385fb155adc40febd31fb61e952fc7981bdd6aa2c9909439310a03ce7830de8f6b0047dc120e5b'
        'f9f61232925683d6dba616a79c4fbbf01566ec38fb578324d84785588b8c9ab33141bca4c623e8a44038190ff74b43586ab6e8424eb98793e7d03be92dda40b9'
        '585d7241c0bc82db61a38742b544dc8b76574fc7634f33c23ec581cc4ff9fa3230352c826872c71bc9262a04c3c6edf5aecd839040404a61b57727a7b5e4f0aa'
        'd192ffeb70e54095c6101407f659e2e1887e3c9cc7fc7765ac605104d625897a2893f9e45d4b0f3e9cb0caad3727790eb25e2e89fa9376870ecb4f8a2e9c5e8e'
        'dec8d715d4f7589cc851f7e3e335613fbad485d3a849d53d0ab29f13852e5a1e821ce021c789a194312fd206fbd8624628b072d5310751d9e52ac7cb132b6842'
        '355996465a59246952b81287f0c87d91fb22fc46df686f1c2b8c2ab34e3e4cf88647313f9e21bdb83e6f396d0f9eb01149ecb5f3c2df162e68db2bd51caf0673'
        '98c5fa82455294a0a9a1053f21f1477679935eec0c3871cf8fd0a3a05446b1230f623602b0dc15a7bce3ed026ff944056bcbf268d57b57d53e83b358177fb892'
        '914708ff01b16594aac3e3cc298510466ee0f9ea03c95743297dbfb71446aedf04f6b794906dea04c8b21ea13b0f8e4fa0f6e2cb87170a151a90ee41040b2773'
        'd350941a3fc0b5826423299caeb7ee576b60459573a65d739a539257f33ec920471a06dffa4b578d57f21bc6c710921e1258ab0ef8b6699965c81741672f9cc4'
        '8027e678edca3a54afde28ced99aca024e66d8e8d23974a890a667fa202ba0eb8a6b1f2710998ad655a8894d0fff4dd729732558ca0ac89e7bba6ba4d6e09ebc'
        'f21e26f1d57a0fd5bf78c2ef425eb0407e3ca5343eee6fcbbaa1fc6c5b877274290522ec7ca7b2805a14dec633fc774f1011cc7a4289036b2349d497b49f5e82'
        '83f12f3d6f72cfa3db6fc41a8f21937db4fd1b0243a5e0268a8037ad397a790ef28ee33aaf9c1d32aedaa15beae0211d2374e38122bea3be81bd19aa90b59ca9'
        'fcb8f6390aeffd27842bdcce0fb3f73cccda53bd3a5caa37d413c30452ff3de3f6a7d1da01eeeef5ffda725a86a3694863abadc9011697f0bcd3ac8f121ac146'
        'a1afdbe5843fa49a105ca9fd9e70798fd88b8429069478d70ce06d4b4cb769683d6f7edb3e3147867a1416bb8af5142b17781852db89de8e586a9e7c56ea8839'
        '4fc1aa86fc92823b16c449640f0ff6385dc53125bc68670393687a9fa3648529c930798e242820a5ca4434775e65e9cb3511242e5b09d25c3d5cebcbb1dd7147'
        'e7093dec07b16145e20fd5adf6ada699a1a7b78f98719506c3ab4a10b02d67986f03cc626106e592504d85efeb5a40c6b1622da6b1eae4896761fb2dac75b75a'
        '3e8c8f901b1bbe41ed979b9ac46ba6edf611eaa030549bdd236f99815d7802d05740454c18e8f2c77aa5fc0a5701e13dc9e8391902fc5735c050f3de27be8c36'
        'baee65fdd955c89c42badcced45dfc9a610f4343dbf3b8c328d0d3d2bd1966df52208f15c634467f069c69657552c2045bd6cd3227044975f841bb7fce4a9daa'
        '7d2a064eb4113e1bb61f4889cde8bb4ae62e7c98b52776ec64b9c81e1e11257e792a72a59b14d5df9f246635283230e2756991fffee63c337afdb53e70bac54d'
        '8789647c8f456f16969ad89db8f326123eb0a8fe416d09d41b7b4b771e9008cfbc9d37931ce2cf4189af02b5c2ce750df2245de7fe19e25ac98c4ef614d65b02'
        'aeefa7e2ba4d2e836e5c9e42ee94e13daaed310853ec4383e0ea4c2e3d6f6880d3e11320777b98c2f5bfc87bc4226048ff614ffa446b864ab8c98042ea84b7f5'
        'd4b97cbb189cdba80ebb7fddd39a9c91d8d0220d1e9b132c5d22616a22b23204e049b5fc997183cb25a083a9a5ccc4897fe7f7b4d4564afb0afb86c4575fcbfe'
        'bef458e812bc3cf4ed4461efc29a61b9f42c5cdf335687cb69542bc59b745b4bd32a08ebbe023a034c0ef64f7704de871d5b4b47e49e9c4ab85d5b67df0a7661'
        '0dab34e170e738267090e6be86914372277e20b3a81eda82f39033bc6bf24d69ee8ee5eb015b3ccb3ad3ce01049c43f94fed75ebdec04a1cf4c866505361b539'
        'b0b6ec2f7685de9168b3afb81e05fe1fe98c5ffc00de9a3f67206074b42381bd302300b872dbb2edb399b86e39f2a2ccb5621bee356c675d0b92ba36770685be'
        '10accb224a275607ad50f7bafd4c37d4e7ffdcaa37056d4e04d87dd921bc7758c04ba846a5435b1cae5867c6b0fc78558d04397f5a9ef17ac7c11da99de595ef'
        'edc2f0e07bffba634e1e5324d9effadbe89c8f9ab47b6084b3d3f177037b30e63857412033a190f5f0f4680a1ff5f8240be5a327340fd982230096d43f2482a4'
        '1359a5604acbb21a1d806aa347758f0b4b500ba30d2e2e1c6e5b0a48fe7abbdcea24a54ae5f00840cecf5d6b00273fc0e26dcc8ddf047e5c33b2dc0b36e4159e'
        '3b769b814f6145e006f0dc257ec96e133ce308ffee69c4fbc35968effd00c7ac4f7f10cc7b79fce7e8bf271523d11d8a9e3cf3fb6ab84cf5e79310b777f25aad'
        'b8710c5502d865bb8cf5d1183207de63cf786984accd4b1373a406e83e935ff5ad63fd52c0e078d533a2f0b681ab785d9b7c7cfa7c4a9c4fe41a9d9124578cba'
        'b1888825be6737b958d09919f2279603c55ab04ed4011adfd087d5c84ce9830a6af6105b05b592dd1f9caccfe63ff0430d73b0ae1d758aa650a8d99e0bbb362f'
        'cb981e1c1515af763302a53a5c7d8442b95cbb6e53ec92c67ddd395a806212da65f1d7f56fc8c61376c3ffe4cb290810723d14345785d967ce0009ab4f758f33'
        'cce17ffde8e8be4d21e7a32cb4ee5f937b3be50375190a92f20954ccccd95dc3c94cc51da368777d66163d25b4810e8f58e7af7312df061469734c6255729747'
        '4873e1ea8ec0585975de9f18a83e95679cd85a54c29b50a560ba7d49bec5df3b65274d0dcfb0af79247ea27771eeabcb465be2d6d8fad79f6ed4a9cae3b2a4fd'
        'e83a4b425cdb89e6e67564b1b5ff59b1305866668a331902e8b7c994d1fc3b93e090c3cd4c7fe3b86601ae4ead7658214a6c0d37805a761c1ab76e84a17672ad'
        '6c074e9a773b62d6362b4b312c979b471b1b61f07f79ff660693296219c52da85b8e11f927f299042fe3163a7e3c4562c139d8703168c81cc4583dfa2c744322'
        '02d4492799d4039fa4d264895ff6d69af1b507587f9b09d5efd3f33ac77aa1d3f0de9e35ae6278cdbb03f380a97d1cc664cdc73b0f73de3f3588b936c3725aca'
        '46f2249efde9bca166184fcfe022e7b9e0e14e2e5692a081d7606d6c3773d46faaf929737a52dbef10776c3fcb88703c516843dd189cb2469a0b34759eb0c128'
        'c85b71c9c58dcfb131193c49c218a3690043761e446808fd1df4d2e9c25e4d6c76eb05597763af9b687ea443e04fb3fbc0a879c3fa05184f5b63ebf145f4edee'
        'd82caa196e527fa6fd13478c57afea270b8320cfd1d46db5050bab77e0e0de1bbdac5b9a95438f041d3aa1d38718dbca6061e191de8c5d15d7a2284f24cb185e'
        'b0198234179b211d8800724a9465c52de7cf4e6bbedfb81f3fcd47a445bf6504f1b41474345ca7208aa2cfc616f4418549e99bc740ff65ee945e7a2a343260f0'
        '47d1fffa1f1e9e7de18090d48c22a14e2681492d0f2005ea2c7ecfb07c7842c32aa635f64db6465e04cb5f9cda09173e2e3685ee80130abf4d2cb766b1c3a1c5'
        '39b5c16dff9daa37d0b3d7aa7517d10342807fc5921d71b4c554a490db5ac411df90baabcb942dc65514cf84c1f738baba5aa616b5b185cd83c387fb0005fe94'
        'aeaa4b7409b0e99c76230fb5eb35f6f78e901b2790478441b1647edd302bbcaafc6795ff7033e661ec7385b585fa7dc01461a5ce400140b9548a128b196ba07f'
        '71380684cff158bb7123e677f0cde2e865fc46ea4396fc20cee9f4ec406840483bbac11f2536465ecb96a5b5e3a45e73b22158e32be1480c8bad608d9cf0fdd2'
        '5aefb80df5eb1d9bdb8e3ac394e166e0076e1db1f368b0f1c05e03732117a65deb6ee729d035c16fd41be68ce78b9629bef46e71642bfaabf34c91379bf4d480'
        '6938e7e3783eafc6e4af29e067d06717dee80fed06344c7d697f29afbc9b133870dc65a0e1d3d1328c06d0781bae61e7d9a0d729ac9893734744b1062effeaf1'
        'b3a8f2324ef1de92d0a4eccdeccdcd7237d1989ebdf496ad653aabab7bfc1a8a4e6e87e853d18b04b260860f5af93317cea6675f08bab5b27bc1095f8057c45a'
        'f4ab573730d2c37f8dcb62b27774a6068529d05ff3827f67d8ef69cf59a6c6f3608f8f81efa6db90fb57b71a7d1b96c1affa590ca477b2bcbd473c90a990a02f'
        '6aa92a103890481c1906b57d660d49994644a40107efe9fd26e3a17c62494b7a449da8e0b6701cbc308fa431acdf1480d3ddb74da82c437828bac12cfe2036d1'
        'ea71b68f81b7b039766aae9a49551f3a351b1933b5779756f4311240e0c22e2a95b69166773d33d1ac6a6a3d78151dc3f159a087edd3cf39a6ace4e51f929e43'
        '832522f36c99cefeb4efd8ce93cda5602493fc5c36746acb1d7e45801a82c9d09c9339d5936cc16ff86eb50b36f4cbb2f2df076096ae668366952a8bae50fba9'
        'e335fc051fd3e162f5a6a7e16376c4ae3bdc3dd7acb1d4f3b3f0da635f16eb7c907fc8dd51e6c3750cb897237e21d86ea0cc98bdeba31aff5ae6377548d08c53'
        'bd05d3804fbe8a010192a57bff7709415776631cff83af8fa75b794c81f8350bd31f3a04ed8222fc66dda50760df2058403c78b4c0e049b9942776141f76ee06'
        'ab44c6f6811fc0a4761450f109d55d3cd2a8c6204c5e3ec15a146aeef634be1e67cff11d078ff13233edf7266641d834b5d0927b0fbf1460e235c5d59ca5a83a'
        '2504b5e7d716c852a65d95899287423b1fc8415efd5f390b1430916a252560f06180eb8c556603cb54cd2b0a36e5141d4a0da254a636b4ed03e813a0d0619ece'
        '76168f960c96a164c2a537252dfed16ba21176c79bd0635c657b34311f1fabefc4a7f6f8c6fd0c058c03aaa6246ad181aba4d1329fc8bc7e40d19ad2940e4831'
        '5f3900c6aee4cbcaac461aaf78d41573d9b87a6b5dab6c3e60259997aa4e5479f0439e3ccfa41551b69331e00e95d4d55013b0a5f2c51b44d590c2336af03c78'
        '5f316c3630d20cf3b010a25f6ac36511926e9fb65facf22f8af381c81fcbe69b2b6a6c24c6a23e339dc74699a01d742c275ecf1e3a633acea335399d271d38fd'
        '87e5ae899ce05164e36f11c2101bb7d849720048f8abc7130c5864f20c54b7388c0f20f0367e28dd1845773a11d48682a57d7f608e3a755052ae4f0821ef88bc'
        '2d54227db526243b8e770cdb3a552eaf7656783e0a0788bef6d4dc9eff3d2b7a048107b4af2ff2ae3f12cc88243e503080aad5491d5881ea0d2c1b1f04b45cd7'
        '3448c07a1e056ffccbb6cf8a4966d86104db9085cf286f83763d4433985b444540fca64bf1d2f7c776cae4148cf449b7eb7f7938bdd6fc721a723ecaf312a6dd'
        '7832f87265c7848240c26f2edebb01acea66325245a63e3f76bbc987a723d4fd45fb049e2f1f533b9a03c37d9cfb73f50fd11ecb4c3a1778e12c9010a91a1338'
        '662d04be0133034cf20a17208886da46154b0e3ae968f59a06632f89e055b6c3019a0b04a106d02a4af2238675caf5ba7c5edfb997f1cceb438240a948323697'
        '76837da19362f86b1cd93b0dc554051221c18e008a6a4dd1af99305b22c2392f4bfec57bf8ea512ef041c64048cc8694071a8e0b8b7c1599f5cce2ef9b586667'
        'e05bcff53307bf0f1365850bccfd682bc97050c3eedc22e95eee40e67dec806891dca6ed14f5ac5b877f3a8a99e211e5b5705f7e6c22771c1285e5dee5529bdc'
        '688c213e92e2345e50893e44a63065e1c3078812cba900302ac4313dc60905d456b8f9566affd10c1092088c1e84be62c846105a6237fcc3dde5456b2113e221'
        'b0c569dcaac5eb9dc893f046d4aed66065c8d083bbe439935ee51da0c550759acdd36bc29aa76b7d060979e50825f492ca3d4a32f2bf901310d6f6dcd88fe584'
        'c09086565dcce723788478f41883fbdc51187b52926eb1040a17224b6459916212787a70143ff11838d62fd8e8913f74107295ba8232c9b0f80040462c69aa36'
        'a013e34b0f60a01dc2ddf466e4c4904b02496bfd72daf1a3c39e84d46bbdf06a376b6ffa54086f8a300175433beedb1ccc906d62bc405f35f3c9986d1d4f3339'
        '83fdbe70899b7a778aa477897a2e78a6ec46727e14b1f71ef6128c4271ecd1f85e8deaf72d8abf2eae243e206f839d4f5d4b015be2c98967eacbc72a9c30c7ae'
        'f030fb0a26ba3dad3bb3e0bda4c8d6631e7f7d62554f78e0063fc1ba5776680a13ec16a2d8b98112f176258fa7f111ccff43438759ea88413ba04963b3349d3f'
        'cc36c247d4c03a5c975e93827915d1a872dcdfcb66553349317514b673a6b69cbc19d3db81184a5bb7a207f0d0b0c5c80c3afdc6ac1cebca35e39e7fe6377169'
        '6e07dd72d826ad4f42d9f40620ec20cb8d942f5987d963f73bc68116897977373e8a799bd02888aa667dd509935f8f4e163f4112fda951b184e597e14220c5cd'
        '7e348fc0966edc49d5846385e3cfc9dd07298ce54732bb2b7e39942620c513e4fe0eccba3eda01e1d0d3dd437dcf55a14d6e9eb76614a514c8df13c08f93ca19'
        'acd6fcf01ca1a18132b89f3f519684200ae8cc4ccb961abc0bfc416a61d2a567556bc4b8f762b8fdc4a48ff90bdfc58e0b049c3c6f7843eb4462d77cc4d04716')
