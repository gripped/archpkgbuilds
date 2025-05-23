# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=npm
pkgver=11.4.0
pkgrel=1
pkgdesc='JavaScript package manager'
arch=(any)
url=https://www.npmjs.com
license=(Artistic-2.0)
depends=(
  node-gyp
  'nodejs>=20.17.0'
  nodejs-nopt
  semver
)
makedepends=(git)
optdepends=("git: for dependencies using Git URL's")
source=("npm-cli::git+https://github.com/npm/cli.git#tag=v$pkgver")
b2sums=('21e49cfac0b9e5fd5a9ddf354a2dd6b834bab4ade34e22306dab69482133f57fd310fd4d765a5362ce00493858bf6d0dd38ee4d89893c134cdb007dd8eb7d621')

build() {
  cd npm-cli
  node scripts/resetdeps.js
}

check() {
  cd npm-cli
  # Windows shims test failure
  mv test/bin/windows-shims.js{,.bak}
  node . run test --ignore-scripts -- --no-coverage
  mv test/bin/windows-shims.js{.bak,}
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/usr/share/{bash-completion/completions,licenses/$pkgname}
  ln -s $mod_dir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd npm-cli
  node . install -g --prefix="$pkgdir/usr" "$(node . pack --ignore-scripts | tail -1)"
  node . completion > "$pkgdir"/usr/share/bash-completion/completions/npm
  echo 'globalconfig=/etc/npmrc' > "$pkgdir"/$mod_dir/npmrc

  cd "$pkgdir"/$mod_dir
  # Remove superfluous scripts
  rm -r {bin/{node-gyp-bin,np{m,x}{,.{cmd,ps1}}},node_modules/.bin}

  # Experimental dedup
  rm -r node_modules/{node-gyp,nopt,semver}

  cd man
  # Workaround for https://github.com/npm/cli/issues/780
  local name page sec title
  for page in man5/folders.5 man5/install.5 man7/*.7; do
    sec=${page##*.}
    name=$(basename "$page" ."$sec")
    title=${name@U}

    sed -Ei "s/^\.TH \"$title\"/.TH \"NPM-$title\"/" "$page"
    mv "$page" "${page/\///npm-}"
  done

  gzip man?/*

  # Support both `man` and `npm help`
  local dest sec_dir
  for sec_dir in man?; do
    dest="$pkgdir"/usr/share/man/$sec_dir
    install -d "$dest"
    ln -r -s "$sec_dir"/* "$dest"
  done
}
