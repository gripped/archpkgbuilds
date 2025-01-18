
pkgname=python-django-q2
pkgver=1.7.6
pkgrel=1
pkgdesc='A multiprocessing distributed task queue for Django'
arch=(any)
url=https://github.com/django-q2/django-q2
license=(MIT)
depends=(python-django python-django-picklefield)
makedepends=(python-build python-installer python-poetry-core)
conflicts=(python-django-q)
replaces=(python-django-q)
provides=(python-django-q)
# checkdepends=(python-pytest python-pytest-django)
optdepends=(
  'python-blessed: Display the statistics in the terminal'
  'python-setproctitle: customize the proctitle'
  'python-hiredis: redis support'
  'python-boto3: Amazon Simple Queue Service message queue support'
  'python-psutil: resource usage limit support'
  'python-pymongo: MongoDB as a message broker support'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/django-q2/django-q2/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('c2bcee62dd502b3d752fb075f300516d68aad650a4c321b9cc8edb8784c34471')

build() {
  cd django-q2-${pkgver}
  python -m build --wheel --no-isolation
}

# check() {
# requires python-django-redis and a running redis server
#   cd django-q2-${pkgver}
#   pytest -vs .
# }

package() {
  cd django-q2-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

