# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-edit
pkgver=0.13.6
pkgrel=1
pkgdesc='Managing cargo dependencies from the command line'
url='https://github.com/killercup/cargo-edit/releases'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo' 'libssh2' 'openssl')
source=(https://github.com/killercup/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('73386a2e0eeae0891ede99ebe7459aa97975f223f3892c5a758a89392b0c80f1602ebf4568317bf32e5c5a4e78edd5d75fdf4a7d8ac5c71acf8ced3e6f40d41c')
b2sums=('c36a4acb6e44adf157e0f9f2e8a94346e53830df5f98da1a672e5e9532665415d27fed1617ed3edd5da3394c184347d89852ca54d766c054d6b1aed2e4b6fa4a')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
