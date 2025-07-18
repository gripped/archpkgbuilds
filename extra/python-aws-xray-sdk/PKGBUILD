# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-aws-xray-sdk
_pkgname=aws-xray-sdk-python
pkgver=2.14.0
pkgrel=6
pkgdesc='AWS X-Ray SDK for Python'
arch=(any)
url='https://github.com/aws/aws-xray-sdk-python'
license=('Apache-2.0')
depends=(
  python
  python-botocore
  python-wrapt
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  # Needed by tests/test_local_sampling_benchmark.py
  python-pytest-benchmark
)
source=(
  "git+$url.git#tag=$pkgver"
  "$pkgname-pytest-asyncio-compat.patch"
)
sha256sums=('c9f6b2d52e7a1b4b9cb8471b2dd3719debd9e53d1d390990e33ea42f3287a025'
            'c323fbba14f13f81bb64127411e0bf9e84fbf91420ce03d56fd9acc1fcd87327')

prepare() {
  cd $_pkgname
  patch -Np1 < ../$pkgname-pytest-asyncio-compat.patch
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  # See setenv= in upstream tox.ini
  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id
  # Ignore ext tests, which get broken from time to time with newer dependencies,
  # and result in a dependency cycle that makes rebuilding for newer Python harder
  pytest -v tests --ignore tests/ext -p pytest_asyncio
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
