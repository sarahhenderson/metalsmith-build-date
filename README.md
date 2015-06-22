metalsmith-build-date
======================

A [Metalsmith](http://metalsmith.io) plugin that adds a `buildDate` property to the metalsmith metadata.

Usage
-----

```
var buildDate = require('metalsmith-build-date');

   Metalsmith(__dirname)
   .use(buildDate());
```

This will add a global metadata item called 'buildDate' containing the current timestamp.

If you want to call it something other than buildDate, you can pass a different name as an option.

```
var buildDate = require('metalsmith-build-date');

   Metalsmith(__dirname)
   .use(buildDate({ name: 'foo' }));
```

This will add a global metadata item called 'foo' containing the current timestamp.

Tests
-----
   
`$ npm test`
   
Licence
-------

GPLv2
