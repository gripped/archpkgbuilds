# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=npm
pkgver=11.5.2
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
makedepends=(
  git
  jq
)
options=(!zipman)
optdepends=("git: for dependencies using Git URL's")
source=("npm-cli::git+https://github.com/npm/cli.git#tag=v$pkgver")
b2sums=('bceeaeafb476d7ba99c48812e8a40bf571be9e368e510c5624d332cb03843f7b65a7ee5a80034f8ec0546566facbae3605f7158b21ccde0ce3d3b1d1cdeab7d3')

build() {
  cd npm-cli
  node scripts/resetdeps.js
  node . run build -w docs
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

  install -d "$pkgdir"/{usr/{bin,share/{bash-completion/completions,licenses/$pkgname}},$mod_dir}
  ln -s $mod_dir/bin/$pkgname-cli.js "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/bin/npx-cli.js "$pkgdir"/usr/bin/npx
  ln -s $mod_dir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd npm-cli
  mapfile -t mod_files < <(node . pack --ignore-scripts --dry-run --json | jq -r .[].files.[].path)
  cp --parents -a "${mod_files[@]}" "$pkgdir"/$mod_dir
  node . completion > "$pkgdir"/usr/share/bash-completion/completions/npm
  echo 'globalconfig=/etc/npmrc' > "$pkgdir"/$mod_dir/npmrc

  cd "$pkgdir"/$mod_dir
  # Remove superfluous scripts
  rm -r bin/{node-gyp-bin,np{m,x}{,.{cmd,ps1}}}

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
    sed -Ei 's/^(\.TH "NPM-'"$title"'" "[^"]+") "[^"]+"/\1 ""/' "$page"

    mv "$page" "${page/\///npm-}"
  done

  gzip --no-name man?/*

  # Support both `man` and `npm help`
  local dest sec_dir
  for sec_dir in man?; do
    dest="$pkgdir"/usr/share/man/$sec_dir
    install -d "$dest"
    ln -r -s "$sec_dir"/* "$dest"
  done
}
