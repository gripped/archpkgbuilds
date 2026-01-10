# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-nbval
pkgver=0.11.0
pkgrel=3
pkgdesc="A py.test plugin to validate Jupyter notebooks"
url="https://github.com/computationalmodelling/nbval"
license=('BSD-3-Clause')
arch=('any')
depends=('python-pytest' 'python-jupyter_client' 'jupyter-nbformat' 'python-ipykernel'
         'python-coverage')
makedepends=('python-setuptools' 'python-nbdime')
checkdepends=('python-matplotlib' 'python-pytest' 'python-pytest-mock' 'python-sympy')
optdepends=(
  'python-nbdime: for --nbdime option'
)
source=("https://github.com/computationalmodelling/nbval/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8565f5d3683f202042f927e606e8c28df3ba6341e3efc03c6cd75f25984a4c883df1c3f11d70972de2effd04a1cb48a1f72ebd7eb36bf652d2ab6ab96516ba8c')

build() {
  cd nbval-$pkgver
  python setup.py build
}

check() {
  cd nbval-$pkgver
  python setup.py egg_info

  # https://github.com/computationalmodelling/nbval/blob/0.10.0/dodo.py#L25
  PYTHONPATH="$PWD" pytest -v tests/ --nbval --nbval-current-env --nbval-sanitize-with tests/sanitize_defaults.cfg --ignore tests/ipynb-test-samples --deselect tests/test_coverage.py
}

package() {
  cd nbval-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
