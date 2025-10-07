# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=sbctl
pkgver=0.18
pkgrel=1
pkgdesc="Secure Boot key manager"
arch=("x86_64" "aarch64")
url="https://github.com/Foxboron/sbctl"
license=("MIT")
depends=("binutils" "util-linux" "pcsclite")
makedepends=("go" "git" "asciidoc")
source=("https://github.com/Foxboron/sbctl/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=("C100346676634E80C940FB9E9C02FF419FECBE16")
sha256sums=('d274451b145b0aaecfdf2d01ad45473b61ab40f3f58e4735cee50aa7573c584d'
            'SKIP')

build(){
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    make
}

package(){
    cd "${pkgname}-${pkgver}"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 ./contrib/pacman/ZZ-sbctl.hook "${pkgdir}/usr/share/libalpm/hooks/zz-sbctl.hook"
    install -Dm755 ./contrib/mkinitcpio/sbctl "${pkgdir}/usr/lib/initcpio/post/sbctl"
}
