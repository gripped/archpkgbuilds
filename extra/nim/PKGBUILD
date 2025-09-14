# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=nim
_pkgname=Nim
pkgver=2.0.8
_csourcesver=86742fb02c6606ab01a532a0085784effb2e753e
pkgrel=1
pkgdesc='Imperative, multi-paradigm, compiled programming language'
url='https://nim-lang.org/'
arch=(x86_64)
license=(MIT)
depends=(
  bash
  gcc
  gcc-libs
  glibc
)
makedepends=(
  git
)
provides=(nimble)
conflicts=(nimble)
replaces=(nimble)
options=('!emptydirs')
backup=(
  etc/nim/nim.cfg
  etc/nim/nimdoc.cfg
  etc/nim/nimdoc.tex.cfg
  etc/nim/rename.rules.cfg
)
source=(https://github.com/nim-lang/Nim/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        "git+https://github.com/nim-lang/csources_v2.git#commit=${_csourcesver}")
sha256sums=('3a408e8342392342db745e26bb6acab2e6acb381db89b2624e8e58a85a1c6656'
            '130a6d21808f43da421057385a5a8fd0a6ebd0d211211d3edd645eefd4fc7087')
b2sums=('37bdb4d4a1f234e0a298a3dcb6071c5d8983ec588a1e510f8734a3fd06e1f055e1ff8ab0801f056ede9b31c32db96742eeca1d92de789d754f2241b2ba002fde'
        '2325bebb91b56f9373df83366efb308994fececc0f73acb2ad7b0822fc549d101026a5c1bf7c5ff7fd534e57f9e956f167bbfe00223fe3db0b487175cf0ca369')

prepare() {
  cd ${_pkgname}-${pkgver}
  cp -r ../csources_v2/* .
  rm bin/empty.txt
  for nimcfg in {compiler,config}/nim.cfg; do
    echo "gcc.options.always %= \"\${gcc.options.always} ${CFLAGS:-} ${CPPFLAGS}\"" >> "${nimcfg}"
    echo "gcc.options.linker %= \"\${gcc.options.linker} ${LDFLAGS:-}\"" >> "${nimcfg}"
  done
}

build() {
  cd ${_pkgname}-${pkgver}
  export PATH="${srcdir}/${_pkgname}-${pkgver}/bin:${PATH}"

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
  cd ${_pkgname}-${pkgver}
  export PATH="${srcdir}/${_pkgname}-${pkgver}/bin:${PATH}"

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
