import random
import json


def generate(N):
    n = random.randint(N//10, N)
    print(json.dumps({"in": str(n), "out": str(n*(n+1)//2)}))
