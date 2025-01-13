# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=11.1.0
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=(
  'python'
  'python-aioquic'
  'python-asgiref'
  'python-brotli'
  'python-certifi'
  'python-cryptography'
  'python-flask'
  'python-h11'
  'python-h2'
  'python-hyperframe'
  'python-kaitaistruct'
  'python-ldap3'
  'python-mitmproxy-rs'
  'python-msgpack'
  'python-passlib'
  'python-publicsuffix2'
  'python-pyopenssl'
  'python-pyparsing'
  'python-pyperclip'
  'python-requests'
  'python-ruamel-yaml'
  'python-sortedcontainers'
  'python-tornado'
  'python-urwid'
  'python-wsproto'
  'python-zstandard'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-parver'
  'python-pytest-asyncio'
  'python-pytest-timeout'
)
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("https://github.com/mitmproxy/mitmproxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('13a4805ae83d605c3afa1d159520907423cb5ed61c20f63ed51d485f7b336e24')
b2sums=('e4297e684bad2d018076c8eb3f932a63fd683e59aa015334cae5f16a8e035ca7b262aa23acf9cb39121e65816c84ceb95aa8ad4679f9bcba6d5a38e335e75688')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
