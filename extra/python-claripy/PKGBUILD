# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.2.160
pkgrel=2
pkgdesc='Abstraction layer for constraint solvers'
url='https://github.com/angr/claripy'
license=('custom:BSD2')
arch=('any')
depends=(
  'python'
  'python-cachetools'
  'python-decorator'
  'python-pysmt'
  'python-typing_extensions'
  'python-z3-solver'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7bb1a6b3c50fb9cc2d0e7b9174ef06f5eb119cb2fedcb9fc7482177022953160ff1837e23a28f70910b62ab2185e7c96e7d2ab8d2afbf72e21778220da7a6249')
b2sums=('7060d03e881a3b65bc53b0b220067e9ede5d08c380af6ac8bf54e6664d7d7914397994f3472866b1973f570241231253eecedcd55122f7b524e2aafa7fa92b7a')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests: https://github.com/angr/claripy/issues/348
    --deselect tests/test_solver.py::StandardTests::test_simplification_annotations
    --deselect tests/test_solver.py::TestSolver::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolver::test_solver_without_reuse
    --deselect tests/test_solver.py::TestSolverReplacement::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolverReplacement::test_solver_without_reuse
    --deselect tests/test_solver.py::TestHybrid::test_solver_with_reuse
    --deselect tests/test_solver.py::TestHybrid::test_solver_without_reuse
    --deselect tests/test_solver.py::TestComposite::test_solver_with_reuse
    --deselect tests/test_solver.py::TestComposite::test_solver_without_reuse
    --deselect tests/test_solver.py::TestSolverCacheless::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolverCacheless::test_solver_without_reuse
  )

  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest "${pytest_options[@]}"
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
