# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=pyenv
pkgver=2.4.5
pkgrel=1
epoch=1
pkgdesc="Easily switch between multiple versions of Python"
arch=(any)
url="https://github.com/pyenv/pyenv"
license=(MIT)
depends=(bash)
optdepends=('git: installing development versions')
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('e7cba0d00b58b689f2d3771b4f58a2b6119a40c0d85f2af4b71751c3ccb14d40cb295fde27511da78f51b35ff4b8acc9ed8ee702a355eb4c30fa89c3313d651d')
b2sums=('51cb626e2cf25b26f12bc76cffa59998fd13cc9903d6e8eaa5aeec39cc18630021540dc846f15bcab6a1901a2c41599844c06d5e924f42c29759e1f6ea4bab37')

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
}
