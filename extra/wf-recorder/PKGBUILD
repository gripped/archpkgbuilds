# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Lennard Hofmann

pkgname=wf-recorder
pkgver=0.5.0
pkgrel=4
pkgdesc="Screen recorder for wlroots-based compositors such as sway"
arch=("x86_64")
url="https://github.com/ammen99/wf-recorder"
license=('MIT')
depends=(
	'libavcodec.so'
	'libavdevice.so'
	'libavfilter.so'
	'libavformat.so'
	'libavutil.so'
	'libpulse.so'
	'libpulse-simple.so'
	'libswresample.so'
	'libwayland-client.so'
)
makedepends=(
	'meson'
	'wayland-protocols'
)
optdepends=(
	'slurp: Select a region to record'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/ammen99/wf-recorder/archive/v$pkgver.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/ammen99/wf-recorder/pull/279.patch"
	"ffmpeg-8-hotfix.patch"
)
sha256sums=('b9168bfdf41995bce2cfed5487e3ca8f2e75a5661b92cebea086a3468d20d87c'
            '48a09fd3b6012f0dae8901aeeff38865e324701037c07543e9a888b34eb0d9f1'
            '666885683138bbc327c9b664029db3587962df56ed25560cec9c6fd623fc1bf6')

prepare() {
	cd "$pkgname-$pkgver"
	# The frame_rate variable has been made private.
	# https://github.com/ammen99/wf-recorder/pull/279
	patch -p1 < ../279.patch
	patch -p1 < ../ffmpeg-8-hotfix.patch
}

build() {
	meson "$pkgname-$pkgver" build \
		-Dpulse=enabled \
		--prefix=/usr \
		--buildtype=plain
	ninja -C build
}

package() {
	DESTDIR="$pkgdir/" ninja -C build install
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
