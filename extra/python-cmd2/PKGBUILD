# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cmd2
pkgver=4.4.2
pkgrel=1
pkgdesc="A tool for building interactive command line apps"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python-prompt_toolkit' 'python-pyperclip' 'python-rich' 'python-rich-argparse')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-pyte' 'uv' 'vi')
source=("git+https://github.com/python-cmd2/cmd2.git#tag=$pkgver")
sha512sums=('ab7549ea4e5a26ca7d5493860841e20ad2be88e8165c275131b6591d57a715facd5bb0b7c591de04efbbbf5420199cc0752766df794b118b5f296ac59d2f70b0')

build() {
  cd cmd2
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CMD2=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd cmd2
  PYTHONPATH="$PWD" pytest --override-ini="addopts="
}

package() {
  cd cmd2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
