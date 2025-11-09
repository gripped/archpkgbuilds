# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django')
pkgver=5.1.14
pkgrel=2
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
sha512sums=('29e2d4746df664a129a940ba9ba35d5b5e5f7104477e3055b02628f66c761def7d601b0f917c7e16988795c36c749d7c093e53da8ad90983a9d7f478adb41781')

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
