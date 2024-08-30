# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# AUR Maintainer: Swift Geek
# AUR Maintainer: Timothée Ravier <tim@siosm.fr>
# AUR Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Swift Geek
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co

_pkgname="powerline"
pkgbase="powerline"
pkgname=(
  "powerline"
  "python-powerline"
  "powerline-common"
  "powerline-vim"
  "powerline-fonts"
)
pkgver=2.8.4
pkgrel=1
pkgdesc='Statusline plugin for vim, and provides statuslines and prompts for several other applications, including zsh, bash, tmux, IPython, Awesome, i3 and Qtile'
arch=('x86_64')
url="https://github.com/powerline/powerline"
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
)
checkdepends=(
  'python-netifaces'
  'python-pexpect'
  'python-psutil'
  'python-tox'
)
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  # This patch set is maintained here:
  # https://github.com/carlsmedstad/powerline/tree/archlinux
  "0001-Compile-powerline-executable-without-setuptools.patch::$url/commit/ab071647568255b7c80c776beaaf467168b4f5ec.patch"
  "0002-Point-shebangs-to-system-Python.patch::$url/commit/6324b25a2a16d5c0bf5dd05ba1bc5448215ad969.patch"
  "0003-Remove-failing-tests.patch::$url/commit/b8772a7583e25f798e4790e550e101f9ce78a2f3.patch"
)
sha256sums=('9e846af9379b57e410efe264cff3a6b98eb78dd9526e83016776ae5ffc5798f4'
            'f3098fc46c6b41adb8fd9da82ea39de218459d8064da7e4cfe5fb65ed2dd66b7'
            '6a45dd8fefffbe4ef7dcadc3461217c010447aa67610649880ca83aa3440cd76'
            'd0b5ff60b4fcddc89954279ffb2b4046466529cb66ca90d342ac4b4450cf81e8')

prepare() {
  cd $_pkgname-$pkgver
  for patch in "$srcdir"/*.patch; do
    patch -Np1 -i "$patch"
  done
}

build() {
  cd $_pkgname-$pkgver
  # shellcheck disable=SC2086
  gcc $CFLAGS $LDFLAGS -o scripts/powerline client/powerline.c
  python -m build --wheel --no-isolation
  make -C docs man
}

check() {
  cd $_pkgname-$pkgver
  python -m unittest discover -vs tests/test_python
}

package_powerline() {
  depends=(
    'glibc'
    'python'
    'python-powerline'
  )
  conflicts=('python-powerline<=2.3-1')
  replaces=('python-powerline<=2.3-1')

  cd $_pkgname-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" \
    scripts/powerline \
    scripts/powerline-config \
    scripts/powerline-daemon \
    scripts/powerline-lint \
    scripts/powerline-render

  install -vdm755 "$pkgdir/usr/share/powerline"
  ln -vs "$(python -c 'import site; print(site.getsitepackages()[0])')/powerline/bindings" \
    "$pkgdir/usr/share/powerline/bindings"

  install -vDm644 -t "$pkgdir/usr/lib/systemd/user" \
    powerline/dist/systemd/powerline-daemon.service

  install -vDm644 -t "$pkgdir/usr/share/licenses/powerline" LICENSE
}

package_python-powerline() {
  pkgdesc='python library for powerline'
  depends=(
    'python'
    'powerline-common'
  )
  optdepends=(
    'python-psutil: improved system information'
    'python-pygit2: improved git support'
    'powerline-vim: vim plugin'
    'powerline-fonts: patched fonts for powerline'
    'which: fish bindings'
  )

  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/python-powerline" LICENSE

  # As executables are currently installed as the separate split-package
  # 'powerline', remove them from this package.
  # shellcheck disable=SC2115
  rm -vr "$pkgdir/usr/bin"
}

package_powerline-common() {
  pkgdesc='common files for python-powerline'

  cd $_pkgname-$pkgver
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*
  install -vDm644 -t "$pkgdir/usr/share/licenses/powerline-common" LICENSE
}

package_powerline-fonts() {
  pkgdesc='patched fonts for powerline'
  provides=('otf-powerline-symbols')
  depends=('powerline-common')

  cd $_pkgname-$pkgver
  install -vDm644 -t "$pkgdir/usr/share/fonts/OTF" font/PowerlineSymbols.otf
  install -vDm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" font/10-powerline-symbols.conf
  install -vdm755 "$pkgdir/usr/share/fontconfig/conf.default"
  ln -vs /usr/share/fontconfig/conf.avail/10-powerline-symbols.conf \
    "$pkgdir/usr/share/fontconfig/conf.default/10-powerline-symbols.conf"
  install -vDm644 -t "$pkgdir/usr/share/licenses/powerline-fonts" LICENSE
}

package_powerline-vim() {
  pkgdesc='vim plugin for powerline'
  depends=(
    'powerline'
    'powerline-common'
    'vim-runtime'
  )

  cd $_pkgname-$pkgver
  install -vDm644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" \
    powerline/bindings/vim/plugin/powerline.vim
  install -vDm644 -t "$pkgdir/usr/share/licenses/powerline-vim" LICENSE
}
