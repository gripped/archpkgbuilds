# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duplicity
pkgver=3.2.0.2
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm'
arch=(x86_64)
url='https://duplicity.gitlab.io/'
license=(GPL-2.0-only)
depends=(
  glibc
  gnupg
  librsync
  python
  python-fasteners
  python-pexpect
  python-gnupg
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-gettext
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
sha512sums=('df2a8e9b6f51ff65063db10966153e9ea7e3ef217e238d3152b49c068bff335c3225a2f907b4d0912d855792af97abe27f98e21e7b6ddc9d3a1072ba9c1dba73'
            'c157fc0b5a3eff6e5743721adbc9567c89638ce8f5adf33b4f976e6a86adbcf16dd3f8b38b2482e4570ae728a4f99b813600efc5ac6e3996b6881ccf1a04fa22'
            'b380db3036442966e4fa39d3759b6a554254fc03955666c93b80ecdfb9ae2d57de8d4c08a94bcffb950858106a08967f7741afb4385a68bc6bc4890d0e33aa10')
b2sums=('b7345e8fd1ee59ccc5b73eb3a8858db97e29752b8a0dcad7425f1083e0806d48921f2a2fdda6b2554f25b6c72b8fa7ca84da975e9e15a0f813bd2512ff12d51f'
        '727029fc3e8dbafea089b976be112631ea3d580dab251f1346594ade5fb6ca7cd87640b80fda11cafc87f13312712da3c8fe5e2a2c497093ad31dfce6c866560'
        '40b4e6aeec2fbda0036bde6921e987e6f77e36878ae08ee6e59acb07a94564522224245f04f17a3aa7566af4e355fb4fac940df633487aeb2949789a6bec52e8')

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
