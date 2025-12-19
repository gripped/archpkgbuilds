# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_name=plugins
pkgname=cni-plugins
pkgver=1.9.0
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
sha512sums=('8383a9f3fca75e978b84035609668f139e34cac7c5c1547c2913b6893754c3a0ec55acef73fd8e362094ca022359f2fa6c54dec55bada6b8fb8db7e9d7c889ea')
b2sums=('658b7b1cc47f44bea1e1c8df311bc3aa69d56bbd0c7d634fe7fc9f2a8f6d2ee7ec060a48cb2bc24512a860aea9e9c34420850f39cc1ae0ff1941bd773fdd6f14')

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
