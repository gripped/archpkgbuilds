# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=132.0.2
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

b2sums=('e68299fc1c41ee2ae4afc48bf01d9e0d5c9975a8d276688df0ded09e0e21ac29d79f403cbffd977dbdfd088eaaa57a810b66114845619f7ad538ae3f628780f9'
        'SKIP'
        '841156f14a633ea775a85426b8c229e29cc772591a71d63145a93310ceafe34abe3771aae438451605f3fab5a37d096f5fa2f61553c370f9212d8c2fc948920a'
        'e68fed5131f695bcc9c814f73ddb47c9b2eee35692a216c06f7c394316497ae19e54eaa2016abe17390660c3886dea615d98893bce92ec55cfc1eb8e02076a38'
        '4b2bad5760a34fbde1c8570a7c8d6d518f70a6dfe104247f9b6944b1a0773ef933dac6b8a417674df33a7c0addb415ed847eec935ad86da6cd5241a24d1af8b8'
        'f595558df803257586d32637aa01c84de8981e84842f8446776d9297998fe3abd7d5f0ce4356baafa48c6bbd6ce05d2f04c52e62dd760697826700e1363c865e'
        '4d4d94c925674b01ebf8b36e428ab7d008c83fbb208620d66ddcc2cb0cd02b8a636f57727aa961d987cb8b34957c7f37e88b2db781999f863019a2f7620a4051'
        '385b92317f4258ac93344d26698756d9140d9104c06ab3ab44782e428dc0cd2af6cfd2f2c419f8ea88aeed1c286e21ddbbb1b874c5bde26a5b83529a24656753'
        '00b6bfbfd76ce34eb28a3f6bffc93775eb2a28df82dbc7c79e6ac4e2933fc66d20d5a1e95445a990995bf1fc5f5a258e183004193ad36ebf8531be85ab64e206'
        'ac2d4f4d16ca22b05c868007a87f02b20fe5b716bee6603d79b24ed288be5e3bd31a31d4062143dd22dec90987e5baac46531c9b97fbf35edfe5826cde653eb2'
        '8718f62f40944f353dd75a5ef73b9f00c8922875405364b6504b394fbbca004401f588d9a259efc569f0ab7dabfdb495b02b3123b4888956c6fa0e642f702541'
        '2a3a43ef38304c63c88f7970f732d91f9e7cdba6e2b56701a1c8c9b82a8f43cdcbfd3a0ac6796e345592182fe6c458ce0a4b3f3bd4af88111e3bac2a0a28b800'
        '2ca4993e8219bc9ee5cfe85b91747f0ce290fed52c3d3201310bde4cfd590904b14d0502b62a4766bbff060f3f25c6e0ddead88cc7afb46755e98ed891f074d6'
        '953cb26bd6106aac4ef7961ad725eb5497763f85d92d99cbb96fc933ac945cc61f0363f0a5313de1e94dc83b0dd88c376e1a82397617a7361ce2ba484006cef5'
        '14158d56110e467cf725a42cd888607fe9e638d00c86d431d38c1fe770ad834fe2e8fee7a8d91b2ccafff7f3d1b182212cfc1a083588a3ed0e58b559f8f0d3e8'
        '644547d2a7a545c878a14cd18d6182df2109df9bd0cc2c8672416d77b0bfc5394ac1a33a7d698a2c6c7df03e86b76efcc02b066b23cbd1b530a42ceb3ca9607b'
        '30a672adfb8370cc73db4124f0f80c792e757f3cd0e171895f4899f4ed49bf5cc4e56645c4ffe81f959016bd9067c734f42a5f10ec2847b533cfe20cddae3fbc'
        '4d39129fca426d897b8db58d832e8e988d51625746a8736e043aab106722c2f4de5bd9677cf2d89ee5c7f6514697c3ea4e2dd8ea3e0392ff9fcec14ad06ad4e9'
        '5f34c48da31c652f42e138f68f0b8f80ed2a1f0fe6aa5cc78c268ccbda7d1881defcb2cd6badf9d3c06d42e6598f8cb1a4e933811f4b37bfae3b6e0270da34a1'
        '947c957874be9a0d8f9467942d3e2cea5c495dccc2a634c0e6b2c7f4b02967cd7295325bf7e7ad29f7406323b1dfc3e22cc05e7b8bcb5792b1ff488b270a8a13'
        '75e0441f1c05a02f9c8b4efd69767ac1f7e70ce59b3c8429e70ee3f54741c86be9162fef3875a4a33f92c1b96bfa94b53ea81cdeb667ec69b3c2aaf9faec012f'
        '70e513b6f41b72433f848334bc05007dbdf8eed05c8fa0f0380573bb9855cf434449efd02e6e2d612d7c9d0a108bf44b9ce9fe04dd475ba1a8ba810f98a75d23'
        '6145fa2155e5cad211f08c92d1a843433a15ed57f6abd56febf84b2d7ef63e693473a65db9537f6ce619101fb5473ce9c9d48d983b7f629f6f0909b88b1823e0'
        'afd7cb2d83168a19d053902ee2942da052f0ae8efd0e7b0841dad5fd84bf5f9520fc0d4709ed814f623b8903006efec1c6c81b60221886bb0f70ff7404c027bf'
        'a5767cb10208915e826d247c454c72ca640c7814bab323f27e8fd5aefc444245119abb46befb713b198f3caae3ec0fe7fe92925bc8507b384f74b9e68fa9fc9a'
        '47bddcdb6766101953512666048dffedb58d2c001a2ff389d4798e5bd6262b5aa519360cf9e1fab7a4f0c4bad12b182254102e1d86030bc91832f1b078252e8a'
        '52393040762c961d32fae4dd5fb85d14e9599be8e705e7272f0f53300905aae4a8a8dfe31513aa296c911bfaba8178f20d3de39c0bc6b8bab5990f7ddd50404d'
        '2a1aad17d5add11a4e2104c4e5c32a56a180fb6b116e2b39b43e31bac7c3c11d5a142c658cbbd641dff885b00c1bdf7bf35503485da128b4330cb4a7eea01edb'
        '0577933e610658ae7dcbbcbbae58175cc615419d8564d6797eb357e24dc876ea8ece0258ef4c430d35a4550a76a4d60eaef0760ecedd9c10c021ca75f69f557a'
        'a32215ab0f13e2797049cb7fcb72b6b979e903ea7767fcbc8a862ffbef9bb84b9885d2e836e74a1ba71844815749f1c51e657a967fde622ffd3fcfa4db0e4fa5'
        '699ade0cca167136be6767a04c63eb9c9bad2cb55ce79da4aefc61796ed79d5f1071379277b780e9c137099d7d5d1480dd3ef43d8a699a8748fa28bcca609152'
        '54ced28611f00d0de39f14d3ad208d7ff3ce944a31d273eb3c4edb40ddffa5ac3b2e76a33c694fccb810d416c67969fe9cc1d9cb5f8058baede329c9021deb08'
        '55b5d3a94cf90a465931b16a692619d7904555490e6ed89f05939953d2a2b8fe39383b4f51c4f07207b4fe5f8ba417b9eab8c06633372b94f355814035f48435'
        'c6f8c918acbd98e52c0ef2e812dec5a18824ddff5880f0e2eb13a393c64cd3cee144ffcf0be03d28b9a001196762ce16811125ea559baf11a500f3b1eddd1389'
        '4e5b4a699941d8f24298dc41dc3520056a4a88941672fbea9b182f3a7a1a53a1226d92e45af9552d793e17df28dc46975f9e226f93cbfd88560823f374b11038'
        'cfc89b209f3a3db88e0c87364604b8f0ffbe545f466cc6ae8cf562dd4c9f9e106e67c0e7d49b67b6d56cf9cc223d9126a056923ab9f0491d8f52100a4cbe8034'
        '6926ab64138705a4dfc33e4b2147243c0889d13eda594d12181035da80e0e80c38b9f5d99366e6a9bf4d3526fc257cb0da1a9f6ef0280fb7158c909b47322b0a'
        'e874ab2a7491af8646be9349dca74e68d64697349197778642d2e10a1e439ce6d91e7dca884d6e94fcb0e1256a65345bb9675292d316ac83cd5b020d5a72dd65'
        'db71d23230a2f446f6b6611727c09a13bd67151e74f739a5b55bd68aae5c84801319bda80220e78525a77d2f13b5af69c40211bcdb1a42d9b56a4c6bf69cfeba'
        'bb78d1080a6cf93671c3cf56e4b3ab0a93366fca31e103cf84ebc74548592e8169c2ac477deb6351cfa6310f5b41e6b2cf0f0087b2582568529beab3bdbaf038'
        'fb94aff49e882fe302bb8460b1ab5cf98828dda7627fe5ccc157dc393b06e4a5694fe2358ef22130d2a23ceb27a5d48db238b79bd00430d05a9b948a11fabe43'
        '5ad1000b0d04d360178b2751a895d0394010cbe8cde3c3be2c71a31bec2d7e67ddc45afbdee5f1f28840a97b908adee0c3e0a2e76cf0d4437fa3bbc840f5204d'
        '447f56eba782a0542267f9f605c7f0f693f6ff1060957f00b236e82b3a36fad3cfe9a29625a01f82b2ef0df7f22235033866dc00cd73ec991df1a674352c666b'
        'da416b20f1a54eef8bd7b39226e6db239627c127323b294311a99df96a0d442f0f9e1060c27f89999ec295acb782b0d8cd5291d26ce5a8e58b4a03c9aed2775f'
        '0a2cf794532beab7240fd1672bff4d659c0568dcb138d6331eb4ea3d79f1a6fbea9e8f8fc5fa921903c77930d330126587713041b80cc65329adacc86f7f95d7'
        '3fc445002da07b17a0e948dc9adca8e600656c47a856cd20fd2ae2f30a95e317a8b5263632b64cf8a076cb9521e2e2e44387905ccf98534f8a217c92cc30f84c'
        'fa7dc2b7d67cfd04e0c0c93f2744890810f431252d0840b204f73aef31a9d13d4a6393515a7aca67ac5232a8d07d9e5092131d36e60cbc7245e2908bcec3503a'
        '6c62c10e6bd93adf6c6ed897463446ca7aa843ac64dc2a9a63bdf40c6905596b306b8e59c6bd420f4950966553ea74165fdda7d41d1af62ddd96191e0920fd44'
        'b1aa4fb763e76b165b97df6fc69ead23a0615d836c1964308b2001c4477175c70c7d64f65e3cc490d7546a05fdb76f5e7c0de0d1aea32d93fc61fedc38fbe337'
        '750a3a53bc0e488e3409be2edebca20c4367f3cdd2985ae743a5b7b3164807f6910c6141c4004c5cd1cb5ad0df253904b26b600ac32a8c28c31520002eb26adb'
        '36647134acdcd2cbd3690ae7474c718c678ae11c01cd133d8cc615e14d80da9f50a6a60f28d418e7e943ea2ebb22aae5795f27c7f2cb24beaa3a855af54344f6'
        'be04937e77ebb6756426a8b804ed7e2dba95165cb70feb1bd5449c880628f5fb515d66a1ef567c73bfc08eae581e3eb771094dc881c1d9f60dbd5a08aadcf5f7'
        '3c58ad56d4dffc685ae9fa5127661b6656ba1e6e6ca4774dc555aedef835efcda2f0d3fc50290041bd6e0d75d872d98d50acd1353e1b408bfd4eb25087b7ebb6'
        '9b50a8826a04b244cece7ebfd3dbd03a356a7ba8ceab19be620d1ecf54f43c7516e194a81d94f675306b5bcfd73e085cf6dd1fe1ecc8b2f3ea3789d1bca65fa0'
        '33c7e4e9f78a03ae0811884fba8c6a3f8ce70c2086a2c1f343b189572bfa3e2723c620ed7d4f6b22a179207a42ffb1e741cea01e91bd83249719f22c5ade40f3'
        '8a29eaad65c211244e5d9f412ac7496cdcb2613ea4d50eb17fb362dd626fcf909af336f17b61c4773e8d07f8cbe66f1b2c6e1d26acd1e2cd6b1e556208281409'
        '293a08890e21406450707f3280575e602bdedb351f01510ced08b71a6e0dfe8fdd2ac9df904eaec756e41c2022266689ec33fdc1384c007c5f6df791f15c5ffe'
        '0a5d8d22882d3c4d19047bf3584e09c5d59c9d917a63d450e1d4a2ab01babc13c084a795c8ae178d28911310190c409af7632e61b2fbe2631b69fb17be67a495'
        'a5051dcdc7ee11d41e52af729b3b544a6e1a1687cc6eb118a69cc3eaa44bb9503b1c48459d9b83459c8683f5b74a9f8bdd07b7c7b5155c5fee993c09dd9ce03e'
        'f696cd8dee1e63e4e13b9d5799149b3ca79d8642f6afdf3c58a5e2adc800e805bcbbb501a6968f4a89ba08dc9c29ec680614f59d7380f070cfaf1ad9891deaee'
        '4f649afa3622f1e9ff010b9c7c983962673feedfb9fc8980bb7cbe5677a6de5128da81ce56ef14dd19e43db25a7feb5e0f7d9042f9c13654e2a99f54c9a69197'
        '5e8666d34a67b1c09fff4b0e80696f0430d4464b8eeae936fa52924a30f74469bcc20a4ef1789ab9bdb878c7e6be703a3a5387e996e23dd951cd938ee9f6d650'
        '4c76e2966f9856bb4f373e1c522aaa8e320d9c5d1d1a4db55a06d98196427d408fa30aa4aa2ccd9d313314617d29e631cd4443d836b17ff833d450e9f2922789'
        '60a43baf1b763a5769413e06b2cdd735b1ca2dfe6b684736ecc6f77e70ae479bd32c2785093a03cd4b8175116e3400dbd90b2de7d80b4def62ea50aa1880d67e'
        '8b53b94a0e0c8165ed848a9af1f0f7701b1d74eab00868969f438fecf723e83f16cbb35c7b5848973841322963581ad6cabf35325a6e0960f3ae39da6938cfa1'
        'a1db6dd5bc0e550dda458d0a78e21eac26d4a948cefd1c7915ab74980befd8504bdd4e1ba51e972bdd0d5cd6e1995b413c829b573b6b876d3ee5ca71ac145e5e'
        'ee4b5d44fd4f4f4a09af249d692d900a227730d60017511e16944d4264936e03ec3aba9a88f3d25ebbcbae5e1be8c4477bc07dd2c4d4b89ec8820a2e04c85a5c'
        '826c98d222dc05eb724b6bba4a48bf666e8d46c26286b894ee7f291ee7e3131cfcc404d8c7253700a4f4343bcb77e5b7ff5c890a573447ca0722e8565c160cf5'
        '751f5e711f5b2ab456dd359f1c5843fb5cf4792dfd8e7029f09399269df09741572ed8cf5ad646749f78c6b7f858a7d42cdfe6f76213a30bf129f68369514369'
        '49ac366b022b17e426c4fb8d77e871f6b661fe63b58e0c1a9d094c54cd71f4ac2b518c5c9feb86822e9ada20f9bb2995685ef609685d76a14941d1b7c46903ee'
        '7cb2b9884f0a690ba9effddead726fadcfd4b827dfe089835c69fe917c4b7c88b739e54db64f02a2b12a91e342514ecc8c135c01b2f39bf6eb96c138325986bb'
        'ac37a39a7623089ce8de500797108f201e63b087629bad757f47a85eb91a8a1cff0bcc5cc75180a57efaab361717aff4f2583c5150fd45f08aadd7a2be1ad9f7'
        '219b3c66975a8f21cf8b8787ceb4f756164c73f0f2f6d0fb274c0889ab180498c070feb3384763aee44f8fa803a46a19e3d9579a2e6d88a4b5cba578fa229d48'
        '946e494b557fb3a799a4081bc8bd125b98e0b786007ad3276d76926fd0ae50ff37c4f4e5e71d91577d22d9f2011f9954c954c326c4203acde466d05c9b48af97'
        '130354c59da013a95cf047a4a8a269eaac42dec93db59e641dcee782e70c9a284333980609eb6534b0d970e2540c7da5dc54ee557cf231e9784880dcad81da6e'
        'a13fb8fa15871ffd5b5bb7e96036874a99a150d6ad3e14936e4bdced9f62a78eae944ba4fb32e811aba3ceaf98d425d5d1304905428417a6ebe1824519771611'
        'f5c53f7e6487c2c7953329a812c8a0c3e9d9e1425c52fa076dae99cbb60d5d3f1089cb796f3856a6b6a9922d3dfadbd4f915ff6836f05dbb3665d08d319688af'
        '7a0540d8fa2785a38c62bcd2a4154708fa3e1c6983b375ce5f2fd31a343a9b44353ed5e5d514403a8e5678db01f2c04da710ed6a76cff21643ceaab55be4274c'
        '655b3ca367aa40e405cad44deb02762e7c850a1e9438ee76bb625ddd3284ac69737433dea186b6a8fcaf63af032e4f78c53b0225f295a44f64aa835dbf139542'
        'ee928b687e08b208e5a9a492dc9638dfafac2941d65a2ab465a9e0e85c481ac0dfb85302e58fe46675abf10f653da7c8dc4e89c1cdceafb24695b2fb9c898cf8'
        '0e9dc5ddbc48df728ec9df3a1324ced2d58492854aafc5cb03bc7615f2b5aee83830e2b664ba24d407338e2d5731b97874e2f01456283c07d3ce5038344deddf'
        'fa81615044d6084a5cb63535c35914b1a5a30829876b66be3058732ba8e88adc24e0b41c399fc4c19c3b1de2681ae9aa1ba0227c09e044eb376a5350e5484295'
        'bc798fb13f32d3d99a62ca354d389150a313c1035d3a019efa4b485dda6d9b3a94e01ada3382c79d68f14e424ed5be7005220ed76bc01a33397a3476df88c8c1'
        '8976ffaac09ecf84ef1f1e1c2fa96de631f356017a2d0924730442b73bd17dc0a579e3fd3a249aad7640235756c17beeff93ffd0b3e4f03a7cbf206dc64832ee'
        '3d652df871013776e63d839601f1d09b21ea9ec6a6df05e16d3b164ae39f4968e4b9eeaf96b31908745245770abffb5a284487b194d6df146836cd0856aa68a5'
        '3b1b12e4c68b1188697938d743a942b0ebda2687f742aee2bf184a0a928635ef85856c237d2e07f8fd6d2c6d3f1ea3eb48ec2c13fde1f2a263a5a78a006a9492'
        'b74702e9300fa1ecf86af87bea87d63290fd2b8f2e4d8a05fe63f895b0bf30b8b31037951ed9e2d5e5c50821bc14453b24256e7f63ddcac314cef297629f3279'
        'cba04b9fe059d85bc6ba297c0acc3b97df547a8029fcc5096108b3da356eb6183959feef449adcdc3e2672d665a5421f85a9aaec367c5e0a1ee024ec470d3f0d'
        'ca50ab7d6216b6b393bcd3150f83c7d73f4bdb46fdc0ed7c5be6a49ad93e5b3d157b1e24cd20ae399f28c461c4f3e042d767e6fdc68d366e64433d4d7697c660'
        '68b69e3ceb831cf067c6222621f1fec31575ccd7f70d34e804e402191019bab3b0812ded170547466a504504fdf0e6156da60194a233025761ece6e379462dea'
        'c3944985a7130db8d9fb28ae06bedae1158c284f02b77ccca401f2ffd8a8ac4e59c82b7be8cf456ed58ff8a82a79a783cca732236cff6e9af49e5d8f02d40038'
        '102a02c85cb02428e4c12f4c7f36428e5f2457ba9dce37f2a2fc9aeda760a51866b3768aa826642cb35e1a8174c3d215baa73cb6945e9c059cf4f1eb97e25844'
        '1c2b0ec6ba71f406ca34fa6ab3e7678f12309bcfc689ccf62b4ca62a21b7e9b45ac65df159b46848006528c2accae20dd20b4eced520300920cba3137bb3bd8d'
        'd013066fc1631834fefc79dcd10415767c09525c3383c60861519c101d6482ca2b47c2d7ecc7a113fe4bf69bf10582bd674bf8ca970abb7b62f2d6f245774ad6'
        'c6273528dc8ac0033c86603de3253b9483efc2436710f22a5b5a3a0c311623fae3b9b962f880c471428fc3f8a4fe716f08fe5610a490e209b5a6ad2007232ff7'
        '71f119020ddf35a11d8a9f602a04e527b874d0516cde27e8a87d0f3d524adbe66a47fbdfbc0ceacf23fc6b4faad6b4bb264c1552c4fbc00ab726e7a309ec1639'
        '1c6642cc1830595a04397c9f95ece8f4552a2c0b556dbae20e3d1cd610389d7a3b97f03246485c2f54027021ac86edb9eb710f8037b9d7c347a93a9892ddbd49'
        'b79f4f7ee138cd4a5c8134d0d309927eb4e8a9199685427eba5f8b5a1815958686a3a59eb8a799f26955c9d0df6821171e58e24cbf8bd4cc0f7f28f0928587fc'
        'fc7b7193632bc0fb2d52074d52b5f9b60b316673af842a2a9e35b2ef24d530db0f6af02680f4db6d0e8ef66dc7b08412f205765d47af8e55e9314ce363267b50'
        '5758ab15f1893335353a75a02cd799ba58e6d2de5258af4d7c6a2f902787cea38a22dfa2ba470e3857bb87e4a61b42f48350df58d5383b4f49f66b36d067658c'
        '27c4db14e7d3d1626178569c01f1628ea10f8d9946c1d3d1131eeaba58981feb49f90ab79d6bd2a0712aad52c2a662b08cd44bbd3fdb8720c7d23914be58d331'
        '1d83f45c7ddcc4a93b77f44a479eb8448e0d7d2ef1613425bed130d08f898e3cbdc9d39a277f7b9a4386883e2b18de76ad0349cede76f53c83fe50ac6f2c01f4'
        'd4bcbd524706fcc5a75d94854f9890bc7ae90e81e8acf7e62443e5d81e2e5f77714e1da473a685414b2f794f34fa61bf932062500a559c0b4a71070fa4a299ff'
        '1887a9b7c49de2b8da5b30325b6d1b84e2b10fdddc90063cf0e84ecf39808ff0dab0ac5037456427b1c617e7d8c76bad3cafcbfc81d781be6232edf0f1d19c3f'
        'c421f438fec53fcc1851f076e0394a7ca5559511dd9d35da0ac85aabffa9acf57cfe00ff2174c83fe83e2a58c626bbff474591778b8ac18d0965e6524b9a07bc')
