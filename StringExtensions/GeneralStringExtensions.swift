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
     Uses subscripting to allow getting substrings from strings using Ints
     
     - Parameter startIndex: The position in the string to begin
     - Parameter length: How far down the string to end the substring
     
     -Returns: Substring given the above parameters
     */
    public subscript(startIndex: Int, length: Int) -> String?{
        get{
            //Get character indices and advance their position as needed
            
            if let start = self.characters.index(self.startIndex, offsetBy: startIndex, limitedBy: self.endIndex),
               let end = self.characters.index(start, offsetBy: length, limitedBy: self.endIndex){
                let substringRange = start..<end
                
                //Make sure the indices are within the bounds of the string, otherwise nil
                guard (start < self.endIndex && end < self.endIndex
                    && self.characters.index(start, offsetBy: length, limitedBy: self.endIndex)! < self.endIndex) else{
                        return nil
                }
                return self.substring(with: substringRange)
            }else{
                return nil
            }
        }
    }
    
    
}
