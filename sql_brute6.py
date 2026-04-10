# The error "RangeError: Too few parameter values were provided" means that the SQL query
# expected parameters, but the parameter provided was an object so it didn't pass it correctly.
# If we pass {"$gt": ""} as username, sqlite3 driver or whatever driver fails to extract the parameter.
# But wait! If `username` is an array?
