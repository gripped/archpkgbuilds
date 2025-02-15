# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Platon Pronko <platon7pronko@gmail.com>

pkgname=python-lsp-server
pkgver=1.12.2
pkgrel=1
pkgdesc="Fork of the python-language-server project, maintained by the Spyder IDE team and the community"
arch=(any)
url="https://github.com/python-lsp/python-lsp-server"
license=(MIT)
depends=(python-jedi python-lsp-jsonrpc python-pluggy python-ujson python-websockets python-docstring-to-markdown)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
optdepends=(
    'python-mccabe: complexity checking'
    'python-pycodestyle: linter - style checking'
    'python-pydocstyle: linter - docstring style checking'
    'python-pyflakes: linter to detect various errors'
    'python-pylint: code linting'
    'python-rope: for completions and renaming'
    'autopep8: code formatting'
    'flake8: error checking'
    'yapf: code formatting (preferred)'
    'python-whatthepatch: required for yapf support'
)
checkdepends=(
    python-pytest
    python-flaky
    python-mccabe
    python-pycodestyle
    python-pydocstyle
    python-pyflakes
    python-pylint
    python-rope
    autopep8
    flake8
    yapf
    python-whatthepatch
    python-matplotlib
    python-numpy
    python-pandas
    python-pyqt5
    python-appdirs
)
source=(https://github.com/python-lsp/python-lsp-server/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6619b497fc7cbdd92558827757c6443b7a7e98d57853e943b312aa0121835e19')

prepare() {
  cd ${pkgname}-${pkgver}
  sed 's|jedi>=0.17.2,<0.19.0|jedi>=0.17.2,<0.20.0|' -i pyproject.toml
  sed 's|autopep8>=1.6.0,<1.7.0|autopep8>=1.6.0|' -i pyproject.toml
  sed 's|flake8>=6.1.0,<7|flake8>=6.1.0|' -i pyproject.toml
  sed 's|mccabe>=0.7.0,<0.8.0|mccabe>=0.7.0|' -i pyproject.toml
  sed 's|pycodestyle>=2.11.0,<2.12.0|pycodestyle>=2.11.0|' -i pyproject.toml
  sed 's|pyflakes>=3.1.0,<3.2.0|pyflakes>=3.1.0|' -i pyproject.toml
  sed 's|yapf<=0.32.0|yapf>=0.33.0|' -i pyproject.toml

  # https://github.com/python-lsp/python-lsp-server/issues/605
  sed -i 's/DEBUG/INFO/' test/conftest.py
}

build() {
  cd ${pkgname}-${pkgver}
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build -wn
}

check() {
  cd ${pkgname}-${pkgver}
  # Disable coverage
  sed -i '/--cov/d' pyproject.toml
  # https://github.com/python-lsp/python-lsp-server/issues/602
  pytest -vv --color=yes -k 'not test_jedi_completion_with_fuzzy_enabled'
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer -d="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
