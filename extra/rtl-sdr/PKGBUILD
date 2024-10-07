# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Michael Düll <mail@akurei.me>

pkgname=rtl-sdr
pkgver=2.0.2
pkgrel=1
epoch=1
pkgdesc='Driver for Realtek RTL2832U, allowing general purpose software defined radio (SDR)'
arch=('x86_64')
url='https://osmocom.org/projects/rtl-sdr/wiki'
license=('GPL-2.0-only')
depends=('glibc' 'libusb')
makedepends=('git' 'cmake')
install=rtl-sdr.install
source=(
  "$pkgname::git+https://gitea.osmocom.org/sdr/rtl-sdr#tag=v$pkgver"
  'fix-udev-directory.patch'
  "$pkgname.sysusers"
)
sha512sums=('56306ce6909efb2e3847dde6068c5e55c9a60524d451a0098a968165bd1b087a929e25e2719ead0b15badb813eab6f0319a2def68b18d54f1cf8a9b911c70db7'
            '196c87cf3ccc2fb01cf44c3c3dd035268411c5d06c1d5b880f8b43946cea96b92b1c1478e2b9053f65a23c8d5734a76b0dbae2077bde48f285b26b2188336054'
            '121661a5f4bce17dd5abb72c26bb2015bc0a86b65ae78758bace9fa8b1b19ccb2736ed3f3bddea0c940cacfbbba89301071abe65ec9c386f679314591469378c')
b2sums=('a4d5d8b2148fe347227ae178367782eaaae3de1bfe9896171d439bf36c81f822f3b0f7f7e35d8ec1a99a11defa63c04b424eeda4d8cc9047086233e18f710cf7'
        '2356582926b8bb0b1b7bbf22dd046ae9c55855a925818730d8e9558e4620f8f6599663aec50e0bdb5c1e7f1242e8f170d2f9eecb0808e42f53d06ea6a812ec64'
        'ff6d84a21f23ea3da8771cbf6f6344d7ac7a52a0987b6f8974bc083efee3389250402e861b233460228439fb8c7e35c4f98cf91254ecc5d956742158fd565cc3')

prepare() {
  cd "$pkgname"

  # ensure udev rules get installed to correct directory
  patch -p1 -i "$srcdir/fix-udev-directory.patch"

  # fix udev rules and allow access to any user that is locally logged in or in the rtlsdr group
  # https://bugzilla.redhat.com/show_bug.cgi?id=815093
  sed -e 's/GROUP="plugdev"/GROUP="rtlsdr", TAG+="uaccess"/' -i rtl-sdr.rules
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -D DETACH_KERNEL_DRIVER=ON \
    -D INSTALL_UDEV_RULES=ON \
    -W no-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # rtlsdr group creation
  install -vDm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$pkgname"

  # module blacklisting rules
  install -vDm644 debian/rtl-sdr-blacklist.conf "$pkgdir/usr/lib/modprobe.d/rtlsdr.conf"

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" debian/*.1
}

# vim:set ts=2 sw=2 et:
