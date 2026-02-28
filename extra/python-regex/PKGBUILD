# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python-regex
pkgver=2026.2.28
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2')
b2sums=('a63f281600c6b7c929825558cc0e6deb762e668cc97381c95d21efadb05eebe450511bed401f7ee0a10126c53e3bf4b7e3367bbce31cf0d217c27d39c9c5336e')

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
