# clsql-local-time
### Arnold Noronha <arnold@jipr.io>




This simple library allows the use of local-time:timestamp objects in
CLSQL models and queries.

## Usage

Just include this library in your dependencies. You don't have to do
anything else. After that you can use timestamp objects like so:

```lisp
(clsql:def-view-class foo ()
  ((id
    :type integer)
   (created-at
    :type local-time:timestamp)))
```

At this point you can load these instances, save these instances, and
query them by the `created-at` field.

## License

MIT License, see LICENSE file
