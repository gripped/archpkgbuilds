# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pallets-sphinx-themes
_pyname=${pkgname/python-/}
pkgver=2.5.0
pkgrel=1
pkgdesc='Sphinx themes for Pallets and related projects'
url='https://github.com/pallets/pallets-sphinx-themes'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-sphinx' 'python-sphinx-notfound-page')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'git')
source=(git+https://github.com/pallets/pallets-sphinx-themes#tag=${pkgver})
sha512sums=('ebfc31d60b4e45d5fd025f3b5e59e79fcd794dcfb1e9c343521c573c926489664dfde9a5cb4bd2d3ff63b0fe3bc77c726d4b483eac7ac3156c70192af9f79f1d')
b2sums=('578194a79dfce650d4d5cb722510c3c82ff5908329494437f473e95b9c70361200d456fa8f656b911a73ceb0ade80aa85fa0ce4b551a20a33295fbc6967e07ce')

prepare() {
  cd ${_pyname}
  # Remove upper bound on flit-core allowing version 4
  sed -i 's/<4//' pyproject.toml
}

build() {
  cd ${_pyname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
