# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.3
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
sha512sums=('4202893d0786ba57a77c2717eb5db7ce22c4f9c6c920b2ce7758110c5864e7d4c3978cae7926aa043b0c258faa41986918366fa887389815c5c3dab79a73bc94')
b2sums=('922f660daffde9f61cfebaef543b34ef4673b5b654b5e7e42e2f0e0871095841bac0ae83cb39f5cb83b69f5b8f975cec8279aaf079074d68eafde37e2e6ffb19')

build(){
  cd "$pkgname/psycopg"

  python -m build --wheel --no-isolation
}

package(){
  cd "$pkgname/psycopg"

  python -m installer --destdir="$pkgdir" dist/*.whl 
}
