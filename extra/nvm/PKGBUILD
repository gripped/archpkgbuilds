# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Tom Wadley <tom@tomwadley.net>

pkgname=nvm
pkgver=0.40.3
pkgrel=1
pkgdesc="Node Version Manager - Simple bash script to manage multiple active node.js versions"
arch=('any')
url="https://github.com/nvm-sh/nvm"
license=('MIT')
makedepends=('git')
checkdepends=(
  'bash'
  'npm'
)
install="$pkgname.install"
source=(
  "git+$url.git#tag=v$pkgver"
  "init-nvm.sh"
)
sha256sums=('2f679a6891593b01875765001be2f0f09b57bd485b6ae54c5c5ecc63eeeeb96b'
            '1175891054241c344f8e3d1ef3f7d3a43fb630fb552da834deee45b277f2849d')

prepare() {
  cd $pkgname
  # Requires sudo and/or Docker, skip.
  rm -v "test/fast/Running 'nvm uninstall' with incorrect file permissions fails nicely"
  rm -v "test/fast/Unit tests/nvm_download"
  rm -v "test/fast/Unit tests/nvm_get_arch"
  rm -v "test/fast/Unit tests/nvm_get_arch_unofficial"
  # Requires submodule, skip.
  rm -v "test/fast/Unit tests/nvm_process_nvmrc"
  # Fails in a chroot for some reason.
  rm -v "test/fast/Listing versions/Running 'nvm ls' should not show a trailing slash"
}

check() {
  cd $pkgname
  npm install
  node_modules/.bin/urchin  -f -s bash test/fast
}

package() {
  cd $pkgname
  install -vDm644 -t "$pkgdir/usr/share/$pkgname" nvm.sh
  install -vDm755 -t "$pkgdir/usr/share/$pkgname" nvm-exec
  install -vDm644 -t "$pkgdir/usr/share/$pkgname" bash_completion
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

  # Convenience script
  install -vDm644 -t "$pkgdir/usr/share/$pkgname" "$srcdir/init-nvm.sh"
}
