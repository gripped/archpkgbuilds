# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.63.1
pkgrel=5
pkgdesc="JIT compiler that translates a subset of Python and NumPy code into fast machine code"
url="https://numba.pydata.org/"
arch=(x86_64)
license=(BSD)
depends=(
  gcc-libs
  glibc
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
source=(git+https://github.com/numba/numba#tag=$pkgver
        numpy-2.4.patch)
sha256sums=('55b7c20aaa5a3ce79d7011312c7a657c81477d75d110d154ba1be32fe94df07e'
            'ee0195be5d22683f1546ccd8aac2cb9232e5cc96f9c210f0590dd666701d212a')

prepare() {
  patch -d numba -p1 < numpy-2.4.patch
}

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
