# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv
pkgver=2024.0.3
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
b2sums=('3a8d4384f90626455e51afe3766e7f6775a87ba82cf9b42340b0268c1181f2a95dae5953a4efb325154482db6d335f9ea0cb3f957340573ebdae97a676c810b0')

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
