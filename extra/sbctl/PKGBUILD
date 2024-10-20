# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=sbctl
pkgver=0.16
pkgrel=1
pkgdesc="Secure Boot key manager"
arch=("x86_64" "aarch64")
url="https://github.com/Foxboron/sbctl"
license=("MIT")
depends=("binutils" "util-linux")
makedepends=("go" "git" "asciidoc")
source=("https://github.com/Foxboron/sbctl/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=("C100346676634E80C940FB9E9C02FF419FECBE16")
sha256sums=('528f852285cea2c96175db8872aa83427f5e200e2d09ea9383037432d45965be'
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
