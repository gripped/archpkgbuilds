# Maintainer: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20231030
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=(any)
url='https://github.com/M0Rf30/android-udev-rules'
license=(GPL3)
depends=(udev libmtp)
source=(android-udev-$pkgver.zip::https://github.com/M0Rf30/android-udev-rules/archive/$pkgver.zip)
sha1sums=('fdc8732c78003cdd83ef1f40acfcdbbecae5be3b')
sha256sums=('269b737c5596977983a4c0d25333a421788f318c4d5046713e8f42b9c827cbf3')

package() {
  cd android-udev-rules-$pkgver
  install -Dm 644 51-android.rules "$pkgdir"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf "$pkgdir"/usr/lib/sysusers.d/android-udev.conf
}
