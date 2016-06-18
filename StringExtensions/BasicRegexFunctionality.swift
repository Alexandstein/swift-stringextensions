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
    public func hasMatch(pattern: String) -> Bool{
        let matchArray = self.matches(pattern)
        
        return matchArray.count > 0;
    }
    
    
    /**
     Fetches matches in a string
     
     - Parameter pattern: The regular expression to search the string with
     
     - Returns: An array populated with the string results, if any.
     */
    public func matches(pattern: String) -> [String]!{
        
        var matches : [String]! = []
        let nsRegex = try? NSRegularExpression(pattern: pattern, options: [])
        let rawMatchInfo = nsRegex?.matchesInString(self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        
        for result in rawMatchInfo!{
            //Get substring
            let substringBegin = self.startIndex.advancedBy(result.range.location)
            let substringEnd = substringBegin.advancedBy(result.range.length)
            
            let resultsRange = substringBegin..<substringEnd
            let stringMatch = self.substringWithRange(resultsRange)
            
            matches.append(stringMatch)
        }
        
        return matches
    }
    
    /**
     Gets the first substring that matches the pattern
     
     - Parameter pattern: The regular expression to search the string with
     
     - Returns: The first matched string, or nil if no matches
     */
    public func matchFirst(pattern: String) -> String?{
        let allMatches = self.matches(pattern)
        let firstMatch : String? = allMatches.count > 0 ? allMatches[0] : nil
        
        return firstMatch
    }
}




