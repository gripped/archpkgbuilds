# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=nim
_pkgname=Nim
pkgver=2.0.10
_csourcesver=86742fb02c6606ab01a532a0085784effb2e753e
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
)
provides=(nimble)
conflicts=(nimble)
replaces=(nimble)
options=(!emptydirs)
backup=(
  etc/nim/nim.cfg
  etc/nim/nimdoc.cfg
  etc/nim/nimdoc.tex.cfg
  etc/nim/rename.rules.cfg
)
source=(
  "$pkgname::git+https://github.com/nim-lang/Nim#tag=v$pkgver"
  "git+https://github.com/nim-lang/csources_v2.git#commit=${_csourcesver}"
)
sha512sums=('93f6dc51d09efdac22610af1c79cfdb84e857299ba85dc95fd248bbb4fd4feba32617d6d7e8e5472cd288c63841dc9c94ad2fb7191f3068bd9d2416bc80a9c09'
            '0c6eabf3aff84d0ed6e0e0c1705d523e93eb7a7d70f4a01aed947af14eecd9eb15c43d8420b20f3ec463f600a23a73e485a77d5019abd49e09402f44d7aaa4f2')
b2sums=('c0569703a24795bb7a37e5ca008eb165116131faf435b4aa74fe891362ed38332c897a4de8db94e4c1176c710ea9850aebd535b0e1f9d852d7a370f5b92ea7bd'
        '2325bebb91b56f9373df83366efb308994fececc0f73acb2ad7b0822fc549d101026a5c1bf7c5ff7fd534e57f9e956f167bbfe00223fe3db0b487175cf0ca369')

prepare() {
  cd "$pkgname"

  cp -r ../csources_v2/* .

  rm bin/empty.txt

  for nimcfg in {compiler,config}/nim.cfg; do
    echo "gcc.options.always %= \"\${gcc.options.always} ${CFLAGS:-} ${CPPFLAGS}\"" >> "${nimcfg}"
    echo "gcc.options.linker %= \"\${gcc.options.linker} ${LDFLAGS:-}\"" >> "${nimcfg}"
  done
}

build() {
  cd "$pkgname"

  export PATH="${srcdir}/${pkgname}/bin:${PATH}"

  echo "Building nim"
  sh build.sh

  echo "Building koch"
  nim c -d:release koch
  ./koch boot -d:release -d:nativeStacktrace -d:useGnuReadline

  echo "Building libs"
  (cd lib
    nim c --app:lib -d:createNimRtl -d:release nimrtl.nim
  )

  echo "Building tools"
  ./koch tools
  (cd tools
    nim c -d:release nimgrep.nim
  )

  echo "Building nimsuggest"
  nim c -d:release nimsuggest/nimsuggest.nim
}

package() {
  cd "$pkgname"

  export PATH="${srcdir}/${pkgname}/bin:${PATH}"

  ./koch install "${pkgdir}"

  install -d "${pkgdir}/usr/lib"
  cp -a lib "${pkgdir}/usr/lib/nim"
  cp -a compiler "${pkgdir}/usr/lib/nim"
  install -Dm 644 nim.nimble "${pkgdir}/usr/lib/nim/compiler"
  install -m 755 lib/libnimrtl.so "${pkgdir}/usr/lib/libnimrtl.so"

  install -Dm 644 config/* -t "${pkgdir}/etc/nim"
  install -Dm 755 bin/* -t "${pkgdir}/usr/bin"

  # Fix FS#50252, unusual placement of header files
  install -d "${pkgdir}/usr/include"
  cp -a "${pkgdir}/usr/lib/nim/"*.h "${pkgdir}/usr/include"

  # Fix FS#48118, related to the doc2 command
  ln -s /usr/share/nim/doc "${pkgdir}/usr/lib/nim/doc"
  install -d "${pkgdir}/usr/share/nim/doc"
  cp -a doc/* "${pkgdir}/usr/share/nim/doc"

  # Fix wrong path for system.nim https://github.com/nim-lang/Nim/issues/22369
  ln -s /usr/lib/nim "$pkgdir"/usr/lib/nim/lib

  install -Dm 644 copying.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # completions
  for comp in tools/*.bash-completion; do
    install -Dm 644 "${comp}" "${pkgdir}/usr/share/bash-completion/completions/$(basename "${comp/.bash-completion}")"
  done
  for comp in tools/*.zsh-completion; do
    install -Dm 644 "${comp}" "${pkgdir}/usr/share/zsh/site-functions/_$(basename "${comp/.zsh-completion}")"
  done

  rm -r "${pkgdir}/nim"
  rm "${pkgdir}"/usr/bin/nim-gdb.bat
}

# vim: ts=2 sw=2 et:
