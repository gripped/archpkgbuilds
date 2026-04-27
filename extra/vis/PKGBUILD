# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=vis
pkgname=(vis vis-syntax-highlighting)
_commit='452f5da105d9ecdae84f00b60595b9bc69d232ae'
pkgver=0.9.r400.g452f5da1
pkgrel=1
pkgdesc='modern, legacy free, simple yet efficient vim-like editor'
arch=('x86_64')
url='https://github.com/martanne/vis#vis-a-vim-like-text-editor'
depends=('acl' 'libacl.so' 'bash' 'ncurses' 'libncursesw.so' 'libtermkey'
         'libtermkey.so' 'lua' 'tre' 'file')
makedepends=('git')
checkdepends=('vim' 'lua-lpeg')
license=('custom:ISC')
validpgpkeys=('54A47F12462D26A7D078A932C83A52CD1962562C') # Marc André Tanner <mat@brain-dump.org>
# TODO: can we have signed tag back?
source=("git+https://github.com/martanne/vis.git#commit=${_commit}")
sha256sums=('bb33a7cf6270666c4475b8d4c2582422f5cee9c62d5e3450ba1232b26a96e59a')

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
              'vis-syntax-highlighting: syntax highlighting')
  backup=('etc/vis/visrc.lua')

  cd vis/

  make DESTDIR="${pkgdir}" install

  # move for vis-syntax-highlighting, but keep 'lexer.lua'!
  mkdir "${srcdir}"/lexers/
  find "${pkgdir}"/usr/share/vis/lexers/ -type f -not -name lexer.lua -print0 | \
    xargs -0 mv -t "${srcdir}"/lexers/

  install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua

  install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
}

package_vis-syntax-highlighting() {
  pkgdesc='syntax highlighting for vis editor'
  depends=('vis' 'lua-lpeg')

  install -d -m0755 "${pkgdir}"/usr/share/vis/
  mv "${srcdir}"/lexers/ "${pkgdir}"/usr/share/vis/
}
