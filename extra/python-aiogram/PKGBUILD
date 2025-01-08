# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname=python-aiogram
_pkgname=${pkgname#python-}
pkgver=3.17.0
pkgrel=1
pkgdesc="A modern and fully asynchronous framework for Telegram Bot API"
arch=('any')
url="https://github.com/aiogram/aiogram"
license=('MIT')
depends=(
  'python'
  'python-aiofiles'
  'python-aiohttp'
  'python-certifi'
  'python-magic-filter'
  'python-pydantic'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'pifpaf'
  'python-aiohttp-socks'
  'python-aresponses'
  'python-babel'
  'python-motor'
  'python-pycryptodomex'
  'python-pymongo'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-lazy-fixture'
  'python-pytz'
  'python-redis'
  'redis'
)
optdepends=(
  'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
  'python-ujson: ultra fast JSON encoder and decoder written in pure C'
  'python-rapidjson: extremely fast C++ JSON parser and serialization library'
  'python-emoji: emojize and demojize support'
  'python-redis: Redis storage support'
  'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
  'python-motor: MongoDB storage support'
  'python-babel: i18n support'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0bbfc27945f810895211ab33fc154bb41bdf1c49ab59e0e7f1f73b6b59842d31')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  # shellcheck disable=2016
  pifpaf run redis -- bash -c 'python -m pytest --redis $PIFPAF_REDIS_URL'
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
