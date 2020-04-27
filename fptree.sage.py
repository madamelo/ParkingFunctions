

# This file was *autogenerated* from the file fptree.sage
from sage.all_cmdline import *   # import sage library

sage.repl.load.load(sage.repl.load.base64.b64decode("ZnAuc2FnZQ=="),globals(),False)

class FPT :
    E = []
    val = []
    children = []

    def __init__(self, E, val, children) :
        self.E = E
        self.val = val
        self.children = children

    def get_list_val (self) :
        if children == [] : return val
        R = val
        for c in children :
            l = get_list_val (c)
            R = R + l
        return R

    def is_FPT (self) :
        if len (val) != len (children) :
            return False
        if get_list_val (self) != E :
            return False
        return True


