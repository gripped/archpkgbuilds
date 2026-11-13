# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=zellij
pkgver=0.46.0
pkgrel=1
pkgdesc="A terminal multiplexer"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://zellij.dev"
license=('MIT')
depends=(curl
         glibc # libc.so libm.so
         libgcc
         zlib)
makedepends=(cargo
             mandown)
options=(!lto)
source=("https://github.com/zellij-org/${pkgname}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d3302f36426288a32b3ac9db1e670f20c57285b1458113d2889802dacd250b1035096ac1fa23ca08b341796a22aeb2c86988e73ade199bbafd45b6b12e29c2a')

_srcenv() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
  CFLAGS+=' -ffat-lto-objects'
}

prepare() {
  _srcenv
  cargo fetch --locked --target host-tuple
}

build() {
  _srcenv
  cargo build --release --frozen
  ./target/release/zellij setup --generate-completion bash > target/zellij.bash
  ./target/release/zellij setup --generate-completion elvish > target/zellij.elv
  ./target/release/zellij setup --generate-completion fish > target/zellij.fish
  ./target/release/zellij setup --generate-completion zsh > target/zellij.zsh
  # mandown docs/MANPAGE.md > assets/zellij.1
}

package() {
  depends+=(libcurl.so
            libgcc_s.so
            libz.so)
  cd "$pkgname-$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/zellij
  install -Dm644 -t "${pkgdir}/usr/share/doc/zellij" GOVERNANCE.md README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/zellij" LICENSE.md
  install -Dm644 target/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm644 target/zellij.elv "${pkgdir}/usr/share/elvish/lib/zellij.elv"
  install -Dm644 target/zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm644 target/zellij.zsh "${pkgdir}/usr/share/zsh/site-functions/_zellij"
  # install -Dm644 assets/zellij.1 "${pkgdir}/usr/share/man/man1/zellij.1"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" assets/dev.zellij.Zellij.desktop
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/pixmaps/zellij.png"
}

# vim: ts=2 sw=2 et:
