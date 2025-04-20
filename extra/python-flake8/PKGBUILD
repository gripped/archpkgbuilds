# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Allen Li <darkfeline at abagofapples.com>

pkgname=python-flake8
pkgver=7.2.0
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
sha512sums=('cafc73920adae015316dc484826fb94bf84348605ac0a9d00f8fbb4c71fa45155d6353c9d1eeed22acc6e25211f30e3db524c944e251b6a7ec54d8a13ae15ace')
b2sums=('476f879cbdf6616c5cc9b7c7ee0170cdd143e17e40b8f2edf613c72873b656262ddf98e7a1b061c651fa32f20db086b41e8311988367ff31e20bb6b7a8ed1246')

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
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages:$PYTHONPATH" pytest -k 'not test_local_plugin_can_add_option'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
