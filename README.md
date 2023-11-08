# micropython-build-sphinx-docs

A container to build MicroPython docs

## Minidocks Sphinx-doc

This container builds on the good work of
[minidocks/sphinx-doc](https://github.com/minidocks/sphinx-doc).

The only additions are to add support for `make` and install the Sphinx
extension `sphinxcontrib.jquery` which is required for the RTD theme.

This container is published to the micropython docker hub under
[build-sphinx-doc](https://hub.docker.com/r/micropython/build-sphinx-doc).

## How to use

The easiest way is to take advantage of `sphinx-autobuild`. At the root of a
clone of MicroPython:

```bash
> docker run --rm -v `pwd`:/mp -w /mp/docs -p 8000:8000 micropython/build-sphinx-doc sphinx-autobuild --host 0.0.0.0 . _build/
```

Then use a browser to view `localhost:8000`. Any changes made to the `docs`
directory will be updated and pushed to the browser.

### The 'differences' topic

The entry [MicroPython difference from
CPython](https://docs.micropython.org/en/latest/genrst/index.html) is built by
executing a Python script. Although the docs can be used without this topic, if
you'd like it to appear then the script will need to be executed. There is
a convenient `make`` target:

```bash
> docker run --rm -v `pwd`:/mp -w /mp/docs micropython/build-sphinx-doc make cpydiff
```

### Cache notes

Sphinx keeps a cache, it can be cleared with:

```bash
> docker run --rm -v `pwd`:/mp -w /mp/docs micropython/build-sphinx-doc make clean
```

This will be necessary if you make changes while autobuild is not running. The
`_build` directory may need to be deleted too.
