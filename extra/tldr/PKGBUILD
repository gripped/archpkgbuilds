# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=tldr
pkgver=3.4.2
pkgrel=1
pkgdesc="Command line client for tldr, a collection of simplified man pages."
arch=('any')
url="https://github.com/tldr-pages/tldr-python-client"
license=('MIT')
depends=('python-shtab' 'python-colorama' 'python-termcolor')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatch'  # Set in pyproject.toml build
    'python-sphinx-argparse'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/tldr-pages/tldr-python-client/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2ead8d86f4532b69daa1efd56ba44a652e18f644e62ba16d31dcfb833b3116c010f8ab525e8a783e3c4268220f58caec303e5a544c473db5d5a7e28524612bef')

build() {
  cd "tldr-python-client-$pkgver"
  make -C docs
  python -m build --wheel --no-isolation
}

check() {
  cd tldr-python-client-$pkgver
  python -m pytest
}

package() {
  cd "tldr-python-client-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Generate here instead of a .install for package reproducibility
  install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
  install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion bash \
    > "$pkgdir/usr/share/bash-completion/completions/tldr"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion zsh \
    > "$pkgdir/usr/share/zsh/site-functions/_tldr"
}
