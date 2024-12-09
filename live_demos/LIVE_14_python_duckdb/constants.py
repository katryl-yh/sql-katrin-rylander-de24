from pathlib import Path
# __file__ - dunder file
# returns the absolute path to file constants.py
# / "data" -> concatenate the absolute path with / "data"
# # / operator works here because of operator overloading and polymorphism 
DATA_PATH = Path(__file__).parent / "data"
DATABASE_PATH = Path(__file__).parent / "goteborg_stad.db" # it is possible to use .duckdb (there is a bit of difference between the two)

print (DATA_PATH)

