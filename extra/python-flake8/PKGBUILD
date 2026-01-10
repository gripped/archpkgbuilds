# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Allen Li <darkfeline at abagofapples.com>

pkgname=python-flake8
pkgver=7.3.0
pkgrel=2
epoch=1
pkgdesc="The modular source code checker: pep8, pyflakes and co"
arch=('any')
url='https://flake8.pycqa.org'
license=('MIT')
depends=(
  'python'
  'python-pyflakes'
  'python-mccabe'
  'python-pycodestyle'
  'python-entrypoints'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
provides=('flake8')
replaces=('flake8')
source=("$pkgname::git+https://github.com/PyCQA/flake8#tag=$pkgver")
sha512sums=('5066ff7bd1381990ab3433f0727a7b5f0c9b75f46c8525d2548f03b0c023ce1a922cd08704d2f0a19823134aa74287f951442456551b4a01d77912a7bb34b962')
b2sums=('0a956766198c911d886b6130aebef62f8297d89270fed7ab0e7f6851e547333f5d1a489562ea976103466253349dbef6707c0db6c8f39ccd604b840a4aa8c164')

prepare() {
  cd "$pkgname"

  sed \
    -e 's/,<[0-9=.]*//' \
    -i setup.cfg

  sed \
    -e '/error/a \    ignore:Creating a LegacyVersion has been deprecated and will be removed in the next major release:DeprecationWarning' \
    -i pytest.ini
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # hack entry points by installing it to a temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages:$PYTHONPATH"

  local deselected=(
    tests/unit/test_pyflakes_codes.py::test_all_pyflakes_messages_have_flake8_codes_assigned
    tests/integration/test_plugins.py::test_local_plugin_can_add_option
  )

  pytest ${deselected[@]/#/--deselect }

}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
