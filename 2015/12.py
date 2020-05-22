"""--- Day 12: JSAbacusFramework.io ---"""

import json

def process(data, ignore_red):
    total = 0
    data_type = type(data)
    if data_type == list:
        for item in data:
            total += process(item, ignore_red)
        return total
    if data_type == dict:
        for _, item in data.items():
            if ignore_red and item == 'red':
                return 0
            total += process(item, ignore_red)
        return total
    if data_type == int:
        return data
    return 0

with open("input/12.txt") as f:
    j = json.load(f)
    print(process(j, False))
    print(process(j, True))
