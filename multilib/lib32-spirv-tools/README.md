# lib32-spirv-tools

## Always build against latest spirv-headers

To prevent any potential build / compatibility issue, `lib32-spirv-tools` (and `spirv-tools`) should be built against the latest version of `spirv-headers` at the time.

## Keep in sync with spirv-tools

This package should be kept in sync with `spirv-tools` version wise. Ideally, both should be maintained as one package group (meaning they should be updated, released and moved accross repositories together).

## Packaging release candidates tags

It happens that stable release tags never make it to the upstream repository. Upstream was contacted a few times on that matter but it seems the release workflow still didn't got fixed reliably. While we usually do not package such "unstable" tags, the hard dependency of other packages on the latest version of spirv-tools (e.g. `glslang`) forces us to package release candidates (.rcX) tags (when the related stable tag doesn't exists).
