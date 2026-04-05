# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ntpd-rs
pkgver=1.7.2
pkgrel=1
pkgdesc="Full-featured implementation of NTP with NTS support"
arch=(x86_64)
url="https://docs.ntpd-rs.pendulum-project.org"
_url="https://github.com/pendulum-project/ntpd-rs"
license=('Apache-2.0 OR MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  rust
)
backup=(etc/$pkgname/ntp.toml)
source=(
  $pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz
  50-$pkgname.list
  $pkgname.service
  $pkgname-metrics.service
  LICENSE
)
sha512sums=('ecc82081f9af5b3ce73aaafb3a12189d66519b1e02e48949d939112681e62ef6ccbfff176f4da277a35423c812109d682cc9aa1d15121e528c613de0c5c73f3e'
            'e5dae786b999383980dc1d9aaee125ee18c52651abf163a3c38a2fdaa97b9de8940052af5a4e8ce1826444fc3f246740b1a95aa35f96c8484ccb683b0f638783'
            '04e46533dcbeb97ae5e04f0f714ee4a7feae66fa5dc7bc894d7996bcab58ece661abe790ff48416599ddad6dfed4a10e7e895903072d6a70a0b29ec9c98feb63'
            '00ac29201d87e745ff1c46032f32cb21b0c20e7e56cbfad1bc34fb68c26383706a31615e52db4baecb6442687e8921003361f8d8be5eeae4358830c8756bbe17'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('584da621d013db2023391dc48820704913ff4d17df9abf0890b250da0d27d677d4595359bb1d081bb3c939966d173e2a19ca1f4db01fb1c4a0481cb7274d941c'
        '8013fe6de65a093366d79e09b9d5ed9975cf707cfa282b9abe8e5f3be5885ec668c598cba2d2b204388b291fbe2ef249f091bd5a480d1c3d951b1ffe34cae831'
        '5d392c85742722d8850a96122ca380e2b45bda7c958df5f81d8f3f390525f76dbcf2dcb837b2f02624bb51a766ccd78c68c33b379990749b5a298fa9875b4a6c'
        'b409414cb467c9e17d5711f75b528853d193f9a48acf1c9fe2ae47eb4d8e6a69f5223e176267aa1dff33c97c41b2cbcd3d9e12d9d2dd04f3a8d1f07b0f69f679'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -ffat-lto-objects" cargo build --all-features --frozen --release --target-dir=target
}

check() {
  cd $pkgname-$pkgver
  CFLAGS+=" -ffat-lto-objects" cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 target/release/ntp-{ctl,daemon,metrics-exporter} -t "$pkgdir/usr/bin/"
  install -vDm 644 docs/examples/conf/ntp.toml.default "$pkgdir/etc/$pkgname/ntp.toml"
  install -vDm 644 ../*.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../50-$pkgname.list -t "$pkgdir/usr/lib/systemd/ntp-units.d/"
  install -vDm 644 docs/precompiled/man/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -vDm 644 docs/precompiled/man/*.8 -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
}
