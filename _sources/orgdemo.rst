

Ox-Rst
------

**Ox-Rst** exports your `Org <http://orgmode.org>`_ documents to reStructuredText.
Ox-Rst relies on the Org-mode 9.0 export framework.

Configuration
-------------

Add the following in your init.el

.. code:: common-lisp

    (require 'ox-rst)

reStructuredText export
-----------------------

``ox-rst`` export back-end generates reStructuredText syntax for
an Org mode buffer.

reStructuredText commands
~~~~~~~~~~~~~~~~~~~~~~~~~

To export your org document to, press ``C-c C-e``, and then ``r``.

``C-c C-e r r (org-rst-export-to-rst)``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Export as a text file written in reStructured syntax.
For an Org file, ``myfile.org``, the resulting file will be ``myfile.rst``.
The file will be overwritten without warning.

``C-c C-e r R (org-rst-export-as-rst)``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Export as a temporary buffer. Do not create a file.

Title, Author, E-Mail and Date
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Org:

::

    #+TITLE: This is the title of the document
    #+AUTHOR: Author
    #+EMAIL: mailaddress@example.com
    #+DATE: 2019/08/13 00:00
    #+OPTIONS: author:t date:t email:t

reStructuredText:

.. code:: rst

    =================================
    This is the title of the document
    =================================

        :Author: Author
        :Contact: mailaddress@example.com
        :Date: 2019/08/13 00:00

Headings
~~~~~~~~

Org:

::

    * Heading 1

    contents 1

    ** Heading 1-1

    contents 1-1

    *** Heading 1-1-3

    contents 1-1-3

reStructuredText:

.. code:: rst

    Heading 1
    ---------

    contents 1

    Heading 1-1
    ~~~~~~~~~~~

    contents 1-1

    Heading 1-1-3
    ^^^^^^^^^^^^^

    contents 1-1-3

Table of contents
~~~~~~~~~~~~~~~~~

Org:

::

    #+OPTIONS: toc:t

reStructuredText:

.. code:: rst

    .. contents::

Lists
~~~~~

Org:

::

    ** Lord of the Rings
    1. The attack of the Rohirrim
    2. Eowyn's fight with the witch king
       + this was already my favorite scene in the book
       + I really like Miranda Otto.
    3. Peter Jackson being shot by Legolas
       - on DVD only
       He makes a really funny face when it happens.
    But in the end, no individual scenes matter but the film as a whole.
    Important actors in this film are:
    - Elijah Wood :: He plays Frodo
    - Sean Austin :: He plays Sam, Frodo's friend.  I still remember
      him very well from his role as Mikey Walsh in The Goonies.

reStructuredText:

.. code:: rst

    Lord of the Rings
    ~~~~~~~~~~~~~~~~~

    1. The attack of the Rohirrim

    2. Eowyn's fight with the witch king

       - this was already my favorite scene in the book

       - I really like Miranda Otto.

    3. Peter Jackson being shot by Legolas

       - on DVD only

       He makes a really funny face when it happens.

    But in the end, no individual scenes matter but the film as a whole.
    Important actors in this film are:

    Elijah Wood
        He plays Frodo

    Sean Austin
        He plays Sam, Frodo's friend.  I still remember
        him very well from his role as Mikey Walsh in The Goonies.

Special Characters
~~~~~~~~~~~~~~~~~~

Org:

::

    special characters * asterisk \ backspace
    .. reStructuredText comment line

reStructuredText:

.. code:: rst

    special characters \* asterisk \\ backspace
    \.. reStructuredText comment line

Paragraphs
~~~~~~~~~~

**note** Org line breaks ``\\`` will be ignored.

Verse block
^^^^^^^^^^^

Org:

::

    #+BEGIN_VERSE
     Great clouds overhead
          Tiny black birds rise and fall
          Snow covers Emacs

              -- AlexSchroeder
    #+END_VERSE

reStructuredText Line Blocks:

.. code:: rst

    | Great clouds overhead
    |      Tiny black birds rise and fall
    |      Snow covers Emacs
    |
    |          -- AlexSchroeder

Quote block
^^^^^^^^^^^

Org:

::

    #+BEGIN_QUOTE
    Everything should be made as simple as possible,
      but not any simpler -- Albert Einstein
    #+END_QUOTE

reStructuredText Literal Blocks:

.. code:: rst

    ::

        Everything should be made as simple as possible,
          but not any simpler -- Albert Einstein

Org:

::

    #+ATTR_RST: :margin 4
    #+BEGIN_QUOTE
    Everything should be made as simple as possible,
    but not any simpler -- Albert Einstein
    #+END_QUOTE

    #+ATTR_RST: :margin 8
    #+BEGIN_QUOTE
    Everything should be made as simple as possible,
    but not any simpler -- Albert Einstein
    #+END_QUOTE

reStructuredText Block Quotes:

.. code:: rst

    Everything should be made as simple as possible,
    but not any simpler -- Albert Einstein

        Everything should be made as simple as possible,
        but not any simpler -- Albert Einstein

Org:

::

    #+ATTR_RST: :directive note
    #+BEGIN_QUOTE
    Everything should be made as simple as possible,
    but not any simpler -- Albert Einstein
    #+END_QUOTE

reStructuredText Directives:

.. code:: rst

    .. note::

        Everything should be made as simple as possible,
        but not any simpler -- Albert Einstein

Org:

::

    #+ATTR_RST: :directive sidebar :title sidebar title
    #+BEGIN_QUOTE
    Everything should be made as simple as possible,
    but not any simpler -- Albert Einstein
    #+END_QUOTE

reStructuredText Directives with title:

.. code:: rst

    .. sidebar:: sidebar title

        Everything should be made as simple as possible,
        but not any simpler -- Albert Einstein

Special blocks
^^^^^^^^^^^^^^

Org:

::

    #+BEGIN_caution
    This is the second line of the first paragraph.
    #+END_caution

reStructuredText:

.. code:: rst

    .. caution::

        This is the second line of the first paragraph.

Org:

::

    #+ATTR_RST: :title This is a note admonition.
    #+BEGIN_note
    This is the second line of the first paragraph.
    #+END_note

reStructuredText:

.. code:: rst

    .. note:: This is a note admonition.

        This is the second line of the first paragraph.

Center block
^^^^^^^^^^^^

Center block will not affect.

Org:

::

    #+BEGIN_CENTER
    center block
    #+END_CENTER

reStructuredText:

.. code:: rst

    center block

Literal examples
~~~~~~~~~~~~~~~~

example block
^^^^^^^^^^^^^

Org:

::

    #+NAME: label
    #+BEGIN_EXAMPLE
    example
    #+END EXAMPLE

reStructuredText:

.. code:: rst

    ::
        :name: label

        example

src block
^^^^^^^^^

Org:

::

    #+BEGIN_SRC lisp
    (require 'ox-rst)
    #+END_SRC

reStructuredText:

.. code:: rst

    .. code-block:: lisp

        (require 'ox-rst)

Emphasis and monospace
~~~~~~~~~~~~~~~~~~~~~~

Org:

::

    *bold* /italic/ _underlined_ =verbatim= ~code~ +strike-through+

reStructuredText:

.. code:: rst

    **bold** *italic* underlined ``verbatim`` ``code`` strike-through

Subscript and superscript
~~~~~~~~~~~~~~~~~~~~~~~~~

Org:

::

    H_{2}O
    E = mc^2

reStructuredText:

.. code:: rst

    H\ :sub:`2`\ O
    E = mc\ :sup:`2`\ 

LaTeX fragments
~~~~~~~~~~~~~~~

Org:

::

    If $a^2=b$ and \( b=2 \), then the solution must be
    either $$ a=+\sqrt{2} $$ or \[ a=-\sqrt{2} \].

reStructuredText:

.. code:: rst

      If :math:`a^2=b` and :math:`b=2`, then the solution must be
    either 

    .. math::

        a=+\sqrt{2}

     or 

    .. math::

        a=-\sqrt{2}

    .

Horizontal rules
~~~~~~~~~~~~~~~~

Org:

::

    -----

reStructuredText:

.. code:: rst

    ------------

Comment block
~~~~~~~~~~~~~

Comment block will disapper.

Org:

::

    #+BEGIN_COMMENT
    comment
    #+END_COMMENT

Images and Tables
~~~~~~~~~~~~~~~~~

Images
^^^^^^

Org:

::

    #+ATTR_RST: :alt alternate text :align right
    [[./image.jpg]]

reStructuredText:

.. code:: rst

    .. image:: ./image.jpg
        :alt: alternate text
        :align: right

Org:

::

    #+CAPTION: image caption
    #+ATTR_RST: :alt alternate text :align center :scale 50%
    [[./image.jpg]]

reStructuredText:

.. code:: rst

    .. figure:: ./image.jpg
        :alt: alternate text
        :align: center
        :scale: 50%

        image caption

Tables
^^^^^^

Org:

::

    | TOP1 | TOP2 | TOP3 |
    | 1    | 2    | 3    |
    | AAAA | BBBB | CCCC |
    | END1 | END2 | END3 |

reStructuredText:

.. code:: rst

    .. table::

        +------+------+------+
        | TOP1 | TOP2 | TOP3 |
        +------+------+------+
        | 1    | 2    | 3    |
        +------+------+------+
        | AAAA | BBBB | CCCC |
        +------+------+------+
        | END1 | END2 | END3 |
        +------+------+------+

Org:

::

    | TOP1 | TOP2 | TOP3 |
    |------+------+------|
    | 1    | 2    | 3    |
    | AAAA | BBBB | CCCC |
    | END1 | END2 | END3 |

reStructuredText:

.. code:: rst

    .. table::

        +------+------+------+
        | TOP1 | TOP2 | TOP3 |
        +======+======+======+
        | 1    | 2    | 3    |
        +------+------+------+
        | AAAA | BBBB | CCCC |
        +------+------+------+
        | END1 | END2 | END3 |
        +------+------+------+

Org:

::

    |------+------+------|
    | TOP1 | TOP2 | TOP3 |
    |------+------+------|
    | 1    | 2    | 3    |
    |------+------+------|
    | AAAA | BBBB | CCCC |
    |------+------+------|
    | END1 | END2 | END3 |
    |------+------+------|

reStructuredText:

.. code:: rst

    .. table::

        +------+------+------+
        | TOP1 | TOP2 | TOP3 |
        +======+======+======+
        | 1    | 2    | 3    |
        +------+------+------+
        | AAAA | BBBB | CCCC |
        +------+------+------+
        | END1 | END2 | END3 |
        +------+------+------+

Org:

::

    #+CAPTION: caption
    #+NAME: label
    | TOP1 | TOP2 | TOP3 |
    |------+------+------|
    | 1    | 2    | 3    |
    | AAAA | BBBB | CCCC |
    | END1 | END2 | END3 |

reStructuredText:

.. code:: rst

    .. table:: caption
        :name: label

        +------+------+------+
        | TOP1 | TOP2 | TOP3 |
        +======+======+======+
        | 1    | 2    | 3    |
        +------+------+------+
        | AAAA | BBBB | CCCC |
        +------+------+------+
        | END1 | END2 | END3 |
        +------+------+------+

Hyperlinks
~~~~~~~~~~

External hyperlinks
^^^^^^^^^^^^^^^^^^^

Org:

::

    [[http://orgmode.org][Org Mode]]

    [[http://orgmode.org]]

reStructuredText:

.. code:: rst

    `Org Mode <http://orgmode.org/>`_

    `http://orgmode.org`_

Internal links
^^^^^^^^^^^^^^

Org:

::

    This is an <<example>> cross reference target.

    Internal cross references, like [[example]]

reStructuredText:

.. code:: rst

    This is an  _`example`  cross reference target.

    Internal cross references, like `example`_

Org:

::

    * headline

    Internal cross references, [[*headline]]

reStructuredText:

.. code:: rst

    headline
    --------

    Internal cross references, `headline`_

Org:

::

    * headline
      :PROPERTIES:
      :CUSTOM_ID: customid
      :END:

    Internal cross references, headline [[#customid]]

reStructuredText:

.. code:: rst

    .. _customid:

    headline
    --------

    Internal cross references, headline `customid`_

Org:

::

    #+NAME: sampletable
    | a | b | c |
    | 1 | 2 | 3 |

    Internal cross references, label [[sampletable]]

reStructuredText:

.. code:: rst

    .. table::
      :name: sampletable

      +---+---+---+
      | a | b | c |
      +---+---+---+
      | 1 | 2 | 3 |
      +---+---+---+

    Internal cross references, label `sampletable`_

Org:

::

    #+NAME: samplefigure
    [[./image.jpg]]

    Internal cross references, label [[samplefigure]]

reStructuredText:

.. code:: rst

    .. _samplefigure:

    .. image:: ./image.jpg

    Internal cross references, label `samplefigure`_

Footnote
~~~~~~~~

Org:

::

    * footnote sample

    Org mode[fn:org] is for keeping notes, maintaining TODO lists, planning projects, and authoring documents with a fast and effective plain-text system.

    reStructuredText[fn:rest] is plaintext that uses simple and intuitive constructs to indicate the structure of a document.

    [fn:org] org-mode [[http://orgmode.org]]
    [fn:rest] reStructuredText [[http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html]]

reStructuredText:

.. code:: rst

    footnote sample
    ---------------

    Org mode [2]_  is for keeping notes, maintaining TODO lists, planning projects, and authoring documents with a fast and effective plain-text system.

    reStructuredText [1]_  is plaintext that uses simple and intuitive constructs to indicate the structure of a document.


    .. [1] reStructuredText `http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html <http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html>`_

    .. [2] org-mode `http://orgmode.org <http://orgmode.org>`_

Export reStructuredText fragments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Org:

::

    See also @@rst::meth:`mypackage.mymodule.MyClass.mymethod()`@@.

    #+RST: .. class:: alert

    #+BEGIN_EXPORT rst
    .. class:: alert
    #+END_EXPORT

reStructuredText:

.. code:: rst

    See also :meth:`mypackage.mymodule.MyClass.mymethod()`.

    .. class:: alert

    .. class:: alert
