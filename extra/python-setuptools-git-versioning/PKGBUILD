# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgname=python-setuptools-git-versioning
_pkgname=setuptools_git_versioning
pkgver=3.2.1
pkgrel=1
pkgdesc='Use Git repo data for building a version number according to PEP 440.'
url='https://github.com/dolfinus/setuptools-git-versioning'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.io/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8cccd352642ed6435da35b8edaf56a2f764f061ef2edaf3ae6602806acc7105f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
