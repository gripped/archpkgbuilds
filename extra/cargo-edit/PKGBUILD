# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-edit
pkgver=0.13.10
pkgrel=1
pkgdesc='Managing cargo dependencies from the command line'
url='https://github.com/killercup/cargo-edit/releases'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo' 'libssh2' 'openssl')
source=(https://github.com/killercup/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e744bb0b3123e560e4a3ca8993fb8b3d74442f13ca9bc283a0d40bf06fe73e328c402bcc50acb661ce08784d794a3e525d9fc285d8971969ba3f48c80325ac9b')
b2sums=('d507886dabd2462b68d083343285b2343e5e77b45b1aee592bd7c1ebd40328580ba944c5a36147523521ac9926bf6d2c4e791efb8d6687831af2fd39d75dfa05')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -ffat-lto-objects'
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release
}

check() {
  cd ${pkgname}-${pkgver}
  # Note: Rust 1.78 started warning for deprecated config file names, something
  # being used extensively in tests, build with older rust from the package
  # archive if you want to run checks, e.g.:
  # `pkgctl build -I rust-1:1.77.2-2-x86_64.pkg.tar.zst`
  local skipped=(
    # Rust changed some error messages
    'invalid_manifest::case'
    'invalid_workspace_root_manifest::case'
    # Rust 1.85 changed manifest versions
    # as of this pgkver 0.13.0 these tests assume older Rust
    lockfile::case
    upgrade_all::case
    upgrade_workspace::case
    virtual_manifest::case
    workspace_inheritance::case
    workspace_member_cwd::case
  )
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 \
    target/release/cargo-upgrade \
    target/release/cargo-set-version \
    -t "${pkgdir}/usr/bin"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
