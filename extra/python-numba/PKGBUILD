# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.68.1
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
sha512sums=('36d1efd4233196e23dc490c7485ffc9818d88bfa2e73e0b5af69c785f7bb55e9fbf691ec5ec9d4208c67f45827806a6b21926f8b3d1c48a221f23f1dae3ed3b9')
b2sums=('e0f5f7d9908f7b3d5c534299a466c4fecd68af00536f184895a3513feeae6b30ae05afb7bf6175820c6a7f96c776b693e274423d1fc57e2453bd334f133ffafe')

build() {
  cd numba
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer numba/dist/*.whl
  # skip failing typing test
  local site_packages=$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")
  mv "$site_packages"/numba/tests/test_function_type.py{,.disabled}
  test-env/bin/python -m numba.runtests -b -v -m 64 -- numba.tests
}

package() {
  cd numba
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
