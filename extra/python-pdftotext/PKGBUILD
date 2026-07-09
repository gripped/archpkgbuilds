# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=python-pdftotext
_name=${pkgname#python-}
pkgver=2.2.2
pkgrel=12
pkgdesc='Simple PDF text extraction'
arch=('x86_64')
url=https://github.com/jalan/pdftotext
license=('MIT')
depends=('poppler' 'python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('f7e6735e37b9b0395ed6fd50b7138903a7d1120049d6bc0c7f1511acbd0c9150c82aaf704e37b92d85504ec4c532c1829de1d3a4d774b94846b7c69f4fa32f13')

prepare() {
  cd "$_name"
  # Stop using the deprecated pkg_resources
  git cherry-pick -n a48f24f5fdbe3877e13ebca66ed002cabb4b5968
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover
}

package() {
  depends+=(
    glibc
    libgcc libgcc_s.so
    libstdc++ libstdc++.so
  )

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
