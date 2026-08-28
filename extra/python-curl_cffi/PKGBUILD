# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-curl_cffi
pkgver=0.16.2
_curl_version=curl-8_21_0
_curl_impersonate_version=2.1.1
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
sha512sums=('40314b3c830fdef105b50925204ef9391696d7b7aacc29b8988457cca0c897f7967531cb6c9a12c6e4aec6bec03323e0f5e770c963e13c3dfdb8f2d8102024a2'
            '0ab6c99c3d5b86fb65c526db517c3159b11db2f8d82552d635c4887059c0602288603c93b754ce0ec543ea2f275122ccec2c8dcd866c2611b5b949c728ee72df'
            '7958583a2f8cc26d0baae3ee19f6b9caa5e6082954ccf32e0cf748d4315980a1e2f015430901eebaf638bbb6173a8f9b6bf4ca4d0cf7c6499635b01d383130ea'
            '26e200b8d2acb83a5a401c9fd2103a81a700622191d201283f9082fdcd0f0d885fb912e9ebd00684a3f934b74deff02be8937724ae6024345894df3f2297153c'
            '21a6ce184ef841a5da687fc24d89a400b0d21792488a45324b30c9221cd586dcc9283fb19f6b5f6be87d178f7a82bf29e2d3ddd0ec31b553423cbf2f578d50a5')
b2sums=('81251206060a0a290b08a25092a6467dc5b23ec8b026d65d71c93b5933f7f58f8f4cb31f6bd8a5f97dfd1cfa2f054427f7e9e054a8599e3cfa9bbe6a0b80d191'
        '3e4df97e213a5aa56ef144cdfd085ea51b2902cf09d6006315e8036156eded548814a43983cd2eea9a653d635219675a8223682f2c98ce4379a8d6f5cd14f63c'
        '22e97da18a957f6a8f483ce6cd33648e9792f775bb63c6164304944eb68ceb430b6187db7bf896c1502996c59a35cfd00752a5bcdbaa53782da4e484cbdfc064'
        'e44a4c76dfe9bd53e77654d1b6c38b848513f561ee57f034b0296cb6b54ef7a8ee67b0c7487dff26d65b64ffff7fcf436a033d4e6adfc20abeb0226e09f32d92'
        'f3d191c5420049e9638816a1ff37d08bcc94171d742ce3f476f8c4720fb73fc62f40874d0e0a6212d5f2784c90cb08fd5bded5b6c8389948b84bdf12eb58886c')

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
