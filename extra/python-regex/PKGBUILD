# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python-regex
pkgver=2026.7.19
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('7e77b324909c1617cbb4c668677e2c6ae13f44d7c1de0d4f15f2e3c10f3315b5')
b2sums=('c7e922fca496731dba5130bd7f572df56adfd5c31db6812f935ede24060b3fb6abca57836f3d0a0ad7bcee6433e1520b14611657495e6e844fc2d5d99d6dba32')

build() {
  cd "regex-${pkgver}"

  python -m build -wn
}

check() {
  cd "regex-${pkgver}"

  local _pyver=cpython-$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$PWD/build/lib.linux-$CARCH-$_pyver"
  python -m unittest regex/tests/test_regex.py
}

package() {
  cd "regex-${pkgver}"

  python -m installer --d "${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
