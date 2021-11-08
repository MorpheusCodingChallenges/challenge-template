import random
import string
import json


x = "".join(random.choice(string.ascii_letters + string.digits + "!#$%&'()*+,-./:;<=>?@[]^_`{|}~") for _ in range(random.randint(1, 100)))
print(json.dumps({"in": x, "out": x}))
