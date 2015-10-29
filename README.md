# Caesar Cipher

This is a very old way of encrypting messages for more information on Caesar Cipher,
go to Wikipedia: https://en.wikipedia.org/wiki/Caesar_cipher

This program was created on Ruby version 2.0.0

It works only Mac or linux OS.

This program allows you:

* Encrypt by offsetting to any value you want.

* Whenever encounters a character non existent on alphabet,
it doesn't give you any errors.

* It also includes a decipher method.

####### About the decipher method ######

* Version 1.0

The decipher method is based on the search for the most common words. So
it's far from being perfect.

* Version 2.0

The version 2.0 uses the linux word dictionary: "/usr/share/dict/words". it's pretty fun!

######## To do list ########

* make sure it *downcase* the string to make sure all the words gets to be ciphered or
deciphered *** Done! ***

* find a way to use a word dictionary instead of common words to decipher *** Done! ***

* it takes a bit of time. I need to find ways to go faster. 
