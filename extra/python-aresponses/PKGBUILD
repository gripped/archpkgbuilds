# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aresponses
pkgver=3.0.0
pkgrel=5
pkgdesc="Asyncio http mocking. Similar to the responses library used for 'requests'"
url="https://github.com/aresponses/aresponses"
license=('MIT')
arch=('any')
depends=('python-aiohttp' 'python-pytest-asyncio')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/aresponses/aresponses/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-85.patch::https://patch-diff.githubusercontent.com/raw/aresponses/aresponses/pull/85.patch")
sha512sums=('92788bf7ba469cac7ef6f22b7a49cb5880ed48b975b3dc16362638fd7c80c8401600e53fc36ad0c1507c0be734f3a46547b320762b7b2c77bf900729da53642d'
            '1c7e707c588a12baa2de7e9aa54ff8dae13cd233b595de285da3e1384b8bc843d43254c5bd7f5c5519f58a0d6829d94627d4a3492fc1ca84d82d8e895b10c56d')

prepare() {
  cd aresponses-$pkgver
  # Replace remaining uses of event_loop fixture
  # https://github.com/aresponses/aresponses/pull/85
  patch -p1 < ../$pkgname-85.patch
}

build() {
  cd aresponses-$pkgver
  python setup.py build
}

check() {
  local pytest_options=(
    # skip tests failing due to internal server error
    --deselect tests/test_server.py::test_foo
    --deselect tests/test_server.py::test_passthrough
  )
  cd aresponses-$pkgver
  python -m pytest "${pytest_options[@]}"
}

package() {
  cd aresponses-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
