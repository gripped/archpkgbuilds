# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.60.0
pkgrel=2
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
sha256sums=('2ee47f97464e36b6118fd9c6b57db901930b8b9d5294a7dfcddbd5a8b2b05873')

prepare() {
  cd numba
# Allow numpy 2.1
  git revert -n a27405dd3048b506b8eaabda624c4c342fb9038c \
                eb0d620c8e4f0dfb08df66ce051c66a2c4b556b4
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
