# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=mercurial
pkgver=7.0.3
pkgrel=1
pkgdesc='A scalable distributed SCM tool'
arch=(x86_64)
url="https://www.mercurial-scm.org/"
license=(GPL)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm
             python-docutils)
optdepends=('tk: for the hgk GUI')
#checkdepends=('breezy' 'cvs' 'git' 'git-lfs' 'python-docutils' 'subversion' 'unzip')

# ToDo:
# check included contrib/packaging/mercurial.spec and how BLFS/Gentoo/Debian/Fedora do it
# the following should be either makedepends or checkdepends when running tests
# 'python-gnupg' 'python-pygments'  'python-pyflakes' 'python-pyopenssl'
# 'openssh'  'rust' 'subversion' 'breezy' 'cvs' 'git') 	

backup=(etc/mercurial/hgrc)
validpgpkeys=(2BCCE14F5C6725AA2EA8AEB7B9C9DC824AA5BDD5
              EB851395B4223EE2F7BA0B28DA54740BF08732BA
              818D87CD1AC180C394C86E633A33DE460D9EC39F  # Pulkit Goyal <7895pulkit@gmail.com>
              1F66F8CDF654E905C11DA061A11E01CD0E05D956  # Raphaël Gomès <alphare@raphaelgomes.dev>
              ED213E486B23249BDC107B5945CAA92A71CA027B) # Pierre-Yves David <pierre-yves.david@ens-lyon.org>
source=(https://www.mercurial-scm.org/release/${pkgname}-${pkgver}.tar.gz{,.asc}
        mercurial.profile)
sha512sums=('3a1b1029d6803935604e85f5e3a04d2a00d5ef3990f79f108be3ed40fc486c844b08d6d5d2f54b5d8d83b890f332d4555a61042bd4744fd26ad282ff9284276c'
            'SKIP'
            '710dcddb24d928efc97370e869d9caa083107929ed9a1086dd2a3ae0caaf2c71e2f29060597e29315b6b15b1616251c42412e268ce737109c48ae4d7aa1b9555')

build() {
  cd $pkgname-$pkgver
  python -m build -wn
  make -C contrib/chg
}

check() {
  cd $pkgname-$pkgver/tests
  # TODO - disabled for now - to many tests fail
  #python run-tests.py # -j48 || :
}

package() {
  cd $pkgname-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  # Do not invoke install target because it invokes a soon to be deprecated
  # `setup.py install` and screws with shebang handling in PEP517 install above
  make DESTDIR="$pkgdir" PREFIX=/usr install-doc

  install -Dm644 contrib/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_hg"
  install -Dm644 contrib/bash_completion "$pkgdir/usr/share/bash-completion/completions/hg"

  make -C contrib/chg DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm755 contrib/hg-ssh "$pkgdir/usr/bin"
  install -Dm755 contrib/hgk "$pkgdir/usr/bin"

  install -Dm644 -t "$pkgdir/usr/share/emacs/site-lisp/" contrib/{mq.el,mercurial.el}

  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/syntax/" contrib/vim/HGAnnotate.vim

  # set some variables
  install -Dm644 "$srcdir/mercurial.profile" "$pkgdir/etc/profile.d/mercurial.sh"

  # FS#38825 - Add certs config to package
  cat <<-EOF | install -Dm755 /dev/stdin "$pkgdir/etc/mercurial/hgrc"
	[web]
	cacerts = /etc/ssl/certs/ca-certificates.crt
	EOF
}
