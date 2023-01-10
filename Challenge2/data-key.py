import json
# Load and Convert JSON string to dictionary
with open('meta_data_azure_resource.json','r') as jsonFile:
    data = json.load(jsonFile)

print("Azure resource metadata in key:value pair\n")

#to display all the key value pairs
for key, value in data.items():
    print(key, value,sep=" -: ")

print("******************************************\n")
#to retrieve a particular data-key pair or some relevant key values against the major data key

datakey = input('Enter the key attribute to retrieve few details (ex: type id):')
print("*****Output******\n")
if datakey in data:
    print(data.get('id'),"\nStorage account [",data["name"],"] with the type [",data.get('kind'),
     "]\n ...is located in the zone:",data["location"])    #data["kind"]
else:
    print("Key doesn't exist in json file")


