# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=134.0.1
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

b2sums=('4dc7c5b7acc051dd2013e12bc6be4e3949ee877a71359d74ad36285d50e5236b66845574b05cc6485b8e614c5b8c3bb2a967c77534b34568ffa95968bb53dc79'
        'SKIP'
        '788b4c43d946082fedebb17be89e3cf434015c882655a5372dcd409d63eb7792ec5e10b1482ce5fd0b925d77441fa12804e4ebfc71a7d82f61d4b0805e7ec0e7'
        '2d7a974dd2862c6e69412045908847ef9725398d099169320da54b03249f9f2e56caef908a416f4e2ac4595bd1ffcb7636f156f8d06de7f4cc198c5de41e6e46'
        '8c161c455a5156992c5927bf7ad72742986a6018c514e71e2b8ff3a9207d86bcd80424c11e18692af8283da8ad8580337984f61cfdc8abeb190b3b2a3ad34270'
        'a19e83d00690f621e2bcc1729a981135e1a888935187057d6263b3d29b5959c4a7f842d0b566a733be15bbbb810bdc857fd7d589e56892bfd50f015a0cbc9855'
        '1bfd6aaa0b1959c1039c1e3b9aa1212ee2bf94d07dee1d0b0e9a77d33ac4c83a58f46bcaac9039a2af6e2fe4a258c54d5478fb0e3211bb146764195eae8516cf'
        'f417e13bc2d2152542becb6143eb7f4af0352d0a82171b729a5d5118ab934af46153bae95f1bad56665567e12dc01bebcd7bd6d5c727183e41993029572c99a9'
        '5fff8ea83331f397a4ab1828cf2fee3645abf897a6fbd2340e43e11e0ad8c42211e5c418e1dfde2e1e9452837954f04bac9bbb76424bfaa4a8f072bcfc5e229d'
        '01b8dc1038b7b6e9128958b5e739c5a4b3639807cff8df1b050359f2c3fe9811888c5c9370f647e7b3bbad154758a0e1f6b882b8afa51474ef157930e7cf04ba'
        '53b652f52a148c45ce7d329944eed7e84f00c93c26070e312d52312c0a1f0681ed547b8ade89271d851ff10fe2299d78272df512da0d4667c42fabef1e12ced1'
        '1261ec2774e698f450dc310eb567ef553a61c74a952a294561063e07488fad48df6f13a53ddfec5a167583d0d09f2a8b4bbd94cddf9fec59530fc2834797abdb'
        'c28892d717b30aae7aaf7aea077197a307678d6fc53a0aad48f639357d61a3b93de2b370263dbe793f372fda644d7d539435bd9a232b990ee954d80578b04d39'
        '471abe72ded5f9810f7b1d91b1f897772cbefa09c4ecb14d8cad38dcc1add0b97f229cca207eabf66989f06ebeaa9404185b46888828b45f6e7e295a194c265d'
        '57d2fda6869373e843cb307884d3f4d63f3b7e9d7502effd2dacd3e7ce87d08611f8c4ca8882f2a2bcf0a0dfb6db66b8af8ce90fc5a58f5aed0b7def6bd7a422'
        '551137974d12f5e85bd92e6e98b9ccb0ab021034c05ddd48885405610d78283fc923bc3bb9a93006cf2cd421e6d2b0049028671af8b5fd21fee85f6f3eeeec8b'
        '2cbebbe2d3232d528d53cabdda6302980d06c668519d749e901a121f5cf770b4b138f3e360f84bf7a36216cc254270368aa5226dfd249a62d11be141369550f3'
        'cdd5ba1d5aedd5851d255dfff6b921fb410d100b562640ff5b4933296e307dd3663f6d4b5b850517034d33f5818dc34856655a0379e7160342d7060818d59a13'
        '8e164298378decb7ee8619099fb6f6dbce3ac154943fbd3d4ce8a626127dc2cb7ceaace59866b2fa923f48ce3c58fb9e055e27518ddc9b949b40753e99ad0ad7'
        '1151184923790742a50fbdb05b2477fca7404c2ad245d65c0ab8fe0ffa599cc3676cd1795da779bb60a16f6f76c0f520ef890d7eb776fa91e164da6803fbb7e0'
        '72bc98f77b5c4675f6c1631af4df7ab82a3d7d2807c6dda96f72b1c6be03b40e87fe093ba8d6486d04af78f67b2c4824555f8bab4c7598850201f8ec4975c862'
        '9fd7aca441b63d304e2c5d6ced84d7ce6dcd76000475171fb9c77be6cb9b8807dd4be9bb22efc74fc3744e49f38be02fcbdbacf4d92a3d5253cd8875dafd956e'
        'd1a0d2e889d59ee0d7c006b12ca97f0c284f53563dabb963294981cc9c4462cf7d28d3d5bed1aa9b9ac999cec154e88967a59c1c596cdbb68358c89ba002abbd'
        '362948f71c974bcdab609bf9516f2f98b52540fd0a790dc8109897c78360ddf3dcccf661167f986974d0d9f0111a023fc5b86f2e784bc1787621022efc6268ff'
        'b1994e55d2b464dca881355af536fad29974eac450bb6b4a5f34c3e36e2f17baa7db491af09e39170f551c0e41774d4f148ee7b62e5aa14b0132e978bf2bb8e6'
        '09ab880f6a2d34f2857205d409839078f4a2c7126f45dabc94f1c06b657bbb9f94514260007b1c6882433621281ca229a7115fa8dabd04038b091a99ec25bf18'
        '4c1016c614999770a7fbd396bf17ebb8a0b87140cfdff8ae00108f8b5597828ff517692fb3521f69dfc698e4dc50ce7b80df9e3133f791c88ad7069e1a97c671'
        '55a8eda049f5eb410a12cfe4ea09f486e9a0626b9a3a0e3f4ba3a95f930243572f595edff3b416c265c086d847e8b7e50212f506e934dd2faaea18b73ec5826e'
        '620d4736cd3e41c8210cb4319e5ce9c9fc8262bd599eb7c8585740a7f118a74c599a5f4a2592b4aa0dee2bc33a3a39ae0b48779d8d156e9d185b7914c4646caa'
        '4e8ee9b9b1bfafa2ed83ae79581f349f46acf0baaf0481976168b7414547c6e9736ac513de6e414a7fa25279c90ab651131e789fb7e36dd2f4c35ac04645ac11'
        'b673824bf57de531f23c34ef8917132adc739f4da1668c34e8d075b231c42e90a0c2d6ff1848b63ed1b7a6bcec142af682186ee66aca601a42ce5ffb0cd58466'
        '1834e4d050bc6b400a0474e8064593254a9ff6f43eeec7aad06be98efd5a082ced7dd8eaf62575bf11d3dbe5aa620466d8ba35f89583c1fc2be919a4674b5c9b'
        '34943c9a14758165c3685684e74dc19d381a5192375bb2ebf500d3bed5f62d8dd771bce500ab5d9d71a4c63765bf3aa30afdef496bd9708974dc31324c76b85a'
        '72bdf2767f69b94ea78e24e9991aa0a71d73c9f9ab1fce94af26e5292959109b8c0a8ff91b22642eb65c6d244d6aa85edc110f48e08752abea379a3efe4bffa7'
        'c28718ede4a3628809d7f9d77809540775a454e16f23a436ca22ada68d8fb75c28e0a39013ab9f8fb591c579c5582766845fc51f88a8c9cb65b15bb648c26178'
        'c5edf355d8301bf0a4a245eb8ad2a543af2c12a2f4549e6cf6611514387c4f3b1dc8603a9c2d41cbcd690db46df707a9a584077b59285f4c5c118689ad6d1820'
        '66b9f111b853085b5277f31bce69b808ae9ad4a4bbe91d4355433606ff5bbad0a22f6ca371dadece69ceb125d9773ad101302d0cd11fe537bc5c741438152faf'
        '00c39830cc589349b2e4aa92f24552d10a1df719d6273d86b2e02ba2c661d548914ece5371441c68ec6412086adf886f894e7797025affca93cec26ce62247d2'
        '9fe63cd9e01f371803d0ce5afd0797016c24d17c742e47ba60c1a9020465103825d9218bbcc29053aee8a41dcc80b9f018c66d5b0a9f6d9016088d29114724c8'
        '7d111ad363dc155d48761105bb846f3a0d815cad1dbac38dc398b2145a13af4c20a86f82b0ed160662f7157cbf1ed4c1307503884ffe9ca3265501a09584f8cc'
        '5faa407f5698eceda380505156b7e7ecda69e2871ae3cf1ba46a1198d3ed9636c762178209cef8b1cc285bbd58f1fdd106e724fc91cf738a7cce073ae2ac542b'
        'd651686fff74773c3cdfd5d510d2dde2f666642c860b34610780c10cf66acbb938557700bbb1e565409fc26e00e2663b5c83edd2f308f9e2629fb5efb28ffc15'
        '40d949467fd2fe93e99c7f496927b436b74cd0233af2d2c83efb06079aa2152b8006f953965199221666676c420b705057a30f827921b348d8e24e6568b36621'
        '39590855f02159d23f5cd8e60c940a4052a6f75be8045a37f678c99d877bbae9cb9efb1f5b05795b15ad3c2d0b3fc3d42fe913caf29af5dea703930a14f2dcff'
        '967cf67999796bd0be99befcc0afb425ddf13fa2deef026fad18951d402b3c321b1c4172b6cf5b108dee6813ddbbbc999be95ad11d375a5391576a5d0d6ce701'
        '798befba32b265836933f7d19bcaeaa24cba8edd322b7ac996880f8dc4ab549bd9c53e002e68cb18f3ffc40953c4c4369944cabe00d06ddc0e07a35c8872808f'
        '8c4cff5e920c63a394e0c393e5ffcdf2da24802a154fb9adda381ce15e802842d09fe6e83693b5401b24c92dc6a37861175b59a1d0cbb61d98fdfd6eaa589f6d'
        '45810ebc540dd5796ca79eb4506df9b059f8abb9d832e0838a897d0ebd9fa32a17ab9e712fbaa7708a6d2a3b7e43aba140e54ff6632568242042e16199cd86be'
        '1bf61ae9d99823097e1eeb4de17a521735c4dcb3b05c566c2bcb1cf755e1618880413a7030988b2b2420aba0ba212e36906e3e7097243189e64a5f4f484ff772'
        '75b0cc092f632bad4e8b05e8455aa403373a4d41ae7cfc11aedda32a4e932b297101459d53e8cf2a4f8b1583e86044456d285be1989bcef1e9dbce1de3a5e291'
        '3d9594e939287dfda94a271b07e9d05fcabd26021b5e75d7b23d72c905e6488188afad09654865addead69f70e158156761732c6380ebfc4450067e0eb121a97'
        '4da6a20307cde66f5a39246d966fff223c9f112340c23bfca79747caace201753cb51e8484a770f2f78229e936768b7722ebfd24e0b00ec52a704fc8bce2781f'
        'ef69e5d790b476ae98bf2f9d3cb0fa27e2b8b9f54754f6f206b68922163465a707170ccbe673e91dd26fe9711d46b5b4bde8d99fe2b2ac0abff51f781d5a0ef6'
        'caa33493e15fc4a0faa044d7b10dea04bdcc722e95c7bfc72a0eb78f97a4551c9d397ea4afba086364c1052d98c5904024084cfe06e23236fe1d00d45ae0e3fb'
        'c4571dbf8ab7ae8a9c5917eeb5614641221acdecd0e23cb1567bcbe7927e4457248353c72db1a8abb2ab14e1e8cc9411c6c4dfe17fe86c98845872b2a3db6593'
        'ef543360e97676a3a6cabdb3136f160aee3d1c2000f4828ef447f87c9aaef349df4e68df12f9dcd7ea10ee05f5b0e6b1543200f55cded988af3546913cd1e7d4'
        '997bbeb292ae336cf892137f6247d996e9275ad178d4bbfe3ec436400a0b70433bb9faf6ca1db2bf2333ec723eaf3b062e9b5b3757603474d88129772c800cea'
        'ffc3986397992b7ea52fcf734ac3fe750825be92a2ad316f60a63a0e2b8364279f01741f4a6de07d852a5e02710124814baa48040f14efa5d179a13193bb5884'
        '9526039df0db78e3f3f91a286b0918c8bc64c01373ac59a6a3e9c0282b8455ea3329b23dc740d0f134e909c5ca3d7049526477c1490d0266a720fae7c84967d9'
        '026baa4268d3752812e9174e828667586873da09d12ae5f83e4391ba6fbcfec184e36b2364b2a72674eb17ba7c3a4627b41270f9c69f8959cc2627be8f8d9b1b'
        '14da2a82cfc53a9f87a568f4cc5b60e0d8f16b009c77cea776e05cdc4ac93f29e21d0e75e4c1f66ffa445d7e4ba02a4c68e8d1986d1514d05555d1738dc6e0ba'
        '091011e0e17b9eed978c7ac7ce688521d2cc0ab232884d4912ff2e2464a0541b475ef94ef8cfa5ed80addfa85586d246b44031b5988d9f78a21f2beef2ff7c05'
        '58ea9e0aa3202ccc3c31c83be173d94f528a6312ce4e7213edb2ccabf1921de88baf35f4114f8fe6f2d1cb94e863b9ffaab7f3dd1dfb1e57bd6511c7ec7c5b93'
        '509213b1283627c6ed7b1391d38f27e7f1a7a72f6221e8fc411e2e95175ca5747b4a4b88a0bedeef9d5a33a230a2c78879a841dce931f5c11bd672d8d1006293'
        'd50880231e938be54d44fed045801f7eed192c0f710d36c6f2fcb9119074045611140c8c24d8b17f118f609f976d62df839965ffa25adb63a93aeabea432d739'
        'd9e1443563eff6d1bb2f09864e42632e4eb5e2f794f462654f25d062d6ceb989480b520b2a8afd067f4757f1d35154349f4e82433ec8931b7dd37b8c063e05d0'
        '65d6149824f5fdc87552904f4fc5f569f9bfd70249e38e8ef8a7c723988f0ab18b08db085fe8c1ea1baab3b92e2a6749ca7e7bc434d73dbb771568014eae3122'
        'c3c85efe7902e9d3e49cb6a72da6860eee84c4d79351a999484c3bad407bca372aea475825f6f3360156efb8b0ccf82945dc1ccb61a2914612ba7f89a6df7222'
        '0714bd61a28deada6e1d4097552cd5b67b6f8d0c8e8be973086eda3858f423665e2a0cf03ab23de00b77bd9bcacc780d93a4b15e457eeeb01447d2c40ee95769'
        '4d692e5d0beac05dca50dd178c1217a2076281a8eb55802e6e95ce56f8a6536fee16fdd2cba8451665a56c808ac484c7472e906db5c264170062b6a295d3285e'
        '4d7141b7774bf89fe9d6b46bd49fe1786921ae80604ca9c98fe872e18a0d118c43ce4c2ff7542e5892b90408b398ae3989528598455abfe41f936ea6064ca34c'
        '968f2e94f341d0bf6fdb7d65f5ddd2393f0657e1dd1e24188a7642c7cd195c466910f5f937b8d8cbecfc8abc014b212e91be853559a4517b5ae144b0b3017b3c'
        '053f71b2a2cd6ca574a30cfcf1af4e1ff7e08a8efb4d67908304230f88e477408c37576e9cb3aa1a22095aa3261d86e5bb4e597a74878fcd9f9562fda86a2ce9'
        '89079300e7317e686e68b61d9ae0ae1c0360882f7f01933f102634635c96ba8897bf00f9ae4288b7246071ccc0e83338267061b1df0da098abf11b10d552da79'
        'e14d24bc7d3bb37633a19f8f4f73fde518837819f91f0d551f370004a6061ede536939e51c3204a27b00cb2b93d2ee33d773e7d481777ff0af8c13c509e887f1'
        '438c9ad7cb9e2099d43f7989d09ca2ef8444e428e11ddd2e3c60878dd75b1370259b5302462d70dc3c5e5a6e97dfa6122eacd99abf363b78a2bae03f42295695'
        '15f0becba9faa5ec3b83445103a6396c4f18b3dadda9491e9ecb9167fe042dbd2e06da47d03eac7d478973ad1a33f3c9aa6c3aa289d697ffb39a629c75ee884e'
        '70e452ba9951671e6dd79265ec14c9cd5c1a1b96fb86586c916560674809b8ca1fe069ea1897b63533797c38fe568c68adfda7169c0107f57618d61f5790da1b'
        'b5e15f23836309493e20bfeebec3c5d364c3c33dda136407f006b65756b84aa4332a87b87c1fc6f3e2d073310fb2f595154121cee7a852dc73684aa63aa0456d'
        '0ac919f4ec9907e27f58bcd273717776fd61d80e829f9627cf2d21f9ce08fe4f7791958b19e00e7eb9f2884f494a91e4cda04a02c7a7247c5e262a3f39c0b0ac'
        '3cf87bb1f2e4d2435d1d01fd7208db1a7c780d4a7a43fb210826825be0adb49b19fa86673a9d069e05fb182816d54310c30899c822e911cdc7c0908d78b81097'
        'ed5cce9dea2fd6ef9f12604db52282dc22f35fbe6a190cf6141245712205c8b5961fe0f04c06b72de3b4f8c855d9e5c0bc4e52956b91540e6f270a2b0e5c09c5'
        'b6b9163b7cf77aa53a38cdaa22f382b4e2c244574e899dc2486f65d29746088e81c045673e7c66a5f44d69727f2f7124480c6cc13c4233c1bc8da4936f7a5cf8'
        'a4d4bea37c48c58d819539a698ddcb3ba78e05747dde612092ca3616d7c754ed96eb7830c592fe1dbad2e9a3c589f93a9e6c318c7142abe0a23d5e2e1793f434'
        '361fcf3bc793ffbc035ee7e16855f94025aa380c2cf432783a584a783b53b00544ee0d3bdfd58646600f1a57c1605becbb7f61bef27acb60ff0db6feeb377bf5'
        '1cc065a6fc66c9d912096c0b7f795d562389885848f42aacb1dfbfb8c80b9049c0600ae126c2b9daab98726028895efeeac1c518607864bae7bee9f06dc51d12'
        '50c91dacd8ab84485133ca9aba6989ca105193809607dcba3b83722108c662a51bd580edbe90f2945231362427d3e5a0066aa2c2d12f02cea3c3c905134ac000'
        '0cd71ccd45dd4817b3a39b20fda396dc7e0cdb05df30590227091c583e576c0473299a688bda58ae45eee8669628ae4c4aedcf88debef8d263a7392072c46f38'
        '4f335c0f542ca7d4f7e4e0218fc67cfaf30088a78b1681c517e15a55a279885f4e4813a720b1e87fbaf39c4715ecee3eb4e79127fbdf23d090b72c4c126ec0dd'
        '51d03f40f61fab659f622df7626044b416b0aae95b6f5e29b792d0593c681cc931f97395999a11e6c2f6ba0ce22aebcb27c41eaf33a9ef4843a0e000674e1d1d'
        '6d306e4796e095454e8b3ee6b4c69c6be2b2e14c6802aaa442229ea9092f4d44444fb1e244ccc40afa283b8829df91d6d31f39ec18f4f5aefaa25b043ccb9dad'
        '1473f6543931c5b045a05a32232c18d0aa3cfcd9836459bf346c5c9828946358ad98a5905c22762fcd6f470f0dd6b385234730cfcf9c87105b8d0a3657215cc3'
        '1e941acb251bfbbd9c497dfad0aaf20727455a5ca1ca20e913f04a744c91349a6c221aed669abedc2cdc9c1eff255f9eabfce1c1f183a7a1d71f18a4f25bcca5'
        '91868dd69912c7339e1d007c3bcfef19d56606eb488e9cb88c858601f5d325fae41b33fd275ebeaf76c1af214eca38be891e991c233714a4f34980c000cf8d48'
        'b58b778f7e8969ae9f7b624a814a1702283946239c85b67465fe3ea45d12d620fd3e41dba023e3837f41f3a95bedb68a4312adda2d1d599b4a3d0c24ae616251'
        'a411c7f6ef10343e11963a16e9303f16f239903b246f438c98be7e019fdaeb3dcaf1decb98fd4b4b2cb56921cc7fa87dd34bdc1f8d2d29a30ab43e0fd87cd84a'
        '1667f7e399f9407130cc6b6c003ee86502aa5d7e54350201ab457b7e354855d41e01058beaf4ac0a8b500c6ace40408753418209f7bf653d76888d8a52efca5c'
        '7695fb9055440fb411d3a14fefb9c0468ea6021fb726a910a79e0dc5fb6ccb1254492a091d11a67488cda194d3a176a426f42b5c3b5daf92ab294621069866ec'
        '16c52791649d5c23764694b852f7530bb02e8a959143c2891dd4ed90f6e95484930ffa7c24238065e0b33105b6ac9fa675cc4ec7532a34228d1ea0e890e2c0ac'
        '680680c8b3ff393734f6cbd69a4474dc34748fa80124a9e28114b98f7e864eaa0356d1480d6f4b071c871704ac8472930142199ccad6a9086435fbb6d5608998'
        '929e808752c36b2970cf5e20de52818ab0d284d1047591645a1813edfd97cca455cc03da9bf1e95edadf5960809a73899279506369f3697048d2251efde2a8bd'
        '0b9926c6ea07a0f43ead4201d4d639358f37c7ea5ce0950cb81320bd52050702bf28038b85604185f655779c8456d88960410b1541cac48d9b8f2d758031e017'
        'e294f811b4631e5f82a4cb5bd78b6975a57aca1e4d81ceab9847579823f6f38652551bd8df931f9798a5afc23ea6e70cd9a5e6b64f18deb797b1eb4b4012d15e'
        '2113c7de306fce3c07f98a2301bb9a86e4a9ff0b5dc4af4f1a99b08b787f71a99aca078fc0d7eb1cd86cdf04d46ae5b42f7fb0018bbada84e6e6ad9115de9e0f'
        '77b3cc5fa4e33e2ff940599082bb741bbd0dd3d5f75ce1f9c3f77c8440ee6b7eaca575883215756a5c40290bf706b4580f9a7b4a9d03277098e86105424d3020')
