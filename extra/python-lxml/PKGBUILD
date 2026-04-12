# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgbase=python-lxml
pkgname=('python-lxml' 'python-lxml-docs')
pkgver=6.0.4
pkgrel=1
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('x86_64')
license=(
  'BSD-3-Clause'
  'MIT'
  'MIT-CMU'
  'GPL-2.0-only'
  'LicenseRef-RNG2Schtrn'
  'LicenseRef-XSD2Schtrn'
)
url="https://lxml.de/"
depends=(
  'glibc'
  'python'
  'libxslt'
  'libxml2'
)
optdepends=(
  'python-beautifulsoup4: support for beautifulsoup parser to parse not well formed HTML'
  'python-cssselect: support for cssselect'
  'python-html5lib: support for html5lib parser'
  'python-lxml-docs: offline docs'
  'python-lxml-html-clean: enable htmlclean feature'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-pygments'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'cython'
)
checkdepends=(
  'python-cssselect'
  'python-html5lib'
  'python-beautifulsoup4'
  'python-lxml-html-clean'
)
source=("$pkgbase::git+https://github.com/lxml/lxml#tag=lxml-$pkgver")
sha512sums=('702ba3693484f9e47fe086c9db1058328d2e89a973c7a3a1179a3bed78350ef86b645d00b01626fe7afe8ecf0d2e63d9c4c4a8f43d5c781259df225c0c130356')
b2sums=('8e276624cd8c1d090a7bb605c5f18f14f87e9439e4729c6e65025eca1192b2873d8b71939f3457d3f954bc4bd3e1107f31e21a02bd03fe43a485ccd7a748141a')

prepare() {
  cd "$pkgbase"
  
  # Setting LC_CTYPE to workaround encoding issue
  export LC_CTYPE=en_US.UTF-8

  # extract licenses
  sed -n '/^<!--/,/^-->/p' src/lxml/isoschematron/resources/rng/iso-schematron.rng \
    > iso-schematron.rng.license
  sed -n '/^The MIT License/,/^THE SOFTWARE\./p' src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_abstract_expand.xsl \
    > iso_abstract_expand.xsl.license
  sed -n '/LEGAL INFORMATION/,/3\./p' src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_dsdl_include.xsl \
    > iso_dsdl_include.xsl.license
  sed -n '/Copyright/,/3\./p' src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl \
    > iso_schematron_message.xsl.license
  sed -n '/LEGAL INFORMATION/,/3\./p' src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_skeleton_for_xslt1.xsl \
    > iso_schematron_skeleton_for_xslt1.xsl.license
  sed -n '/Copyright/,/3\./p' src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_svrl_for_xslt1.xsl \
    > iso_svrl_for_xslt1.xsl.license
  sed -n '/^<!--/,/^-->/p' src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl \
    > RNG2Schtrn.xsl.license
  sed -n '/^<!--/,/^-->/p' src/lxml/isoschematron/resources/xsl/XSD2Schtrn.xsl \
    > XSD2Schtrn.xsl.license

  # https://github.com/lxml/lxml/pull/470
  git cherry-pick --no-commit a0a1dfe8e37836074f65f6f889bb102145951172
}

build() {
  cd "$pkgbase"

  python -m build --wheel --no-isolation

  # create documentation
  make html
}

check() {
  # TODO: Find a sane way to skip inplace build

  cd "$pkgbase"

  make PYTHON=python test
}

package_python-lxml() {
  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSES.txt \
    doc/licenses/BSD.txt \
    doc/licenses/elementtree.txt \
    ./*.license
}

package_python-lxml-docs() {
  pkgdesc="Python binding for the libxml2 and libxslt libraries (docs)"
  depends=()
  options=('docs')

  cd "$pkgbase"

  # documentation
  install -d "$pkgdir"/usr/share/doc/$pkgbase
  cp -r doc/html "$pkgdir"/usr/share/doc/$pkgbase

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSES.txt \
    doc/licenses/BSD.txt \
    doc/licenses/elementtree.txt \
    ./*.license
}
