# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python-regex
pkgver=2025.10.23
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('8cbaf8ceb88f96ae2356d01b9adf5e6306fa42fa6f7eab6b97794e37c959ac26')
b2sums=('56441db882934d0472f8ccec3c4f50ce6b45db66ee49d5275f4b90ec2d4d4c552e68fb53b965b45bb37d4e4ce864f8cb4b0341228e92959b90a71adbf7a18ef1')

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
