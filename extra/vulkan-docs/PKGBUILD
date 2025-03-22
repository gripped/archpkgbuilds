# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgbase=vulkan-docs
pkgname=(vulkan-html-docs)
pkgver=1.4.309
pkgrel=1
epoch=1
pkgdesc="Vulkan and Vulkan SC API Documentation"
url="https://www.vulkan.org/"
arch=(any)
license=(
  "Apache-2.0 OR MIT"
  LicenseRef-KhronosSpecCopyright
)
makedepends=(
  cmake
  dblatex
  gdk-pixbuf2
  ghostscript
  git
  graphicsmagick
  jbigkit
  ninja
  nodejs
  npm
  pango
  python-pyparsing
  python3
  rubygems
  source-highlight
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/Vulkan-Docs#tag=v$pkgver")
b2sums=('a8c697b186f59c49abd9f6d4281b813cabfd7b4c31ed62161df536c726a8a53de8b4f4017a69332294530e51dcf6b9f14341dfb1cbd24c720cdb948eaa35e32e')

prepare() {
  local gems=(
    asciidoctor-diagram
    asciidoctor-mathematical
    asciidoctor-pdf
    asciidoctor:1.5.8
    coderay
    i18n
    json-schema
    prawn-gmagick
    pygments.rb
    rouge
    text-hyphen
  )

  gem install -N "${gems[@]}"
  npm install escape-string-regexp@2.0.0 he lunr@2.3.6
}

build() {
  local gemdir=(~/.local/share/gem/ruby/*/bin)

  cd Vulkan-Docs
  PATH="$gemdir:$PATH" NODE_PATH="$HOME/node_modules" \
    ./makeAllExts html chunked manhtmlpages styleguide registry
}

package_vulkan-html-docs() {
  pkgdesc+=" - HTML"

  local docdir="$pkgdir/usr/share/doc/vulkan"
  mkdir -p "$docdir"
  cp -a Vulkan-Docs/gen/out/{man,html/*,{registry,styleguide}.html} -t "$docdir"

  install -Dm644 Vulkan-Docs/LICENSES/MIT.txt \
    Vulkan-Docs/LICENSES/LicenseRef-KhronosSpecCopyright.adoc \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
