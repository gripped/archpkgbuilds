# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=133.0.3
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

b2sums=('ed8cb7c3b005e5b2fb2f684084cacac6e7a7ca1f41e40eadcf202239fc210bf1b366d947614f5e3ae98a0021be1d6062c07456fa240f79a9e1b03a9c9f5f1857'
        'SKIP'
        '6da604850f3d69b4eb65a42e3d7c48a9d88803f91dd95b5fde30801a2041ca2cf0f11083fc565f21ed30c6588471bbdd8019f6d4cff8734b67ea105d2cfaef2f'
        '0a9adf8f87950c28cd7cc56ab75a391d2795cdcb60b6d9f7680a7456cd0886e169376ff18dd0e0fbb3ed702ea333c8668c2bf3a635ff6e54f2913a93fe668b5c'
        'ae9c162cca93513a10ef31e1e43421b7a1caec7928cf63a658f95e34aac9f1c81c58d314f8cd8bee54fe2f6f91bd418c63dcc2758a6ceb92a31dc0e2d9594b83'
        '0a51e88bc23d134c70072eac6dfecdd0b275c7976f3a8b775a0766afa6e4e3600a1c8aadcd036c4519ec2f6fb377847508f8d689dbc45c1109bac0cdaf2b0111'
        '302e0916d6b48d053e44da9689d4f2f56bd6c7edc6c55412b1be0837ee47f7528d5484dc68cd6332616d6f47b9512425a75e66a4fae0cd361dc7160f020c43e9'
        'c08f54c7214057f82309b1f6f6f503fa24335a970d02f7c1511a87566dc61b700af6efa099c4fd3c92f79d0b4ab6cd59e2d5ae414bb11f3610c16da3134c5650'
        '0e9df3d77f55c7e5c2f833f9f178143437cc752dbb809368cc0ac32d87b17d120d9c367c922937d21a2f839a0e16a9227a29b740995c4ce163d7feea3abfb0df'
        'cc4760756b998c1c0f4df9b6863f42dc0008e5575fa1440623eb94b7608d251a82aab54bcdc42d36c8c82bf551cb4564dad6c2f7cab3c5700e748c777a08360c'
        '3cbc6d5d418415acfe58435e49253b681f7b42bff0892c48f87cf139e622b57aecc2462642d8188c336f73f2b0c1e9fc0c1cfb7cad203ba9a90905bc8005cebe'
        '7fb5bca258a9f5f4b7ecab869e7bbe42424f899c2865e91e0cc3fe0d28315014a1d559de7939097f9a0487a33267f2250f0e3aa7e8b84b8e3668109706b44c5b'
        '030996cf2cc6ddcfb78f79bf5e24db7ba94ec5291307168855bff48c19015d5ff0a7607382a31dcbf826f0a1b7f755c4e34a32f64a63ab51ec2027efc0d91ecb'
        '74783ba7047a71aaf3fa72781dcff6459e1a07ede3bfe7f0169d21d4495d5086f8554b2534f2f6398fd356e6ac26d21bc4ede346da3d591c7a792bb1a93d173f'
        '2a6264ea27dc5126e414c0d7e668732b7a460a3e2cc3b3409c8fa5016026d6ad12579db9bf8f0bef13a9077c548c8a8c69bf4cd3e441442fbb64f55e36f4883e'
        '176c129fd274542c9bff8ff5012f48a960566ea67b6bba5da77fcb130179b7331834d5bd8e49ab0028ec0aa9b04c4f2d61f0773f65e7f18de440316068473a0f'
        '38199c714460b004b5df838271086437c059bdcc840289474b31eca4d240888e64182cf9d3ac8aa779593f931d6e0403f7e4bf6f13ab3b84132b7a2759803fe0'
        '75d0a2f6c07296959db0b0a8ae71bc977aa4068701051738a88a8a7affe9a3a412ca77b132d008733f737c83d70ce1043213eceda9fcd6e538e18b3e26288e74'
        'ce23d37ed6c72995ee377b9de79bf5272550cca072d8ca2533ce537705be5e0d95862fd0059de208c38c7a451dbad73f2f308cf5d9a6a3612f828d52ebe8df0e'
        'fde0a30b2fafe44db7f9a08220ed2a99e2e0dcfb61a4b8f0d9ae9cf9d1bca5381b637f383bdbf3326b4171f43d85addc3ee519bd2963badd16911e1f09120756'
        '3227d7c592d4bbc537a2bb98186b4276ebeaad2634661f3668d18e8ee3138735c0fad65d149867f11fd39bea0aad37f30bce8475056425d26449882964514911'
        'b3423f5db2826eea5d9f5f4258cc64ce1e1d11bff149d6d1f274b854a58a0f91a4ace338e954ab4b4eb134114e2860227e8b40d521a41bfb7381bad1f34b56f2'
        '51e7ee7cceeb6633238e16acf0297ac3f91475fc5f46769d41881ccaa84458ebef476b9bfdec85aacf89b3525a8fd4c10fc753f55f83090a74b15c4db21df91e'
        '14dd2ab2f4f29332458614888ad8040a67bda2c7a8feede37a77a10cef4aa9d2655de90639fd9a415b7eb74388efcec24156c545e553f131cc9911a5c708274c'
        '9eb6fef4a6351947f2a68b29ff2df891b8bca14077ede7b15f46e8b739b937f2faa4270ef6af7fd190848adf126b851d01d17b50b86bcceed1f4b31a001d0f54'
        'ac0398d82fd714e20b2586502ab552beb830d02e86e990e923b6cf8661ef2a97a74afc49cf710fa2b76519b83bce40f8e525517371cba202b47ca47e8d8a87be'
        '986a4a3bcd8120ea074971fb93b9c9e32a3e42342128c4d92093aff4fc7fdf4e390f934df6b94fb2b28379701852c1387dda53b6cf39400d1427492296722a00'
        '757d446e508d8d950839934c25f471f6713a098e2c99cf5b80a5a86d4b717260c4211cccd79b144f753fff3ad730936e7770539123cb914217e6db671063a970'
        '76674b94d6cd8fb0bccfec266e41347771c0a385cc849aef0c3911f5268903620043c64e0a44e0426e4cd35d8da99f0e8b0f1587cd7270640cc61a8b0d08e5ac'
        'c3649f06b5572729353601c90868fc9cd140513f16d0e504bea8cce52419ef614f9a96cd039ac8f6e2b79d5d7ec921732fa06cdcf5e14bcffab8018bbdfe87cd'
        'c1c28d01bacd9b58a9fd08d31d6e7725ba83ae8236aabf47714239c360c4dec43ae84f911d09dd6b6664a38d19349dc664853cd86ba09f3ba6893285f10898af'
        '4a3fbaf0ae2bd9750a6e25f126df3e888874b964d6e2a539aa1c7260d0adee35ca1ea4d8687ad9443103bbb3a1f32554ca6d0045651a980a427fce3a0d650cd9'
        '5a96c1171667d045320e14cb1ec898a0f344272dc777c7363b221ebc14ec98fe7455875689aec7f4e669c92f59e2310d436c6759c2dcdbda542cad95d8b2ac66'
        'e133b7b0c07c3065f20dbae8cb66e4fd314af0a8c62dec353312a951dea66985c905e253b0601e8a15a3df09481f528ed81a423ea46ad59bff84a17e7de80713'
        'fe867ae86db2d203d97d2858cc93d3d107f77950645209ca4ee07f03864abfc07f808b6462ca7a286bf3a53802067db3c8c417c0042f08bb930f4a7ca40c409d'
        'cd6fe54b533400974dab6723580ff05722995bff99c803e07442d6ce07e542d96bc3e2a4a77b2478491c654b3eab3d660ef645e16f93d9781a0b688551c7c5da'
        'c21cd9e50f640ba25ea7a5d8aba0250aa92f69547403a8fb370b37c0454d2099ba2439d7b8ae51d0f3ea578b2c7ba3d657dd9ec69b856ab794095503da0f4ef5'
        '5915efe6b69465634f48abc0c235f100a8a36d2c13338b287b2039162bfa1576fbf928a9df0bfd2f756039104749208ccfe465192a77d5f7c78992028792e6ca'
        '7b46bd20c8179af26a53e273c8d9da9fe247f1ae7e5d46fe595b0440284203bb8d1db25f05b7e785b8019104e3a2cc0030ee26287866cbf756387da6c55d61cd'
        '4fdee2d2bafd2dfb0e3bd8183afab98e7f6ee89a88a1b17987021a5d57f9779cacb38ff0b0706f06dfd553907f868c3cbbc605ec6f2d40c505c384ce8a254d85'
        'f895e46384f526af27b569567177a86d32d579cdf50110145f5f5b2dc58897f1586cf51563372b0814776c5b6434d4421f6512be4913347b65359fce4eacae7c'
        '5bb06883920903779860d5e5be1509a02f12e4f94bb0d7987fbcd196bdc57b857c4b1d396b569577918f2590a5f3968ec5d2b6520b10e0e15d575af7d3851b8a'
        '0ee20d1afa9d5c07ecee5a817cae9ef77318d88217c350eaafc613293494a7fe0af65dac4e1c4a66ec1ea7d5f03b7e69e8832e891d35ee0edb8a0c12c8c0236c'
        'fbff7e5e8e244007b02aece95fd5eac74a5c4448bb93d7ba8492c6395f5b321648d7df602cc75d3ee2752ea40563408c1c17023c667b2ebf568548adbf99f0be'
        '1b8abfa026330886bb04ae05a42708d4ef0ba60e3aa1c2882f0164e7154c61219a5f45439a75ccd4fa95fdacb743ff520203207b0e78b3b751cf885bcf5e8c92'
        'b714913cee58993481ec4ce08778a2250773ea1c8905c379d27763a197adc417c17c32bc4d91c4ba385d8760ae34aa5389b8588d9b1a0f4f77fd14437f1dce38'
        '253b2ff5f37b14fa245efc6c7db9d7bd8c1f1e669ea9d8e906b112fb310c46d7da7e8ff6495cfaa1cd3cc5677771d84db74d7e9252bbb49eac11db81f2c56ad1'
        '52d9f172bc43c59290f0190c7ca574c23f5af4c7ab3e3512dabfdb70dcfbe3311327e48db6f7eeaa9a3253cbe248a1f413c7fecae7598a7bab764aca16084c5c'
        '7ab90f0eee62493d638ad0ba9488cdedd0ed3e04d159e3ebe49abb19620d465786800c421895d6e423031c38eea0f762fe352d7e2014a321b3865d9b6daec563'
        'a594e05205fed7ebb8667c45c890ed94f06d5f25937d2267e5a75b6da8bf55a04ba21cd0ce340ee333864ff899c100cc9e1b3d3117f454b1dc5515fdd7ef6b29'
        'c9e4342a91d56ca565cb5b2d19c684fe483f4a307847f0536ab8d5956e633f0534076bcc55612bdf6c91d013f71d2550378feb459229e47a44bbabfc3689eff1'
        '74bb835861bdc63c0c3ff861c853748130eca8d98784850a959d3ea40d86fd1c3935da52278b200037385b68d4e29ff0351936db8e30632c176c6017152f554c'
        'af515e89df2b1c8aad50f2e2cb21511a865d9f611f8e3811a7b2996901d7a7657fbbfaa0946eb0d4d252618f47821408313baca9381d8d5ba01b7c2839eadb32'
        'b952364d43c73fbafdf5ebcada6d0e3c6c586e14a6d8f87ffd423e1e644e7f0af076726cd64c49d0679ad996e4a77070009fbf81f9f8571e451bb54d44fad41f'
        '44b6830a3b92ec60669af60fc1e8ef077e2a4cf652054353bd74238a1c8f67e3bf068376e17fc0137f65d626a054556b7e31b9ccaa669b6286b4c3f24cfe76f4'
        '45141dbc6f2ed8011866ded78f3148763b57e09ea9269e4715c3e96a1660da81cffc4a4ac3cce2b723c96cef886415bdf77d26914978f0de8936208e200b05a7'
        '7da2b904467c55adf48c132457c837ddc2fe7fc5cbd00ead9fb9e531a66a19d987617c0e7128cadfeff6e09c2a5dc446317fed2fcebc198b6816f58c63d71ddf'
        '900b7ad33ee6d0e6f22526423da8959ccaba2395d6aa25d697732fc54a529997eead96b485d3f8721e3ecb721a73ed05bfa32f7e73b1826cefdc891858eab1c3'
        'd13bc41d56daeae406338fe6b42902602910513d44bd436f3af109c317791f1a14e8c3057b36cc3018f993e7ed4d1de70dbdfa7e9bea289ca581adcb616ffc8b'
        '9780e61492cd3f9cd254caf6780b14c5250521f72cc0ef5829d51acae16e5c064e1e7f14fe780898cacd595783ebbfd2b7caeb2a11f0558eb1cb10e868eff06c'
        'c80dc7c72d81a2dcc4ccc44ba55d6beaa4b2e6c6f9e058c3996b3e2afe99035296cc18cd8e1934d27496c765ca85c046e7158df37dd82dd27e2be4abb79322e7'
        'e966c1d6f3f08e00f1d53ab9814b3472442c2c90589337632ae429cc5769ef3b84ab39c2a4c3b7708b4edcb3b87b6858aab06fdabf3c59cabbb126b25f212040'
        'b9ab741c43d66c90e9afb8b248c09d173e02f12c7080b14ad1fab0348bd49fbbe683eb09e0daa2cf13151ab295a2ff74946e6e53eec598f054d959f171912611'
        '8504312fae7a2824758a5596fb1183f47bcf44e2597fbfa552a23068f11e1b7feb60614202c57fe70bf6bba3d6c9e73053824beb888e610635b857e139cfe43b'
        '7dc03871b727af0ebcabd1022226f444cf68a74cc3ad31f5cadd117620182ec39dfe3863b1a0268b936c739eef8f6850ba4838a8651529919133972a71bd8c07'
        '8cf9be3eed2873e4280123732aabb23ef18011d32a1796acca04430f7fe678398311bafeb9056cf719f774e9dbcdea352472da35d485fc3dec44c12e1fa56cbb'
        'a664b79412d2ca800ee0cdb552a6ec40460c9c506f2f91674079ec35b2a454227e312720c88131d7d93a0277d5374caa9972186dcaca2f211300e33057f3a502'
        '74153ec03c9478fe63f2aa729ccfc6506fdfafd537818890faa557c451df8eaeb1aaf98ec1940689f2c8117c72474044777b3ddf62be20a6cb193854f3b795fa'
        '628a3c7c9979b754cded68e48f928bc337d2f56b0c3601d9ea1084b62d204aa6c7d7bc1e5716f34704989ea5b33dc69a39b464f463b4e172218373a7a5e93525'
        '6508fd2efaaf2d2130503343f709e63ec27d4b6c684cba26efa597a8223d26480dac725d45c1a54e54b86b87a7b6f50894c5a83264d7b62c2cd7bb2e0aa77523'
        '6e6efd3b4c12f5efe0ac236e1c3f65e1b0dfffeb1be256938b4fb4b508c4197df6d4a95a57c01697e7897fe649f1e2e648f47bfbf236f9975ea479e0425f4277'
        'f2771d4506e465d8d917f05154e5a681db8ca15d52a499416a002632fe26eddd81d2025214219321af99ce577a347bc753a62cd84ec991bfeaee8c8169a96cd7'
        '839035303e765a3215d2282eac0250cb1fbb532053f6355f4e570e9abb0a9c9e72d774363c98d4807b91361c739e72d775bea0b48885d88da5889d451c7e560b'
        '518e09a477c39cd5b09c66300092ec92fcbf2a83d4bdfd66e57f81db05446eb3931eb4b6e59172df384a10ceba395a26b13625cfeb9670110f0b531626ee8c43'
        '8902ae16015c8e42f74c6df6a9054d82ae8569dd0770785af821517004d7ffd94fe4ff4cf8d0d80ef264dbe125b98cd7a8506474ffd54870c577c3da946e1139'
        'c66c8c4e60a95309289dbc8ae4b242d0abe507554c0b25fc482143c677cc9bd49862e1100937005a280a2f75ae6eb3baf0798e9713869a542caa803ea6866ee0'
        '97565456a072a4425ca80d9583e07a1e956bd6c7a2228a39c5542728343276e983ddcb59d38372b51059b0fefa7b56792bf3d344833bce801f02cdc4a88517e5'
        'b104806e76321b5c461ff833707c4c5dcfeb9c1e171cb10cb95f616440e65c896c63be004ea67f6b1c74855ddd83a80e9277a62962cf6ff4245a5a22cf652e6a'
        '00ebd6b0ff68b586804f5d72884d9586a75367729fb3a60bb92ad89ed68fb1c47aefdbde8435fde0dcfee3ff92e21faef0015ffae67eb76b9b9b3d235458d347'
        '409724ee712cbcee9d299454cc7d77240507547c03038d0799b4e4614d8fd5d42a29f39b193a698803777f4318aba8a946439a1b900f1bbc42c99f33ab5c3452'
        '9aeefc81c4dd0036267e056e87468aaec2dd70fd4324ea087e956b2c6d5db06f498d65f7c282d53cc910b1016191ba680b54a1a3844d5c641cca243e24d84689'
        '1555480e5ff0e5ba572cfe510a9921da6a23990c44e10d7af54e31c5e8151dd52b74f054ed36c1c29f8c5de29789ef8cfc9aee896f3b0477f5e6c1cdd5a88407'
        'ea3e6ba9f9ab22a8afdb87d5014eb49b5812b28eb339747bace5e7daa7ab3a3a2247fe8e5894bfe0e648d1106fe1b37cb4e9f8f76c4b3d149ac0aed07fa2d6e3'
        '040063aa2c163f3e36dbd5557d84a85e22d7f743b9ec75b3c4251e82303772010a0c48b4756e9aa27fd0353b574aff1577556def0e5788892749f3b7e8a86cee'
        '64283e88e00f484036734549828bc2e58fc6ff279fdbd9df67cdb4f73f875b1455dde505a7e94ebc13bc078471163a1b3efb0e1b449ff21affb380ee82f3e697'
        '2eaa6b9bb50e9edbd9328ef2e404e7229ee70560dd36c02b80b5e70468dacbbff3772337bf4f618af6eb4913287a7a17a020cfeb7e91c2c89e23b62434431a1d'
        '0bc157afda00d2dc03e6a86f6841d9ecaeb06b6d83349f95f1e2dcccc4e484b807be5c50fdec00baed7fa64c9e7cc5cd0226f9b4916249a866ef34400c7b45c0'
        'e90ba6eb6b69dc5b82da5e8f38f663f6d9dc01a6839afcebe4efde6af10a5242e0c3ec0f62cb4ce50802f5f4e29cd05fa00008c6adc351e5c865cfbc3f2f9572'
        'a6b088d835ed4cccb595672a4d44a12532fe6519f3f6145b44a7767de9c4b80ac3e9499a2d822a67325e63f06488db5c61b02cd6be31c70bc35b16c249abcf35'
        '5f53f0336dff7e293e2bdb1b3ab9b7f9f66f229b1b95a11b032ba09a15eb699edd7088fe606b3024c0b9dac45a69649b27c82251387c7becf4268b9154586203'
        'd3cdfebf92806624cb912ccdd2edf50cd599631cebd553ee5f4ac919aec9002001efca592910b34b50196dec47b51060443f040f002ec2508700ad0cd89e1694'
        'd0fef37716ad527dbc97659096c004e0ff3024c46db94ef30e0e385801ed8715da59e89bab76baecbd1fb91e02b8c7f7896eea69c2262f27ad677fe903eb7b21'
        '0fb5ba0e2a41e4b71ba33f75cbbebfbd6a8c77ae42e81f497f9070c05aa16b0584d3cbbc69c6c757af12c56afde261ea93d37840c28a34b3fb42e915ce6679f4'
        '19887e88e473759e0665c83e1fccf25af8fc931a296a9694329ca4f0379bce86b91b84e2a14449a516cbf27e0ff69bf476172671cce882f2e60d9cf2df7ca5b5'
        '6f662bb87c15fbd2803792c15262cd4bc4201981c2b0608120918da62cd64073c69ad2a50dfd174371532608d2b601149f1cefb6c5f7348d0b2a2e795fb6e243'
        '4510d832e7aef23e434092bcfc907eee2f755fab13a29719e96a06959bc1bd618a4463751bfd593441c2cec17fc8bd7c14dc408a06f0d9a5b5414e5438500a24'
        '0987327de542780f0cf5e5427f030ce92f231cdea45d74738e441deaae0b3e56311d160c1c415c0bf25c88853f9918104e075258a5d13ac7cd6705e0d5e87e77'
        'd101c40cacfa1314d6130f63ec8ea35114240b9ca15372230c6ae1272d8221e8ecc8e70f923ee02e47fd4fa171355339fbb7a82627b567b2e81ae93a46b5a4a0'
        '0984ab0af7c51f2fae15b3478edfa45d11af23c99b558560cfb2ecd48c66a3f97532c90b95a6a9fbef421139421e564982bbb3428524dd1cb54355045145669b'
        '65081ef3043b80c6d86f95b95508d76b4a0b3e2ae8001d27812e8ff1a0febae8a1057f8ccc0a0ad269e1d7105d89d11f0850b4879cc4124fb3a030e93753613a'
        '609f4ddd57411d0c85213d6df4574422f3d052d6ad3618357c67a2e61703af77bb7df99b9916d35a77ffdd2c069a0368545c4ae504e119b0c6a1f3d78d82171f'
        'c520f4174be263dd011d3c856eac0053a5a342e20211578b815da461a934a078c2ba53ee3da810a29c6aed92c4dd646d48cf4ce408afc41791b4b8c5cdafb5db'
        '79238c6ce683f1d9cc585f8ce40e1603df46a926b9d8bf02c001e70a4924cfd1a913b73dbbb5bb6301d01e988ef216241b67a3bda8e88ccd8fcc13a17440cb59'
        'b6f9d3ac6055a258b78857dddffb89c97f2b77bd859bdab6bb20c7791f811267bcc09db2b451ed56855c074cbb9a7c6b09c375819e951f89d67b011178b30f82'
        '7f67226c9bf2a2d311b7a13c5aaf68bae1c784c53256f3e971490980f6d739f2dedcde7803d0f1955d6be8390ad461d3fe1f84083a7ea093624ae39564aa6ffc')
