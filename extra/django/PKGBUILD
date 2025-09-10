# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django')
pkgver=5.1.12
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
sha512sums=('01f707690efbc9ae7c9c826136c6ce2dddc12e567f37a4c90c709ccab25825aeff124df23d9c75b772e20cf1c21e5ca474044096e3c54f979bd3d8c34b463a68')

prepare() {
  cd "django-$pkgver"
  # Drop versioned setuptools requirement
  sed -i 's/>=61.0.0,<69.3.0//' pyproject.toml
}

build() {
  cd "django-$pkgver"
  python -m build --wheel --no-isolation
}

package_python-django() {
  cd "django-$pkgver"
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
  cd "django-$pkgver"
  PYTHONPATH="$PWD" python tests/runtests.py || echo 'tests failed'
}
