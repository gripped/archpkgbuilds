# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python-tornado
pkgver=6.6.1
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache-2.0')
depends=('glibc' 'python')
optdepends=('python-pycurl: for tornado.curl_httpclient'
            'python-twisted: for tornado.platform.twisted')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
# Deprecated CaresResolver requires pycares 4 and will not support Arch's pycares 5.
# https://github.com/tornadoweb/tornado/blob/v6.6.0/docs/caresresolver.rst
checkdepends=('python-hypothesis' 'python-pycurl' 'python-twisted')
source=("git+https://github.com/tornadoweb/tornado.git#tag=v$pkgver")
sha512sums=('8db0d62d4f3f6daddeeb5c9ba8db7a18c37b9025609b9cfa71414b728f9e9c2361231f1a5a658a6bbebbb5a36b986af543b10aa30efc99a9a018aba88529911d')

export TORNADO_EXTENSION=1

build() {
  cd tornado
  python -m build --wheel --no-isolation
}

check() {
  cd tornado
  python -m venv --system-site-packages --without-pip "$srcdir/venv"
  "$srcdir/venv/bin/python" -m installer dist/*.whl
  cd "$srcdir"
  "$srcdir/venv/bin/python" -bb -m tornado.test
  "$srcdir/venv/bin/python" -O -m tornado.test
  "$srcdir/venv/bin/python" -m tornado.test --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
  "$srcdir/venv/bin/python" -m tornado.test --resolver=tornado.netutil.ThreadedResolver
}

package() {
  cd tornado
  python -m installer --destdir="$pkgdir" dist/*.whl
}
