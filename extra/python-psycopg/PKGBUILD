# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.5
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=('any')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=(
  'python'
  'python-typing_extensions' # remove once we get python 3.13
  'postgresql-libs'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver")
sha512sums=('d40a8474b14f4118389a2119f77f3823ffe083f18d1941e568eeb8f27f97fe2924c1b1b3ef51898472fa3cdf3ec1e3bacec85c11377fd6d7e5a93fc1ce0d3db7')
b2sums=('29fb09e9a79db3e6abdc3ecb8db7e58a342ba96c1c54cea6e65ea1ca1e146653c10280a80b147613ccdaf8d328b831e77b62e2dd548138302dd5d0bdafa9db06')

build(){
  cd "$pkgname/psycopg"

  python -m build --wheel --no-isolation
}

package(){
  cd "$pkgname/psycopg"

  python -m installer --destdir="$pkgdir" dist/*.whl 
}
