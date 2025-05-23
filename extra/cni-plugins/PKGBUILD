# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_name=plugins
pkgname=cni-plugins
pkgver=1.7.1
pkgrel=1
pkgdesc='Some standard networking plugins, maintained by the CNI team'
arch=(x86_64)
url="https://github.com/containernetworking/plugins"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
provides=(container-network-stack=1)
options=(
  !lto  # unable to build with LTO: https://github.com/containernetworking/plugins/issues/706
  emptydirs  # NOTE: we need /etc/cni/net.d/ for configs
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('5b1a8c1a63f6f7a7ca4df570bf5c4b2003cdfe1b861ac86f145b5b523c9371275f68b01a115566a4f3455e56709a5a280b485005ea3fa121c1f381fbf6bd500e')
b2sums=('a537dac57c7ab12b0efee337af6e0f31cbb6b4b0c2feb1eccbe12e37c70ec1418f5d0673f2c4c222b02817644b0ec1c384c0bb070f4cb68c1cd3e49a957a3d7d')

prepare() {
  mkdir -vp $_name-$pkgver/bin
}

build() {
  cd $_name-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  # custom go build calls, since build_linux.sh is not flexible enough
  for plugin in plugins/meta/* plugins/main/* plugins/ipam/*; do
    if [[ -d "$plugin"  && "$plugin" != *windows ]]; then
      printf "Building plugin: %s\n" "$(basename $plugin)"
      go build -o bin/ -ldflags "-compressdwarf=false -linkmode external" "./$plugin"
    fi
  done
}

# tests are broken
# check() {
#   cd $_name-$pkgver
#   go test ./...
# }

package() {
  cd $_name-$pkgver
  install -vDm755 bin/* -t "$pkgdir/usr/lib/cni/"
  # strip files manually because makepkg doesn't do it: https://gitlab.archlinux.org/pacman/pacman/-/merge_requests/38
  strip "$pkgdir/usr/lib/cni/"*
  # some applications would build their own versions of CNI plugins in
  # /opt/cni/bin if they are not found (as non-symlink files), so we have to
  # install them twice... ;_;
  install -vDm755 bin/* -t "$pkgdir/opt/cni/bin/"
  strip "$pkgdir/opt/cni/bin/"*
  install -vdm755 "$pkgdir/etc/cni/net.d/"
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm644 plugins/ipam/dhcp/systemd/* -t "$pkgdir/usr/lib/systemd/system/"
}
