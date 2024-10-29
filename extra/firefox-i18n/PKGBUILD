# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=132.0
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

b2sums=('f0120b81c47b317940019f9864024247f834818c60b73dc8a7492ec31636787cd5b5ac1ab8ec983bba69b4eda75b4224797c5c17ae778925163e7b5b021cc3e9'
        'SKIP'
        '51b5861f519e1fa3ee53aeb5bc43201da02ae0746657676dc8e111abd20049841eee8ed8b35b01f5783ebfd382c4073f99db0d99e35ccd1f52f44486ff88be1e'
        'a1995a685318be094deb914f574fedec7c36dd2827db5f4f24b613a74f640c2f9d4089df2519846d2ceb7c7584f11335e29f8668b3daf9d82142d9ca74943c19'
        'a3f9693b81c7af2e40d499f32fd18635ce2acbec2b076ca5db5137244397750dd7ca30f40b708cdef3faadbdd0e601f6cc05a711a129e8333085f8603e86489f'
        '1708b6447f0af84c9d8b2482796aa861aad1b488ed5191955c21cfe0e9fa636784f7d6b5cb94bbb6eb8eaddaa96155445991ce47722071eb1a8c94679d226994'
        '40ea1ef46cf07d01a1faeb0db7b7c8a44960d8ea51c74c7ace6fcaa2d72c3c35115245ee61bada969bc10ab73741dfb788fb2e4154b987604947be91e9eb12a0'
        'f87ca5150e20fa65d8b3752aa68946b94fed6cb3193ec779c4881cdc0b242f2c9bfc7fcc8b26b640184b8299269e86c15c38cd1a55e4c6819d9192c2afd421aa'
        'bc68f4beaa1770fd908002a46b2df5db92275010a07fcf210b80595860acae7541e9eb282b1e5546f593b7900bcb47ad0354af9743e0889c4232240266d15f21'
        '3dba4c39bd1033d8985551e05e81ac21c5ce2de9090e8db0491c3e3d5d3257b6e63e482ecb03c368224fc91ebe21398641a65b6c81035c608a5dbe64ec0aba47'
        'd9375ea530c03761b9974db2f19fae9949e23502c476e4e4926f43beab54de7efb60a3ce52bc0c6059b23f33d9a18755e85cdf7ef7fd80f660b332c6eda23718'
        'd6f5fc00d7d6eacaabfcd79bf8f1f0b0405ec6cb5f96c4c81f40ecefa91ff33a23d6f5b255436f930b4c80679a2c950c8ab706ddfd9872c7abe7d20caa89cbf6'
        '0a53d385d6c5306b59a5bf69b6e0a271b5b513ad51b250c621c5bb7d90381584b3e336ce0d5313ce9b8016c88108a0f068877e2c182df9ee06ff629c8c53e244'
        '8a50db8bb762fc28ae5d2c80d1822e22e5c9a0d25a4a96e2637fb48727b1d4d8143e734aec6d8581589378ac822ee1e9d5d149143b533cd78d537e6aadc24ed4'
        'c992de67bbeda6f11b134740f553f2cb28cfb9ecbabe2977ccf4224b598528f3abc33a3495bc6c4559dd7184595dee94aaae0435dddac6577220b361cec474bb'
        '49bfc9fb0c0cbbe13bc69388a5093efd84ce22a84f1c39888286373768eae9cc8d8fe4492fd214ee97c4eba4615359efae33f121baac2fb729bdfcf98d4b594d'
        'c77a371a0dc20d8c17fae955fa45eb83547e6dc24265bed4cee7594933eb3b85d775c6ff06c4bf4457bfa7ab4e6b8adc196e55e241621f1a73fc6591255212f6'
        '4229155836f7cc7b135345e58c0c9df37c05c6e2946bfe4c9d09fae56e83c4e0782a5931c2bc40150056099c470d90e0c90b700ad00d39e2a2c7faac7f5529ce'
        '311655c832b645d3ebe22cd009532b1fbfd124d8d2e016779ea4dd2250e5c6c0eb172b0e3aaa6c57f4fb706568317a728668db557a432d7d2c895ce2d03ac850'
        '9e539e5912af00f18f85eac2d832f0fcf75bc045eac7afd0d039217f45510b2f6d03799ba6d3bf235bf3e21202a396412bad13bbbe75f635de154f58b970afba'
        'a688926a3e58bae28335cde51538a25980c57840ec0ab7a47e151ee27626181e732f03c5b906034c8d39e89f9f299f1b1321476f4a871485b2bb99ac0269fa20'
        '106350993f27374e2bb5284b970e3be91eec3bb77bef97c3629bc76e20592590c8dd0bdab81c27b536b23e1578894883e2d3cfb3ae57402cdb5f98561fcc0c58'
        '95e4e74a35cf013f141ed84a5032a0677c18a13bbe70a03c5dae650aa26de37fe62b9bbed4fa9332ec93d790c4c05d47796be792362ec71dc8bbfb06b1161e13'
        '299c5fa23b30a063791c48a8bc133f30a11ac9f9eb8b70a04819037e3f2057d38c82fc479c4d3456e2c78bd07a2741313429962ad9624cfda14c8e612b6290e1'
        '4e1f6549446967e0e86779c9cf6af8f2121b32e7a45191348a7cae25b36dba94c3dba29d6c0807e8c82e8f2ab69fdf878e03cc654410cfbce82e38597d68d79e'
        'b8cbaac1013e8757e16954cbc2cc1b19cd9ec60a84ab84aa7ea6b75e9d656aad5b68848ebd93508c6adfd023548beb5b117b92b6ab3d0c1ab8d3692b31af9236'
        '4633c71bb6b3b2b9508fa8f5ebf6eb1eb12f6e5193dbc7bfed5cbdb1222bc0eb8e73f4b47c49c1e5ffca342e3dc38b164d847106b0ba7741b799274587508645'
        '59da3c7a129f4b592d29e79bc73c85e46bf1fba9a903c5c57e3f3bcc48e4fe9181658a3442ded39b64a0c07456e716b105fbac3ca7933d2c62318b2b1d9f9698'
        '8ce6f95fd2dec02c5900ebac915be280ab83b718c09923556cd93f07439dc9112d2d936f9061595e7c60a4336ce30eed51b8de289582c3cce8c0e80130bc3097'
        'e4232724fb6b19ebcc36cc6015caee4e7ab84da4af3ae13d27e8bfd960e80280e1d8c3e5ca49af284bedc8538b14c706ebb88aed9e37dc261aeb0bf3997a0891'
        '9893a162425adf4b5ec7ac13d62d4b62eb7a723ac46689e6d0f4c5bf3e5573c967e3e763bbf84ea79d6676016ee63e4021aa9795752b7ffcb1a6973f38d98cf3'
        '854a0ace90249fa437e7f6a15afee20c8759f242bd9baeca96449903c21f13448a5e435ffb8ff99c383d40118968403d28d384b335d6b70998400651adad5709'
        '198c331f8b081c9b49e4f7dad7b57c7dae780b78b96c650698c901d3b3cb7b182b95c0585bb54102ed0fa6df9949e114c386a2e020d13ca0cf504205d21ff945'
        '526a620f0cef2e0e35ec882361f869940325ab3351ee8df5b30127740b0e741a898a122f314d734a14064e60c2e757dddb0120a5d32d4b8f52a2be2e0637340b'
        'df5ac5a866c38f84ccbf1e98a09c8acf83f009f45b27af6d6319c27a86ad66c5b99d970f0a2edad0bb3a554489fe7540110f4716f85ceb005a6a79cf81ad783c'
        '189312f16af0e14dd5ee5fb436bf33c46eb97a8b1adbc0117168aa917e1e5af8c5f9f183be654563001048b8c4e9da0215a9049e34568ad56248c03d5630237a'
        '8e577f9a02bcc0645da96f4133e392c393fa54a1c9e385ae88e0f4249d0321bc9f6ff0886ffaae58b941224b070a723faac8a3b507c947672e1f6703c90b8064'
        '99c053425d8329099cfc2aeb121d079049670b9d09b347d32117c272350a5eeb51407097752ccb8753d9dbcb96d3647a51b1216b44bbe550d84ef8918754b604'
        '1ae584f8a308f5a2f8baae3fc180f6640afeeef56a275ab47a074b3f9b54e42eb15441746cae18cbdbea1f580d4729a0792821ebed78edd3ad8acd64ea1c9ac1'
        'bb0fee733f8096179690094141557369a1749493376ee24df43d5781215042dfce6c54728d4b14fd89ac5dcc2be564f6030b531abc29290965353fac7b90d176'
        'eeae260832dfa1337d6cc0cc5baa41fa19afa0b5e2a0977eee3cd78157340f57157763a50d9a4d4b577a3a956d28b36877e141acb2e7f65191985a987db0d8df'
        'c73f1bd132bc7a1e582db6eb940d068031842addf960a17bbedcb7c8bb78a0608dc33cb6f4b119f89c2945413fbea89cdedd361e4bc2d0de45bf5af39e58ba21'
        'dd42fff42f6f95f950139ed1ec36707f3f9bc5edba7efa05934d41dc200e9e2d1124706bae1d7ef632c3c5d16a69a6e72e31993a0bf24544930a88684354005c'
        'dfaf758c4d06b46678a7d711572f9f256c2cfabf97bfb85cee00495d6dd91583d6c547108268e512b462e957f8b3f5adac042ccdb059938be6e5d4d05089b889'
        '0114228b40b8e18c0422ad2b6873dddee03919f4bc5986ebf1765bda7f521255355198d776fbd3cb2b244dbb398711ab52816a1babd88e3638c58e7edcef97c2'
        'cf18b744ef90e3a2d7f6cb6699ac264c9f742b214f3dc7d56c4e7056dd0fc1ec085d2588b7a2ba604bbe7aebe55fbb204d186da2fab05c5697fbebc05753ea3c'
        '74b68a65daddceae77aa51e549e55822dc0ada6fd3195760323db6e6639bef56c4c23059c672553b97264e41b78d1a5df445776402ba50ca3c7237aff099f364'
        'e427bf2b74aea21914f0296ed4a168730ec23362f50ec3d59dbd220339f0692a123385eac8b1ea426efb5277b33328468f45a0635101ee8ccb24c9915d508603'
        '9cf76f61f1bc70453531d5434f4aca6245787e33a7c62b694a11736f0643b48842c3452202296afbd15b434ee2c02ae056d57022b2dd2a13a8e21a76b53b0af7'
        'c0128dbbb0dd11bf36b83b3ef2fbd7d069a09e6928d844a32f7a9085f1bddf55a50ba3c46a13eeff2892e351db221c565e357735822c2ea18da320227b6677a0'
        'd48e84b6445828758fe098505b1e7b2e9d3229891fe92a03c40f01057b8958f378ccc403de088168ead200a58eb3b53c3e5380606e83e35bc90cdf73b941bec7'
        '5fa99abd493dbd2a9d85045d079a0d8ce958d053065e9612329da1a23c2aa3969329a40f5af3e3e645dbd2dead7b8cedce75aa1ac4c8fd1df59fc264182c84d3'
        'e033efecdf4d8ee4ff22050bc00b8b67661011580bf87a8dc8e1b43a33bdb618bb6c3bb3757c0970eb21a7982685c886cfa7b56cb5cfaf0d81bb33781535b37a'
        'f90d10c31b70308e04e0354e23d64267698a5fccc160f8edda2ce80a5036411e506b429fb550498c5aa5d35a84d4fe273273cd6a7a3e298ac72dbe411f33728a'
        'efc352a201bef4fe31e34cea6632c783c7b5f59109ef77bac66b53ecf714a7b85fc7d99701825cd0a108b684dd3234e39eded883ac81565697df6dfee4ce54af'
        '7a9a56c7ebebfce98ac0c6bfb6ecd03895ec10b51fd266f8fe9ce106bd1150c5d8d6b00b0e33ecae7acf7fe24e6cff9ee5e8a93cebd69f6e9b4987a87051a478'
        'da7363086f340c522156185507a32a79255f2613299bf3723af34b1fcd8d4456422a4e01857f7132714563031790b24e0ddd3ca578ec1d6b583ceb18acdb2411'
        'e1ede197dcee04a243b2e2b6a65c95959d3980c5a791b6cab652d5b653cf91bb019904724b61f62512d66a2df4af32f220ca3b66676878fc8ab394571776053d'
        '7fea3febe4853523b67e287e836ef48c3ee6345c15b759ec5e315c7be4b12e3db623a63e0d956504ddb4115a196e2c746a1a77f653fae995b35dfd058aca1315'
        '718e4ae61fe7b43f79d4f4bccffa0825784a46ed4d9cd92e2efa4bd04139025e52e5d006ce7841ecc762857d2294239a8518a67e93d5837008e4e1fa20c9ae4f'
        '4cdc426d162e648993f254e5fa69c2daf555b89287d5f0abc7c0a2fe0bac76058f9352475e2c949380a1b55a881e42cfb80da931cd840d0dcbd63e8cb78f057c'
        '08a2c685d6b1e7ffe2698c5b4b58202b49984fed6b6f6adcbde3ccb3299f7042dc2f427586ade15c2501f1006c25d11f42e65050d8819f2dcea68e28718fc0d3'
        '7764f24827fbfaeeb69b193a494cf53f28fe20c9635cf1fde2298271b13055a89372e5a350ff18c201e24eed415d31477157e97f0591414c409583ada369ba5d'
        'c4fdf052b51d6529531efaeec298762f0f410b6642c9d4ec738ac2b462eda2613b040e71466f77ae265208ddfa57b80d91b235798e96e609295b0a1f286ded10'
        '5cd403d244b00052a75afae328e56523ad906e7ff55f503859cf0625464fcdb28b31c517e3d7bd3efa254961dfccc4bd20bbb8824f7c12f142da0fbbb8e51ff9'
        'eddf2ae78fa2d746f7daf30a8efdb52e0bc3f8d071b2a36c5bfca775f2c8f5687fdf0d46a67ea8ba775ff556718d5b89dbf5a6c6605b36b057efb243b51b822a'
        '6d6eced5ceefa869d0a6105a05f8f5672686ad44a51cfde7718e381176751291148f34b9bd012c2a58877b8b61e7d6d0f7eb48f17d31c68c05201d4a72bbe9c1'
        '35bc05556a35734f8f76f6f1e121b06bc2187cefc9cd2ed1fe2d658f730e88e24b5234a0e0721c54313814a75efa7debe3bc5112576b654e49345817be724c62'
        '32c5e4ce3cccf70828d4d2d22386ce2c57d285309cadef5e34db9c7a563564c1078807e937015184a6245f0963943496f6687e6904d7effb5a9be70e625a11c1'
        '98623342ced264895f23e294ae497fd609b410992b3e209e869de8e131b5adabfd63c61ea832373c6340b6a6a9e93462a4faeaa2452684caa3b69762a011c72a'
        '9e77c7dfd8572eaebb667861e94ffd3e34a7d187974a8f2b6d9d4d42a85dd0379202088dec6790f8cfbb7d6ab6b13ef0db49de6b8f673b4a0c5952cc6b3cb475'
        '5a4d9c86e1ee330ae2c00d7ea2cccaa830defa9fd6dfe631f6c8cfff2f4555a6814ec96bacaeda7433dff7b4e623453d5461a0e659f1e7b3357d55fa1461a264'
        'dd0c6333981b97b84a5e808ec5c78bdb0782610768acec1c50b073f505b023f0e16962e4b94bd752add453ebe64e750bfe58cd6e64be5d8073239116fa721dfe'
        'e2cf1caa3877467d1b5b716ba5816b3b43968398d172475f28f0a9aa5b624f7deb7b6f0915e019fc7d4312c1dba19180d244bf3687fad315b4816214e1697df2'
        '3a06cd38ac183d75434f04ca99407fef825f8eaa78e0b873079225790eecddf967ef8e1dc7bda68e6ea1481fd83dfcf6f07f17ef0130e481ee5ef6a61c73ed88'
        'f3d517c18e8b0281ff5934e61f030b0acecfa3b80f86dd6bc93c02604d6f78442532c303c795763ff83280c586edbd10c98f9dc83639f377ae2cd7ea8d673234'
        'dca66e3a4fde74c1c97eabfd2a46989b1ab31b298a3fbb9e1e0e6eaaacc72b363bb0fb6395b7a0977634de472913582f8b7e8dd7dafde2854b0c2190d20c201a'
        'ed949b72c8e8a99ffebca1dec86b6042b6ecd5f5409db7740cb6ca9d7f1627cc6557f1173ec4f60a8ec88ab9af9c2585c35b2f3aee47822acbcf7944d6680f4a'
        '5c6e50199c7413b891a0797ff69d0ef416250424ceacdff3b7d61a585c01ec5959f58718b672e9281e56e2d30877275819df76019d8f793eadaf28ca769d8a9f'
        '7ee6abaadeeffa552c483a9ca5db4b1c05ee94acaa05f53cf53f29527e0e74187de49c75d3dbd2fe886315c2082e6b55bce35f596317fea50279d1f46f103501'
        'c9ca9ff113a6b9d46fb630391f0d547a273ebce0df3e884b085b0d9c210822425d36df0bbac3cadc8597d37bf41e5869bde61b75d414c30065c2308a21cbd670'
        '1d184fb94af8dec58885488799c9fad135e0f4a637655e4422a4ac1e3518d2d1ce52574fc3ab39c0427a951292c30fc03f740646ea318e88885f8387260045e0'
        '953b664981165efa949456d1e3f7fddffd06d8ab871eab315a28c5065f656d2f119eefa13898120ef4ed97d7cbb7dac09dd483875444144f5fdcb825475f2b3d'
        'd3625eb22d6ed72c96b883ba09fc0030d7b15b3a7ea7f637da21f24a262cb61d7c529fde107d46c58eb5f4d2e1e05c594098024a24c5ec73bb02205edb2707f5'
        'eae2a19a2a35c2c699c9ecb1ff4d8a8cd13ec6f04a5b6a8ffde73deb4bf186ee74fa3a838b0f656f47b5dcd1f153eea58f5eca813a013525fd04ae14e58a7a48'
        'e81dacba1522818dbfe6211738e54d58806144690df0ac65e95f6d14884c16e4c1fbae06f708a2ec0f9cef11e41b015acafc1896201438234a403767c7c3778e'
        '38805cfdd532a26bd038ffa5d4814b145acb5412e10b7984b80a05ba106e46bf3ba8f5b29c56896b3c2e29f297fbd9d7cf49370513c146a2d2fbb440e6ce2d08'
        '8e9e3c12ca46bcbe0a94b6b56e26118518775d7ad3bdfd3b0be96f12c1e934b9add90da9826524ee227d7100b461e9311039ed5b6dfc61915f5a531892066f5a'
        'e7f644c1e2e63ca406b279b2a1bc7c55aff7a781339a2f59119f310d366b1db2bb22980ccecb7f46fc60dc15a46314057370cb3d7f5827d0b2875e0e4bb5f5a7'
        'b3a8b5025bc335708f6f6d3f9cf34f6b3fa953465ba9db76aad7ef58e0c6801429284cd97dea8b4306d9ed3ce82b750cac3ce258c38481aa6618aaee450d1043'
        '6bc5d2f7a8066a1c0375dec62466bdc7f968d1643af3b71974e14a51eb7b21988ae00401e0202a1844549a4ccbbeb3760187ae3cce94cb1b64146d17b992f390'
        'd78cf61f7ec270f48d2cc24a96eaaa21b9e7edd0ff334c1562973ec64f6f765b1d81874e1484e544ad235f0090777ddda9d4ff9b44f434f975ae536a73d05dd3'
        '8668859fcc075824b0f4204457ee4798101d464a876aa81ad8783fa7fe6a91a6b4cfd94b3b2d819584dbdfc0c8ce9f2cc4a08a0d21f072be251bd33a2f37a6d6'
        '74e58be9b4e03e6f636502bed9a1ad729ddd505a9355d032e9139b37724cd2e6c25acab3720982d57a427655b927a27c1ddecba4085615e085a344ba73d5e7bf'
        '29feaa87a9a09d4bc22d1349cada041bac8fc23e5f5ec47741a37493f421dffc6318a5a63c68de62a21dd68f77096fde4487ca0d23bf15be94398082e5f1b31e'
        'b5150b3d58883a99aeef4691cca38110cedad6d0ce8ae889ece7050557d0af38c7dfe3486a9cd3bd018b013befb62980911eb49bf8537410d07eb49dc19530fd'
        'c08e56f211cc0481a4e85dbbd4aec0ada421fe27adf5011072c609d0c196cda897139adc8716d0f320cfa849fb9fa3c32d1e0a15ec259b9368622312e72e11a7'
        'def2bd0d115ce309a2ea5e3b2c26ba25e24d6ab2c4725903d737c501bd080421a6c5884125383c0cb3a1aae63620921090b0dceadf56766037e87bd57c3fdaa7'
        'f4a686aedbd5fa4d91180e16ba8d0f83bdddacbad2d8ef3028d815cff95a52bc5dc80b77bf4aa7965b07d0b6090ef50353de35ae5352c3d6e7e1e6917526e38d'
        'f03abf62c3373ac202bf2d8690577a30ce33cfed6cea6b0517e140acff0373e91850b1cbdc2e8429f3235b71beeb748c0daf3765198c24db3dfce26f5e81bc82'
        'f9e6999c8cafdfd5163b28fa92b65a61b98fa7fbdd5651f2093e60b4a8e2ac0937ed1c6fe3f8f63a05540b1b4c1fda887088788f97a7da5cf28ed4572b41a4e3'
        '48bb35892b6534ae09ce85e964650bec567ae88b91a1c6df42430941946e1cbfb5c2fd2c94919b3524437277f8904a5e8d615c53dd7c6334760ceb34492adf7f'
        'ccb58c161a75776dbc4714f5551ba15356ad58d95a82ceb19ed876b7ab739a2f0aba0711e8f047c421bb29e5e5dafefaf5538bef82fb89976b1d605990e97691'
        'ad7d6461d130ec64ceaff7c8a2bcc1752592a3a15de7310f21af744e2c12a3096baf45ab1865e038d103790812f88e1d461e9500c348c16ed75f2edc83da1744'
        '6e415e664d9a5b46e83da94c2b88ed2becbdd7023b2c5d87d53d5e8a81f1284cb9e072a52fc31c5b327eab981acdbe4e78daa60ac8aca1af6bd6777b04c2ec3f')
