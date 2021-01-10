#!/usr/bin/env python

import json
import yaml

string_example = "Hello world!"
integer_example = 100
float_example = 3.14159

list_example = ["a", "b", "c", 24]
dict_example = {"A": "a", "max": 42}

example = {
    "str": string_example,
    "int": integer_example,
    "flt": float_example,
    "lst": list_example,
    "dct": dict_example,
}

data = json.dumps(example)
new_obj = yaml.safe_load(data)
print(new_obj)