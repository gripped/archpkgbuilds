# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=fastfetch
pkgver=2.23.0
pkgrel=1
pkgdesc="An actively maintained, feature-rich and performance oriented, neofetch like system information tool"
arch=('x86_64')
url="https://github.com/fastfetch-cli/fastfetch"
license=('MIT')
depends=('glibc' 'yyjson')
makedepends=(
  'chafa'
  'cmake'
  'dbus'
  'dconf'
  'ddcutil'
  'directx-headers'
  'imagemagick'
  'libpulse'
  'libxcb'
  'libxrandr'
  'mesa'
  'ocl-icd'
  'opencl-headers'
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
  'libelf: st term font detection and fast path of systemd version detection'
  'libpulse: Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'hwdata: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
  'libdrm: Displays detection'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3c92dd2cb15faf55d87846eda8d14456af2d0e0938998434144074c695c57529')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='RelWithDebInfo' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DBUILD_TESTS='ON' \
		-DENABLE_SQLITE3='OFF' \
		-DENABLE_RPM='OFF' \
		-DENABLE_IMAGEMAGICK6='OFF' \
		-DENABLE_SYSTEM_YYJSON='ON' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
