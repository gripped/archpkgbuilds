# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python-tornado
pkgver=6.5.4
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
sha512sums=('b449fbfeac5faba43a6024ddfd9ff6f9b543f1236e935e0bb54ffac7f2039d2b5aee10abe501633d1912f515e491d49ddfc9fd03be3aa76f0d39c2a974bbff1c')

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
