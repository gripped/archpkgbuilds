# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_name=plugins
pkgname=cni-plugins
pkgver=1.8.0
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
sha512sums=('a2bf1bd2b87e2fda60329982aea4ccc4e80aff9e41de48501e72a09476e9c97132c77cf737b4c3b668383f398b9dee5f7574d2f300bfef10f15d7545cc06ab79')
b2sums=('4d6192edd7613f61661d9216b2dd9a4277efceee0beaebb5116f7fd792e78a309cb87b96a638cb0f3735971e2a999b77cbf304bb22f9db2e07e31d6f4d7fe94f')

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
