# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=1.13.0
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
checkdepends=('python-hypothesis'
              'python-pytest')
source=(git+https://github.com/sympy/sympy#tag=sympy-$pkgver)
sha512sums=('298c8e049a23adcb5151f51ecc12b174f0f01c2b8637be56728f10afa158e1a12fab993bad092636676a28401f92267b1aeabb9329f6ea51a921916133e4781b')

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
