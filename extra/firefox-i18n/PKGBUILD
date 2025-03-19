# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=136.0.2
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

b2sums=('3216e78b23ecb79291f0cbe0cccc44961b57401eea849d50194fd06c30f890f78df3877d0e97cd774cf137e92ec179730e621a37b5bc75229a0220e9f1ed957c'
        'SKIP'
        '1201107574ad2fd46d7b4ba3b7e1b86ed19a7a9b19a841c032088214384c611464fa593ad691e618f4943ed85255589b63d753fc0ca08c2f6c75d6f9a53c60c3'
        'c4625331df79759c3454b6cdf093ce196c5ecaabd25ced1ee568bb5197876506733609d5aa6647096e328dfbb0a21309fb58748d1646ebb1a6df623d33377043'
        'f400d031879988a2f07be9d72b71e8a6d24f3fccadf4f26428d29e477ba1deff06177caa58149af944151ac08143df3a40fab4f79cc3df04d034d1118605acee'
        'e65760e7a56ee0576060fc89fc935b3500436496c3ef0b8a764e60a3fccf0f794cf76901290a67d15a02302c4213c0f2708194aaee387e13c1cf97b6a9eb42ba'
        'af1a5381f1db6ab25110c64879f939211c67b62880a2c4aadda72868423b8a7d91bd732309f66f85ede3cc6a91a43e28df984bf72375f442baae6b0b57e454c5'
        'c5766b30737caac870f4138ab5b8a04b8df4ff3f331db2115be43a3573ea68f3d3faeba953d8b23eb7a76825ce61509e668d132a909520e49633c886d0c8a170'
        '3895cffaee30e5d7089e47e8e2e5640314f2e822209541026d33e2c26ec0c3a26ef2d153759b07d1495d2a872446a0d1d71cc958fc8fef393fb4aa535165a13e'
        '93dac82ae0167b36189c2c26a30dbe8c36896cc5acaef40f23f5c25d0c6fac6c72b091483c7e60ff31c1352fc99fe748cdc62c4c86d20117540a7ef296120868'
        '6004ff1f997bf650eecd4f6edb0abb68394537f2c0ced2b02058dd49ef1783dbae8ea544826b5941bebe25c1f215d14e00005936389371fe1b04763369844bfd'
        'dd6b9ed5619276d4fa94019bf9bab8400cafacccebcf07dc91981a2c5123207185212d271b1e43cd6f2e86ed64ce8dcc7ec0e875529113f8bf70fa882a41922e'
        '69c4a7f3826fb67c85a1b64e695b13ac12a494d33a7a79dbd6e712ea9fa405ebce87be3a354fb4b2a16937cd7fca0599a013c80126693bdb9a728f3fc3c5d806'
        'ac27e9b65ac5586a30a93bcc071bdc032971a216b272651811f9352ba6fcfd5d47bd1ea7e4bf8918df0849df5b7b7eff6bd6d71bd407f8e2acc4350d12ddfc25'
        '01747b8e9b333ef373801848c15fcbdffb2d940501ddabec0ddd7b9bd8496981ebfc4ef9617b5512dad740419c58239d70b281aef19e5aafcee6fee174bdc74f'
        'f68fb89d132fc74679fb0a69384057c73614c9cb657c7c10dbbe046f952daa311bddc10e6bbbdfb0ebf6cec0607a621a8d55108e7339e6ee6425253589465c98'
        'f90eedb2addd5f138978a8982e58b07516378604622b50fe04a3ed3235cd5e08a0be71a974a81c7fc71458d08c3ffecd2b44ae4ca83f70e3e50611eef4001993'
        'c59ea972d03cb6eadee6595ed25c0044b1991e3208154c0ef52314d5f6f559ef736fa9d97ceddb4821e3bf1414910d8ad984bf34d82b164030bc541d8281a03c'
        '1b8da5a1fef6a50aa35197f006c016a4cf1dd35af546f881efb9bf0b959e5ba5507f9e8fa869c778f43a7a69967b06709cbc5a38d71358bc63722288d7242542'
        'e67d71c69e45f0b9d2a401cfbc37d3d69418cec8cc42675bf4273f204de6e996b97b5be4a78289566e6537338da00244f6e56ff66adbb67697fb12c1d89d0ae6'
        '4365699e8e0cd25898e3acbb24ad0bb05f082145e1b13845139adc0051395aa862de80bec33f8f16039da5cc32b98659f6eea023da98de486a2e44e724218a43'
        'c51bf8c581f096b881924e54649eee58902f87afbce6402f4a1c42004b16f919550946ebfcd6a39aaf149f3d61cc514ecf63c033f2e7f633b844dfb82d4580bd'
        'e04948148783f344bb5363ea1c018e33f80c401840c1a5f96f29c5f0408a63d35cf4f37d7cb11b7978b08206940376df673db4f01b6fb0ac416b357985547c54'
        '77ad89f755cfb746307e5cb6222fce18017d44d34a026464d225abfd888b992ddcfe04b6f6fa2a30c0b48e7c112eec7a94584b5bd4de7a4c24e56e2b761fbce5'
        '55a06735b9f9f2a1a5b4ef27e8d3a24154fa93b08cba97f237e6345ed9d49ab13c4ce450f97fc63d76d112bd85d454cb9f471e4e964f51eb297c627027d58e4d'
        '2b200b6798ef8bbd31f7609bf20695a67934d919dad65e7906e512c6ff970339f9c8e2b3e641f1d2facaca21032d5d5aa388bc98c3eed53c246d6edcd78ecb14'
        'c39e9eed906a5e937e42c0dc766706355d2720740d469eab81d44dc6c67111269c7b74962544ee19ce497d7a99cdadcb057ac329545cc510351805ef2e8b5733'
        '914e60d22bcf42d8dc281ecd61eac0e4d36e4275b452dbc301a44e0f7f20e45a9b03791727df79235058f2e50852ed9fa0a50d2448a43c8789383005094aaf96'
        '8ed11078bf2121614d4445aa78b65d84cce8d21e510146cddf6af9b10d0a8813606ed2f161b1e904e47425efe9b5deb5db958e7d28c4a6308cacd51335cdfce2'
        '063313908692fe702c2eff808ac7c9fb46fe34142975f5aaa9deab21edec7b779b6037a4a7accc26d5dcc8d1f6d7ef84d798fb2e8d63c9e372258033d9ec5844'
        '751398e306accafe3a58440d8fd16470bb783e7e1b3393ca62bb2a307aa338680b72bf7321ba248f9ba8e598dcd364483d34c1ae9f4a2f559cff5191e272f5ed'
        '204b7294a134dd7a07ee5f4aba33bfe7456fb9b906ebc2f59292476c0faa60f2c98badcef35a53482196139d68fead435a7c22caffd5bfd7248c7705416bae3e'
        '455398f1cb4e2081aae127f731a7abcb6a4827925c73d38cb02f6cefe437c9c5bda922cb061665c1568eeccf11780a8c4fff68b5ca93ff534a86d7e6853c1ca3'
        '58d531879887377e9b10d8b0535124427c5e49aa1432cca16311bc135310b6ef3b50328516192a70376fdcf185032cfffa38f706763ccec7f9df3be2bfd16cd9'
        '53f5f9b4b33f4b25e275ff8e2fbb6be0187056912f5f7686623976e62f130761fc6dd8be7ac5f20cdd7c8c3aeb493fbfbebcb6704a7ac528f76c57c557faa9f2'
        '42ffc97865295b59038d23f773fcdca419004b6e2b3e52a2f55dc14cdd7030a3c4e79daf034d49376e812837ea39dd06f212b6ddeffd76ee8d17f7d33930bc31'
        '597d1fca711d4c17536998cee7f827715314cefb8434e90a02a494fff0f23fce5bb9539414045fcef61e42a379e13829421cf787702d2eab92a76733a100c5eb'
        '66246ba48aa5afcdcb3873a9a15455d71166e9e9f702500fcfece495a7a1ae7f1ff0abad892f1898d21ffda2803dc5044850a562fda93dcd6bb36e75e39293ad'
        'cbbd06cc2138c62cc300c6fd6e5f1554d7665d47ef24f4a6b84990659f77229b5dfa279cccc114c2999ae11e1f28ba0c2e2ab0108c9030233c25e06a5072fcfe'
        '7557967bfbd99af5a099efeefc2e2ed0555f10a91de59c876c892e8b12404ce50612ea29f81e530c3ea627fe28ad14e63d33937fc3d6f9a829d6ab8871883483'
        '591275d91526bc4a21e58950fd500390523562a4812ec46aabfbe28f09dba03f6a487d19bbe802aa1a1ee4ae5d476f1cfea80872af7ec8ff9c3414379d4c05ff'
        'b7463118084e98fa9fe514e1eda9b1f3a596b5200a5eaf84ce57e110fb1c312569fe8c5e4cf6244d8524a717e39e1f6e41e39e732e8983fcff04b5915e9ee89b'
        'b1869ff70691b1a608cd7cc1b8aa02a3a1d9b82c8b647186c206f9a1de70fe8777993606bb9e2c3c80b39fa58d800d963c69fcc861f41eb7c72d1e4e7589f29e'
        '94df4107b9b31433b6d2b49c769f71f153e8a9b98e8b867b51a7000c314a6f46b9110f9ed47d84122874c21b37513bdc68ccc899fc91e540edc436a10bbc2dd4'
        'f0a733dfe0a21040937150efbe7e874b5877c1a6334e679a00dabafd3e73342a0e3dac65a4068716c7e34dff419a3b3a7a4b91fe5446af6cc571b78c8c210a5d'
        'bde9472da9fbec877a418ac86786328e9dc33f517f4533853209ef77bc2e3dc79f7c858bdd3defba36a68ec0af2b7973fd3e57f2bd75e751a583314dd9b8195a'
        '9d726420d66b6551880c7e4ea9a9091c92e9d4b312f0ba2d5dc9b87affd4fc47f278b995c6cf6720cca8d98b38739289cc594cae789485f18afe6b84747bd07e'
        '8085e66c18bc713a9e7481cffc1e8611bb4780f136cc3ce1943fdc2d9a039ab6a78aec574789950e447c604ffbda06dd2081a4b898189f9b68ad930083e7df32'
        '5e93adf7ce7bf7712aed39a1a23802c08c28e21595de87b3bb63effd4486bca435c23e12e044c5c2df3645155127eb5e51619e941d24bd830d585d0ebbae154b'
        '4e22ca63a629c2380c95b09d04ffef70c6042d9b127d87bf6ff98911e48c307d3ce3bb0149c801b8323f005a80569545f623fe9f2c0bb69139913be1d022c059'
        '7ea041cd5ff8576b21a4f2e2793f7c3f3edd9ec1f55956d17e2cbcf762c5a0864d4116bcb38274aa4eab0f11d96566f3f58fc1f0ec13ab61bc5f59cf2732e2fe'
        'dff7c4edb7a81ef6bd92c09e21fb02aa60fb49c09027f289a7488d83e9d1af6dfa2e8f890016a2f83f63b889340404b1bad2a985fd1011b64c80c90751bb729b'
        '0620bba42f0b5a54a0f27dead65245a5072f542d88a4a7c3db981bcbf1adde6df646c9764cefaab0f97dbbf15a851dfae12e059fd85d8b2efaf4086fe7e50876'
        '73d463eb0fdf1d9d3a797f7f1d7387a65a65c94082b9b4af6036c49372accd0e13d22ce2221a6a5684f4684c292ad26218c3652a087648c9f64c2ca4f3513fb0'
        'f2b271eac7d06ee47e747cdc06e52afb90d9a3b9e20f34e427c71a4e8336fecb469a4590487afb2fbe9d758be70c73af949e4bc108fc0d69e131055cbe04dc55'
        '047103d290647f889a2adf14223ae1a4149301e6978468b6f89dd340360ef63964b37401daa53be7720bd2d8cd4505709e222ce98261dabfc8579fa06d29b1bf'
        'bf5700a8ca13f00cdb8fa5be635e34241cd61d166eb3640b49ca66170a3a91e0373339b09e331b865bca0c7bb4541a9e119702d20469f6807826480f92da8eba'
        '314ad53f107869ef4bc311b59dd49d1aba09ef1e0b46da5f362a10924ead5f02cb914ac82eb42de82e1ec2d1f79ea32e782a02ecb78633414164996185ef4d20'
        '39b57e32c64ffa75877392a2bb637b4a0cfd4031ae031445d0e9b6af5512653aedfc13a9e3ad3f5a5b0b027c849d22dbdcbb53b647fdf5476fc416d1f86808e2'
        '49c8d2783fd3a6e7dbbc5218ce84bd8ef993d4ef90778a009c81c18bf77f3cc31db1a8ab031c12fd1f581f417c57cfd953ca528395e61d5da863b15bfa35a1a7'
        'c2a6ab9d56ad91915cc8fda2cbf787c8da691001bc551c8e42f24bca7c9972f1e8a4d932984ba8a70228180e2c6f23d905a2c024d22c9b45a1ae134b7ce77a68'
        'f557eced0c63acce19ccf7bb7d57a9bc7680f997eb373c5fb281c7dfb9aa49afac43d430bdbd5c55502e9226caa247434cb5f27984ac6fb9f816c316607d66c5'
        '989d58a0d479804e0ea294372f4522f0e3ed9b186e251433417dd8895adb1f2a5bbe7eb3e7ae9c3b58b185849af80d618a9becc297bde56483a099d216b25205'
        '7bca62a2aeb76c90ae168a93ee4176c2a6ea7ee415b1c099ceb956fb945201410ac364e4f739ab956eee163365451fd9d0f7e53dd128cafaaba8d5f1623bdb16'
        '8c10f08e54a6bfe81f78668446982be386ebb31cf0f5974d7f5eda14f74b908213ac92e7aa22443545a87e8318d1f25021728d2005428f97a7737876b7ba6118'
        '1d14aba7a95a24014dbac36d99807342c1a5667062cfd298dd744ca8c48ca99d7463b5bfcb9dcf641202f38aa182e053f09a922febcf9110c3b957573b77c701'
        '08874e9a735954f879e226ba4795eefba923ed93491ccbed83319ac56ace4ba5f45ccb9b4b639b6fb82d669faddf36349354f1886b5fa70b892f79e3693eb3d7'
        '45626a67730f34a371853d5b41a901b1ba9a9e76800e82a46464f3576fa21771af0d9e262e2f0efa3f86d48c291a62a9d85c5c8ed8e584b1fb9ace93c1d2a790'
        '78c7da8705c5a21b3d7f506f7064627ee618453c9a5fa78ef799ca5765196d17456586050974503dbf21084219abc07e7a708417c92e5012ae96d5051e61a04e'
        'a0c7465baabd2a4b8634b25789879cf21493b13cd89594599904c8aba623294bdcdcdac4220fb1fb4e24992df9117576d8480a5f746f5b080ff9e36c630e951a'
        '30f1dc52c4551a577b89713ad728035364bd6343f17f84927b98aeddcd461961ad9df6513e3a510ed86588684cddb80af8357736ba89c404b5f2e39cc3430689'
        '1c33c2a05f5cdc90404fb3f8b55ae903f5cf97115c2774c055044b34deba6ef748fd051d926492a42f9d84a8b0edab885d33838a06d0a014bfa4a0b8b50a4bac'
        '4dda593ed4afaedf66c288d658b66679d8f94359ad65d0a18bf7567d153528152e4d5e65a801cea17437d342b0fdb55a0d385b88e3de25d17601830c120f30b4'
        '4dac31164d978c73467f756236ea94ef93c26c52682d2e5e24ce23d1409f68ee9a16d198226edddc9370be5eaa2f1d84d251e10ce278ee2dfd29283812bc736e'
        '10f93c12497964452e24bb4241816ed8cec4bbe38432eeef4c66f371b28f48f7a7b5368c28f13d1fd4d5dc878f6e20a4f90bd1e788dbbff4e13f9f762134459e'
        '867014302296d29d4209f791c2d9a17000744b5878816084f01012a39fdfb5b38f2bdce14f49718d3726ea279166a1c54e9172007a63c479df1d37a3dfea591b'
        '2cd400102556fe9cc3c4b6e71b91ca6075b764499a9922e49dc59ef517abb7e9f5e4c1e1967b7648bb4a2393ac01e893f7d2b92ce3fd6edd266ba74d0c2c8ce2'
        '7e61b615a9d0e54e0de1700a7d1eac1a2fcabdb48b8f59fe716a4e1070e5b2dff427d1c527c76571f7c4e88df73115f8b2a74a3449e73d0abdf34635a4224721'
        'af4f00fb425ff27862dccecbbe7c354422ca07a01519276b0c637f0faa6bcd31e3fcec817be9ee2714f32b3654f0af71a79aff2e78ebb6f5c80982bbe20e639f'
        '4e1f6dfb6cd677c1ca3660b4e6a75c4e8c7545dca52102f786e185b77f3193494c57e79f4faee601074e84c932d071349b1d59d23e5103e6101541d616206e06'
        '1e8e3d5eabea22337f853fcac31c97fab4f4b498944ccfdba208a6136956433568647a08b6ddfca844d7c67431ba4f2c349605fd56866915b0e2754e493cf535'
        '81db2d2d5f4ab6f1a9df9833f090edc72497a6b35498cdc8ec8ff4a7e7e2b736d8609565ba2353d6ed3f3808aff27e6624e6d836ba5e819f11e4004a411b44e9'
        '2b8c0659b0e1e6294622bef085a81c08f6cc4f3953ecba620468106e2f89f173a173f8eaa03441d07ab7d3884edb49748665372f54a584349d28c90c3f7340e0'
        'e7ac831f34a3cce9885dcfe9ff2c2e6b2d66d3b80d73736995bb857fb828e31114f51a4678e2bbc3f23fbec1857891bf5d6b1e50edfa94c34560c0a7142c94ba'
        '35cb2a2dacdc4f0548373052fe05cee969a41dbc5e23b856e414c0913d100789fcf9e05b0aead9b6400b935005ce6486e802832aec4eaddfdb345eec51db6c2c'
        '9d6ab3e2a9de53850257fc529a9353d7eaeaa09c3e18da5856cc4ccedc4d004ffb765af6ff5ec057784430585d9345fb39bf374807a4e43e149ab58c702fa8ee'
        '496aa6a298ff07b14b19614ea67d1b9576658dc3c83e68b66261a1c0739c810ee80bf617be7a4f36d5c3ae5b8f296763ac55776ff3dd8122e84c46d9baaf7991'
        '4b4f2e254e61ad75d732aa154c85015c8d96b8bd345dae5b135a3467c5db597ad0488b5c2ce98eda4457be0e73900e8a85ae720794ac9658bf83285fc82b19ef'
        '0d2c3d7e7e1a77c09eff575b0f15cf5381f9a1c9b1f9be4d0d8b6fcc06ae00b793ae27527b2c2a78eb7fdd7e54025d9452a21f4a658003b64b8b8110cc61f0ed'
        'ad7b0b2d0bc1ef528324677bd06ab18d60eed28206b5e5b15c02a9bde377df228b70521a9e8760d7e889e79ffc7aec8166e903f114ee6f972d72ebd2b4819b2c'
        'd3c0088114052b142b4c0307b3ea6b7cbb8d8dace892a11c6688fc8a970802dc78d88889930da2211598ef69a6c34a2bf5cfbeabdf6cb1946674ab5f9cc10620'
        '091685d96d18f81f795d2c18165bb235cc4824037fc72171efd3fbbfed412f20fd5564eb23ce1639d82eb4d0042e739609bbf8ae3e1ef05c9f2df09d459fcdb6'
        '6ba6a2e960666493c9a3077cca7eb848275870d435eea041bdf671414dcc86866f29b8adbbd6a08f153022309fb382b72d92992d55acffc41fcbc3cbead130d6'
        'a6458dd1fddb6589fbe800d502c9aae7d6130f9aea0aa770a914fee70760f794fe663b7d13a2310f5a86705bac8261a16c99dcd06a9877ce4dadf45348b0d0a9'
        '652e543ef32cdba55e8ae5f25f9d0cc37891b245ac794c79de9c43314c4fdaa2cf48810d5cbe69436426cc7b69d48171ebb362d911c324dc594e01f5b4dc091f'
        'dd778cc0380672290245c56c5d00db98ba14dd491fae5b55613fa0b6a5489ec9bd40471072319e5f8d2b752b28e20d41196e8392108b07898042cfbbf396d4a6'
        '037909f5c974d898d96ef713ac523e8bab31b7c369556c3c762331e795845d0138dfc686ea48345d57c5f9ed4af275609a2ac2b1f1101872e81bb23df2553c53'
        '093ee98532cc81905e0b66f53181801bb4ff014db27b428ad6f4db235319a5f0650e1de4c69948850a33c1136c40d7499d4a6d51b8f918755aa25bad7a985900'
        'ac37d3e1d8d3ff27fe8faea02fe8877a0044ddc99383167368f6c9571ea11872241afa1c1477e304a78730481cdc707de2b5ac4394e170acd196fba21cfdfe65'
        '103b601473db4ae25c763b241e6ccfdee2bda7b9a1de6c0fdc2c91919bb36315819b861959c12866b91fdabd588bd216582247cbc794165930a6a0a4d1febe71'
        '9160ea1b7245f2ce560e01f2a8e7a3ada6f61db58d8668cb630f2ef1802a66aa2eab2cc4a311fece77b5eded157a5983ff25282b391bfdca352cce75957271a2'
        '1e28d8f57cac1d84cdf32f783b3f0db3f47602e09de38ade44e6668ddf14eed6f9aec9a4dac8c27fe5d7a06978d9431b90613fe564ccd398e2e56e7748bb0e02'
        'e15fd34f3462e3e2ba12af675ab7256c46812614789f22f1f578278537e385444b6aa3d8d8a3b6da49e609e9ad92ffedd102b65f4c32e494f08ecefce2be24dd'
        '8ca76457ea41a9a5d7b1b9e710c508febbc333f9aca1ba65c1b199f76cf0c1ea18d38fd398b2aa8b3d70e205f47931f65a22403dc16c048ac7ff489aab53f51f'
        '128b68f4259e577ef6052185d96a1da4d790f8af55629b4fbd87a857baa50d2a4c6b0543dd15c2df807280de9c37f4a4689db9b1aa9ea40aa6f2dda52958e1e9')
