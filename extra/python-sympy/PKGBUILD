# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=1.13.2
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
sha512sums=('cb6da14e073a9e277ca633a7e5f82545f08a5b8ebf981e46e55fc9d6056efa2f6e71dde93184f6222ca1b936408530add44c656b007fd095833e5612cc6b4232')

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
