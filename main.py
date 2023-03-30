import datetime


def current_timestamp():
    now = datetime.datetime.now()
    return now


def timestamp_to_binary(timestamp=None):    
    if timestamp == None:
        timestamp = current_timestamp()
    str_timestamp = str(timestamp)

    # printing original string
    print("The original string is : " + str(str_timestamp))

    # using join() + bytearray() + format()
    # Converting String to binary
    res = "".join(format(i, "08b") for i in bytearray(str_timestamp, encoding="utf-8"))

    # printing result
    print("The string after binary conversion : " + str(res))

    return str(res)


timestamp_to_binary()
