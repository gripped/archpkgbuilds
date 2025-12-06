# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname=python-urllib3
pkgver=2.6.0
pkgrel=1
pkgdesc='HTTP library with thread-safe connection pooling and file post support'
arch=(any)
url='https://github.com/urllib3/urllib3'
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-cffi
  python-cryptography
  python-h2
  python-httpx
  python-idna
  python-pyopenssl
  python-pysocks
  python-pytest
  python-pytest-socket
  python-pytest-timeout
  python-quart
  python-quart-trio
  python-trio
  python-trustme
  # Required for building fork of hypercorn
  python-poetry-core
)
optdepends=(
  'python-brotli: Brotli support'
  'python-brotlicffi: Brotli support'
  'python-h2: HTTP/2 support'
  'python-pysocks: SOCKS support'
  'python-zstandard: Zstandard support'
)
_urllib3_hypercorn_commit=d1719f8c1570cbd8e6a3719ffdb14a4d72880abb
source=(
  "$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "https://github.com/urllib3/hypercorn/archive/$_urllib3_hypercorn_commit/hypercorn-$_urllib3_hypercorn_commit.tar.gz"
)
sha512sums=('83164518af31b6ca1a9dc81564622caf65613a7c28a2c4193fd14984b974d7d2120bdbe25d932061b285b39bcaf17f5839ba66d137a4608d7d2ee9df6e90a394'
            '62d6787d88a2e716f0ac04fc49f6cdc586e473a660ee754ff66961922ae78bcc75d1f78b091e78557dd60f006e8e480114738c7b4ff71beac804e4fc9603240b')
b2sums=('06bd29c4b9564b6e959f1d0fd88e13527d67e9b0a7a4c4e090844ebfb4506cfa69367dff21d7e0124079a132cb712393ca186672b252bdfa5beaf347fbfed45d'
        'fcb5f49653401e6e4079e1c770d3cd407602d4d6764437b735bd4ec04191dec59cdc930822fa2aff726ee25cddd0f71fd457dedf31026bff1da121d93af8b768')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # The test suite depends on upstream's custom fork of hypercorn,
  # https://github.com/urllib3/hypercorn/tree/urllib3-changes, and ~60/1800
  # tests fail with the upstream hypercorn.
  # See the following in dev-requirements.txt:
  #   # https://github.com/pgjones/hypercorn/issues/62
  #   # https://github.com/pgjones/hypercorn/issues/168
  #   # https://github.com/pgjones/hypercorn/issues/169
  #   hypercorn @ git+https://github.com/urllib3/hypercorn@urllib3-changes
  python -m build --wheel --no-isolation ../hypercorn-$_urllib3_hypercorn_commit
  test-env/bin/python -m installer ../hypercorn-$_urllib3_hypercorn_commit/dist/*.whl

  # Deselected tests fail on the following assertion:
  # >   assert type(cm2.value.reason) is SSLError
  # E   assert <class 'urllib3.exceptions.NewConnectionError'> is SSLError
  test-env/bin/python -m pytest \
    --deselect=test/contrib/test_pyopenssl.py::TestSocketSSL::test_ssl_failed_fingerprint_verification \
    --deselect=test/with_dummyserver/test_socketlevel.py::TestSSL::test_ssl_failed_fingerprint_verification \
    -W=ignore::pytest.PytestUnhandledThreadExceptionWarning
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
