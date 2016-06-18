//
//  StringExtensions.swift
//  StringExtensions
//
//  Created by Alex Stein on 6/18/16.
//  Copyright © 2016 Alexander Stein. All rights reserved.
//

import Foundation

public extension String{
    
    /**
     Uses subscripting to allow getting substrings from strings
     
     - Parameter startIndex: The position in the string to begin
     - Parameter length: How far down the string to end the substring
     
     -Returns: Substring given the above parameters
     */
    public subscript(startIndex: Int, length: Int) -> String!{
        get{
            let start = self.startIndex.advancedBy(startIndex, limit: self.endIndex)
            let end = start.advancedBy(length, limit: self.endIndex)
            let substringRange = start..<end
            
            guard (start < self.endIndex && end < self.endIndex
                && start.advancedBy(length, limit: self.endIndex) < self.endIndex) else{
                    return nil
            }
            
            return self.substringWithRange(substringRange)
        }
    }
}