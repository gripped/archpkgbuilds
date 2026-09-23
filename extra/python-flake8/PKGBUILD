# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Allen Li <darkfeline at abagofapples.com>

pkgname=python-flake8
pkgver=7.4.0
pkgrel=1
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
sha512sums=('a5eaf386518d73feb02be6a0967e01ce3d4f2525819f23bc75e4bcbcad69add15601ebb1f37f1a09826b14f5cbed25d2296e5c35431b93a2be17f8d26f9834de')
b2sums=('dda60889ce25faf878a0e7450d9c042ddd7ae712bf5efd5f62b55f79d15b73fb1bacee4e90233544e95e22f5f8fb113147dcf80a1fb67c66b5ce6f4c774524a6')

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
