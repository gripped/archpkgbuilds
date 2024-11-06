# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-tqdm
pkgver=4.67.0
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-toml' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-timeout' 'python-numpy' 'python-pandas' 'python-rich' 'python-dask' 'tk' 'python-keras')
source=("git+https://github.com/tqdm/tqdm.git#commit=v${pkgver}")
sha512sums=('49c05b6f059537ff447f8fe9b1f767927d1906d0421cd426d3522795a356541df68e2694571f710e7375065012cc8f3454734fcae91e0bb259a39ec8f74f22ed')

build() {
  cd tqdm
  python -m build --wheel --no-isolation
}

check() {
  cd tqdm
  # Tests still require numpy < 2.x.x
  #pytest
}

package() {
  cd tqdm
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm 644 tqdm/completion.sh "${pkgdir}/usr/share/bash-completion/completions/tqdm"
}

# vim:set ts=2 sw=2 et:
