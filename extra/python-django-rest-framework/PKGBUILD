# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-rest-framework
_name="${pkgname#python-}"
pkgver=3.15.2
pkgrel=4
pkgdesc="A powerful and flexible toolkit for building Web APIs."
arch=(any)
url="https://www.django-rest-framework.org/"
_url="https://github.com/encode/django-rest-framework"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-pytz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-django-filter: for dynamic queryset filters'
  'python-django-guardian: for a per-object permission model'
  'python-markdown: for markdown support'
  'python-psycopg2: for PostgreSQL support'
  'python-pygments: for syntax highlighting'
  'python-yaml: for YAML support'
)
source=(
  $_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz
  $_name-3.15.2-accept-integers.patch::$_url/commit/125ad42eb3922cd5ce1f4b332c91baf6d6162fb3.patch
  $_name-3.15.2-django5.1-support.patch::$_url/commit/2ede857de0bbcc8863fadd6acdb1f8d5570d87dc.patch
)
sha512sums=('a24322fb09398ee1608900ae623d8ba44c3cb066fc7921e38f847a93513d3ca549d933da6cfc045a556edfe50dae3431b6782d0241a9f53ac3dbc0caf48fa520'
            '9b130d0938dddbc8c83eb77e1189400d9e5d91df8fa4b9a78f7614411ea710415a363f89792fa92121d3fe112d3d61479d9e43b7611194fe992ba530496962fe'
            '52b3b5b053be764840cc4082420b89d12497d0beb6b3a4dee53c8b03cf6ce1b45cca25e465c2ef43f17eeaa090ff202b74c925171a6a5facbaf4792ebab64707')
b2sums=('588aebbdd89f749bacd4244707f6b4b0e2a6aef0759973e5451ebcc4acb4d2e1c2d9773ab576e33442f5123ce860cae087622a26d1d208edc70df04057c4d401'
        'a43aa9df5f4c4a47aaf77508bee10ecb5332ee7c8c3105066e970601d5d49f7f0d6780c43c5bda5acb233ce22a3d1784e69cd40a434a77f5afe54a0965b49853'
        '9859b64d3c03d3f518c7bfdc7c77737e13dc7ab435c0a0752a2681364f49d7a31787acfe646200d0360053cb39a63cc1967c4e4d042e58d9a2b3b4c6b102aef2')

prepare() {
  # add fixes/improvements for django 5 support
  patch -Np1 -d $_name-$pkgver -i ../$_name-3.15.2-accept-integers.patch
  patch -Np1 -d $_name-$pkgver -i ../$_name-3.15.2-django5.1-support.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""
    -o filterwarnings=""
    --deselect tests/test_fields.py::TestPytzNaiveDayLightSavingTimeTimeZoneDateTimeField::test_invalid_inputs
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
