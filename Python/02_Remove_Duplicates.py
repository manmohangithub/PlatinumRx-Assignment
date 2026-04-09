# 02_Remove_Duplicates.py
# Removes duplicate characters using loop

def remove_duplicates(s):
    result = ""
    for char in s:
        if char not in result:
            result += char
    return result

# Test Cases
print(remove_duplicates("programming"))  # progamin
print(remove_duplicates("hello"))        # helo
print(remove_duplicates("aabbcc"))      # abc
