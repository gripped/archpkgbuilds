# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pygithub
pkgver=2.5.0
pkgrel=2
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
depends=('python-deprecated' 'python-pyjwt' 'python-requests' 'python-pynacl' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyGithub/PyGithub/archive/v$pkgver.tar.gz")
sha512sums=('4fbb6b27e21ba97ee59a0bafee40768d2beb61d9d405e2edd04bb859df7e299c072917dd7fde85202a539591d806e1a4697576cab78b465c559eef50fa223183')

build() {
  cd PyGithub-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build --wheel --no-isolation
}

check() {
  cd PyGithub-$pkgver
  python -m pytest
}

package() {
  cd PyGithub-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
