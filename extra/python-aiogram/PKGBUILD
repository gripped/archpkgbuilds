# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname=python-aiogram
pkgver=3.26.0
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
  'python-cryptography'
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
  'valkey'
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
b2sums=('6deae4fe2036918520f723d1b7568c5f3a159accfe526b2cea1d8f2817c665020a6ea02e4367c3402ce7b9d3cf2bd5a3939de85be0f72027241234ec684a331f')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  # shellcheck disable=2016
  pifpaf run redis -- bash -c 'python -m pytest --redis $PIFPAF_REDIS_URL'
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
