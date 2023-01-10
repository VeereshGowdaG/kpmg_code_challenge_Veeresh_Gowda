class FetchKeyVal(dict):
    def get(self, path, default=None):
        keys = path.split("/")
        val = None

        for key in keys:
            if val:
                val = val.get(key, default)
            else:
                val = dict.get(self, key, default)

            if not val:
                break
        return val

print("*****Dictionary as input for the object*****")
#"x":{"y":{"z":"a"}}
obj_dict = {    "a":{"b":{"c":"d"}}    }
print(obj_dict)
keyy = input("Enter the key for above object: ")
print(FetchKeyVal(obj_dict).get(keyy))

#input: a       output: {'b': {'c': 'd'}}
#input a/b      output: {'c': 'd'}
#input a/b/c    output: d