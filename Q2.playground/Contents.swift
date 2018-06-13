//: Playground - noun: a place where people can play

import UIKit

//Extension to determine Int in a String
extension Character {
    var isInt: Bool {
        return Int(String(self)) != nil
    }
}
/* Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab"
 For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
 */

let string = "2[b3[a]]"

func decodeString(s string: String) -> String {
    
    //Array "Stacks"
    var intArrayStack = [Int]()
    var stringArrayStack = [String]()
    //Strings
    var tempString = String()
    var resultString = String()
    
    //Appending to Stacks
    for element in string {
        
        //Int count for repeating element
        var repeatCount = 0
        
        if element != "]" {
            //Checking for Int or Character to append to seperate Stacks
            if element.isInt {
                intArrayStack.append(Int(String(element))!)
            } else {
                stringArrayStack.append(String(element))
            }
        } else {
            //Setting repeatCount to determine repeating count
            if !intArrayStack.isEmpty {
                repeatCount = intArrayStack.popLast()!
            }
            while !stringArrayStack.isEmpty && stringArrayStack.last != "[" {
                tempString.append(stringArrayStack.popLast()!)
            }
            if !stringArrayStack.isEmpty && stringArrayStack.last == "[" {
                stringArrayStack.popLast()
            }
            // Repeat and add to Stack
            stringArrayStack.append(String(repeating: tempString, count: repeatCount))
            // Reset tempString for the next iteration
            tempString = String()
        }
    }
    //Converting the ArrayStack into a String and reversing it
    resultString = stringArrayStack.joined()
    return String(resultString.reversed())
}

decodeString(s: string)



