# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python-regex
pkgver=2024.4.16
pkgrel=2
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('Python' 'Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('fa454d26f2e87ad661c4f0c5a5fe4cf6aab1e307d1b94f16ffdfcb089ba685c0')
b2sums=('75df2f861116ebf37845abdb0883774ac53d7d61e4cdf18128c74b4c1d5a55b86bfd447616cdb8fc14239c0a5aeaa2c7e59cb0b2b365b57185d785a3728e6dce')

build() {
  cd "regex-${pkgver}"

  python -m build -wn
}

check() {
  cd "regex-${pkgver}"

  local _pyver=cpython-$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$PWD/build/lib.linux-$CARCH-$_pyver"
  python -m unittest regex/test_regex.py
}

package() {
  cd "regex-${pkgver}"

  python -m installer --d "${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
