# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=pyenv
pkgver=2.4.13
pkgrel=1
epoch=1
pkgdesc="Easily switch between multiple versions of Python"
arch=(any)
url="https://github.com/pyenv/pyenv"
license=(MIT)
depends=(bash)
optdepends=('git: installing development versions')
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('1601fd41a8a5a8bd5575c50c8f12547a4e50566bd5f737683cf57ee69a7aec83abbe9da1d95bef38776f14321b3515cbc87d87108e1f09484860ee11b34bc10f')
b2sums=('64d4428dc45bd6671386f49c271b04596e414bedf1442ab4746c8515d5a04f0c9271e79f8fa2feafa0a211fa8cdca2b869d0d03081d2e7130806200474c0d5b8')

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
