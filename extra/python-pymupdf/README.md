# python-pymupdf

## Upstream sometimes do not sync (python-)pymupdf and mupdf releases

It happened sometimes that upstream did not sync `pymupdf` and `mupdf` releases (as in "the latest `pymupdf` upstream release [expects an unreleased version](https://github.com/pymupdf/PyMuPDF/issues/3460#issuecomment-2104873827) *yet* of `mupdf`).  
This can cause some tests to fail (which can be disabled, temporarily or not, like [this](https://gitlab.archlinux.org/archlinux/packaging/packages/python-pymupdf/-/commit/02c5721027e52516e323550f0dea581bd82c6f80#9b9baac1eb9b72790eef5540a1685306fc43fd6c_102_102)) or the build to fail completely (in which case there's nothing much to do then wait for them to tag a new `mupdf` release).

In any case, [opening an upstream issue](https://github.com/pymupdf/PyMuPDF/issues/3460) helps identifying and addressing the cause as they are usually responsive.
