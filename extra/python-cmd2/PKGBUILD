# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cmd2
pkgver=3.2.0
pkgrel=1
pkgdesc="A tool for building interactive command line apps"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python-pyperclip' 'python-rich' 'python-rich-argparse')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'vi')
source=("git+https://github.com/python-cmd2/cmd2.git#tag=$pkgver")
sha512sums=('eab26e2ad43c32bc336e576e81b3cd66b1a26d59e1261d617ece6c996ba21b8cf6db3cec70de240fe880207717f67e82bd36358aa1210da30c2137bc00387ddb')

prepare() {
  cd cmd2

  # Keep CompletionItem deepcopy-safe; upstream fixed the refactored code in PR #1642.
  sed -e '/        self._orig_value = value/a\
\
    def __deepcopy__(self, memo: dict[int, Any]) -> "CompletionItem":\
        return self\
' -i cmd2/argparse_custom.py
}

build() {
  cd cmd2
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CMD2=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd cmd2
  PYTHONPATH="$PWD/cmd2" pytest --override-ini="addopts=" \
    --deselect tests/test_rich_utils.py::test_from_ansi_wrapper
}

package() {
  cd cmd2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
