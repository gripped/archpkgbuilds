# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=pyenv
pkgver=2.6.4
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
sha512sums=('8cd3462211a9df9b3074eab51e953453aeb5a5f90c13c2a44229a8e166bb99b5e685f520ea1c0adabe2ffa22bb5868593652a9e47500f02e49326e6b5bb9f165'
            '0db4e464d3f79a3402fca8457ef5fe66078c360596c8d899f1fe2759700171299100421ebcaa12ab6a96ec4c4450fa9245879f3d0058632b10c8acff2ceeb106')
b2sums=('5100ae5b156193991a664b6c875ecb23df06234f6235add761804ae26e02e72f4fbfe3288889522e3d1b230d619aa8f16c56cb84a610baa9865b4f13f8d28938'
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
    ln -sv /usr/share/$pkgname/plugins/python-build/bin/$bin "$pkgdir/usr/bin/$bin"
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
