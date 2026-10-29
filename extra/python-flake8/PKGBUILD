# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Allen Li <darkfeline at abagofapples.com>

pkgname=python-flake8
pkgver=7.5.0
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
sha512sums=('553627236829acc515ccc59d51355fe75fb8a29225344fda07cb8c66169a7ce4cd5f679d71bbccd7b47ae277fdfeee814ebfcd4c3b05793a3033f6c36c308432')
b2sums=('339abd216b6fc039005f3af0da7d1d2058b7e0f8bf7263158886baf6419095c4d2bdd65518f3ef487e34d4ea3238e62369132217c0a6abef3f46e7d167effa64')

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
