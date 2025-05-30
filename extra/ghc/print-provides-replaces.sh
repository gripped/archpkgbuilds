#!/bin/bash

. PKGBUILD

if [[ ! -d src/ghc-${pkgver}/libraries ]]; then
  echo "error: no directory src/ghc-${pkgver}/libraries: You must extract the source tarball under src/"
  exit 1
fi

declare -A exclude
# no Win32 cause we're not building on windows
exclude['Win32']=1
# no integer-simple because we use integer-gmp
exclude['integer-simple']=1
# no ghci because it only conflicts, not replaces
exclude['ghci']=1

cd src/ghc-${pkgver}

# $1 is the name of the field
# $2 is the string for the test, either '=' or '<'
# ..$@ are the files to search
print_var() {
  field=$1
  output_version=$2
  shift
  shift

  printf "  $field=("
  for path in $(ls $@); do
    dirname=$(echo $path | awk -F '/' '{ print $2 }')
    cabalfile=$(echo $path | awk -F '/' '{ print $3 }')
    cabalname=$(basename $cabalfile .cabal.in)
    cabalname=$(basename $cabalname .cabal)
    [[ ${exclude[${dirname}]} ]] && continue
    version=$(awk 'tolower($0) ~ /^version:/ {print $2 }' $path)
    [[ "$version" == "@ProjectVersionMunged@" || "$version" == "@ProjectVersion@" ]] && version=$pkgver
    printf "'haskell-${cabalname,,}"
    [[ -n "$output_version" ]] && printf "$output_version$version"
    printf "'\n            "
  done
  printf "\033[1A'haskell-${cabalname,,}"
  [[ -n "$output_version" ]] && printf "$output_version$version"
  printf "')\n"
}

# For ghc-libs
print_var 'provides' '=' libraries/*/*.cabal{,.in} libraries/{containers/containers,Cabal/Cabal,Cabal/Cabal-syntax}/*.cabal utils/ghc-pkg/*.cabal.in
print_var 'replaces' '' libraries/*/*.cabal{,.in} libraries/{containers/containers,Cabal/Cabal,Cabal/Cabal-syntax}/*.cabal utils/ghc-pkg/*.cabal.in

# For ghc
print_var 'provides' '=' utils/{hpc,hsc2hs,haddock*,hp2ps}/*.cabal
print_var 'replaces' '' utils/{hpc,hsc2hs,haddock*,hp2ps}/*.cabal
