# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python-tornado
pkgver=6.5.6
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache-2.0')
depends=('glibc' 'python')
optdepends=('python-pycurl: for tornado.curl_httpclient'
            'python-twisted: for tornado.platform.twisted')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pycares' 'python-pycurl' 'python-twisted')
source=("git+https://github.com/tornadoweb/tornado.git#tag=v$pkgver")
sha512sums=('1938da97401c385ebcc61252d8f0b58a04f7b1c8973a8a6dfdee357a68d023ce808ae2f631c0fe11d432c2aec3401d9e784a348c0e184f71e627f811c75b4084')

export TORNADO_EXTENSION=1

build() {
  cd tornado
  python -m build --wheel --no-isolation
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado
    python -m installer --destdir=tmp_install dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages:$PYTHONPATH"
    cd tmp_install
    python -m tornado.test.runtests
    python -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python -m tornado.test.runtests --ioloop_time_monotonic
    python -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || echo "Tests failed"
}

package() {
  cd tornado
  python -m installer --destdir="$pkgdir" dist/*.whl
}
