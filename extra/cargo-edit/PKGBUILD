# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-edit
pkgver=0.13.11
pkgrel=1
pkgdesc='Managing cargo dependencies from the command line'
url='https://github.com/killercup/cargo-edit/releases'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo' 'libssh2' 'openssl')
source=(https://github.com/killercup/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d9dd13164c353bc0c7694c0e74805be02f4d3abfbb13b846f3434aef8262531923790cc2fbafe9df6193ee50c344318f5e2fcc315f667f2558afc8f2650f41cb')
b2sums=('50839a4a86a74ed4df7cf89222d080a4cf45231a5e961adfe3273f44b94e0be1e8237af61f502ea7b4b5551bcf53ac76b1245768e8098cbd26cc6f20300a7f81')

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
