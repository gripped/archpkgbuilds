# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=10.1.3
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=(
  'python'
  'python-aioquic'
  'python-asgiref'
  'python-blinker'
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
  'python-protobuf'
  'python-psutil'
  'python-publicsuffix2'
  'python-pylsqpack'
  'python-pyopenssl'
  'python-pyparsing'
  'python-pyperclip'
  'python-requests'
  'python-ruamel-yaml'
  'python-sortedcontainers'
  'python-tornado'
  'python-typing_extensions'
  'python-urwid'
  'python-werkzeug'
  'python-wsproto'
  'python-zstandard'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=(
  'python-asynctest'
  'python-hypothesis'
  'python-parver'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-runner'
  'python-pytest-timeout'
  'python-tox-current-env'
)
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("https://github.com/mitmproxy/mitmproxy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f399de886cf193e053b9535f5b529675b43382023d4f8c41010980d9e50245c')
b2sums=('6b978d7a0643b04e7988d93a9b334ff62255b897cc3b7dd2a4205e1fa1ecda6c1f6341c89b6097bebaeb79d45e7e30974c9c3d674327837c2dd5aecfd7f4c733')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" tox -e py --current-env
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
