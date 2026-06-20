# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cmd2
pkgver=2.7.0
pkgrel=1
pkgdesc="A tool for building interactive command line apps"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python-pyperclip' 'python-rich-argparse' 'python-wcwidth')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'vi')
source=("git+https://github.com/python-cmd2/cmd2.git#tag=$pkgver")
sha512sums=('e2cccbd2b3133de7f8072b23e3d7b78526d9a547ae3948bebf2b43a0714e9f49e6aaa2801520c36af270d8a8159a09903c720c86e8d499363386b1618afbfdb7')

prepare() {
  cd cmd2

  # Python 3.14 removed argparse.HelpFormatter._format_actions_usage; upstream
  # dropped these private overrides in https://github.com/python-cmd2/cmd2/pull/1571.
  sed -e '/def _format_usage(/i\
    if not hasattr(argparse.HelpFormatter, "_format_actions_usage"):\
        def _format_actions_usage(self, actions, groups):\
            parts, _ = self._get_actions_usage_parts(actions, groups)\
            return " ".join(parts)\
' -i cmd2/argparse_custom.py
}

build() {
  cd cmd2
  python -m build --wheel --no-isolation
}

check() {
  cd cmd2
  PYTHONPATH="$PWD/cmd2" pytest --override-ini="addopts="
}

package() {
  cd cmd2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
