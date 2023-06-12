# encoding: utf-8
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Contact: Kyle Lahnakoski (kyle@lahnakoski.com)
#



import json
import sys

from collections import OrderedDict, UserDict
from collections.abc import Callable, Iterable, Mapping, Set, MutableMapping
from functools import cmp_to_key, reduce, update_wrapper
from configparser import ConfigParser
from itertools import zip_longest
import builtins as __builtin__
from builtins import input
from html.parser import HTMLParser
from urllib.parse import urlparse
from io import StringIO
from io import BytesIO
from _thread import allocate_lock, get_ident, start_new_thread, interrupt_main


__all__ = []

PYPY = False
PY2 = False
PY3 = True
try:
    import __pypy__ as _

    PYPY = True
except Exception:
    PYPY = False


none_type = type(None)
boolean_type = type(True)

try:
    STDOUT = sys.stdout.buffer
except Exception as e:
    # WE HOPE WHATEVER REPLACED sys.stdout CAN HANDLE BYTES IN UTF8
    STDOUT = sys.stdout

try:
    STDERR = sys.stderr.buffer
except Exception as e:
    # WE HOPE WHATEVER REPLACED sys.stderr CAN HANDLE BYTES IN UTF8
    STDERR = sys.stderr

try:
    from time import process_time
except:
    from time import clock as process_time

izip = zip
text = str
string_types = str
binary_type = bytes
integer_types = (int,)
number_types = (int, float)
long = int
unichr = chr
round = round
xrange = range
POS_INF = float("+inf")


def _gen():
    yield


generator_types = (
    type(_gen()),
    type(filter(lambda x: True, [])),
    type({}.items()),
    type({}.values()),
    type(map(lambda: 0, iter([]))),
    type(reversed([])),
    type(range(1)),
)


def items(d):
    return list(d.items())


def iteritems(d):
    return d.items()


def transpose(*args):
    return list(zip(*args))


def get_function_name(func):
    return func.__name__


def get_function_arguments(func):
    return func.__code__.co_varnames[: func.__code__.co_argcount]


def get_function_code(func):
    return func.__code__


def get_function_defaults(func):
    return func.__defaults__


def sort_using_cmp(data, cmp):
    return sorted(data, key=cmp_to_key(cmp))


def sort_using_key(data, key):
    return sorted(data, key=key)


def first(values):
    try:
        return iter(values).__next__()
    except StopIteration:
        return None


def NEXT(_iter):
    """
    RETURN next() FUNCTION, DO NOT CALL
    """
    return _iter.__next__


def next(_iter):
    return _iter.__next__()


def is_text(t):
    return t.__class__ is str


def is_binary(b):
    return b.__class__ is bytes


utf8_json_encoder = (
    json
    .JSONEncoder(
        skipkeys=False,
        ensure_ascii=False,  # DIFF FROM DEFAULTS
        check_circular=True,
        allow_nan=True,
        indent=None,
        separators=(",", ":"),
        default=None,
        sort_keys=True,  # <-- IMPORTANT!  sort_keys==True
    )
    .encode
)


function_type = (lambda: None).__class__


class decorate(object):
    def __init__(self, func):
        self.func = func

    def __call__(self, caller):
        """
        :param caller: A METHOD THAT IS EXPECTED TO CALL func
        :return: caller, BUT WITH SIGNATURE OF  self.func
        """
        return update_wrapper(caller, self.func)


def extend(cls):
    """
    DECORATOR TO ADD METHODS TO CLASSES
    :param cls: THE CLASS TO ADD THE METHOD TO
    :return:
    """

    def extender(func):
        setattr(cls, get_function_name(func), func)
        return func

    return extender


def flatten(items):
    return (vv for v in items for vv in v)


_keep_imports = (
    __builtin__,
    allocate_lock,
    BytesIO,
    Callable,
    ConfigParser,
    get_ident,
    HTMLParser,
    input,
    interrupt_main,
    Iterable,
    izip,
    Mapping,
    MutableMapping,
    OrderedDict,
    process_time,
    reduce,
    Set,
    start_new_thread,
    StringIO,
    transpose,
    urlparse,
    UserDict,
    zip_longest,
)

