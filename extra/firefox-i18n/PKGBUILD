# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=128.0.3
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

b2sums=('e992fe24ccfed5916b873012ce310eed8876b45ae489492c30403bd7c04301d2fe7a44c6c63fd7a09cba28a154ca54b0f49d625086a46124dabe76ea7a842c46'
        'SKIP'
        'bd1e92adb3cb6f1f4f61e9c1a168190c26972ef846fcf45cd14e7f29d6b5940611d6348fd6b3815f356f80bc9ccf5143775fc602cbb2035ab33bd77391721139'
        '45b368d5bdbabeab7cace3e29dfad7d2cf4957fbba446a9ace922c0f6cb0683de1d634a9146dda7367a376b6802d6579d2f0ef1095bda24886a3fdae87dd6ad5'
        '0f9ecd72aa5b4bd5af3a659002b9956bf9bcfdb3a709b5f698afaf393e6426b3606ad6140b861e5740edf40910b9d1d07dc6eb092cfb1d742b07dab209803295'
        '5176beb66f9425c5996fadac95cf17c9377840d0e6a6dfeb4161f51f6538afa0fae0188be85f802ac0be5e20d658fd0687c7e2ead170525476335cc8890d100c'
        'f0abb0158c2fec99b922402eaf070252096723b2cce94ac815f458b01ce4a671c1152875448ef138ad38ec6b4d33bf0f8bb294ca0efa8558e639462167cc6e50'
        '311b1ba01f7eb728c8186dcd08c7b65578b67086003b696f4e08cb10dfb6771d35c9c88d25cd42ed8b3f75445c6e4ff88930c9346f832519245afe24008ff256'
        '1b48e36e40f5ea942afe17a751d17be28644b75ee9bafce2f1d33e00ff3d8f9850eb5f146a3e5ddfcd613b8f441c1000946ae22ddba74127ac317762c5ead1bf'
        'ec4c722681e6d15e01f3fbdfaba5879a906ab790c09b295f4bcd7aa6272a64a2a3714d4fcd60fe28adc1a8a469d9842ef95ca158ce9d0a31dc52cbc26e7d6413'
        'a7dd44af2911ed3a24f738e6e4c29fcb2789658bad7a52389e4647a2afb57e2741a8f54a282d6a540fe27fac9e424dadc1e79b3838508f52ab8b71bfbd79468c'
        '6b453122beb85b5462feb48a38bbe0bf968dd69df5d08e322286cc0b7d42ce48f603e29da0bb1b48d63ac9ce46192b391fe237ea8ff37789bdb007b422f7830b'
        '1f04823572f0aea757d5906575d0c3c8cd5d6089503f8622e104f00da971ce5c44a436bfdc0506b1c93194a54d1335d4fe353c377614927bfa9348d4a2e3c7b1'
        'd99208ac1f2c7fc9736b9575c7826fee0f1a4588488d873aa689d66b328d569b8ccbc79e7c1c478b19b3d86ca40d1143efdd0eaa7bbcfa091d04614639d689fb'
        'e1a59c44c5a00703e906dba00317636fb85461c4635a44419fca74320d4f07359e43806d5a3c19fc2f5f8e8f298902dfb40de8e346514ffce16138b802f2f6ea'
        'ab040d4397c6c14b2590c66845ddb32e04c9e421f63630924c5c8c42218911b80ae2d7e4d8eebf4b1cdb924e1908c7ffc8198344b015e8e4353e6fbe260f9298'
        '77440f97c2def843531d0da78d2fa187493781902415ccb8f1ccdbe54569204f63f9f786d60011ece646201adaa6bc405c6156e04492f4322ef38786898f1bea'
        '4c6832f17b962bc303c06493eb5611a512f4d12c49154b7659c081a9ed6fede434c55d141ac37d513dfa0d9ca8450f238dba269461529008dd240f92fe938f8f'
        '9015d327ac2a263a0c344cda13bbf68467038fc5fc0b1eae05aa8db86c38026f7e69f4a34a0877a12abc6a0e56aaff009bdb1137f28b6833d4313eb5835f439e'
        'f86ccebc80756fb5ff83a8a56e1e05814605c3e6caeaf17f4bca1d828b51c0f99f18254484aa6ccbed5aa265881c2ffdb8e12efcfcff5fd444e64d2f35d2db3b'
        'c96a1a12a5afaaad739e05e0e319440d4cc69561dd7f715153753b4c93a2f7e26708eb33a91d7f83375af6d5757226f6e93fa9ae39439d8b462fd66885227ed4'
        '8b33f0a93ce6afb660b2c6782515b52534e39a136dcafb7b93b706e2b6f6fbbd26ab62797b0f6e4a837f9d52879a43babb8c26ea0cef987a149078f3a45dc637'
        '8387203395cbd953bf19962d2afc473e95237bd2c4f41be9dbd109ae114bd51c2b91edd948b6196835a3a4d24f49ae4ca882799ed39996e5aaf82c4ac837622d'
        'f30f63c71bdb7d4836f87aa7b7b4adb45c5fdbceeb24e83b5176e261e50143045fa678a06098f0abd8636748aed74b9bd95dfbacc9edea99c88a747fe6eef34f'
        '4e65cd5c7794c08354322af22cac5cc6ece45492a7242bcd2f5bf5b5c347e7924d606c954be3211f15d57d5c400884af3f6cbf09d12b073f4dc4f38f74747103'
        '45f53a29dee57ba65911bfee5197f0a6fd57e16ea33a550a81d19bef57ba3937ea87a023a8bd63db6cf96d2f8ae93965b8572274a6e3c852df7b42911fdc7277'
        '41f2e8ce30210bf5b16ef41294c851e8233090a6d96676ff664369633dc9ba01d23946316812c1b7443f7195f62b7d7e07281e69b84bdad7f4f77e97620eb35c'
        '8c25642bc62cbcd3196840296acb71e91dec55c8ec92b2132a1dbc83868a82cf64675720bb52c9fd3069cdadc961295e93dbe3ce4cec0cd2c718ef154d42fb4b'
        '8c65633ced118634a2d948230e9666480dbba8184b85d85bc0e0f932c379143c0318dfac60f94c5b589d10197fe5c9fe24f9850ce43115ed2a1ff4fdf5a04565'
        '13514fdf5b7cecfeb365f4d486da91fd8326db66d07a8360416f0e364ea01a4c5abe14e54272f599b1877b4c5ce4dfdb4393ac986da14407d0f547769e1f1b2e'
        '451d9a8605d16f53044271e98b0920ca5b2bc099e142c087cd5b1df5984c5f8291f98236e5f0f4d73cbbfd061bea7d2b0c9b55b2ae4ea094d333d1cdb0e9caa8'
        '8105442b04a5c9eb520caed777311997c5d6f60793f2f3347bb66189a1275e4f1d47b7d9c701538e97248f884d50839769fd5bb806f6490727e4a68900221582'
        '7b2dfacbb93ba1e3b667c79e5073414c629db63595b519cdf4a9c8ce6bd104ba9a1208d1a44fd9f73fa25a242842908db5e5ec36a44ed46cd31e8134a5d26357'
        '931afa781fa667af22c0b51fd59b9a1ed312c7db3cb91a42b74309198f2a71c71b70a0df6768084e39077b5115fd908561d58b28c2f6d8b0bc3f1f8893a073cf'
        'a207329da5efdafb981ebaf5316504edbad5180377765bef51d4cdad5a7e0e1b4266dc0e7bba922b593d9955fd25dcc5661abaae5d1337a3eae67abbb2347644'
        '5f3d77d8489322a04611d9938fa4db843d9d57caf65bb18ea95317bcbbbaa43fe97a937c79ba9e3fe2ae813da6a0d8315e2215e0fe9232e9f4b9e4606ae7bb52'
        '0b005856dd524faa70b3df7d2f5f5c7bba1ad4a7e6eac96c854c7ee34e015434fb136fbd15ad6bf4ce9dcb112bd546599939101359302d5703a0c497b06a75e6'
        'f5a1668fba78d69fd366db423e07603b7209c9cf1c28ec88d3a9042fccac16f8a90ae7a6b7e3e8c3271541c98869f0f82cb965e4738747f0d04c53786f6af514'
        '69047a8ebc01e503f4a972d215081b2c9833209f2ad714e0f2580727f7c080557b87137f46af7d0d04221edbd3888581eeec1c57ce30103e17258b279f4e003a'
        '7f8cb4e09c817927fe2d6bc1e4253c0e6297226c67051ed3c4982155519ce25f8c87d36ac42f51bffc24a838a7c1158275447d19f7623ebfbca35e37cd3b9dc8'
        '96e4aa3efb08935d34e15b946975482c271bd9ba871ca00dd7a3c4996a16045b58d224b8183d9e5c3d8393ef1e3627e9e14b7a89f1d8b3cd1dae9ee819dcf808'
        'bdee578c515ed1a03e123c50b1ee8a63e6204fd46e67a51d541394b382238b6f35c97a524b16d9080276e75ef024cab834a36d95950eb930312c577bccaf5794'
        'd06eb237de22b1977831568424837eac47305cd8ef0114074c9ce2437a4f9da003b820bce722293b36303c23ac3b0142acf1231719573472f545740b78ed8892'
        '38694f10578228bd18f3e810a667575b3a004b02a84de07449506c6c4305d67101c4a7ed31e9d93fbd9cc8ee2bd79d2b681c4900d262d635aaad8d4f71cf2bb8'
        'c77643df28520e35b163d86ded59343a228ed88e55566e035d45d4d1af165a63390d9720c6c2e516cba69b33f0f692062a0971d4a2b3a21ac19981b0456f82cd'
        '32717e35361b2471c9ac163a1bbfc08ba05ae47db26c773ce094196024dd9f80fba173738532a58d07182822a8f5f309d08861f6937b2986b8d0f1298cfbbd2f'
        '2519be9e83cfb86f8cd335926f8e3c99ec9dcba8291ad247f86a0dba7d86d2a71fcc4adcec735195d57f6961290cdf9e766d724cdcb66a84e4ce0d99d90da027'
        '707fb79f74a5b46ca6de44e6d56112c2a49c34422ec95ce6d4f978bea904a2a3f017c88286be882b2c174e7e057b610753c030889c5c54c3ba28f7c42a810cc8'
        '6e90a64ff88c240e253e06a3fde78fb4efa95883f7daec20982ff7402898e3ca1a3c6eea098a27ca6cd15dc84d066eea4f36784f205c95296bf2b8655d5cf167'
        'ff2ab5c4bc21204842145d7a459dc09f99209ad49989e94fd28c0f5b1b34389a2995af3f63dd639c436ebabdaf2cff99c6da94dd3b30f1c3fee385966dea64ae'
        '75d9bd05b30b9d052657ad9d261d5999a60b7ee0fcd80d6e48b45f6019b6c834fc1ba12a32613ba2f255bde8f8165804135f7005e79940d83e44ad2ce87c9ae7'
        '94249d9d33c13d2d43b14032a1c60ef8d2ed59490e8249fa60787a2da489137c38a57a086fa857d215473669a7dbd022c50f73425b29f7ce6d47dd8d013663ce'
        '759bc1e76eb91b0897554a8ec1756c5a34e5a78a91dd2239b89153b2d72b403c06a6f63a08af2ca875764bbbace1c319e36173f7bd76866cff0f14749e0a7658'
        'dac46fcb428768d09ea65fe3aaa73ceb6517a4f14dd2bae6f0ec0f9dbbc9ef2647f0ab9b63d8607c8931316e973a111e54bed6da825e6a790abec5b3497c8e2c'
        '1c81c2351081db0783938c6f0b8512847be4562e67763ea8663fe542ac25f3e48f99edc39547270a0d8282296dc400c65b8f16045795ffee80c085dde7c4b646'
        '345bb1a7f7d2acc5563be97434be928eae6b113ff9ceb6645f834208354beae6f21ff82a6ca7adc0c8eff9fc75c0bd89e63f05b634deed0d8b1cb299fb4b23e8'
        '2ce39e085bccdcd6a1399867bb42e0a74dd4bc2e1508a6f51e5c8ffe4b52901062ab1cac3645c1704569dc1177f58b457a84a6c1c98982fc00a34bcfed112f6f'
        '912b0436ba3b7b339673cdf7c81f79e441f0c442ad72cf9bb27fc553ff178dd4cbd7b519e481632b8295b13ad8bbdcddc82bbefbc3fbbb315c2f73eb6750465b'
        '3e5c41b6ec15d880e1c8f32c96aaefa1fbcc015939765fdd6f15aeba7c01e94f2d52f5d4fdf4cc17ecd0abd22920a572354b3a12dbd78f7bb9e77ae9afcaf3e9'
        '57d7bbfa64e2ba94edc7cf797d48516279ebabaa8e9699871edc428b83b9f7970c6210ff13dd5b8b2916403cf60c74eb9e357078b6c5e5027b982e16a46c05ba'
        'cb59f07aaa69341e117baa9985a5be36232101066d519e240cfc6e819520ef676ca9be09c1b9972182a73446d59bbd5c605171c0f62b9d29d3df2d3745d7b5a7'
        '3603ebfa2cd0ff6d451eaba407a832db725fe8e6e82af9e0465a6cd9249982d1ad6798c22fdc58ff3ec69b77b6aace97b76618b9bd7ddade2efb52d0a9f907ab'
        'fe46033315e198e87469837608e674c8c0fff0a569e61e74a778870615821ad0446946cd6fe8e28be68c37292905444f31862cf01cc61a5fd7c15c09ecd05a20'
        '87598e549efcbd16468d7971f741c0cba877f0cc4396d20d183e49243a685bc557a0ad851bfc5f6f4baf65b27fc7a00655c60192440af4f76dc1ffda5117f86f'
        'a7fd734d1db3bf102560748af542e1b46f44d461af49d60f575dc5a227590eb7b4b8d0fa8699cb0ab02662e40ecdd3f082348dc7959ec7e780da1b3b10433b6f'
        '1fb71d1d685d717ff9422bd1ee20d705d81406924799a559defad2215e5d63cbc3da02f0716291db318de811ce47afddfb5d233350eeda7392c9d1de34f9e609'
        '2d090409ec509e341d5e17de3f792d087372fcd028d790b71939b8334b41f4de87a1c47380ea73a3205dfe166703524d0d49a02a3037db6c064ce326b18628cd'
        'bc56de8a276e2d76091239d735a96c4df9d0b1565ca250062288bd1cf751a4a67cac5a368aed6036d5b80a8c7a548904b09add5ca9758b075b10bbfd74ec374e'
        '216913e673179e124b36413ad702d9ec7dda2284675b6257f234a5ae6417c98013b6c86f096cb91d1be5a1952b35122af1d1ec02caa2ae7a065a69bcc03dc3da'
        'c89c8044d76a0662594709ad3cfe600c1c5abe7276bf8fd91db5a205d7cf15e24384fc294e50768ade1a5a73272b5ebbcfef2df7c2a7f304a4b43a6a4d02a328'
        'a3d2d7760c7b7d47d34964a0314d23c66a608252eef4f7409062955cbebcfc33ecb73cb85b71761ce72cd4a9770aaa8b229c6c43004eb98609286e7f76b8e472'
        '34c0873944523c5aae085ee2decffbe08837c2e81acd049ae9b7b36dfffc6863dcd2d0b89ebafebe3a181af31998c34c4a19782ce0b617158abce6c495ffdb6a'
        '1bfc754b0d9007f76e3b901aa5393a2917aa0c3b750835df96cc47b9cf3c922c84bccff54e7a2b63b8f77a5eb10ef388268148c8a5fca2509972f047282b1060'
        '1113d75c1948f7f18adbc2da3569d8c7319341cd49d157eba17992f3ed72b0644c7dba0b0f3b2c385fd6bf7980f23cd5c34c5388e97d6076b501c85d0cb3bc36'
        '5992d51887d7989051bd60d0925a475899ffa8012d6b3f2421d9dfae092367a3a0ca505e9e6c601a275c482e7166d7f17dfda23c59d6538fe7941497290fc5b5'
        '8b183aca56b82f58f3556427af3681c1c0dc2e3c1a76d67b1ebb6b5419947e5f08441e18302c207f698c7565d6cba045c25583be56c770a56de60a9715c07ea8'
        '5429ec89787901f540d3db31d71664772c5748c297dd1765411bca8cc2d51e1b22a618e15528b11aa33fa93583ea13f0374fe1d54ac0bde896164ab78b37ff57'
        'b40a49d70d64a1582b25c64526c826cb260de98e813babf59473133ff0419fc3a58c29bdcf1d565f744fba5168bb01883b8834ad689f31bf65da94ac47155ef3'
        '0943c618aef992664787cc5ff017317642307cc14d21184ff5a3ec98e28417aac9c22c976f63a0b4468de4b6fd2e57afb6f998d7e6c1f019f4822ba7723f0f53'
        '1311f56ca1c00071f3ac260afdfae778d614f46c235a40765f8728924f1f3db038a93b7a17ec3db03f9cef3439c7039005d26e1d2a906e89e227fecb9bbcf459'
        '7d33c96b2c99418e75bd80a2f7cf1329001cf9d79c79cdc88874795ac17f3b5c242ef58cac4fd90eeddf090c403ef6812b93eadc640047965cb174751edc4fdf'
        '75eab6a274672dfa625f2ac0a1756b9323f024b08780f3ea69c355c1fa85fbb6caed245bcc308620cefcbd04f1a781976d6af74f3ad3f913c45d0a1a5911ed24'
        '16802d279bf3632e518e3e46bac1d182cf1b1648e0e6c150e27e17959e92041e2bc377e94b990d66d71cd6a0b9e7104dd1eaeb00a6fd7e629e8d25277fab8131'
        'f368517d3fca5da608f7dd5930b71271abfbafa8204ca1bf471a34bacdc6b07c9fc657a93e7956a037a9db17448bb49f14b28afcb5695b5720db18b3a3279570'
        '2329f046dc880f0816f6e6d600d2e8d18cb59051f247d6591625f0ab0f4055929bc2af76256fd73d48b892eba681901895f1c021967d0a5fb8a4e72d67278d98'
        'daad5f91bbb5e8bb89d0af35d8ec13161996c2679436a1beb5ad41fa67f8ab322d66c46c44b46e7e8600db5111cba116524b09fd658a4a2c3682a29e3b30a9e8'
        '86685fbe19f40bc7afc376d56635cc87c6224b4d00fc5ab7549bdf21ce7021e9daa60994458994511d131a6888c3a59101341102a4f6164335f0bf234a65f1b4'
        'ed38769559df3bff38eb30a26b3825438f7b54168d17d3537307eaa687e7c58ba5538a7e81ec2f289b3e1b7360ad0c7a019cd8a7d49b30c2732897052812c46c'
        '145dfeed9830d01d0a8ce35df69aed7f625284b626897d683fa9ba8c01921beb54d13e479036aeaadb3449af9fd8758cbb9b3764d17ffc2462d726c2679ce4de'
        '4e192f20586e54061ae120326c759a565318d128ae0fcf1cd0104faf709042b0ae45184f940614cfc4c2bc8dbfa23b2298522a06c3f9e1c7812a0633bb1ecbe3'
        '23b1acbad3a06051efa3b53b1ab43532774e741e2459e476b5f4bae1b66cc9e6d8fcabf708a2899470d6f94392f0f8bf6b41c1f9dcdbddcb0d6dcdeea2ec126e'
        '21e1004fab9d36739a84dc2bed6b951d2b084af7479061eea23fe78805a76849baede4612bc5b4f18151614a434cf84f9cd34fb6806b0c38662517c27bebf1c1'
        'cfd179c8db54f5c98cf3c1d9552d98e279ba8330b6610f64c9d1288b0fe33c39f876ec888d27e4465c233254433a55d3b0aad6510d9e115d8e3f6f63fc274ec6'
        '8b6112d92decaf9e28e08c576b471e1b8750888b6cb9c47fe534996aecf44f9e3ada1d2d1c8fae8689bcaa9c458bba7b4d9e6081b501f7354102bbf2fd638e61'
        '0bbbe31a866de617c80c22ed199bcf09b93fd36c78aa0b4c7ee1317fb7aef4540947e8e6caa48a7d116b790eaa052bbd7b59ca642772e8ece308dc579393af6b'
        '40f1db1b12c292a5e26e97715f0f77a6eb5513f679c21bcf99406bbaba4dd533472138f13cc2be631a402a1e4e57ee932267a061b33d82ce96fd6d30400f2129'
        '0e7c7151e9be548471d07a56b93925b0f7217ecbd7d3b2ed39d8052473644865bd42c53cdb796161672c2b84133dde6c8db70a942daf1a88077810ae0a38afbc'
        '34a4cf3546aee4e4cbdb971eddb640909f45186ac6e8f0746d5cdf22c580fe75ad760866933f44ab8accd44973e3eb85cf2ce5326151efb8cfdfb7b1e92681bd'
        'f7864313a5bcb40f1bb2bffdc6daad3c82e87184a8e4d6d10a18a9d04da6769f402b1cec85cb6ddf8164ee312e8ad686c0aca5d07537d761d7d5153061ae6bbe'
        '0d85acde4aa9e0576aad590fc0c7d3799c73c6d89f9f1b8efaa8ff32f2c889f71382bec19c526c6ee2af0bb86ed9c518ee8dcb8c3b5ef4a65514080e73b1917b'
        '45b321b8143b10099a1246aa99f0f72dcf83c1d4846f7da1b0091a26bbe4ef563aeb51a7501795ca1f2e64d8b3e2dae4a83b6f121dca47989b6ff9d35da3a1eb'
        'f9ef15bd809f99d525792ab9785dc15a892c6118c283f15d79357ed3687a94733e70272126c947e26f7007df74142c5aa3e3861c454c08292ce18c327d9350d5'
        '9e0f3da87a68da99ca52353ba8caccf0993ef27fd2661deaa78687eb6158e0a70c4ce2703390b9f0d9855a7449636dadc1e4cf8cb1fc146ed768eb65dc8d8d8c'
        '85d43be34cdff7ba76c8b9d7466678904b913593abaa4538221a805d59012cc9d4923750d41302057dc768b59a21ad8ea9af367af91c85924368821f303a7036'
        '5f7cfc5d21e1a98396259b46c28ca5531fc50e0fb0b78000915ccd7c97c1885aa53866248a9d8f0134f706bd5a920c63a11937dea304eb7b6c8b5dd00d9370fd')
