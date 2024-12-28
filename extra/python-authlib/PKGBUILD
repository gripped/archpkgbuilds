# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.3.2
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=('any')
url='https://github.com/lepture/authlib'
license=('BSD-3-Clause')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-django'
  'python-requests'
  'python-django'
  'python-flask-sqlalchemy'
  'python-httpx'
  'python-starlette'
  'python-cachelib'
)
source=("$pkgname::git+$url#tag=v$pkgver" "localproxy-test-failure.patch")
sha512sums=('75cf99b3beceb174928308058340b8b1a9cba236776b425afc02589fdcd7bda4a7150b5a1ee47c93d567334f2b71ad2fe2c803350fd143c679a9fb8ddf248f6c'
            '05f446dd3f0ac84878e8ebabc96cabcb24383d10be927e707001b3b321e8b4da37b6c0837e087597e3d6c731c9930e77be1bfede8b852f5911d7e360118b2cfd')
b2sums=('9ecd0008b3856a09272c1dedaccc8606180d2e9e7c29391aebb2ef9d184ba7e497715400ab56f5e150a4fd5f81115b580dac11a3e073fe2854de8a2cc7b7b389'
        'b0949a46839ef8807136446f137491421d703b53f88e1ef5b1387e5ff7098dc75148e702a149678a7e8a3109587f871717f917fe1a54c6e386e01302d4da31df')

prepare() {
  cd "$pkgname"
  patch -Np1 -i ${srcdir}/localproxy-test-failure.patch
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PYTHONPATH="$PWD"
  pytest tests/core -v
  # TODO: Disabled as the tests fail
  pytest tests/flask -v
# https://github.com/lepture/authlib/issues/456
  pytest tests/jose -v -k 'not (test_dir_alg_xc20p or test_xc20p_content_encryption_decryption)'
  export DJANGO_SETTINGS_MODULE=tests.clients.test_django.settings
  pytest tests/clients -v
  export DJANGO_SETTINGS_MODULE=tests.django.settings
  pytest tests/django -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
