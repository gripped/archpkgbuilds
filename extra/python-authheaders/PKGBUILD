# Maintainer: David Runge <dvzrv@archlinux.org>

_name=authheaders
pkgname=python-authheaders
pkgver=0.16.1
# last updated as per https://www.psddmarc.org/registry.html
_version=2023.09.02
pkgrel=1
pkgdesc="Library for the generation of email authentication headers"
arch=(any)
url="https://github.com/ValiMail/authentication-headers"
license=(
  MPL-2.0
  ZPL-2.1
  Zlib
)
depends=(
  publicsuffix-list
  python
  python-authres
  python-dkim
  python-dnspython
  python-publicsuffix2
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  $url/releases/download/$pkgver/$_name-$pkgver.tar.gz{,.asc}
  psddmarc-$_version.csv::https://www.psddmarc.org/psddmarc-participants.csv
)
sha512sums=('03121dae439a02c4016a25f4cc21d0b5ec4fec3f8cb9bdcc440bf4bdeaed0dbc3165202c6a2bd2a00e29be2f532cd21ba271d89eda24f51762d8ac40a4b74ba7'
            'SKIP'
            'cf1cc1de56aa41b88b5030b3589613dc9ae245d32ed3eca2434686ecf06be1ebb6a3682d98e4e10b8587dba507b3d24025606ad3b85920ca6f3855e579dc9367')
b2sums=('e0f07ee20174d08dcfdb03962df0151740f333f9f50432c3c9eb30ac7b64489dbeae87538a3b68a279547c7129143e439d0b48e64b11f14e233625e3d209144a'
        'SKIP'
        'df8b6d4a1e6a9233964cefdeb54d14397764a31f83e3edc6383ed38bc4ad332f9ea4464dbed03151fc29fa4e31a1c7df086091ff26cefa9a3d7f57d368abab9c')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1') # Donald Scott Kitterman <scott@kitterman.com>

prepare() {
  cd $_name-$pkgver
  # embed psddmarc.csv: https://github.com/ValiMail/authentication-headers/issues/4
  cp -v -- ../psddmarc-$_version.csv $_name/psddmarc.csv
  printf 'location = "/usr/share/publicsuffix/public_suffix_list.dat"\n' > $_name/findpsl.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  local python_stdlib_basepath="$(python -c "from sysconfig import get_path; print(get_path('stdlib'))")"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
