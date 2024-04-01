# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=fastfetch
pkgver=2.8.10
pkgrel=2
pkgdesc="Like Neofetch, but much faster because written in C"
arch=('x86_64')
url="https://github.com/fastfetch-cli/fastfetch"
license=('MIT')
depends=('glibc')
makedepends=(
  'chafa'
  'cmake'
  'dbus'
  'dconf'
  'ddcutil'
  'directx-headers'
  'imagemagick'
  'libnm'
  'libpulse'
  'libxcb'
  'libxrandr'
  'mesa'
  'ocl-icd'
  'opencl-headers'
  'pciutils'
  'vulkan-headers'
  'vulkan-icd-loader'
  'wayland'
  'xfconf'
  'zlib'
)
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'ddcutil: Brightness detection of external displays'
  'directx-headers: GPU detection in WSL'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Wifi detection'
  'libpulse: Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'pciutils: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
  'libdrm: Displays detection'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e3ea8388d79cc02ed1a6e45b8e5fec4068507ca03923386bdc9a7b3ff02d2a52')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE='RelWithDebInfo' \
		-DBUILD_TESTS='ON' \
		-DENABLE_SQLITE3='OFF' \
		-DENABLE_RPM='OFF' \
		-DENABLE_IMAGEMAGICK6='OFF' \
		-DENABLE_DDCUTIL='ON' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
