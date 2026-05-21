# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=vis
pkgname=(vis vis-lexers)
_commit='6efb844b79c78cf20af033591c461c3cbb907ded'
pkgver=0.9.r420.g6efb844b
pkgrel=2
pkgdesc='modern, legacy free, simple yet efficient vim-like editor'
arch=('x86_64')
url='https://github.com/martanne/vis#vis-a-vim-like-text-editor'
depends=(
  'acl' 'libacl.so'
  'bash'
  'file'
  'glibc'
  'libtermkey' 'libtermkey.so'
  'lua' #'liblua.so'
  'ncurses' 'libncursesw.so'
  'tre' #'libtre.so'
)
makedepends=('git')
checkdepends=('vim' 'lua-lpeg')
license=('custom:ISC')
validpgpkeys=('54A47F12462D26A7D078A932C83A52CD1962562C') # Marc André Tanner <mat@brain-dump.org>
# TODO: can we have signed tag back?
source=("git+https://github.com/martanne/vis.git#commit=${_commit}")
sha256sums=('d3bcddf87f980e9e0a52b57e01fd3b4c6e1eec002700ea9248469e3f69565a6a')

_backports=(
)

_reverts=(
)

pkgver() {
  cd vis/

  git describe | sed 's|^v||; s|-|.r|; s|-|.|'
}

prepare() {
  cd vis/

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done
}

build() {
  cd vis/

  ./configure \
    --prefix=/usr

  make
}

check() {
  cd vis/

  make -C test/
}

package_vis() {
  optdepends=('wl-clipboard: wayland clipboard support'
              'xclip: X11 clipboard support'
              'xsel: X11 clipboard support'
              'vis-lexers: syntax highlighting')
  backup=('etc/vis/visrc.lua')

  cd vis/

  make DESTDIR="${pkgdir}" install

  # move for vis-lexers, but keep 'lexer.lua'!
  mkdir "${srcdir}"/lexers/
  find "${pkgdir}"/usr/share/vis/lexers/ -type f -not -name lexer.lua -print0 | \
    xargs -0 mv -t "${srcdir}"/lexers/

  install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua

  install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
}

package_vis-lexers() {
  pkgdesc='syntax highlighting for vis editor'
  depends=('vis' 'lua-lpeg')
  provides=('vis-syntax-highlighting')
  conflicts=('vis-syntax-highlighting')
  replaces=('vis-syntax-highlighting')

  install -d -m0755 "${pkgdir}"/usr/share/vis/
  mv "${srcdir}"/lexers/ "${pkgdir}"/usr/share/vis/
}
