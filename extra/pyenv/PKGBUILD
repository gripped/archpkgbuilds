# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=pyenv
pkgver=2.8.14
pkgrel=1
epoch=1
pkgdesc="Easily switch between multiple versions of Python"
arch=(any)
url="https://github.com/pyenv/pyenv"
license=(MIT)
depends=(bash)
optdepends=('git: installing development versions')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "pyenv.zsh"
)
sha512sums=('8e2764807e51e7f4b54726a43fad3cbd0226747e50acfff9ed866bc9c1d2f58fe5bc3bf0eeb793aa4b97f57467a1900f70ba7e11434a00ad611d6ad76b8ff8f9'
            '0db4e464d3f79a3402fca8457ef5fe66078c360596c8d899f1fe2759700171299100421ebcaa12ab6a96ec4c4450fa9245879f3d0058632b10c8acff2ceeb106')
b2sums=('5d7cf9b8121bf354a90d8b286783a7480b636629cd4351a31658eab8dd5966d8f52042ea0e8d06aaf270836a7c292893109fffbaa7ecfe0a9447bb72525fe45a'
        '853a2e62a3d1c1963bf32e297a086d74e3142784f32b16df0738e5694587719954e868744d66e4a265aa6197a1fa1ae74b0b1300bda5b924feb6854bcb1f4aaf')

package() {
  cd $pkgname-$pkgver
  # application
  install -vDm 755 libexec/* -t "$pkgdir/usr/share/$pkgname/libexec"
  install -vdm 755 "$pkgdir/usr/bin"
  ln -sv /usr/share/$pkgname/libexec/$pkgname "$pkgdir/usr/bin/$pkgname"
  # application hooks
  install -vDm 755 pyenv.d/exec/pip-rehash/* -t "$pkgdir/usr/share/$pkgname/pyenv.d/exec/pip-rehash/"
  install -vDm 644 pyenv.d/exec/*.bash -t "$pkgdir/usr/share/$pkgname/pyenv.d/exec/"
  install -vDm 644 pyenv.d/install/*.bash -t "$pkgdir/usr/share/$pkgname/pyenv.d/install/"
  install -vDm 644 pyenv.d/rehash/*.bash -t "$pkgdir/usr/share/$pkgname/pyenv.d/rehash"
  install -vDm 644 pyenv.d/rehash/conda.d/* -t "$pkgdir/usr/share/$pkgname/pyenv.d/rehash/conda.d"
  install -vDm 644 pyenv.d/rehash/source.d/* -t "$pkgdir/usr/share/$pkgname/pyenv.d/rehash/source.d"
  # plugin
  install -vDm 755 plugins/python-build/bin/* -t "$pkgdir/usr/share/$pkgname/plugins/python-build/bin"
  for bin in {${pkgname}-{install,uninstall},python-build}; do
    ln -sv "/usr/share/$pkgname/plugins/python-build/bin/$bin" "$pkgdir/usr/bin/$bin"
  done
  cp -av plugins/python-build/share "$pkgdir/usr/share/$pkgname/plugins/python-build"
  # licenses
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 plugins/python-build/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.python-build"
  # shell completion
  install -vDm 644 completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -vDm 644 completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm 644 completions/$pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  # man page
  install -vDm 644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1/"
  # docs
  install -vDm 644 {CHANGELOG,COMMANDS,README}.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 plugins/python-build/README.md "$pkgdir/usr/share/doc/$pkgname/README-python-build.md"
  # Fix zsh-completion. See:
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pyenv/-/issues/1
  install -vDm644 ../pyenv.zsh "$pkgdir/usr/share/zsh/site-functions/_pyenv"
}
