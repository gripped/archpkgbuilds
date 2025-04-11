# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgbase=gimp-help
pkgver=3.0.0
pkgrel=1
arch=('any')
url='https://docs.gimp.org/'
license=('GPL' 'LGPL')
makedepends=('python' 'docbook-xsl')
options=(!strip !zipman)
source=("https://download.gimp.org/gimp/help/${pkgbase}-${pkgver}.tar.bz2")
sha256sums=('9adf5aa0f1fa424a9cc2d3c30e40154cb37ccc2602f66c7ec7141a7b7ee87342')

_languages=(
  'ca     "Catalan"'
  'cs     "Czech"'
  'da     "Danish"'
  'de     "German"'
  'el     "Greek"'
  'en     "English"'
  'en_GB  "English (United Kingdom)"'
  'es     "Spanish"'
  'fa     "Faroese (Persian)"'
  'fi     "Finnish"'
  'fr     "French"'
  'hr     "Croatian"'
  'hu     "Hungarian"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ko     "Korean"'
  'lt     "Lithuanian"'
  'nl     "Dutch"'
  'nn     "Norwegian"'
  'pt     "Portuguese"'
  'pt_BR  "Brazilian Portuguese"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'sl     "Slovak"'
  'sv     "Swedish"'
  'uk     "Ukrainian"'
  'zh_CN  "Chinese (simplified)"'
)

_package() {
  _locale="$1"
  _language="$2"
  pkgdesc="${_language} help files for Gimp"
  install -dm755 "${pkgdir}/usr/share/gimp/3.0/help/${_locale}"
  cp -rL "${srcdir}/${pkgbase}-${pkgver}/html/${_locale}" \
    "${pkgdir}/usr/share/gimp/3.0/help"
}

build(){
  cd "${pkgbase}-${pkgver}"
  ./configure --prefix=/usr --without-gimp
  make
}

for _lang in "${_languages[@]}"
do
  _locale=${_lang%% *}
  _pkgname=${pkgbase}-${_locale,,}

  pkgname+=(${_pkgname})
  eval "package_${_pkgname}() {
    _package ${_lang}
  }"
done
