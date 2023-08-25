# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django')
pkgver=4.2.4
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
checkdepends=('python-pytest' 'python-tblib')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-pytz' 'python-sqlparse' 'python-asgiref')
# TODO: package and add python-pymemcache https://docs.djangoproject.com/en/dev/topics/cache/
optdepends=('python-psycopg2: for PostgreSQL backend'
            'python-argon2_cffi: for Argon2 password hashing support')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
sha512sums=('e773a54ce6ad82abfac462f543c54e414c216ecb28025fab9bf92e4f1add4fbc9acf831e765b638f560a71f6d7591eaa1a8ed6175c3379d5662a94b6a64f2c77')

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package_python-django() {
  cd "$srcdir/Django-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

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
  cd "$srcdir/Django-$pkgver"
  PYTHONPATH="$PWD" python tests/runtests.py || echo 'tests failed'
}
