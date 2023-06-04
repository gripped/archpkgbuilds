# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: K900 <k0009000@gmail.com>

pkgname=steam
pkgver=1.0.0.78
pkgrel=1
pkgdesc="Valve's digital software delivery system"
url='https://steampowered.com/'
arch=('x86_64')
license=('custom')
depends=('bash' 'desktop-file-utils' 'diffutils' 'hicolor-icon-theme' 'curl' 'dbus'
         'freetype2' 'gdk-pixbuf2' 'ttf-font' 'zenity' 'lsb-release' 'nss' 'usbutils'
         'xorg-xrandr' 'vulkan-driver' 'vulkan-icd-loader' 'lsof' 'python')
depends_x86_64=('lib32-libgl' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxss'
                'lib32-alsa-plugins' 'lib32-libgpg-error'
                'lib32-nss' 'lib32-vulkan-driver' 'lib32-vulkan-icd-loader')
optdepends=('steam-native-runtime: steam native runtime support')
source=(https://repo.steampowered.com/${pkgname}/pool/${pkgname}/s/${pkgname}/${pkgname}_${pkgver}{.tar.gz,.dsc}
        steam-runtime.sh)
sha512sums=('3cebb97bff58d8b6a9aa7e7127873a2290056db107c3a02a2c8e030b9ce3ef9ceb94c2f81eb7fb423b9afce50244646bbc0707d515217d1c5455ba8aa05562ca'
            'de653b037717dc457aacf8f683bde7ac4542ced90d53349a8140bcda8d0f990a914d56655b73013f465e1fd41ad10a5330ef764087740b6dad55cd7ca5a41cbf'
            '5e75c019e9fe8c67d686c4e3343dac1180a69a4bdb7d39b333415c63201eef9b98da5619dbf6fd8daa6884e65bc7f8afc9e52778682425e5a75987d527eae6f0')
b2sums=('f84598cc8ff4f38057c21271288d8c9b6106da3e5256d14191079272009b493e9ec51da80483e8767706ad4670b59e9f727285ea3c4c2a340f3230b9938492ea'
        '6fbc9f8128fb98cf5bc764a28da490241f329d276c47712cf9ac99afab2457e5b851c2e078f50f85e400a350675a38defb1f87a7b858a80efd017629659abf7b'
        'c6bac99336b7c30fec7cdbaf9e949555c687dd9dff50bcae136134d6314f4b841f5fc66ddb2caac1b003690b926fd4afbdc11da143b4674db4b75f27709fdd23')
validpgpkeys=('BA1816EF8E75005FCF5E27A1F24AEA9FB05498B7') # linux@steampowered.com

prepare() {
  cd ${pkgname}-launcher
  # apply roundups for udev rules
  sed -r 's|("0666")|"0660", TAG+="uaccess"|g' -i subprojects/steam-devices/60-steam-input.rules
  sed -r 's|("misc")|\1, OPTIONS+="static_node=uinput"|g' -i subprojects/steam-devices/60-steam-input.rules
  sed -r 's|(, TAG\+="uaccess")|, MODE="0660"\1|g' -i subprojects/steam-devices/60-steam-vr.rules

  # separated runtime/native desktop files
  sed -r 's|(Name=Steam)|\1 (Runtime)|' -i steam.desktop
  sed -r 's|(/usr/bin/steam)|\1-runtime|' -i steam.desktop
}

package() {
  cd ${pkgname}-launcher
  make DESTDIR="${pkgdir}" install

  install -Dm 755 "${srcdir}/steam-runtime.sh" "${pkgdir}/usr/bin/steam-runtime"
  install -d "${pkgdir}/usr/lib/steam"
  mv "${pkgdir}/usr/bin/steam" "${pkgdir}/usr/lib/steam/steam"
  ln -sf /usr/bin/steam-runtime "${pkgdir}/usr/bin/steam"

  install -Dm 644 COPYING steam_subscriber_agreement.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 debian/changelog -t "${pkgdir}/usr/share/doc/${pkgname}"

  # blank steamdeps because apt-get
  ln -sf /usr/bin/true "${pkgdir}/usr/bin/steamdeps"

  install -Dm 644 subprojects/steam-devices/60-steam-input.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-steam-input.rules"
  install -Dm 644 subprojects/steam-devices/60-steam-vr.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-steam-vr.rules"
}

# vim: ts=2 sw=2 et:
