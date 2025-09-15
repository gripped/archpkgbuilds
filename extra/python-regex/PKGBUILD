# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python-regex
pkgver=2025.7.34
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('Python' 'Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('9ead9765217afd04a86822dfcd4ed2747dfe426e887da413b15ff0ac2457e21a')
b2sums=('4eb0c5600b9ef759f1e7511d01d533a3fda7b6010b6c974c0071e7cde2f5bbd9a8c62289b7abb4f2e0d9c251a9421876f6bf0a021892073babffb181d099ae55')

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
