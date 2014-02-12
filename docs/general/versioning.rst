.. _versioning:

Versioning
==========


.. TODO:: complete this

use StrictVersion!
can test your version with NormalizedVersion

<major>.<minor>.<bugfix>
1.2.3

No "0" for bugfix!
1.2 (NOT 1.2.0)

alpha/beta/develop versions:
1.1 < 1.2a1.dev1 < 1.2a1 < 1.2a2 < 1.2b3.dev1 < 1.2b3 < 1.2 < 1.2.1a1.dev1 < 1.2.1a1 < 1.2.1


valid versions:

0.2
0.4.5
0.2a1
0.4a12.dev29
1.1.23
2.0.4

invalid versions:

1.0.0 (it should be 1.0)
1.0.b (it should be 1.0b1



Versions can be tested with NormalizeVersion (``pip install ...``)::

    >>> NormalizedVersion("1.2.0b1")
    NormalizedVersion('1.2b1')