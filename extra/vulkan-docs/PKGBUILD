# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgbase=vulkan-docs
pkgname=(vulkan-html-docs)
pkgver=1.4.357
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
b2sums=('59ad3bac7108a7c1b70cae9411cfd617b21304d585b766249dfbbed8eecd8d2d91b2c3609e7fcd7d738406f6916b78120119c20b3819c2437db739a10594ae15')

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
    ./makeAllExts html manhtmlpages styleguide registry
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
