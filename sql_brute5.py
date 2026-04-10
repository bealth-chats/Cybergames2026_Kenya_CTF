import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# The database might be treating the OBJECT as something that always returns true, or it throws an error in the query itself?
# Wait, if the query throws an error, does it return 500?
# The 500 error we got earlier explicitly said:
# RangeError: Too few parameter values were provided
# at /app/routes/v2.js:37:69

# So line 37 in v2.js is throwing an error!
# Let's read the error stack trace carefully.
