# containers-common

## Circular dependencies and bootstrapping

`buildah`, `podman` and `skopeo` depend on a specific version of `containers-common` at runtime.  
To avoid unexpectedly pushing incompatible versions, we test the compatibility of our `buildah`, `podman` and `skopeo` packages with our `containers-common` package (version wise) during `check()`, and vice-versa.

This means that our `containers-common` package have a circular dependency with our `buildah`, `podman` and `skopeo` packages, eventually requiring bootstrapping on version bumps (this should be highlighted by a `check()` failure when bumping the packages).  
Bootstrap should happen in [extra-staging]:

- Bump `containers-common` with `--nocheck`
- Bump `buildah`, `podman` and `skopeo` (depending which one(s) need(s) bumping)
- Rebuild `containers-common` with checks
- Move packages out of [extra-staging] as a single batch
