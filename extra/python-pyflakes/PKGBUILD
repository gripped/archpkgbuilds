# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Tianjiao Yin <ytj000+AUR@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: TDY <tdy@gmx.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgname=python-pyflakes
pkgver=4.1.0
pkgrel=1
pkgdesc='A lint-like tool for Python to identify common errors quickly without executing code'
arch=('any')
url='https://github.com/PyCQA/pyflakes'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('691fde67fd3ddd67ecc0a7ddfeda1be86726a568378df443883947a84519998a7e10e7c2a2912412305c83db2476a324d3a9b7b2e5906041205866c527e93adf')

build() {
  cd pyflakes-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyflakes-$pkgver
  # Disable failing test with Python 3.13 https://github.com/PyCQA/pyflakes/issues/812
  sed -i 's/test_errors_syntax/xtest_errors_syntax/' pyflakes/test/test_api.py
  python -m unittest discover pyflakes
}

package() {
  cd pyflakes-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # We have python 3 as default python, and want to keep compatibility with the old pyflakes3k naming
  ln -s pyflakes "$pkgdir/usr/bin/pyflakes3k"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
