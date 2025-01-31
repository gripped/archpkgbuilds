# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.61.0
pkgrel=1
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
source=(git+https://github.com/numba/numba#tag=$pkgver)
sha256sums=('893d8faf62cd5c612d0da8492db3c8a795713e67a734665b4bb4cb87d5ccb80c')

prepare() {
  cd numba
  git revert -n 5e917b96ae7033e994f185cb37329a07e56d51b6 # Drop numpy version constraint
}

build() {
  cd numba
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer numba/dist/*.whl
  test-env/bin/python -m numba.runtests -b -v -m 64 -- numba.tests || true # numpy 1.25 support incomplete
}

package() {
  cd numba
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
