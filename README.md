Swift Basic String Extensions
=============================

This is just a basic implementation of some regex and string helper methods partially to give me some syntactical sugar, but mostly to help myself get familiarized with the language.

  
Methods
-------

*GeneralStringExtensions.swift*

    public subscript(startIndex: Int, length: Int) -> String!
     Uses subscripting to allow getting substrings from strings using Ints
     
     - Parameter startIndex: The position in the string to begin
     - Parameter length: How far down the string to end the substring
     
     - Returns: Substring given the above parameters

*BasicRegexFunctionality.swift*

    public func hasMatch(pattern: String) -> Bool
     Determines whether there are any matches within the string.
     
     - Parameter pattern: The regular expression to search the string with
     - Returns: True if any matches are found.


    public func matches(pattern: String) -> [String]!
     Fetches matches in a string
     
     - Parameter pattern: The regular expression to search the string with
     - Returns: An array populated with the string results, if any.


    public func matchFirst(pattern: String) -> String?
     Gets the first substring that matches the pattern
     
     - Parameter pattern: The regular expression to search the string with
     - Returns: The first matched string, or nil if no matches
