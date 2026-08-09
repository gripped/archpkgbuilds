# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-curl_cffi
pkgver=0.16.0
_curl_version=curl-8_21_0
_curl_impersonate_version=2.0.0
pkgrel=1
pkgdesc='Python FFI binding for curl-impersonate'
arch=(x86_64)
url='https://github.com/lexiforest/curl_cffi'
license=(MIT)
depends=(
  glibc
	"curl-impersonate=${_curl_impersonate_version}"
	python
	python-certifi
	python-cffi
	python-eventlet
	python-gevent
	python-typing_extensions
  python-rich
)
makedepends=(
  git
	python-build
	python-installer
	python-setuptools
	python-wheel
	python-python-multipart
	unzip
)
optdepends=(
  'python-orjson: speed and memory optimized JSON parsing'
  'python-markdownify'
  'python-lxml-html-clean'
  'python-readability-lxml'
)
source=(
	"$pkgname::git+$url#tag=v$pkgver"
  "${_curl_version}.tar.gz::https://github.com/curl/curl/archive/${_curl_version}.tar.gz"
  "curl-impersonate::git+https://github.com/lexiforest/curl-impersonate#tag=v${_curl_impersonate_version}"
	use-system-curl-impersonate.patch
  no-download.patch
)
sha512sums=('23ae22daa98b57c116b99034c15ea06754f6522badf497de0428bd1000bbda06824270aac8e02c1cc06e5eaffd034982aa59796978414e9dbfd4836370d16f76'
            '0ab6c99c3d5b86fb65c526db517c3159b11db2f8d82552d635c4887059c0602288603c93b754ce0ec543ea2f275122ccec2c8dcd866c2611b5b949c728ee72df'
            'a6d89efca3a9903b1e97b260b0b1285f748bff84dc684c51c97cca6cd0a61d4c760e191e30613faed53381027afa98fe2645d18b6b840b8f3c4f63103286d7e7'
            'c2b218b930c9a04ab9be71e9b9df7129809bf5987804197e3262a500a3713bdb3b7cb4d530dddc2b81bb9c246a5347928b43705a720fe77f460e6f82e08c1c8e'
            '5979834b25a5e4a7b4da58f4717fc6ce37f3f0a80cfe1e9446f5c2291f657da14e266d7ed4f9e8e80d0f2032b3f486f29cb4895f742f92d0270931835bfdc2d6')
b2sums=('735397d2106d7a2caaaec907a5f4b5504a40e48021d0819af901ef3bed729e8c2b9ea301ff879220c159230316c737df514176d39a25957eedfd6b79f7103134'
        '3e4df97e213a5aa56ef144cdfd085ea51b2902cf09d6006315e8036156eded548814a43983cd2eea9a653d635219675a8223682f2c98ce4379a8d6f5cd14f63c'
        '07a7bfdc77544638dd622a987d8588d8d897ac974f74ec27bcdf5cedde55f30f3f6226f7320e54d2f43b6812c8f1fc00a024993d040c5aaea359c6c50cf8db34'
        'b61c16660a4bf95db04d987e3ea6fae385cc4fef900b03284f9eeff57710c9c6bc41a14f99f32ae0692e3e8445cab3c901e9329816426a3dfc0f1cbf624e5477'
        'a4f9805d99e1bf0c30554390aab02c77eb3be783ce663c22d512820ea71e7cdbd58fc95420166635a945a9144a11c7ff55fb07995065031acd324b0c344821d7')

prepare() {
  cd "$pkgname"

  # use system curl-impersonate
  patch -p1 -i "$srcdir/use-system-curl-impersonate.patch"

  # shuffle around dependencies to match folder structure expected in Makefile
  mv "$srcdir/curl-${_curl_version}" "${_curl_version}"
  mv "$srcdir/curl-impersonate" "curl-impersonate-${_curl_impersonate_version}"

  # patch Makefile for file verification
  patch -p1 -i "$srcdir/no-download.patch"
  sed \
    -e "s/@CURL_IMPERSONATE_VERSION@/${_curl_impersonate_version}/" \
    -e "s/@CURL_VERSION@/${_curl_version}/" \
    -i Makefile \
    -i scripts/build.py

  make preprocess
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
