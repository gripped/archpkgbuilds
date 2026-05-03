# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-curl_cffi
pkgver=0.15.0
_curl_version=curl-8_15_0
_curl_impersonate_version=1.5.6
pkgrel=3
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
sha512sums=('45bfa608aff9c7e0942b51fed667de54d93cf020ecab20a09e32e2f9804357b4c14e4a2e364e64433c25d79d9cb20e1b9551706a6d7e6949a222599a7b1257ea'
            'd4a560e225d0110133f44ed57cf5394c1710530c5fec395d02baafaac9ea2186dd543047ae27fd7542894b8744070760516ae611602105b1b40605abbf84e684'
            '6b625c1eb73c98d8afecd40b19c61ca956c3c3ed2a5e9c720ea86da42380713a2e3ad7e2383f3b52fe100e3543004de4e85d29ca6c9c9370eba33f52fe34c6b7'
            '9f93f0d82c04f893d8bfb8b2f0dae17bdcb693547ffa96ccb12caf5ca7d52829e43d39bd69660bff8e30098d5bf02d483599f9335f589a851df4531e55c41c50'
            '69870e43c464c094721e766c415e4390cc8d53034dfb79a56332482268d8d37041f1a8a7fa73547ae39f2ac0fe161f12ca237767be8eac6e58e5d8317ff156e6')
b2sums=('8571440cb17c7a9538f93dd1d1dd556744f423730be65075e067a9a82fdf7ead4a52d92de2be783a316036c9b42b74e2224e7848be6d9d03723d33cd64b412a7'
        '5f2d2e5f498495744e3b28ea375596f3e4213f32b5eb45ea9942c0339ad1541d0d98b1d4a774bfa4ce431fe23d81f860f4c150f325610d61286f2aea0a93f770'
        '8ecce88b86e4d8a8e01d143e69a028cbe1c8beca299c00f29b35aa257eda58c31da7108f245e4f1137816ddfc04d956643962bc0231556e03fe1681cdb38f819'
        '451d090fefacd41e4946defd36cf5dffc8ee35d375ae004a17bdf08b37188606cfe0cfd7a861eacd9019d68e625bfb06d90cfca5b4def205d6e36615a5600fbe'
        '71e7af7132f2db4c1e026a0b24dd601ade2300aef5c7a71f2a66e5215b32a2c87f277ef27f32ce65bc1d5a8fd0aa0993e3845ca89b07d3feb11fcab855cf899b')

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
