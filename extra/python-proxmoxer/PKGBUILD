# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bao Trinh <qubidt at gmail>
# Contributor: Bastien Traverse <firstname at lastname dot email>

pkgname=python-proxmoxer
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=2
pkgdesc="Python Wrapper for the Proxmox 2.x API (HTTP and SSH)"
arch=('any')
url="https://github.com/proxmoxer/proxmoxer"
license=('MIT')
depends=('python')
optdepends=('python-requests: for https backend'
			'python-paramiko: for ssh_paramiko backend')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3ed63a58e5c0822841afdb3801f9d913a4996955c1c54f7319b5842ba2615006')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # remove tests because they interfere with other system packages
  sed -i "s/, 'tests', 'tests.base'//" setup.py
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
