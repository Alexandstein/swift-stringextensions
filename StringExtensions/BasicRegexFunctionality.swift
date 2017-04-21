//
//  BasicRegexFunctionality.swift
//  StringExtensions
//
//  Created by Alex Stein on 6/18/16.
//  Copyright © 2016 Alexander Stein. All rights reserved.
//

import Foundation

public extension String{
    
    
    /**
     Determines whether there are any matches within the string.
     
     - Parameter pattern: The regular expression to search the string with
     
     - Returns: True if any matches are found.
     */
    public func hasMatch(_ pattern: String) -> Bool{
        let matchArray = self.matches(withPattern: pattern)!
        
        return matchArray.count > 0;
    }
    
    
    /**
     Fetches matches in a string
     
     - Parameter pattern: The regular expression to search the string with
     
     - Returns: An array populated with the string results, if any.
     */
    public func matches(withPattern pattern: String) -> [String]!{
        
        var matches : [String]! = []
        let nsRegex = try? NSRegularExpression(pattern: pattern, options: [])
        let rawMatchInfo = nsRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        
        for result in rawMatchInfo!{
            let substringStart = result.range.location
            let substringLength = result.range.length
            
            //Use substring subscript from StringExtensions.swift to get result to append
            let stringMatch = self[substringStart, substringLength]!
            matches.append(stringMatch)
       }
        
        return matches
    }
    
    /**
     Gets the first substring that matches the pattern
     
     - Parameter pattern: The regular expression to search the string with
     
     - Returns: The first matched string, or nil if no matches
     */
    public func matchFirst(_ pattern: String) -> String?{
        let allMatches = self.matches(withPattern: pattern)
        let firstMatch : String? = (allMatches?.count)! > 0 ? allMatches?[0] : nil
        
        return firstMatch
    }
}
