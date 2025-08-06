# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=141.0.2
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

b2sums=('3ec53bce56477a38ff4e8c2a7c11a2c053a6261356205e3a4a556109fa9741c166ac02f25a5fad6a693e3b45e1aa59e3633eb1461146efac58b8fead1fe6c71e'
        'SKIP'
        '7e491b12467c72d2eb81400d51f920ec4f20be5fd6070365611226b1b96165a973eb5d7d5301a94ee3aa321ec63ce794faa4405754414ad379444e1b7e3169c9'
        '5d3fa08cd165158f16b606c3bed5d00078970bc12c343e1c34cb6770e58252eee05c2b76fdfd27936c8d31cf59a7e3115e20bed9d2b14e335b66fec2b5ad7f4b'
        '6ce23cb268de6443ced90f671e8ae5a5a7e5429eed309ee99f44eb3f9613ba588bf3465b0a969baeeec3d89a61097a03c5c8e482020a472b5fe038e82005df68'
        '5d08d4e2cc1502e8c6198c6998453659cd928f8a26a11583e410da574c72cd2befcb7b557d2f3acda2ce4d4b52e0727ba417a5e0912a2e50b630ff0381746882'
        '30795d9468ff4869ae3f19706d814a43a2c7f4eacb480e044044a8953a0381903cde302e6c32c07d555120ab47c7608a0728c03e973d9dbd73d5b38227fc0edd'
        '22f927541e86504483ce081c2850cd12dbcd6c5e311125de8dc32ece61a0cd09a73e873cd47e896c18d13cabfc5e2b2e308b3937efa9552ced1db1001cd52730'
        '6128ff0012d57af36d032ff5bb1d23d56ab480b78e67725dd00cae475237198d0da30a0250f1d9ff68ccf70f0d9cf2a4827b2a34c9616ca4ee12e6fd8240d030'
        '31cafc06c4991392b30523957b0c5e8bb9550a914fbd35e2fed37882ffd66d7c8b3473783a4011850a781ab3de058654ee9808167b996c6c6da203fde4d34638'
        '06ee60e64036e46dac4ac2c81ae334a9dbbc068878134ce4c5d389b613cbd6ea5d2b6abea104d1cc8091c88e8a2b86d5dafe4c7889531eaa7924d852cd2fa568'
        'b88b4215b2da7f51d50d512e27adc9303fefbfb4f6311f35afa27cf2e2272a3435249c649662fd8c4d881a956ce8523679c2227467f9951dd677f90f777114be'
        '19c146e9068e92b35a34c9086b35a34a9a8292e316e66d08e3515100450658f5786d23ae2a346a47197734b22226357eb7983943a3469e68abcd094d79bbbf1d'
        '2a05ef302678dfddec2bdde2be082dab8e5ca6457c70b5c8538997177a04c5cd3da39773f5a63775384b3f317472f9e75a3c15e648132222dafa84fbb21baf96'
        '818b73dcb76880f69ac301363a306801eb918b881b1b3c4c81c750fc6f615717e6c53a5ba02051d7c96b26aedb1b43f52e8841d16a2b3967c93cc9589a3a2c8b'
        '15e0a10584f971e3c826d5dc6ecf73e0080d80860a9bce506c1b24aed7d5f84f00f3173ff49b0a223cb82c0cd87f8234226f630991922e92d1312e515c304ddf'
        '77ef128faa003fd1b570b3b5bc557b84b746a59de94c8eb096f102c2cf11263d619ff7c93d85f806c7cff4df5fbbd7e2d82f2275b585e34effc6b7c49326ad92'
        'e9ffe05df27b9f819766ab602ab45f80395820ba622ac9eb5bb5121ab6a777bfe1a8219219649f18d63c928583ddf4d9223f8ce42e1e87bf0bf3b425b30d6690'
        'defd51f3cf6c8b2a76507454ea27908a1b09f7611b24b2c98f4c22c7ddb8efee380354bdddcecc2a7d1df447dce20ffa0c2ee8e6fa6d50d41da8987a844b4ed4'
        'ecf7e736f096eaf4c8c7ff89a4ca557c5aabc9260165206827d86c767eae75c79a418cc386566895ec47609dd86ace6a5736fcf823099f64a85e69d0353a4ada'
        'e1879ff74e72785d8438813bdfae4892558c28812e55495fa71b8c36554aea381fd506cc06f041f4f642a02071795817c12676dbbf2f3d21d0f162a9d4288fdd'
        '65024ea4a36234d2bafcf0493add15e9532f205ff169c692dc422892a0bb1cf31119568eef1dca0524242d8ee055541b110db850bca84a712c2251752eea1d9b'
        '1e47f23bfbd5644bfe0663ddbccf7cf0f74c3ebd11298573007f4198ca9a6c91f6b681f4bb9a8f894980d5b0824f7346fb19e323944e42cfebfbf0c0d56f0a40'
        'dace794adcf4d255547ff29582f7917c73e20b29bc12f8f631e8795cc7410083457c4a0c15f3e100c0b82597c108434d71fe3a34fd5d354b19a9750907189421'
        'bbb6f37a75a3682f70e9a4987ffa095e61ec51c63452bc875fb46e99ab16443cb082de5bba11da187de156e13ed79a05089b6e1cec2f9e6b81bc1e5657a13f16'
        'd9ae0b23f9521655a46ba4a218eb940c83ec1e5b3fa414443efc54283e2c205cc511185306ede0f0cf1bc0cce83f8bc898bb1848fd1d50180ab1fd596f0e40d8'
        '235936f6bb136d48871666a3b5a842b7d9bdd20996b63ec33badfa6138a22dfced3e3205370852882b5015ffb78584b1b4361ef142037b5ae0bd1068b02f10ed'
        '7df961db64661f31e68e1e12790d083b07fe68d1c652ab58d05053d423c26c013030109162059f7eb05c88aeb7a0562c72e22e46dbd7952be0b0767ad18b7cce'
        'ba22de18231acefbfc592e96f70a371538f02a748e14028b1a1bba15111fa68581be0cdd73706c3f428274942ec25ced56ceabcf884039aa5d5b14705922733e'
        'cb3335ae821939cbf8fe71d55e3133e85472e602d2d83474023afd3016d6a9b395cfb8099c70220fa84e3aa9275d36231209822a4c33c27b3e19a5645fb43b4b'
        '66dd25bc134e0957f1d36fe3f87c6aa7236c9a420b684242831e56f8075974b890bfac12a6c47a8d837e71437687448d7d9f05e200da18639af84ee7ec737b65'
        'bdccaaa5bec17cdd3fd3a4bdbe9b48f224c4cdf485dfdd68da53f24468ab87cbe8c0319f6c549b6894c7eddcdde8a5486158a9ba3a5e7b221cb420e4b928ab37'
        '92e4f1714812073ae90e6e4d2383770a2bcb5abd3c8cf331a17df0110a2e0c540453f2467c46280a4827b11dd5ec99c428ab84af136cb0114c46631bbe42e9da'
        '4a1a788ed9c8400edb3461a73dbd56ea891995753705726a9ab951b563d9614b8cd522648c871eea7feb1e5eb604237e16aaf69a74f38eea0acbaec959cab429'
        'd527462ca2e1f0d959283b342efc0cdc3e2663275daf4ec535ba92db8d4e10b5e510d14d78d43dae35fde6c8ae5f0fd83622176b769b2b74623f58b376b8d825'
        '8837ed4c690814bb0069a2c3c286e1296648627773bd971d9b63ff1f4627dea4b7fb7ba59499037467e42dc29672b999e388e2de8711f050b4c87c19cb39db9a'
        'ad03a74819a292e49a5e6b11f8089484b47131660117849fec34b4fe00549e740acb1b9bffc4a2792576f42bbd9724d19cc3927ca8e023473f6bb81241ef6ac9'
        '432a9668c137b80036882927b84fe4c80767e19996f8460b560da6f3f648e944291f60f55fe71ed6d75f55dd8c568e2c28f929f473131d060cf3048eb79f13b5'
        'd1c0376096ebb949e6d936985db0b6d3359a40c691c74c8d010a8e908964dc32007c712fd025b9157a3164a689bed9284fac51ef9a049f3eb5c9c3c762788be8'
        '36002b59c9627e6e49eb8fd8c494dc8ff79c7a9a80bd9c204cad46bd91d2301ec1a1579460c12b57cf6d232c28675b66d9e35ca5988aa27d676266f013d7fba0'
        'ae2f9d4ed37eab56ca2eb0d9289c6c3325650af360a95cdfa69626e98f982564e4748f6e81dac338836c5092330a52a4577593310500edef16f5e821e232572e'
        'becd0bca42d8fc7699383c13b4542749ae1d74fde1ff8305874887f48a946995c3fdd3fc42716a781111e579e9fa0008859d8b868fb434b47b21684d19721e27'
        '2f3d0a0fa4accf06b073bd942f7595acff3f244e3013cdf043714ba1ed4801216e72178ffbfce879306d7fa1899cd775cfaaa291c09d01219c2b4f1c085f9d66'
        '95eada5cfc17ef75ef7e50ce0e84273abbf6484d8c0ed3f9446558e89803bfc5222476c623e599aeffb90d098f865cb0123b53f2a0c2fb475f36ef05a4d57f60'
        'eda10f3aa628c15c84c72cb641b901cb855142eadd3086beaded788289aec43ba609c4e5659b384397c452ef02e59d0c24503149c871079066b48a04ff3ea529'
        'c2882272f8933bbe5a99cc8b4ba70439760aa36e98ad0e80fdb496d645d7fb3bef124e5ed33fdf3443c74fd2cb8e42604ef55fd0219a8f8e3bd173a8b769261d'
        'cedba960192acb0a6d00864dab91bfa043895e6fc91c00b71a94159267a2c9991e41dba0a1181078b1cd56f3dd61021a2f70e2d34eedd4675f4d368cda86cf08'
        '9138d51b85cd859ae1a634cf1771d5e2cf914bd08740ac788cb6eafafa32ab8029b3bf81a7634d203bc01bb0eee8c071f7243a16622649c034823957e022c0b0'
        'e85e70c0fdae62056b4ee83dd08a0b6381a3d63e33b5818a50713c1ccdc6f7c352bc4a7d8e7ba12bf39aa2766751026ba019ef0bdbbd751e44b2fddea579e654'
        'd76504d920a3077265bca6b251822fbc8bc0c53eca22bf31c2bc5d1dfcb1f048d3aad74f50f15be87a4c6d2fd385537396b8f91221b7999fb0cfdf52e6e425fa'
        '838bac8c7a4705043cc69d4702a61b781f59d66fa6fd4e4cec069b17fafa98ac2be85c2d1cf8c540f641447dff645a0c7e0888d3a357420e1e272f5937e335aa'
        'e2a20d9bfaf356f0333321149b89bf70d92e2fbe7ea858c58fabbf506b32100e992bd7b800f55c44aef20eeed3ddce79d7d599c0d7b1dc338174388e399ce8a3'
        '19f6fc63a38863b8c2191c4ef2bb8b5f461837d3a1c94cbb4e3dd75482119697a7458fc6aa8a7d4739f7daa6800ae922fe5dfb59ad01fb2d1eeed19c29c6cd6d'
        '9eb93408d446d691f26a2f4f7d888b9c5541f6ea3ca21670aa0c4b2fac9859664090a483074e0487af473e3883f9f4b6ac2a553def60f89d9680afdbcd84fe88'
        '9505f86fa5dfeca31ff035ac34443a4102b6389e2c10b730b36a4d2c5f6c79f7e8135ffe4da6b2ca7f5646d5b99190d195e7b282ccccf3f90f8fdaa8cb09eb34'
        '32c7f186aa4bfb9402f22ccea0830dad1564f463ce5dc5fd4e88a6e165be6f208e4b27f0a06a6adf899c434a30f17743cd996f21ebf6f4a0fcf458be8c34a066'
        'a02a5713be15a6567d34da68ea20b4e34bbe978e349b6cadaf88c960559df2208278b0f89df3ac22d5bcdd200fe82767a03b5fb2d29294fbf072eaad54928241'
        'c8ebb935de090a249c48772d8ab13b8a2fa43368ac38a01d776dd414ec0107107e5d605d900b7e0510772842b42ff0f6350d5d149544d4c044dfe6b0c1055d75'
        'ee29e0e8145b2388da4c163b8b055e5197e93d676205442296f7da15b35e6da7150f909c1e681e34954e66f902fb6092f2c85bebd2ac89ddda9e9c97c112815e'
        '4b695bc75e124c6ed821af9374c3023bf934f33324023da84d783601f89998d29cb759870336d30a6c7dbfde37ffc6fa3181a6b3cda99af1a977206ee88c7ff7'
        '75c66c13871f843cbc41b7ffdc4f30ad85874cb02b514227e8e50b6e9fd71b3e6b0f2ece20057ba6ee0e2f79f7eab975f9e309bac232fe03889e4752bdee0a44'
        '22145f94aae117e9a0c6d1ae3b59d300c99eec4556602e1601385ddfb55ca1566ecc962dcc634b9e64b5dc2a02ca84774f474839cedadc5d159db34b5622c477'
        '049d6c60b0802110f7bc49041903e76f00d5e57f2e0caa16f4dbd066c366f88c175244be4930245aa0b613951fad0a46b6ca04b636defbfdfbee8f34f336a442'
        'e6526603b2b1cd301008459dd0c34f9509a18d180cf4e6d175d13789bbf540d778f0fe83093f6bd5e9ddaaedb7ed259e04a495d53891f40ccdbfa8934535b8bd'
        '482f14d82878703d0f8daa217e9cb12fd8fe3d3868c57523f08193c745113d3fd35ca0c83f24bdbdb9e1f86bd6ca733072d9caab6b137d128235871d7d9be846'
        '39b9970a5d5879176c347eeda22aefe54cb65e8e5587507b196ff3d76567beb54e0bc0fabac54ddf13e210e3787a10d3e6778531f24e7bc68496a3cab948d456'
        '2bed73651de9ed5cd1fda75be191ce1b7b893e30944193b05099e01abd529bf4e196485cb233b29ae88b1e5733c30ab8ac0518680124220d145909909a214904'
        '942f8094d20d76b2366078e2f21979f670a6a75a03199532192f2050251ad193f62a4020639ee4074003853a59f66538f9293bb59ca25b066628205fc63b2bba'
        '8f3d5007b291c477fa8e5448e20979c99c84cf173eb36feb3378af8ff4d06cd122eb7deac17e2b267d0008a80b63fbe90dc7df6cc9693136c2930a2877acc6c3'
        'e4643acad3aa18f6e6880275ec55a24cc65e572f7aef7a8bd3bc86cb81df07bdf14b071f09d81747e35fd083a90582365fb22336e0247ebd4efdb66240f7cfeb'
        'ce7b5413b96f28cadfb6d84825cf5cfbfc632fcaad6fae3c85ebe096e1fe117e683379ede88b7702a704889c731d9a5dd3e0418a4ae5bfa7fa5627c2e49f7e49'
        'f26aee20b3f7dec14dae55873850731a8db303217d57768857d152ddafa36116c404a1151d965fc7976752920f8a6443889619b78cf4306893a5de761e7e2eb9'
        '86f46784ab58100b403a69b6cd15bf8164227010821a8016116f6c6529dc8df30c6f9843b6dba6508dc41b600d050b1241f29cabbec3ee264f3e50de6eca9965'
        'b6fbe2e9ac567e3c05c05ccc14d1b7f46579132eb789b367ff5b59400730ae94fe69826baadf6e9274c0f9123718d758c469dd719a9f5c31b7de70a09c9d5c11'
        'f7d68fb99cc6bab13f71c54d98b187ef1fe9d3190fd95073b78d7e87ebbb4442b1d1dcb74ea6f438692d67b3080470c27cc209a2a7349afbc836da024aad13f1'
        '534ad0ca83210c91d156feb467d9b50229c8a598a3927bb05edd302e012407e48fc5ebe3b05921a809fea63e9aa986b1343aba7901f6bad9a6fa169875c72e61'
        'feea62cacd401e9da883f9fd443313d6962f33ed23f500b1ceeb93a5973dde6a4cbac3dade4c863617fa9e47a52cf54ade9fb587205f0e0e101ae6d0809cee01'
        'b6b12aed71027611893e87d67c185e8395ea095cf8ade251cc417a87e4b2107e072fd998c6354d5bad24a88fc3cd70fa47c1d24cb19ec45bc790065972ebba03'
        '35164c77aaf72b42df601bbdedadf2b457b02c8405a91f1f859efe91b63ce4ee2f12349a970fd25d82f7471ef6f761fe7002c4766e77f7a83af1c11a5085511e'
        '510e08d38e8b3672e6db83a74c62888fe7cfd8e74744952f2c0532151d4b248ba4fb886c7586507b546ae2d0059b856edb1f2778e6ce38cfd4dbe6b5e1a68c18'
        'd6704932252c5cab0559bb8465886103b71c38b02270a990c3a96f0b1d69ff7559a9bc88916a649d33162cae0e931053eeb8f25019f8b0e3f85b4fbd80292ca7'
        '683cb63572d38b6e1b18c023185bce29f5d530c4faebc46a99916d205de77ec2732e25ef9be82df9a072d1f21795d5f207979167b077cddf04eaadd594337797'
        'a2ba4948f1a2a0487a36c38acce0037edd7cf6615dc3f0e63faaab9195559fef4b7ca6dec9216696a42b1fe2ba3e1be86f756dd9d8b8e7ecb0b42daa99fd84ed'
        'fb9453aae3e74282a0dd91158cf50d27a58b2814bce832dcd6c6d8de40a7b68779710021dfa3172b9edc5b17a8ddafe1f8236297b1638ce80212528107f6e171'
        'd086570164a3dad45568ce79de6070085e086b5c852335ad6fd1ae8309308ef416fd4afbe18646333c2d3f84940d77a19ef44c9402118de1200c38d0077c180a'
        'a33ec7d2ff4fc77e1916dd8be7d6c2289541787066f47b2892300cdf9646eb40afb3fa2c46710f9b607ea2fb5fda1fc86b4706467868a81fa8c7668cc80986ac'
        'b96089e39febf1c107454771264e0af7747e47111ee1c05f2876d4a6aca5dba5ad9a6f5311af20c85df3226201f23cc676cad1308dcc10123f2a61a428974da9'
        'a39c04b235be952053cc81cc57c8b0b788dd8f85fdd0ec3fd2e90118305e0ceeec58258cdff0dcdd6abdf9b26453a59bc7994ad7e5ede6296ac19bf36897a8d9'
        '89e82f5eeee4b73751f6058fe2bc3be4dc3d841f6b9115c30187445eb09de752ccbe6556a91a1777fca458178996d4431c352fa865dfa9f9ad5e40620a911a77'
        '1e63c325d47a11c8773b23d0af66b844513e6fba6243df13cf006cd7b6fcb7815d2d002867ec5f58efa32f424665c90e94b955167d08d3857d09d8d7a153af97'
        'c37de2c1927b765d806035f9c4860f6bdf5183ac22104af4c4e76c5a2b319bbf2255bffee165e49ee69d7aeb7dc15b80f13c638c3ba782e3094b1a4b153eb84b'
        '489f910f64ee3572f55ededabee499e3540433841d2ac0338978cb9c22546a751c3dcd10e755545120af473457ffe2f9e1ce630372d6720d91a106637892bd3e'
        '4e5f96be0894e1828e5942cb1b531a8e2918085636b21efcfc0798124a1b1b82729574d4ac1355111555c119377736b4425a9e28c66ab5f302fd158019e844c6'
        '6b927744b94ab54eac1c080f3fecc09819936ca86fa3c1fe774d7a32af41aba61bd86fba73c913f71580541e9b54566814b6e5d482bf1654af5540971bf0fb89'
        '4dadf74ee6d8d57b6956172b19a58d6716d84174f69071f8fd75d824c2e8561ade668a639efd3b240cd62b3629e8f809c05f21893d48c6a3bc7d9702c214953f'
        '37987b9bc68c964339bb4e3c3ffe6353a0eee6ebc5bdf94a11460c30183caaf65bbb2fb204830435d01d6b08572f4be7079c4937628d3bf4e5676bba978819a1'
        '87f8c348e9053058fbb331b52eae1a3704cafa5ac1e92951b55a5b9b6b46a66843eaa465842fc97adbe30e545da79195192aae700c02f4134010d2ef1a18b904'
        '6174f37104a4085f8bbfe2d161be6cdde90299e21f57f055356129249d6e0cfae1c095f373b4cde6a53dd8a55a6087a66021290ed97778ed645b043e3f7e53cc'
        'dce1788475f5263d1b3bcd4e0d50a3e174a5d974a0fe46e9acb5206938cae619be26b808617804847619512c5898a93fc4bf2808da38e999d113bdd93ca69c91'
        'a7e7fcd15d7ff73c417ead1a825dd608304599e794c9f10bca86bf6bca425f1fe865848521da9b2993a930eefe27f82e4efdf1457e0d0b783e8edfc9af59cab3'
        '23cd29557b5aebdb3bdcd97091abeb659bca8cc3f8c983c0b3213d29b95286c0512cc95f26d537b9fb7b9c0d90326cefd5e9978af78c3d929829b54b702d3916'
        'ff19578419300d8c6057a5632cd0ca1de5923d0c83f437b3b07f825187c519528e1126d98887088acea3685ea54727c6b51b3263830c8c4445a6c265bace885b'
        'afd40cb6ad428ea8cc570afe670e2553bfbc5d1ffb63b79894d31b327bd7fe233567311f7173f75f969a9f5cadde06fa1b90f04c19525798babdec1f228bad1a'
        'fa08f29665c5510a9ca823054c64457a8fcbe232d00a6edebca321efbde9f5f0235cf4b4557da2a05a9a59158f6165eb4da1dd373931b0bdbc616e8458ccfabb'
        '5bd45b7d88e0f8622428121e7ae007d1390b95742d9602c895bd4fc30a1e54936bd8d71e27865d9e0f416c3da57a408c7e16ce134411fcf62b7629c470171003')
