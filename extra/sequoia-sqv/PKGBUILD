# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=sequoia-sqv
pkgver=1.3.0
pkgrel=1
pkgdesc='Simple OpenPGP signature verification program'
url='https://sequoia-pgp.org/'
arch=(x86_64)
license=(GPL-2.0-or-later)
groups=(sequoia)
depends=(
  gcc-libs
  glibc
  gmp
  nettle
)
makedepends=(
  cargo
  clang
  git
)
source=("git+https://gitlab.com/sequoia-pgp/sequoia-sqv.git#tag=v${pkgver}?signed")
sha512sums=('7636309b3a298fc17899a1f6e19c37362458e3049cc352eb349628449493bbfa22b56650e1519cfb46cb1abf7a29788e2a29cedc504ce78ef2b71fba7e3f86b2')
b2sums=('967daa03700d2c6a5a25595352f07e4773f5c0dc6e1e8c98fc585ef6fd96593a7e715db1fca3f6550bd70fe55e26716383a3de38774c6987f90892c79d8c09aa')
validpgpkeys=(
  D2F2C5D45BE9FDE6A4EE0AAF31855247603831FD # justus@sequoia-pgp.org
  CBCD8F030588653EEDD7E2659B7DD433F254904A # justus@sequoia-pgp.org
  D2F2C5D45BE9FDE6A4EE0AAF31855247603831FD # justus@sequoia-pgp.org
  8F17777118A33DDA9BA48E62AACB3243630052D9 # Neal H. Walfield <neal@sequoia-pgp.org>
)

prepare() {
  cd sequoia-sqv
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd sequoia-sqv
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features 'crypto-nettle'
}

check() {
  cd sequoia-sqv
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --features 'crypto-nettle'
}

package() {
  depends+=(
    libnettle.so
    libhogweed.so
)

  cd sequoia-sqv
  install -Dm 755 target/release/sqv -t "${pkgdir}/usr/bin"

  pushd target/release/build/sequoia-sqv-*/out/shell-completions/
  install -Dm 644 sqv.bash "${pkgdir}/usr/share/bash-completion/completions/sqv"
  install -Dm 644 _sqv -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm 644 sqv.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  popd

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
