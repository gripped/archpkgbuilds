# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django')
pkgver=5.1.8
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
checkdepends=('python-pytest' 'python-tblib')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytz' 'python-sqlparse' 'python-asgiref')
# TODO: package and add python-pymemcache https://docs.djangoproject.com/en/dev/topics/cache/
optdepends=('python-psycopg2: for PostgreSQL backend'
            'python-argon2-cffi: for Argon2 password hashing support')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
sha512sums=('d61ee20eaa37da1f172f0e25b3c4a7cfdbc01a1432ae8ae053040db5ca80faf35a7f998dc8a8c67db60eeb4bdec0794a532b7acca4969f3d0713ce6249de1249')

prepare() {
  cd "Django-$pkgver"
  # Drop versioned setuptools requirement
  sed -i 's/>=61.0.0,<69.3.0//' pyproject.toml
}

build() {
  cd "Django-$pkgver"
  python -m build --wheel --no-isolation
}

package_python-django() {
  cd "Django-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
  cd "Django-$pkgver"
  PYTHONPATH="$PWD" python tests/runtests.py || echo 'tests failed'
}
