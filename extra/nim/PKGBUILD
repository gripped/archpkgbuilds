# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=nim
_pkgname=Nim
pkgver=2.2.8
pkgrel=1
pkgdesc='Imperative, multi-paradigm, compiled programming language'
url='https://nim-lang.org/'
arch=(x86_64)
license=(MIT)
depends=(
  bash
  gcc
  libgcc
  glibc
)
makedepends=(
  git
  nodejs
  help2man
)
provides=(nimble)
conflicts=(nimble)
replaces=(nimble)
options=(!emptydirs)
backup=(
  etc/nim/config.nims
  etc/nim/nim.cfg
  etc/nim/nimdoc.cfg
  etc/nim/nimdoc.tex.cfg
  etc/nim/rename.rules.cfg
)
source=(
  "$pkgname::git+https://github.com/nim-lang/Nim#tag=v$pkgver"
  build-docs.patch
  'nim-gh-pr-24405.patch::https://patch-diff.githubusercontent.com/raw/nim-lang/Nim/pull/24405.patch'
)
sha512sums=('e653db3b66d142b3de73a531ead042e0d5110ed797298b82538eecf8b660c33fdb6eecfe493b5d2a7fd9dd430fdf854ed2b37bcddcfc632c07c9d8931027d421'
            '73e359917fa721d069bf4c3de63a217624aedc334529161f1976fd9d6b38b8d24c5bfca4e2f0ba34e3e6e0fc3394268c4d785e76ad7d24355bb8394db0f0fbf0'
            '82b63ffded3672ca42ba2185d3c2478989685974ee96d8a791b0f660cd273a79ec8916a2da9f29f1bd31a444377f31aa046f6b6e6974c4bea58e54b2befebf9a')
b2sums=('d8089400740f18f679417a81eb1e93ae643445e9a00ec1b40b4d646f2717764887388fb301dd95f698003e645ef76de6e6942b8780efefe69f2fc329b63a9e0b'
        'adfffe6b6df889e0cf3c1e37f43ba5c147ce50636150f74b2d73d8dd7df7f60b570c835af3d84d8b249852fa00eb180a4c54330d830947c4e829a2c87b22c4d0'
        '1e28435933d66178bf718851d6e93e714434a53ddab28175d20bd89f6327a8bcb451a4178318bc7b13ae30a4617d1a5137031ad7c082f382c868d6ce8a41918b')

prepare() {
  cd "$pkgname"

  # ensure build_all.sh generates docs
  patch -p1 -i "$srcdir/build-docs.patch"

  # migrate from pcre to pcre2
  # https://github.com/nim-lang/Nim/pull/24405
  git apply "$srcdir/nim-gh-pr-24405.patch"
}

build() {
  cd "$pkgname"

  # https://nim-lang.org/docs/intern.html#bootstrapping-the-compiler-reproducible-builds
  export SOURCE_DATE_EPOCH=$(git log -n 1 --format=%at)

  ./build_all.sh

  # generate man pages
  local h2m_args=(
    --section=1
    --no-info
    --version-string="$pkgver"
  )
  help2man --name='Nim Language Compiler' "${h2m_args[@]}" -o nim.1 ./bin/nim
  help2man --name='Nimsuggest' "${h2m_args[@]}" -o nimsuggest.1 ./bin/nimsuggest
  help2man --name='Nimgrep' "${h2m_args[@]}" -o nimgrep.1 ./bin/nimgrep
  help2man --name='Nimpretty' "${h2m_args[@]}" -o nimpretty.1 ./bin/nimpretty
  help2man --name='Nim Package Installer' "${h2m_args[@]}" -o nimble.1 ./bin/nimble

  # generate install.sh
  ./koch distrohelper
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" ./install.sh /usr/bin

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  cp -vr doc/html "$pkgdir/usr/share/doc/$pkgname" 
  find "$pkgdir/usr/share/doc/$pkgname" -name '*.idx' -delete

  # tools
  for fn in nimble nimsuggest nimgrep nim-gdb; do cp ./bin/$fn $pkgdir/usr/bin/; done
  install -vDm644 -t "$pkgdir/usr/lib/nim/doc" doc/nimdoc.{css,cls}
  install -vDm644 -t "$pkgdir/usr/lib/nim/tools" tools/debug/nim-gdb.py
  install -vDm644 -t "$pkgdir/usr/lib/nim/tools/dochack" tools/dochack/{dochack.js,fuzzysearch.nim}

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" ./*.1

  # shell completions
  for comp in {tools,dist/nimble}/*.bash-completion; do
    install -Dm 644 "${comp}" "${pkgdir}/usr/share/bash-completion/completions/$(basename "${comp/.bash-completion}")"
  done
  for comp in {tools,dist/nimble}/*.zsh-completion; do
    install -Dm 644 "${comp}" "${pkgdir}/usr/share/zsh/site-functions/_$(basename "${comp/.zsh-completion}")"
  done

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" copying.txt
}

# vim: ts=2 sw=2 et:
