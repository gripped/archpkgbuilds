# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgbase=vulkan-docs
pkgname=(vulkan-html-docs)
pkgver=1.4.321
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
b2sums=('922e73b7a8b3034abfbd82ae45e8f9b8edfeb2444fc28b086e08d86de4b8eafa565fcf959b7baf8c67489b4dc0758916e265c579b1ed613c6446ce2776458f7a')

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

  CMAKE_POLICY_VERSION_MINIMUM=3.5 gem install -N "${gems[@]}"
  npm install escape-string-regexp@2.0.0 he@1.2.0 lunr@2.3.8
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
