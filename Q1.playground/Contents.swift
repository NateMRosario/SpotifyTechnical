//: Playground - noun: a place where people can play

import UIKit

/* Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg". */

let string = "weather"
let target = "therapyw"

func sortByStrings(s str: String, t targetString: String) -> String {
    var sortedString = String()
    //Frequency dictionary
    var stringDict = [Character:Int]()
    
    //Loops through a string to set Int values to determine how many times to repeat a character
    for char in str {
        if stringDict[char] == nil {
            stringDict[char] = 1
        } else {
            stringDict[char]! += 1
        }
    }
    //Loops through targetString to check and append Characters in sortedString from stringDict
    for target in targetString {
        if stringDict[target] != nil {
            sortedString.append(String(repeatElement(target, count: stringDict[target]!)))
        }
    }
    return sortedString
}
sortByStrings(s: string, t: target)


