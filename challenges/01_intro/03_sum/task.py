import random
import json


out = [str(n := random.randint(1, 1000))]
s = 0
for _ in range(n):
    out.append(str(x := random.randint(-10000, 10000)))
    s += x
print(json.dumps({"in": "\n".join(out), "out": str(s)}))
