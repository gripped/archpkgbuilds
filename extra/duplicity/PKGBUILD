# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duplicity
pkgver=3.0.6.2
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm'
arch=(x86_64)
url='https://duplicity.gitlab.io/'
license=(GPL-2.0-only)
depends=(
  gnupg
  librsync
  python-fasteners
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
optdepends=(
  'lftp: backend for ftp, ftps, fish'
  'ncftp: alternative backend for ftp'
  'python-b2sdk: Backblaze B2 backend'
  'python-boto3: Amazon S3 and Google Cloud Storage backend'
  'python-dropbox: Dropbox backend'
  'python-gobject: GIO backend'
  'gvfs: GIO backend'
  'python-paramiko: SSH paramiko backend'
  'python-pexpect: SSH pexpect backend'
  'python-pydrive2: Google Drive backend'
  'python-mediafire: Mediafire backend'
  'python-requests-oauthlib: OneDrive backend'
  'rclone: rclone backend'
  'rsync: rsync backend'
)
source=(
  "$pkgname::git+https://gitlab.com/duplicity/duplicity#tag=rel.$pkgver"
  fix-documentation-directory.patch
  no-pip.patch
)
sha512sums=('1742de3a3cc34dd96030683d4630425ece395f3d3764c3aa11db41917113208b9d8dc66726a95647722d57bddd4043f45eed637e399eaf8c9de983121f185ef0'
            'fac5f64001f91f65f4b7d8edd5b3dd667ffaf73ceb06102a93f7c4c4bcf898695d62d143ebaf5173fe2a1a797109ecde9cfc8b3779ad1d234d3abb0f1334644e'
            'c7b94e6c9a5d9ffe57c69ff2db90a278936c6187c0342762c0589616ee35745495bce14bc4b8da903f1ef1baf329a71f6839e826f25a813cfa8eb91a87fecafc')
b2sums=('8d601f3ef98ccf91677c83d7b81dfb623c5747e15afca80cb95bf81a96ce3231bd64009fb262bfab1524a19109c98fd5dfb3720023e6dd525077b94f0ac30e58'
        '04dad8ce369f4fb78e2b3239e30d63410d8e8c33b5e05717b5b62ba54c624c2e931220b950bad507deab60a07086c434949f0766bc3ae2eb771d62e1919cbecd'
        'cc40b852f4546b945fdc7687d900a49187597f8eaf5a843e0ac1556039f9e9daba83443297aca47eb8dce95b54d0e052b07cec31cc0e9982324ce892af3f0c20')

prepare() {
  cd "$pkgname"

  # move documentation to the correct directory
  patch -p1 -i "$srcdir/fix-documentation-directory.patch"

  # do not use pip/pipx
  patch -p1 -i "$srcdir/no-pip.patch"
}

build() {
  cd "$pkgname"

  # FS#76307, FS#79399 - ensure version is correct
  sed -e "s:\$version:$pkgver:" -i "$pkgname/__init__.py"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
