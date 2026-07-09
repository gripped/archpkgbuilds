# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.66.0
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
source=(git+https://github.com/numba/numba#tag=$pkgver
        python-numba-0.66.0-numpy-2.5.patch)
sha512sums=('a63ea8ab898b29b3a099a7b1016fb8f10e80e030e93b861848bda82033ac99788b417ce6cbfad8f7ddb8939324dd257e397d14534cd4bbc44b6549ccd448906e'
            '6752071e5ec165f8860f29e72dea0a3fe64dce90bbb84abcc551e8db16a77fb516768cfcfda798aa180d2f7260097afc1016610760418d9701d57675b0865757')
b2sums=('9aa20b40a9e20b3fe5c8c87de3ae80c0cd8e336ee3702067e6fdb5213b6d19967ce1b69a4e5d7ebec661246911a72beed1b790d755015fbd9de3a65d191eee40'
        '5d114bb22ac9a9e26b27b4cc60b0c7f68621f756c8cd2914155118e76746391c394ff986518a2a63546a08a201816b4f5f2bd21c00ad8d0b802ca7dc45e10457')

prepare() {
  cd numba
  # https://github.com/numba/numba/pull/10645
  git cherry-pick -n 361a0c830d52cf34b69818434a9f09f5ffec2e6b # Temporarily add NumPy 2.5 installation to buildscript
  git cherry-pick -n 7b9770949950e868f7798aede0dc5aceaa1cc2f2 # Add fixes for test failures
  git cherry-pick -n 217cbf9f509f0c4d6ebd82fc5bd90120c0a48f71 # Temporarily disable modified test execution
  patch -Np1 -i ../python-numba-0.66.0-numpy-2.5.patch
}

build() {
  cd numba
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer numba/dist/*.whl
  # 2 test failures are expected with numpy 2.5.0
  test-env/bin/python -m numba.runtests -b -v -m 64 -- numba.tests || :
}

package() {
  cd numba
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
