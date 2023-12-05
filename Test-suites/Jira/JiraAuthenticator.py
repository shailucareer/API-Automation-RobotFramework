import base64


# Example of a keyword that a test author would supply in order to use the
# `Create Custom Session` keyword.  Such a keyword can return any subclass
# of `AuthBase`.
# http://docs.python-requests.org/en/master/user/advanced/#custom-authentication


def get_jira_auth():
    temp = "testteam.fullstack@gmail.com"+":"+"ATATT3xFfGF0Ia0alHE5oOsm02BEoE_M5RuxXcZ52K5Bm3oE2qUkpyIHMA5WMHmj6P9OCI_5n9IoeFbmRe852fLgme27uAD0xfWGvT9jinGDHO3agQg4Wubw9EkD4fwaI-XZMURNNitwusOXMGnl_XoL9_AYonuBqi-nnrFwDVRT6eeH5P5pqrI=79B69C90"
    print("HELLO1")
    print(temp)
    print("HELLO2")
    print(base64.b64encode(temp.encode('utf-8')).decode('utf-8'))
    print("HELLO3")
    return "Basic "+base64.b64encode(temp.encode('utf-8')).decode('utf-8')