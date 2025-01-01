# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Farhad Shahbazi <farhad@enthusiasm.cc>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-bottle
pkgver=0.13.1
pkgrel=1
pkgdesc="A fast and simple micro-framework for small web-applications"
arch=(any)
url="https://bottlepy.org"
license=('MIT')
options=(!emptydirs)
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-mako' 'python-jinja' 'python-cherrypy' 'python-twisted'
              'python-tornado' 'python-paste' 'python-gevent' 'python-eventlet'
              'gunicorn')
optdepends=('python-waitress: Waitress WSGI server'
            'python-cherrypy: Cherrypy WSGI server'
            'python-eventlet: Eventlet server support')
source=("git+https://github.com/defnull/bottle.git#tag=$pkgver")
sha512sums=('24d0ae314dc884aa656be81b85618f7cfe2af2da665af5c52fe3f1ca4bbe011128633d9792f73ffadc0a2f9899c363d009cff1b5f2f0b18b092c1abdf8a35aa5')

build() {
  cd bottle
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd bottle
  python -m unittest discover
}

package() {
  cd bottle
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/bottle-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ts=2 sw=2 et:
