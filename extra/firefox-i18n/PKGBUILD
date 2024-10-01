# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=131.0
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

b2sums=('ba686c93c9d54a45b5166b50002c35b0d224d59ae1eaf8ab7e21022716526035c19e71a67af5a73027a1faa94757c734414eaaff22b14d0eee4d4c97b7205637'
        'SKIP'
        'ff7a03490b95ed57cca023e49889f516a3bf976cc0ab2645ea182882b479a122639620348b6d64e947c24c54d78add8dbee9d19c497da47ddeb36e5f5618c63f'
        '3cd24c8cdabe6b824643604dd7f942e717d3ef378f6836be1f7844980a2f5c963679fd090d2229fd320feebf911bc0aaa58ef0da45723cf132a871bf5493fbc5'
        '2018de90214797db66f93acdbbee7ad8af8485b4936e60501b6f8efbcf9309d444eb07ac868a06e3c4def4bf4a46c6b89a57f740b5384d003a942c51dd026440'
        '68ff9c9c2294c02ccb230f04d1be847c62c7cde20f5e18b03835ac7cea740a66bdf9535a9c98861fefcb650777c5dee72353596faf3128825d44b1eb560434d1'
        '1e2856d2ae6dbeb0de11537658bcaf311356c8fc12e834809d7ee12cef40435cae95d6ab5cf78835ea82f1fdd8f0bc3686b4e99ff03a9ac8092cfbbf7f24851e'
        '82ca2e72b5ae2a14e9929e8c3c46caef805408e1bf551f0c91d9059af02e2a482991dc75349ec8ce6d5a7420b26c2d5a798d544e57887389724ef77b18fffb60'
        'ea4fb234b650004b8cd70f31315c8c4cd563f59bf2c3169e81fd8caf3929ad3b3dda6e5227c55c94a1013cae2f9dbe8a6f733db7b8d6999e82dd70c71bf27f6c'
        '0e415945f2b3c0ea245283cde485a7e436b3a2104fbcc2a5f2ed3451652dbd84c714cbfd5e5f592b2ed44f216e33d12394f875657048c8c8117965a7e62ec346'
        '67d316ff212a028ac132838a848ee8552bddf740d31d370bcd7392f7e0014418abbe93ec662799f25297894a2c0452ac69d5780e982a2fe87bdbd2ff06bd422b'
        '33315d8867237c998e7500ce8a6f9a34ae5ca311be60952201ea8e4d7a93e38f2cd94cec4117488b3617bbadf7f27d91d01a417b3c5caae5c8f6fac9543d95b8'
        '67da47db1f19fb4c05ade52ab63148e9867d28c565e80d991fa5e06c477496ebf73d3ffbb62b5cf3da81ef763379774177a79f07d72574b24b51084cdba1537f'
        '716223404ded89d348f35c30513c197032638122a9c78688f0f19cfc07257cd69f3d5f6fe8e331b63e5bb2bbcd8ff616eb4090021af26968141d2236cad3fc3b'
        '874b12986659b88fed884845514a3969d3bfa2b6cab7201bd158ce895222a05cff0b181739342fc813816126d2355e8d3aa4a8bdde45e2f941547d6e0f54df1f'
        'f5b9e1fff7b6c8b84cceb6e3758fbfcc90761270d0e682050c8e002854b1ec8a321b2288b51e9d08fb01808b246862b2a84cdb99d2070174c381b1e4bc4865ae'
        '07ddb89b880cf5f72113b33abf1e25905eeaf9abbc78e112f0cf887d45fc5638f02bf8da7db13132eb830f542a2acce6d34e82d8261c75b98c08b1b267d53276'
        '33c4ee64853fe791937968ba0d6a6a653b068ea751390b7377fb2df7b68f7a38cec49f39deb13037b2713ed6692a042f4b6bf95e7f8627cf704684b7b16b0c35'
        'cec6540977cb49cfc9d4bbde0617d2514682d9318999b5f1735d454450d312e967ece07447a2ce5493be21095f3c5ead83a0b357e87551d9b3149fa320f0b642'
        '0339b74327d2f5d6b143189f154faf5379e0d590cf5c44a7d65d171557a4a939fc9325b44b82a5d10214cbec0870836f18ea4f154a23caa16cf0c2c4eeb43611'
        'ab967b4bc8d6bafc852deac6bf6bef095186c036b77bd704b3e2949174e7b8aeeb5a80c08e57e02573c7ca0d1411dde56c8b783198939da1802b6a50a6f85be0'
        '5c029d06dc041a9c61663a12ccf1e576782470b871780f2b0911670abe1acfc31551e2c00cf0951f7030c7a754059be412745393c9eac3ee6bcd47fbb774ea18'
        'aa18bf5cdfc4b61b072aefc7c6109c798e311cbcb66de12715e5d302940ad60d567f2c16a9766e72736555f6eaadcba2e4d2aa68b13ef9fc28e0978b72ce725b'
        'd47a1b5f5ed3ea2e45fd2075bb21a92fda1e636b6673ddf3c2e5cca164ba2419a01027e661ed0d326801f7a00d8cc0b0c724c1c94ed70bc5275a43d64c7ee245'
        'f47a184e9247cfdeaef2d579d12d6b93e6d333681f388b623b6261397c29bfe4cc9122e3f7872b828c0c71b567cbe271a9cf15a10e0833f8ae7585ccb1b3a5b3'
        '614d7be3dbdcf69dd879f640386b261903ee04cd7fb1619d2df42038ce649557261deeee3b4f77a3b1ae027285a908ba0a321057c66f9f1919255779ce63fdb0'
        'a7ac7565bd2702aba18cfe7ff26c09e7a1909e4825a50c63f30fa031ff5f801a3eab9f605cdd1ed01bb70a8bd1c0bd1988dcb3a0c42d7831214e24405e825851'
        'ddbf8b345592f3a74a1534eb1de5404198f67d561734c2116e963d32566ec72f8fcfbbb465fe5584813b685cc29d9e0e20db06178164c1a08b18e04b45a4d09f'
        'e526493301a9c73bb90a70c4ba0a1edf0f922be0cfc45ff25e69951331103872ab723baa1e395dd9516eeb80f65f478993821b7fc13e0f42ea9930fb375f39c3'
        '97aca4101133d86c3b5f15e0634621a2f91ceb9a110344559c40c0059fff99d01ca2a8e32eaa6b7666a738ee3550656404986fdc2a50a124b08feeb4d9c53dd4'
        'b41277050d063a95138a77f65cd37cd81e3c69814e4bc83ff2633335244560fa3fb18c3fcf2c129993bca38ad0ff74f5e0d5a49f1c5e1123150c259be18646b4'
        '8f87db5f6a46ee8174274db52abfc6900939f106bf7742bd7cd94f1f26eeb7cde8b7de5cba95f1c39c280737b20e7a498b46c51810bc5a084665d875b9d4c397'
        '61d2f0f59383d838c411b6042001f1875e590b48551ca81cd2aaef2cf12e829d6b1dd13c1968298330a6a98663edab5a75d75954fed1616fe6e7821291cb91d0'
        '4da2ef30283d2eea200ca77bdfdc1842da93fd0da7d5241a051723304f15965978edc571cffabee872854a492699236aeae4d8d568bc99133ad8f6b202b0bd44'
        '6766865c9f1bfad847006a4c409f6f6f7512aa63ccaeb72ddfca56016ddc31dc9fa39e1faa34a9a45e76096b65c7541c9138523dee84016b0c4a388ee2435188'
        'a18db864c5f5a0b72924a1537e7edbe54217010012aaa7cd3dfd87e23efa7290fbe38baec8d664bb4f4d253a7c8d1ee4761de23130384a74ed0db8fc93634ba7'
        '2d9ab4fbaed6d97ae5b3422c0e05cd5abfa9d73f6b576deb73e91c32fd171684fa780255306f11bc618dfd550ce4a9a04736b82598c16c22545323f483d89f17'
        'a143de89d00b332e751625363c3135865f3dca8df8eb8dde601807b38c5bc12e34a453fc6ea9ab2b513099e98e7c7f8a894f858f54eb58870bb63b159ed610e3'
        '16a079e79acf8df2c1d7fe2c71690c7c14da610876d3638cf2c9cb40de5a784264ba091d0a1026340b6385d8cbc45ec83f59387450d045c4688e136cd538b944'
        '424e834e1ce4de0c5f5121b7ccb5789680a572ef46b00aa340e62256fa7ab8763619c8213b294a52ff1264edec195adcd9e2e8b6e5d11478fd50e3bdbcc1ac94'
        '5c7f925a3f551a53a4f74c1e1fe0991500125ca35c1385c5bc3ba716a59005d0d1e8c5437092b7bcdd8355bff1b46ccbeb55d35d0c41bd19f44d70aed561635e'
        'e980aa121d2d98382fa3768727f7f3324c010b76842c54eceef39fddb5dece8873debcf07bdb8ce4bb1c62796e6bb75d4e422792d52b71ae75fafeaaafefc204'
        '7eba95b1afac79e63c359be28b9d515518494ef067ded4231786cfe88a31e7b04a49f6c6722669471bd4d6dd101109f136d05842274225be19f5626d462318bf'
        'bb3838fafce88524e10db28613f174108f0b1b8bdaba3d8b6552b9bf4d1ef93a61e7172a446c0294982f8f0f4faddfe942e715358a54a064e76ce8ca4fa5d727'
        '44a5e788694f67bdd9e9dc3bf584fb94256c35c2a93f23cf59336e33eb5235068b3891335aff6cc1381144d080320807b488027042690991284fe2ecf1a0761f'
        '672efaab9160cc38d9a31db3502beca56d3a4eb3181afd7364c20f7eed5171a90bb8d99270fa266aa8f6535692994173cf71a32813486655af54c2842cefa625'
        'd528baa863f29d43db14d431d21f8e96bc5ef61e5c8f59ab58d0e51d5f7dfa3641f607cb84895543ad584258c401f1bd375c451081b4ec59e33abd585594bc32'
        'f37a12f6f8482c597e9d6dfae2c8e89cf694f3d3dc6d935976339efbd0d2622e71648e54cbfe74b638c8aef6c014b2a1992d90f56d26e6731adb2e9a18cebf68'
        'a6c8892e6284ecfd07a19ac509ea6dbc2f8dab1b4ee6909106d8a564f1bbfee858b20ee91283796c92f2bc055d03d339c7a223980ce3d77e6cf4be30de11b4cb'
        '3d0a85d51f2054f65996ce0bb5a240d5fdf62ac4072bd122e6d8a986e86fcc2fee4611bbdff3f43dcc0f2e59a91e2c292146b4578d86db3e9294e1952376febc'
        '4311f7e3922bf18c5dbb2c43039d247def2df5d4f377d2ceea54c038b0606757a1b427b1e0e0f5fbb5d7852ef8e09a300f3b854dc9e7692f12e0058b1c0aad26'
        '0584612cbf5bb7acfe8876726d30ee3b5519fc93d909b544849db686092f7639504af61c2e6967ae3b4b4b387f1fe65aec1e8223598ab47156256c7e8c810420'
        '06755ba6f7e2d54cbe0f5b3db8a13b4787a21b63b4d0098395143f94749bbf9eec7c4c760df8f6223322c96d2c7bba63eebe2c0b368e8cbb8c6c91cf192f8b70'
        '024983a7d29de9ccf53280796749ee119b5ae56c19ba12f0bbe8f74bab4f4507f03b21f5913e24b5efb240e9f11fda89596ca51ac4a76fe3d2e35eaa13fd9623'
        '59f863ee4146003fd5458138ec76b5a5fd9db781be8205550f23ce45d8a9616e3bbb7e80340671df0d2b7a86384d52f49895793145555e979fd02ea705ed14c6'
        'f8c4c018bf707bf7603d92a8ef0e914e1bafd730ddb24e313f67c53e63ac0ac942a464dc2d5c998f7bf0f7a38d3fa0f9f043f98d3dfbfafc0482ff303be31f35'
        '0d8facdeb3d190f038714a860f5e5211776f44e695db2923197d7fdcdaa6ecef3b21b0ef157bb2f2b287eb0070c390009dabac168caded684a538cbc78b2f716'
        'cac5f1fb502af908e85ad61541126d357a47f1bbd44e9bdae0ffa6c1035af224e284cf7a0f65249e072d8f337996e084ffe292ebc4b200695bf07dd79d4558e8'
        '907c3ef0fde43c602954c8d1bf71849da9fa51b2407b4de7c1744745ed2d705ab465d6108479790f3322eb5417d5289b8eb7ab7a833c3865e41671929b29037f'
        'b52a927bf1769a86acbe2abab3f50390104c3cced7e9dd7693e4268bd61c3583ed2093dc8cad166a17801d705446c08b8ddb2cc33c0b2040251664ac889ee20f'
        '46635018001089b0d306bf6b142d93fea3d131439c7572a3dd1b4b35f25b033ef05588071724fe74117118504ad39f5741acee25bcb5a9861a95d09023456813'
        '8d6d93e8525bd8f14f39046d1d8d2f3756c18447e66da3211ff10fd4823e69acb1ec92c0488fbf941c706454bd051c5d111ee13f68ffaebe2114b4a57ee8a9a3'
        '0c3d28905dccd4f407a049be5a18561c4e195800de79de17bb5c81e41fa3db0a228aa893617a6dac586946c0b9ce531659b3cd38a6dcbe4da2d414ba6f977fc8'
        '0acf9cd240ed4a68f76080be3b6eaac4e681b171bc7e41452a350ab87c52721c72247052684dce823711215a5ab529c5431eeffb138d9580ec8a88c4d8c0fbec'
        'd632d4e5ae295e8c4d21fea67d1217d640296d7e0baa8ffd28076d08ab5e1336e900e5f0d64b197d899db9d7f478c2d1d610b0af9a569461544cee3c7af57e19'
        '446c504f14bafc9cf2fe83153739c3e33353cde6bbf9d6c23b077b046df9c08985cd47942bb0bb5631f2a4a498e74ecd3c092126623f2ecde69fa2adb9e0d947'
        '5d7615cdc5b6ec87af535ec4b08ae56c5dbf89fb854b187d39d82c41d7516172bc4bc3039d806f9e1d4972b2383f3d58a233adaf629a054fb08950d6233ee92d'
        '8384d496d362f8665f43aa4cd842d0d325c39ff9194b68b30968c69a3c35e8978125449ab779524dd88554b309fd9e0d7b4b283aeff7599941d3a2956d7b04a0'
        'e21d54102230bb1b0cb88590a025317142430b59b8be430bf8a49f5d03c381c3d82e8ec4dd07f71c8984811e480cbcebecc34bbd8032e071f47a2a8b489e7c1f'
        '6e13db80bdb35eb10f2054270e657538d8d65de442ec232c4879f278a91faa47d6e41782634e97dd48cbcb0b59aaa715bfe5699970172578f678ca5e3912cf65'
        'fce6ec94259fdf72a9b7987b507f04d8b33d6bb530e3d0498452d3ce4610837d01a5f0d4ba7302847b5e292ae86f2dca425a4c8ff999596b4007d40d8bcc0c8c'
        'f0aa5b9232c8ded31813f180214fb386ca6c85946f23638cd7baf0b79ac841281aadb752bd2d71c73a2c4f4f239462431e411d145c1c999f7a5538a3947d883b'
        '533d5a3fbccc9572af692a5da8dcd02fc932cc25a51842f6f44c9712eb7a1746184dea474911771e985149243a26b3fc5f8fb0263d2d93b151d8593190c90cb6'
        'bdedae96e29967f217af000bf52e2bb1b33855c98bff658d9a3cc914b377b1b4aed8bec5d2ad0b525aa8815d0485b8b87f0d9d7202728ad8bdd7d5364df5a775'
        'c0ef3230361df746f3619a4bd0d69763fe52502fd642915e58d4ff57b5776de6076166379246d9c9589bb32823aa7e982af75c6d7b0ceae4e76fa56d271d0048'
        'cf28f08e27a11189596b7d3ffdcd45da0481240f6e80569b1c8831cfbbf99735b2d8ae9a29061ecf871233294d4647a6949a1de276d93e59a4617c2c4c7c2e13'
        '5544f6cc438dd40bd8286a9e63d6a96326b5e3e75937a7082ed05b489a196c50c7f62a6cd959e0bbf657037bdd70840e01b872bef0402289466ecd6f464108fa'
        '27c85c68207e902d1c7484caf31ce84424ee9c23c53c9c841c752673152f157c7b29b96b594f97e5bd9582e70a090e6961e143067fb054062c0b390efffb7e70'
        '2617978ac98dd89cd777fa818509a7772f09c31df8a660f1a36437a94832603c7a9ab034df8bd6fecbeb63e2089ca1bb34ab43286041148c1226f0a1034a0b02'
        'de0b28d331d8b75106a866edc68fe659d278cc59f9515056ee84fd5d85f8380a06742436ae2fabd433bc11896a6754dffaebd57465e282348e7a33266368497d'
        '733f33bd96450b951bc7c91864c6d1732eb8e1b25926c510f01fced39b3c4b186fdead510d2814e7c2bb9c8b4065e88ee06d22c36ff06245b95205c81b7fee8a'
        '1e968d4ae1eba91bcb41d2df8369c7a3a7d4b2a8453cf5c41b4e476b276ffea128cfa89744bd4b1435eaa839a934337df339e44c721a8a049048918e3208314e'
        'add85164b60b29171c9ea28c31bc864dcea981d939d9d620e84875fed2438c2abe2652aedff6c73019942ee0381751f34ffd4857e885a98578845c0c43d383b4'
        'c43b09f64edbd29c7e0aea0b02a72f32b94afa9647f421160252bc974205f7be1dcdd5cdf0fa983536bcd38c90d5962de7f555b3ee29c325119327b7e43a4f02'
        '18636dc1bdba5462585d4f0816abdf1d68917108cfa092a6c5efa584405e0a89b10f2a725c13be4bec67672fc5f1d87cbb26c88155d0fa3c0da2f547f670de19'
        '378b92e18ef69ea3c440aed2c831f36fc3609c2261cd5e2dec4435071dadcf4e0c546d906e2775825b061199114eaa66044368e77b475c074eca4887c3324b6d'
        '430090a8ccb9da5614d4c00e9176f1250c423eba0fcaea809267d5657a0728d885a10161a2bc5ea23cf649fd0db5272dff218424333ccb55428b0390521ceac6'
        'afdb0c5127148c9d253318128bd577b76347ddd848511ddcc33a9628bb12c1b1e955036e2baa5106520073cba9244510171b9337ef6a995dd0c5930f36f32dcc'
        '8dc70cb7d3954cb722031250923851a8755877e20ce431ea72427d02a2346692b3d7eb371f575e5e64c8e3dd5af78b160bdb93325fd3b2215f1cc2f861e6d210'
        '4a4eb8a0dca7fe169dafc33142b4d6e81e192aaf34ff4ef8b60e69ea1648a993c8c03e98c97569a24d60f98fa71bdf40960e8d6007ade9775b096bea77f9e226'
        'b56ae6e1daf0af3866e4d6212b45c0938e3113247184dc09d2ef6ac24c2a0ba29b55625ce97fb5ca01534c2ddcfc6bdfb81bee015733c610f4aaa40d9b938d69'
        'f417dde4fe08f5ae189b0ec82863865230546d57fa2513a2b672118a7b3e0e78a182e22e69313eff5f5124afa5042c778d086d8944e3cfb3ee2f384e1dd3faac'
        '983c70fab450eb34728b707b7f7964e95faea8fb489b6fc31a11db7aea4d5ffbb052c6318a9c43662afc36679adea184302e062a6b10ab146841ec5a39952fba'
        'd7505c23d8088395b8207ca62c1a1e2848bfab14ac7811993323bbcca1e8a5de6943a247375388ffc98daaa9e77505276572cef34444127b1ff4c1e7cd94237f'
        'b6c43da1a88f48a747554a64ab4cf8d67924624177ab87290debf27dc72301da0932edaff4bc7738dd21222d0e57b63bdb1262c174f0910365516077a24048ab'
        '01000b44a968556cbabf1b323d52eb1b2e447294ff4a57c0127da569d0366ce6f4e6333e6bfbbd9df27d5398940590d0220b3ea9df051819d6dd4a70fb790def'
        'a0f35e8d454323845913d1f4f4bb7f6dc2ff7f16c546041ae972172b7330a1a5677edf16b8d91bc4828d62a43a48057cfad3ed2eb0afa1b378892637d74a3c70'
        'a973739032a45f858e46ec1f9384e8fb71c3bb59f71e15160c1c77a2e70b7f012be3b789b61eb026f59862c1bc06c2de0d3a6214c1cbe9c98cf731dd6be975a7'
        '51650a9c318cbd5051de6d7cf4e3a89f5bf54e25daf3cea10b6182a909625c243696801e8118ea1df1ac7fa776748216abdf92987d8d92e52f03a07c6f74094c'
        'd2e616c8e73cc6c5cefc08a64536a79dc40dc1e048877c561355b363b853edb7bde4a7ba819f9485a69eaaca8f00ef9f0902848024c295d395d18e7e8e0bfb6e'
        'd55eef3cc718b9053f4432459605ffa7c49c33c840eae96d40d38f5e5b3d45c367b2371f0f98488bcaaab8cb1881429c2898a6621187b2fa4e7a9563ea4c24c4'
        'ec659b907cb7a5b5882b10ee1bcab75113ab0e81796355934aef4a94d1d7cae1b25e7b97629118cb318828ca2aca12e4fe87da234c9c9cafaf3402dddead7d2b'
        'a006441cd86f2e4c505492b21d7cc68df5751d5c6d62b03188d3ea5e44e47afb327f07c6745bc0486dfbb00dc268b3db941cad6f42b70462cbae5c2354f90601'
        'c1389fb8dec0f1188ac7b5721e8b27917bd29689ba5f47d3191ad702e19dda83fd6317f1a5fbe0783d66636aeb0c8306c5a27f015bc04ad2ea55130a8a61eb33'
        '13de3debfffe7f4f8e4b7713c501bd273b6ab3144f5e4580a7b2d2f775006b87f90f88640f84974b86f9ac667b4d975407bb8ff4adaf0b03e4ec95580bc064d8')
