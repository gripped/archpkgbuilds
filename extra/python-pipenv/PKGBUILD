# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv
pkgver=2024.2.0
pkgrel=1
pkgdesc="Sacred Marriage of Pipfile, Pip, & Virtualenv."
url="https://pipenv.pypa.io"
arch=('any')
license=('MIT')
depends=('python'
         'python-pip'
         'python-certifi'
         'python-virtualenv-clone'
         'python-virtualenv')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytz'
              'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pipenv/archive/v${pkgver}.tar.gz")
b2sums=('b31dec925d6ba22b9ad91945a54cf031c74b3e69ebb0ba666dc979aa93046839ac826968f4ade539fbc55829d77b70067241b90d585b98a143f3e1d201ce983f')

build() {
  cd "pipenv-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "pipenv-${pkgver}"
  pytest tests/unit --ignore tests/unit/test_utils_windows_executable.py
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "pipenv-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pushd pipenv
  find . -name \*LICENSE\* -exec install -Dm 644 \{\} "${pkgdir}/usr/share/licenses/${pkgname}/"\{\} \;
  popd

  PYTHONPATH="${pkgdir}/${_site_packages}" _PIPENV_COMPLETE=bash_source "${pkgdir}"/usr/bin/pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pipenv"
  PYTHONPATH="${pkgdir}/${_site_packages}" _PIPENV_COMPLETE=zsh_source  "${pkgdir}"/usr/bin/pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pipenv"
  PYTHONPATH="${pkgdir}/${_site_packages}" _PIPENV_COMPLETE=fish_source "${pkgdir}"/usr/bin/pipenv | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pipenv.fish"

  # Remove vendored cacert.pem
  # Taken from python-certifi
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "$pkgdir"/$site_packages/pipenv/patched/pip/_vendor/certifi/cacert.pem
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/$site_packages/pipenv/patched/pip/_vendor/certifi/cacert.pem
}
