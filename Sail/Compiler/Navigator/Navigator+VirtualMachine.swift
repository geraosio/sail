//
//  Navigator+VirtualMachine.swift
//  Sail
//
//  Created by Gerardo Osio on 5/10/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

// MARK: - Virtual Machine
// These are all the functions used for the execution of the intermediate code.
// The functionality is an extension the Navigator class which handles the compilation process.
// The Virtual Machine reuses the Memory from the compilation process to save calculated
// values at runtime.

extension Navigator {
    
    // MARK: - Utilities
    
    func getValue(inAddress address: Int) -> (Any, DataType) {
        switch address {
        case ..<0:
            // Array addresses
            let (arrayAddress, _) = getValue(inAddress: -address)
            return getValue(inAddress: arrayAddress as! Int)
        case ..<constantsBaseAddress:
            // Functions
            let function = getFunction(address: address)
            let returnAddress = globalFunction.getVariable(name: (function?.name)!)?.address
            return getValue(inAddress: returnAddress!)
        case ..<globalBaseAddress:
            // Constants
            return constantsMemory.getValue(inAddress: address)
        case ..<localBaseAddress:
            // Globals
            return globalMemory.getValue(inAddress: address)
        case ..<temporalGloablBaseAddress:
            // Locals
            return localMemory.getValue(inAddress: address)
        case ..<temporalLocalBaseAddress:
            // Temporal Global
            return temporalGlobalMemory.getValue(inAddress: address)
        default:
            // Temporal Local
            return temporalLocalMemory.getValue(inAddress: address)
        }
    }
    
    func saveInMemory(value: Any, inAddress address: Int) {
        switch address {
        case ..<0:
            // Array addresses
            let (arrayAddress, _) = getValue(inAddress: -address)
            saveInMemory(value: value, inAddress: arrayAddress as! Int)
        case ..<constantsBaseAddress:
            // Functions
            let function = getFunction(address: address)
            let returnAddress = globalFunction.getVariable(name: (function?.name)!)?.address
            saveInMemory(value: value, inAddress: returnAddress!)
        case ..<globalBaseAddress:
            // Constants
            constantsMemory.save(value: value, inAddress: address)
        case ..<localBaseAddress:
            // Globals
            globalMemory.save(value: value, inAddress: address)
        case ..<temporalGloablBaseAddress:
            // Locals
            localMemory.save(value: value, inAddress: address)
        case ..<temporalLocalBaseAddress:
            // Temporal Global
            temporalGlobalMemory.save(value: value, inAddress: address)
        default:
            // Temporal Local
            temporalLocalMemory.save(value: value, inAddress: address)
        }
    }
    
    func save(memory: Memory) {
        let memoryCopy = Memory(baseAddress: memory.baseAddress, addressSize: memory.addressSize)
        memoryCopy.copy(contents: memory)
        
        savedMemories.append(memoryCopy)
    }
    
    func getCopy(memory: Memory) -> Memory {
        let newMemory = Memory(baseAddress: memory.baseAddress, addressSize: memory.addressSize)
        newMemory.copy(contents: memory)
        
        return newMemory
    }
    
    func getFunction(address: Int) -> Function? {
        return functionTable.values.first { (function) -> Bool in function.address == address }
    }
    
    // MARK: - Sail through quadruples
    
    func sail() {
        
        // Will be the pointer of the current quadruple
        var sailIndex = 0
        
        // Clear and reuse Local, Global, TemporalLocal and TemporalGlobal Memories for execution
        globalMemory.clear()
        localMemory.clear()
        temporalGlobalMemory.clear()
        temporalLocalMemory.clear()
        
        // Start the Memories' addresses with nil to be able to add the calculated values in their respective addresses
        globalMemory.allocate()
        localMemory.allocate()
        temporalGlobalMemory.allocate()
        temporalLocalMemory.allocate()
        
        // Start executing each operation
        while sailIndex < quadruples.count {
            
            let quadruple = quadruples[sailIndex]
            
            switch quadruple.op {
            // MARK: - Addition
            case .addition:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) + (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) + (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) + Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) + (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Subtraction
            case .subtraction:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) - (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) - (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) - Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) - (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Multiplication
            case .multiplication:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) * (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) * (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) * Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) * (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Division
            case .division:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) / (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) / (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) / Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) / (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - And
            case .and:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                let (rightValue, _) = getValue(inAddress: quadruple.right!)
                
                saveInMemory(value: (leftValue as! Bool) && (rightValue as! Bool), inAddress: quadruple.result!)
            // MARK: - Or
            case .or:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                let (rightValue, _) = getValue(inAddress: quadruple.right!)
                
                saveInMemory(value: (leftValue as! Bool) || (rightValue as! Bool), inAddress: quadruple.result!)
            // MARK: - Not
            case .not:
                break
            // MARK: - Equal
            case .equal:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) == (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) == (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) == Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) == (rightValue as! Float), inAddress: quadruple.result!)
                case (.character, .character):
                    saveInMemory(value: (leftValue as! Character) == (rightValue as! Character), inAddress: quadruple.result!)
                case (.character, .string):
                    saveInMemory(value: String(leftValue as! Character) == (rightValue as! String), inAddress: quadruple.result!)
                case (.string, .character):
                    saveInMemory(value: (leftValue as! String) == String(rightValue as! Character), inAddress: quadruple.result!)
                case (.string, .string):
                    saveInMemory(value: (leftValue as! String) == (rightValue as! String), inAddress: quadruple.result!)
                case (.bool, .bool):
                    saveInMemory(value: (leftValue as! Bool) == (rightValue as! Bool), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Not Equal
            case .notEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) != (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) != (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) != Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) != (rightValue as! Float), inAddress: quadruple.result!)
                case (.character, .character):
                    saveInMemory(value: (leftValue as! Character) != (rightValue as! Character), inAddress: quadruple.result!)
                case (.character, .string):
                    saveInMemory(value: String(leftValue as! Character) != (rightValue as! String), inAddress: quadruple.result!)
                case (.string, .character):
                    saveInMemory(value: (leftValue as! String) != String(rightValue as! Character), inAddress: quadruple.result!)
                case (.string, .string):
                    saveInMemory(value: (leftValue as! String) != (rightValue as! String), inAddress: quadruple.result!)
                case (.bool, .bool):
                    saveInMemory(value: (leftValue as! Bool) != (rightValue as! Bool), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Greater Than
            case .greater:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) > (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) > (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) > Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) > (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Less Than
            case .less:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) < (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) < (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) < Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) < (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Greater Than or Equal
            case .greaterEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) >= (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) >= (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) >= Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) >= (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Less Than or Equal
            case .lessEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) <= (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) <= (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) <= Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) <= (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - False Bottom
            case .falseBottom:
                break
            // MARK: - Print
            case .print:
                let (resultValue, _) = getValue(inAddress: quadruple.result!)
                results.append("\(resultValue)")
            // MARK: - Assign
            case .assign:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                saveInMemory(value: leftValue, inAddress: quadruple.result!)
            // MARK: - Goto
            case .goto:
                sailIndex = quadruple.result! - 1
            // MARK: - GotoF
            case .gotoFalse:
                sailIndex = quadruple.result! - 1
            // MARK: - GotoT
            case .gotoTrue:
                sailIndex = quadruple.result! - 1
            // MARK: - ERA
            case .era:
                // Save in stack in the case there's nesting in function calls
                calledFunctionsAddresses.append(quadruple.result!)
                
                // Create new Memorys with the Local and Local Temporal Memorys' baseAddress
                runtimeFunctionLocalMemory = Memory(baseAddress: localMemory.baseAddress)
                runtimeFunctionTemporalMemory = Memory(baseAddress: temporalLocalMemory.baseAddress)
                
                // Set all addresses to nil
                runtimeFunctionLocalMemory.allocate()
                runtimeFunctionTemporalMemory.allocate()
            // MARK: - Parameter
            case .parameter:
                // Get the value that was passed as argument
                let (argumentValue, _) = getValue(inAddress: quadruple.left!)
                
                runtimeFunctionLocalMemory.save(value: argumentValue, inAddress: quadruple.result!)
            // MARK: - GoSub
            case .gosub:
                // Save current memory
                save(memory: localMemory)
                save(memory: temporalLocalMemory)
                
                // Set current memory with the runtime contents
                localMemory = getCopy(memory: runtimeFunctionLocalMemory)
                temporalLocalMemory = getCopy(memory: runtimeFunctionTemporalMemory)
                
                // Save index for the return
                savedRuntimeQuadrupleIndices.append(sailIndex)
                
                // Get the function from the address
                let function = getFunction(address: quadruple.result!)
                
                // Remove the last function, which will be accessed
                _ = calledFunctionsAddresses.popLast()
                
                // Save function address
                savedFunctionsAddresses.append(quadruple.result!)
                
                // Go to where the function starts the next loop iteration
                sailIndex = (function?.quadrupleIndex)! - 1
            // MARK: - Return
            case .returnValue:
                // Get the function name
                let currentRuntimeFunctionAddress = savedFunctionsAddresses.last!
                let currentRuntimeFunction = getFunction(address: currentRuntimeFunctionAddress)!
                let returnVariable = globalFunction.getVariable(name: currentRuntimeFunction.name)
                let returnAddress = returnVariable?.address
                
                let (returnValue, _) = getValue(inAddress: quadruple.result!)
                
                saveInMemory(value: returnValue, inAddress: returnAddress!)
            // MARK: - EndFunc
            case .endFunction:
                // Get to the next quadruple after where the call was made
                sailIndex = savedRuntimeQuadrupleIndices.popLast()!
                
                // Remove from function addresses
                _ = savedFunctionsAddresses.popLast()
                
                // Restore Memorys
                temporalLocalMemory = getCopy(memory: savedMemories.popLast()!)
                localMemory = getCopy(memory: savedMemories.popLast()!)
            case .verify:
                let (indexValue, _) = getValue(inAddress: quadruple.result!)
                
                if (indexValue as! Int) >= quadruple.right! {
                    let error = NavigatorError(type: .runtime, atLine: nil, positionInLine: nil, description: "Array index out of bounds. Trying to access index larger than it's size")
                    errors.append(error)
                    sailIndex = quadruples.count
                }
            case .end:
                sailIndex = quadruples.count
            }
            
            sailIndex += 1
        }
    }
    
}
