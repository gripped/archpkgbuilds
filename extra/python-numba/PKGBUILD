# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.65.1
pkgrel=1
pkgdesc='JIT compiler that translates a subset of Python and NumPy code into fast machine code'
arch=(x86_64)
url='https://numba.pydata.org/'
license=(BSD-1-Clause)
depends=(
  glibc
  libgcc
  libgomp
  libstdc++
  python
  python-llvmlite
  python-numpy
)
makedepends=(
  git
  onetbb
  openmp
  python-build
  python-installer
  python-packaging
  python-setuptools
  python-versioneer
  python-wheel
)
optdepends=(
  'onetbb: TBB threading backend'
  'openmp: OpenMP threading backend'
  'python-cffi: use of CFFI bindings in compiled functions'
  'python-colorama: error message highlighting'
  'python-scipy: cython bindings used in np.linalg.* support'
  'python-jinja: “pretty” type annotation output (HTML) via the CLI'
  'python-pyelftools: for code generation'
  'python-pygments: “pretty” type annotation'
  'python-pyyaml: use of a .numba_config.yaml file for storing per project configuration options'
  'python-psutil: for sysinfo'
)
checkdepends=(
  gdb
  ipython
  python-cffi
  python-ipykernel
  python-jinja
  python-pexpect
  python-pip
  python-pygments
  python-pytest
  python-pyyaml
  python-scipy
)
source=(git+https://github.com/numba/numba#tag=$pkgver)
sha512sums=('c85f0529eb7c37e923c8ae81df532fe46f2e322e833b16efd56fc1af841ff45af084603e4b7805303f08dae872ca35bda6e33825ccd4f513331796447dded269')
b2sums=('b5c665ab9cbd5cdc67ba02c44ca206c3b07c42bf0d5bd359456c19315a13559adc83d8dad1221b0e039ad0e272c6f198f6b84ceab910b9287e4e1baeb340be91')

build() {
  cd numba
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer numba/dist/*.whl
  test-env/bin/python -m numba.runtests -b -v -m 64 -- numba.tests
}

package() {
  cd numba
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
