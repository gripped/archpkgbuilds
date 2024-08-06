# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=129.0
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

b2sums=('d6f094d633c8f7df14651fc53a8ae017378de6c81bb4a7f75233f9e25d28833da23ea298fe2f9d8ece2a5961ec8c837a12587c661343d7c2737c17409cf1a331'
        'SKIP'
        'a18d754a9b5dd64747edf34033d31a648d83080b3075b206642c4d51b7a1eec3bbf8827582d4b9d92231516b884c83996fe2168788fb34eddf7ac4238dba8c77'
        '4b2df5012e61401763be93e75a1ddfc05c335f4ea21784f97a89a589e45487fe4960d390953302b9786554233f1ff7447ba0bc3baaba8ffcc2d99015659c59aa'
        '8d6c6e29164caca9c8168a5c0bee6e0a55b265a2cc56c00d5597869da363f84ce140a1866522c8d1ab60ff716162a557ffba06e4c56adccb3443d41e98705d9b'
        'a42352125f74e63ccf6d75f56b4ab25d15304c7380c76b1c13a52079abd0a8d5645e776d2e9fd2eb446554e9bef74bea8bf63186b0fc46c0532652a8d178d219'
        '42b7a422feb9f3dac1a83b91d23b89e270196d75d0c1a0baba8dedbfb92062193b0e4fffca093fa246b6df8637b7aacac18d0c4ff5cfb79b65bd3c330f50e621'
        '640a12901c57ca4ab2255caf3e72023ba97c21f1b2d89e744021e0e043f4313ee678b2c7d9a44f2ed3be6db03694133f14ebd21f5185d61c31403b7b845a7751'
        '26a70b24ece49fa4d1f4e45faa03698a02b85b2f498fd8e5a8c0586b73ea6d4925f40626cae8c3302f4da9b57cf3d864f33c769170215d83d3f1c5ce77330eba'
        '77b584b6e22feea0192b0bb4337fadb2d172671841b8d0f772124293ab6e12830c5ec4f064503f99acb09539eea250202e1463ca3031d117f36fd0493d06c417'
        'e9083c3b03504df24b2be96084552bae86886a8f49fc519f32355fe5b11bd94a58c97baf7d4a151f69e153ca3ea2db8832048aeb92e44bfa74692857bd25e9cc'
        '80e4b7b483369882553c0f2ef37bca33b6c7ed9715b97ab3a495e83e2f42fe8f65d45a81ad3b5cfd8c1959264f8d7d0fd5bcc55ada4d4dfc58e3a270d9b1b751'
        '306544dabd2c4ba7de1904547857670302fee47b6307a52f0e84700ebc812ec57ea7b6e18408bad0672695e45fbc74579ae64f093e0aa1a313f8b1ba15e9cc40'
        'ce4388358dd432d936dfeb2e00169384c8d2bf775775a2250f04f50d567ca51c3069f7d1705c31cb91f4df409f0680adbd05572ed637630302496405427b6470'
        'd037e4b4a0d46f9726acac556563e14a4ba504050b96c1369370bb2cb77d81a139505a18f9f89d73bda92ff354b6ca5e563d562f2e01a1affc4907b5e1f0e7a1'
        'd6519e0f387bc98feac962d621d0442db58fa1334bd9017b467e4e140d467adab1ba2a1b27242857e2eac3890ff7e908b3dc944ee959a4c85ae4ee08d6c059dd'
        '61bf849a016ab060c26cbc4436c4ce06a6f6416b1375570f070aadbebb5dd6e6febbe5af7227c8c916936e82789282ef321350a160b42f24ec5d91ed04270dab'
        'd0dca71d0c53c71ef0c1539c886aeb60550cfc57936f7ff3986929c7e55a3571cf3c7733105a1317de185c522e9e0e5c70da776aa7cb96b9d7d8a3fd30e32de6'
        '71c363dee621a01bfca33afb8c0231cb8ddb2ca452ca19eaa21b2d8cfedad8ef63249875125addcf4a6bef803d802b87dc0d95b1b79e5477d39a0bd4641df306'
        '5ec54ab16c77ac66831a2e38a0066c5b6c81c0291febebf01fa8a953b633cc26ae1bf04d300cb644f3eb6267f6c72646c58156bf121ac93cb3bf8f1880b3cc77'
        '49005e81557b3be8b3346247394da69c2048336061a0a011ea557b4e0c9cd690d33c7c6c7dca69357acfb87deb7a69985522337e2bbbb424a956cb45936f10eb'
        '7617a3fd633517e1af7ac7d40e41975b5d2fc5ed68625c8dc601307277443ef5ddfb5f602512861dff6e8720985ac3ad498d99a84d832aa58ac8a63e252302ae'
        'b0f168fbd29af28669f9487ded068f3ecaab27b67e9daf48db6535ccf834d20424f20d13ceb65865d7c410eac611ddfab1764917305cbcda7bc4c4a058bf21f3'
        '5cc6c7c17a375257cdb66992019eead50b0eaca5356d9f385dd241e0986a92cb2c5fb5cad8f59c1d4289ce48dde7bec3c9967220e8cbae8937f2ce937a2afac1'
        '03dbb951198218274b13a2d6ecd233d2fb02b848facf6b7e6c44ec8aabb3830cf49d8db2c4b9dcd47377c36005e3ea817f1c485b5563cc5efebd68e31f8a9c98'
        'ba1b1c62a888e75fa05386936170521d8e4f38b04bea1015be76e40ea1a0a542b9a90157279801cf574743fee6881c80e30684e8630ed204e25d70d6b1cb7f09'
        '66e7e924e7e76728bee954d1e4959092583cb5822be02023de5d7ac5e6f346b8b0a9bc91b0197abee9c41c74a6c086c4ab3adcb5a878c6bbb1b364f5f4438484'
        'e69b110cc6e4e347b5116574a35c17651c85930a38bf79ca9f9636d5aa7764f349dfb81510a115a474e485efdec2e1e95889b1fbac70f44a59ffdf0851d2d2f8'
        'dcd167d53daa7489882e66d734e4bff7281546d03585a46535948fd81acfd5b81cdc9f185fa4d1540f7fec77acf601fd3dd64fbadce11cd71c44574b761d3344'
        '701c52a390789ab60e7bcfaf95cec88ffe63a8de06fda0bfe64b603334c325d940fe9db229d9dfad0b603129db0bd92dd5e6671ec4c1ea3a6c0fc71a79a63caf'
        '92ae97aaf37590a6dbffbb8d28d106b225e621952d36913548f99a0879e837c35218fa73856f01e4085571b9266668b718e4414b3b0fa6fcf0a08049fd8627df'
        'd9a2c6a5d6c4df832abd82e8b6e3f53a197ee3a68a9256df3c82c32e5845e7e08ad182f7434245d6a586647d9ea859ce9a9a0f00c2bb3519a8e8f991e73ccd7a'
        '0eccf35584e5fc6d488c438577f03f4136db74da081ef8e42b7a3f9549dd9a6920049c22aa0a8c7ff9df4fc81646ff728ea2b012795798fcd2d7c94b74c16905'
        '5da946d71eacb54db0a3e62f34c4012b8cd9a3cbddc4fba599cd0d986d6b89b989b906f9973cc00cd7c57adb0566a08783bb5d195944f5596e0ac4155066c700'
        '270a28ee23a2e394ddf9f328e14dbfeca53a9218ee138415ad04c5852bbc26f29274c6dead935e38a1613b67c8f4baee05b62d254b988f173e15c66c364a9bc3'
        '7f18a75fd1106861e2b6f83bc673924f07c6ba4b1240d180e5e2c0908113f6b0c228ffc3ae05ff1e99149f15f823e4709a47232c0296ddfda5423d532000dd76'
        'c3dfa9be7005b8c657157024bd054e1baccb0d17d91811bebf293440fc5e9c6e80df5212eca8120fae67017065c5daeda7f1bf0230d251eb1bf272ca63424ab8'
        'c1c8585b77a7d2171cc8c4597535d64e9307108462fda57fccddda886f71c9948f691dedfd4f439a67ed217f697f0fdc16c3dff0e619edcc753954192242a1b2'
        'dcbd01b540afcae7cef4c0d68902326917593ca1700adc72b2e3af0c02efbe894a55f9aa34eb09e13fa80304c5b9dd8c80e1f764c21a5719e098b37a34884983'
        '15f3e4ecb34ca00791e78cf372359b5018687849d27472a6e67ca48423ac82a7542fe7f1da9cb2333035291a6732bd04dec90a46075aacb3cf1e28bf91469fab'
        '7d5f6715375a011af04030fd95640726c3c7761cabb21765f53c07794632e42a1c99d6cfef06b32c89d21c0959e5e91a15eda8bac9bfff1f2495729b7366c9a7'
        '9bd4977028ef4a7f5510e8741d05cb5dc2dc33f9b22d0aaa64b0a7d05a20e235a46a166476a5730d83e04aa1e9d32dfd02038611e2358ff4c93ee62d90c005fe'
        '763aa4ea6f45b8b6317415207b5c4086be1836392b9dbfaa5245d76b893c73365d06108c9f18100213fb6a997bca253e089b8e43a2c707a4d31ffb7e6ebebfd6'
        'b53e2556bba40429bc36c0a7702b63a8d0e3b1694ead129b496ebbd4b0924dc8ca41ea27a401f4437ae1886f25e3b5b6cf231b21a372df43f0443cf18f800b4a'
        '124fd2178ee2bda140234b3e87574fa520501150ede1506f2dbdc04cfe491e6454375bb15048be5c8d54fc72788f7721bd9cdda47c609478aa861b7ab2f6f246'
        '6c13ddfb6a38882eaf9fc024fe1582819bbfe675dc861b5ca8ccf6723aa4c71d5fa048e9d6f42f9cfd9ef9956828ec04cff264afb92f18a8ddc0d8395d4bc8d3'
        '5673b04b5284fbb9b9dec8d16ad4f1f7ddb2e2b64495f5e8592e78d526cdaa9522d74d2c571c40513aa2353ec7038a898d6420921730b343f655d75d8ae0e375'
        'd7a7f62bdefa69d3bd8e455dcb563b6663166599452949b15be51122a79f3c0697d0e9e3043a44c3941653a0943e0be9dcf84305fdacc29a15ec4253f0ec7c93'
        'fbed0d8e700177aefded1723b4ddf8061e1d4a161491f534750a2fec074335224a27c07c8f14348c8b9c9deae63e867cf24d731c3b41847d6a88d95a92f74ae2'
        '024bf2ed5167902b0d8eddc1d976ffd245ad58be71cf6627f066a4f16d35f7d773aad2a27d400f058f45e7b39b35b5fb48f1ceef6b822d2b7e892bee58431205'
        '7e155c0ec0882ce920ed8dc0b1c6206409534301844b0fed74465b7794a24d8ce4a43f23fbca5bf2d34806cab99e0351495026b8ceeb7f8a685818e51bec706f'
        'b3e752dad3d15633f21816e30a31a595434c6c8e21f3898e8c1a83cdc6839f9b179a4fa855cbe272b6409ec2c26c7945e7166c332d9f534c25560d7949a7e702'
        '571ea27b2c529a353d564e04b15dbf325219d1a8aacb97715bf5dd5f828b989bc4bac3ec7c5f5b3b180bea64bf5040b87cac873971943a33e74a03661870e1f7'
        '565ce7ee85502440bfd866b85ffc13559728600427219769646172e88163542e120eeb06fcc7705b8614242c0d40c82ff5e09c157a7c783dafcf2b91e7eb7aed'
        'a5d08c307b753d95bb01b762339440520ef174d1bf52f56d6b1e331f6ce4b1fede041bf95514928e45d48ea752bb848b2216dc02c21c220d64be019487abfdc2'
        'cde2b3b236dcedba50efd7bf7e160d11f94a68b95f420a5602598b450f37e8d3f250eab67ee4c065d23f86c0e76dc9b77161f5a3e6a8e3a691905053335e0646'
        '6ffe6b99fd74a0662744cc16afa667972cb3a69ca34e2851e84fbbc3d3b1c39de587ba15630cd8fbc52d8bb97ca3741a52bc7b28fba0ec9d203a86eb3669f498'
        'e0879d679664ba3166b8f8f29bc72c5c9c973927337d541d6e14e8bc5e07a18fbc927f6d458cdd7d3e30bc0fd506657883f2bfde3f6451d0226ec4b9b57aa2db'
        '87c405c921d6e896bfff4f685574e1dff38616e4a552794d8fecb8429f1d64b0ae8bef6f1b3097c7fd0cd61dd3cf74aa9048cdf3afe49912e315c9223df38231'
        '86b1a8267535b7343ca1fc14bb1f6d5ed9832c3bd61804e984d14fc5d204240a0300b2c429ebf397cf03bc87cf240a67e6f4f32938ff51c26292b76729243c50'
        'd7aa679b331482e6ff4d21f11f04365f8fa4437aefc3d5ef38b3317d568b83e0297c8db0adae57426d479f58b887ad6f80c3f6084da9593efb84a620172ee7da'
        'c88a4a262cfa31bd2d81f797a0aaa4a79ac25b5ffe8ea2c3a8c02006d43a20e7aaf2667a6e2ec5391a13b4e73f019758776340db1449807c8d33c2a8ec19fe80'
        'd631d2e61309d6db67d659016cfb0057d1a5f6620ed7b5b3a402244d3ea8f0a66eb8ddf9e8349e7117bd42e9c6e095265991d5e6ef498c56c197dc118d25bd81'
        '0eb51812ff068eb754f6ec2538f9538f5e50b307bac2856f3a0d015d5e49d1976c5e9cdf3255e3dd50a8a32e65a21620921140c0752c262ca04e4bf6dd184e39'
        '019436e5226b9cbc03703030b2cadf03bb80478c3843da2fe40bcdc039037369d4091cf7a04e3ea5d4f89bdc39d448f6cc862275eacc6735f7456da30a089e35'
        '8c6ac532d2ee8b4d629b2cbca96fdbd8aa0a510fb629821074964986ba90a8914ba8683c846adba12f6d04074af9d7f6445ef8e567c0662197dd2013d0ad3df9'
        '506839e97769d48c88cbece5a7643d6155ab16d3dad3307887075c4cad6974ee9f904b383ab9aafa1957a208dda6788940fe1589ec0bc110461565e1f1df027f'
        '8c8e5c4f0e8cfb4a21016e16a09d31c0036604242c1b1029d263d1ded7dc9c14059550cc89a144ed7a5756bb0f42e349000c3a3a5a3c998d911490c2e89fe0b1'
        '63713af7a1dd613b118c605a62e4110b40de532be26fb37156ef9ee77963b3912f45a5de2a9008d5fd9aee477fa74cdd07102d221ebd53735d3c0073d29ffc7d'
        '301cfe9ce815235765027455288f67c5cb19867305022065b39d8a3731f0155a2309ff9f2c5308be7898a49dcae92386f20dc65a7c8ba309a161475f8cbc2d31'
        'c872384269d9752afe19d65559d2c42931100a42c948935ec4986a82dedca01c50f67c4f5ad7edbc59a08f2717acc2e380421d3c93f09d984d80efd8209205e2'
        '03e0fc6dcf654f766bfba980f493fc44f004e0c91efeaa6d45c53962b98f01dbfa6f4f145974f09f662a40192a167d55cd6c19d61f5598e975f4fe780447d8d4'
        '931f958b9c9cc5644c6fa1e66964a776e3edf0561d6a8943dd217b962f11eae2bccbb6889eb16d02aa0f37fd14447f5cdcf947416f935d72639ac15981dbf450'
        '2566a995dbd267513d0ec60ba84f050ed011b714edab943bcb6710c38dd34aef01f97370af215ac9f3f604decc51f14bab326b251b005950be8c6f9694893235'
        '406a116c7ddcc0b8bdeb1dbe50e6a40312571e2725ba9d4a9b9e8bd09cf1df586d23e4e2c0b9a79051f52dd96ede6f60d597f762d8d14c0d6097b9da00246f86'
        '3b34ddebbb7a4b51b0456b2c8a458f66628c797d6cc8708aa952c7ddbdfe44b7db6057edb7aefa075c5c28964dad1e0323e71115d4dfda62cbe2f76f145c894f'
        'e200cac2225b3abaa1a7485918ce8c3a943d51a60a712009c6f1c0e82efc4f4d11a9139f416868e079d3833d1bb8a517f5a0b72b6bb16a6111d6a357985d7af4'
        '2ec755b3ba7f133cb66a806232d312a635ab73fd4e0cd1d4b4474ba1475cd755ab6b443bb36d12c823f1b1e051e624b72088cd84c973028386e1c408781f0176'
        'bda2241dcc89986bf590d75539bb59bb253ad24421bacdc21d19f0fa9651c183b0c22de15b454b86c4be6d1ce32a1794a43974d56a1732e6f67b6fbfb78dc187'
        '90f16c38a52d6ba2d4eea985201c35b2f1a270284d609821701fafa03fb34c3a7412eef0c5ff13cde3399f8cdfb815a6d83e2caab0cbfbc30479fa98694123fe'
        '9a314cea536990051b9f77c835054d66d11374525f966a0972696c44daf9f9ac91bf0168aa01f68c5cb8c8f5515afbe1e8c0d34eb1991a328ed42e37035652a7'
        '7570b205e8ba3cd92905c988ac8fcb249f2521129480cf9b186135d1c287222517aa39e8bbdc976694af4f922ed75e7276f7bada49de6f8b15bb3947056d37c5'
        '032c22ac323bb76264e09145a5de5d6ad4861d916a40cce37c9b270dcf3cc21e949e656a2b0588ce14789c34b9143c4020a1c6b498d63d09c1cd3e102f93d705'
        'fb3edf857f07d937e84add67f2ba74c8fa24a879e18b0e5e4ed7ee9d5dbf5e11515d9bb7eb4891984c7abc78a63a6ddd56220987147817fc4b0c82585f4e54cc'
        '4a74250ca07c41d4241d11a4f9fdec9d2cdc58e94e7543e59de6570ffe0d5ce20ed78c184f71b674ade47e7ec4511e7f1449c9e3707eccb2c72ad8507f7f13f5'
        '851442e79deb9ac85881dffff39dc1a61e364065824ed7bfeb2bbe9b4273ca3fc53505f481c63b94c002c95505def63b889f485236605a445c04fb0803e114f2'
        'f7080076b63bd78ecfa43ebec494dba86c50ec59539726ecf0420be6d5b1d82bf5165aaf15b280966cc68782b0900ce433c3d88cc491cc12629a197c4dd2b115'
        '9f15377edb8eaeeae601c0fd255739fad7fbc96d1320246da12997c9226190755a28f3e8bc051733dcf369aa135fecf6cec27c8f2ea0eb62cb6e2fe95517d240'
        'cba40453caa4dd835f9548797cfc4350db4bce8d05d3a6254e27635f3815ab9b4c10f8f08666fad1ef0e3a041054dc8d9b48cc1f7e40239915da886e3c0d62f4'
        '4075df53cbb534ae97be7df09caa47fc63e71225186c852ebdf6006db2f81ed6f111fd9461c6b2383d81ce424188ac503148b7f154cd433fd1b29c077763686d'
        'a5d4c0d66971dd51cafd441fa81fbaaa5da92edf3c8aa1c7c9f355f61d177e9d8d7343bfe6f2cf5c54a4529d82a1ad79958bdd751c0079fdcd9bb85dd33944e1'
        'c047cbd20038dff66f3ca561eb865f64bf5cf75ac0386c1f74607de38018fe4e440a6e48c5a153986bcfb3cc421a49432cc5dc9492982ad6a3dd69acade5a015'
        'ebde7478692071b6d350a5ebcb5b4c04d35c8dbfb69830bbf41df4eef8a8439b2265513cb7f8e5696fd06de0226ea7e0ad9d056064ba978b198f65d5928a136e'
        '722a64407ab22950c55344e45b81696bce21ab8e5f36286a081ccea40e56c6a779cd6801aea38593d0df4ac8accc7a3b61c20eed8bc108798a5c73063d96d7cc'
        '9bcb6082169808b2a1d801e3ec15142debeef0bd04153b5ecf80c8eefa256d696db6eb939b366ba96970e1fa8dd1f8ac2e404c1d40dc74ae4bb74f6f89fe5872'
        'c32118ff88a90b3b34950592345e798295c3042e8a3693b769ce97d91c7d4c158bc7ead979b22977118fc67f47020e02b199609d6a0e8a2c3d5589fd938f1607'
        '18934a021f722b391587db29a462d065e3cdd9042eb27ebd8f62af014fe5183f3f1f8e3bb553b38066ce02c47971e1438f063ef6f7a845b6f3adb27922b3a4c4'
        '50a724dbae41800d5817fcae0285344a4623def4cc6752e9c426a2d1fe875b13e3c9360d1c9eeef77109f515348e9d2556261362bb7d3887ca608a78c6272888'
        'c55fe815b8914a933976e085e8e00b943a9abf8d6655c255918509a83e44522e51bb19b53c4f5e79c397e5dfced8a63817ccd19a34f0659844071414813b1f9c'
        '9555ad7f63d6f3f73d548193acaf48d13b5645f4b05a54528a009a98774f480f76755d494e7b5e70c4a8f372aa3bea00a26bd64bffd066884bea3e9d48466f82'
        'a716a87be418939a1792d9fe95754a318c2ce8ca3427201dc3103c8105f42deee060bc1f4ed6a3f7ffaf4cda4daf6d42360e36f09f05c10b48e52fd5b06d6722'
        '817db5f6931bfec8555210ba4c123156ea6517c54dde58033b9c11dda78b4ac0b9b6cad6eb58637836cd86a5f3ad6b031cbf4ae06ed7c326ae7e2a4cdb2270d0'
        '43b17550b6d5e43d9eab54e8a5be693754b8752c69071af37588fbe37df5c34f430cb12e1b786d55657492a879a09431f7cbcf03b9f15931f5b425d6b672995d'
        'a3e42fd166f3e53e257a01867a39b5968205fc1776039a90a313ec83172cbf01a56ebe03822df187a6858ab68d0b2771aa279b069433f0f1a775601cdb394844'
        '55a5662cbec90c5a4813ed7540cded88b50560d226b17b43c9b8454ee901a269b974ced3f9babb8b46fdcf0a51d4871a36e33d3ff0969597aeda34690c4a5863')
