//
//  Memory.swift
//  Sail
//
//  Created by Gerardo Osio on 5/6/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

class Memory {
    
    // MARK: - Properties
    
    let baseAddress: Int!
    let addressSize: Int!
    
    // MARK: Data Type Base Addresses
    
    private let characterBaseAddress: Int!
    private let floatBaseAddress: Int!
    private let intBaseAddress: Int!
    private let stringBaseAddress: Int!
    private let boolBaseAddress: Int!
    
    // MARK: Data Type Arrays
    
    private var characters: [Character?]!
    private var floats: [Float?]!
    private var ints: [Int?]!
    private var strings: [String?]!
    private var bools: [Bool?]!
    
    
    
    // MARK: - Initializers
    
    init(baseAddress: Int, addressSize: Int = 4000) {
        self.baseAddress = baseAddress
        self.addressSize = addressSize
        
        characterBaseAddress = baseAddress
        floatBaseAddress = baseAddress + addressSize
        intBaseAddress = baseAddress + addressSize * 2
        stringBaseAddress = baseAddress + addressSize * 3
        boolBaseAddress = baseAddress + addressSize * 4
        
        clear()
    }
    
    
    
    // MARK: - Methods
    
    func clear() {
        characters = []
        floats = []
        ints = []
        strings = []
        bools = []
    }
    
    // MARK: Variables
    
    func getAddress(for dataType: DataType) -> Int {
        
        switch dataType {
        case .bool:
            bools.append(nil)
            return boolBaseAddress + bools.count - 1
        case .character:
            characters.append(nil)
            return characterBaseAddress + characters.count - 1
        case .float:
            floats.append(nil)
            return floatBaseAddress + floats.count - 1
        case .int:
            ints.append(nil)
            return intBaseAddress + ints.count - 1
        case .string:
            strings.append(nil)
            return stringBaseAddress + strings.count - 1
        default:
            return -1
        }
    }
    
    func save(bool: Bool? = nil, character: Character? = nil, float: Float? = nil, int: Int? = nil, string: String? = nil) -> Int {
        
        if let boolValue = bool {
            bools.append(boolValue)
            return boolBaseAddress + bools.count - 1
        } else if let characterValue = character {
            characters.append(characterValue)
            return characterBaseAddress + characters.count - 1
        } else if let floatValue = float {
            floats.append(floatValue)
            return floatBaseAddress + floats.count - 1
        } else if let intValue = int {
            ints.append(intValue)
            return intBaseAddress + ints.count - 1
        } else if let stringValue = string {
            strings.append(stringValue)
            return stringBaseAddress + strings.count - 1
        } else {
            return -1
        }
    }
    
    // MARK: Constants
    
    func findConstant(bool: Bool) -> Int? {
        
        guard let boolAddress = bools.firstIndex(of: bool) else {
            return nil
        }
        
        return boolBaseAddress + boolAddress
    }
    
    func findConstant(character: Character) -> Int? {
        
        guard let characterAddress = characters.firstIndex(of: character) else {
            return nil
        }
        
        return characterBaseAddress + characterAddress
    }
    
    func findConstant(float: Float) -> Int? {
        
        guard let floatAddress = floats.firstIndex(of: float) else {
            return nil
        }
        
        return floatBaseAddress + floatAddress
    }
    
    func findConstant(int: Int) -> Int? {
        
        guard let intAddress = ints.firstIndex(of: int) else {
            return nil
        }
        
        return intBaseAddress + intAddress
    }
    
    func findConstant(string: String) -> Int? {
        
        guard let stringAddress = strings.firstIndex(of: string) else {
            return nil
        }
        
        return stringBaseAddress + stringAddress
    }
    
    // MARK: Private Methods
    
}
