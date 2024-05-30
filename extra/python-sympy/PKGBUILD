# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=1.12.1
pkgrel=1
arch=('any')
pkgdesc='Symbolic manipulation package (Computer Algebra System), written in pure Python'
url='https://sympy.org/en/index.html'
license=('BSD')
depends=('python-mpmath')
optdepends=('ipython: user friendly interface for isympy'
            'python-symengine: optimized backend, set USE_SYMENGINE=1 to use')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=(git+https://github.com/sympy/sympy#tag=sympy-$pkgver)
sha512sums=('b50fd53279273fe818c916c431149c94f3f44a92c57853d8233da213f7a7ddb5add07ce749822b68fe790763a4707f4bbe283ae98aff0d057f8900df194ef8b8')

build() {
  cd sympy
  python -m build --wheel --no-isolation
}

check() {
  cd sympy
  bin/test -v
}

package() {
  cd sympy

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
