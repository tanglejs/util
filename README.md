# tangle-util

> Utility belt for TangleJS internals

[![Travis Build Status](https://secure.travis-ci.org/logankoester/tangle-util.png?branch=master)](http://travis-ci.org/logankoester/tangle-util)
[![Dependency Status](https://david-dm.org/tanglejs/tangle-util.png)](https://david-dm.org/logankoester/tangle-util)
[![devDependency Status](https://david-dm.org/logankoester/tangle-util/dev-status.png)](https://david-dm.org/logankoester/tangle-util#info=devDependencies)

[![NPM](https://nodei.co/npm/tangle-util.png?downloads=true)](https://nodei.co/npm/tangle-util/)

## Overview

[tangle](https://github.com/tanglejs/tangle) is a set of tools
for building web applications.

`util` implements a handful of utility functions used internally by TangleJS and various plugins.


## Contributing

The test suite is implemented with
[nodeunit](https://github.com/caolan/nodeunit) and
[nixt](https://github.com/vesln/nixt).

To rebuild & run the tests

    $ git clone https://github.com/tanglejs/util.git
    $ cd util
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle` to use
your modified `util` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2014 Logan Koester
Licensed under the MIT license.


