//
//  Navigator+GrammarActions.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

// MARK: - Grammar Actions
// These are the grammar actions
// They are being called every time the walker goes to each grammar rule.
// To save all the information I used the Navigator singleton.

class NavigatorListener: SailBaseListener {
    
    let navigator = Navigator.shared
    
    override func enterProgram(_ ctx: SailParser.ProgramContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let quadruple = Quadruple(op: .goto)
        navigator.quadruples.append(quadruple)
        
        // Save quadruple to fill it with the beginning quadruples of the main function
        navigator.jumps.append(navigator.quadruples.count - 1)
    }
    
    override func exitProgram(_ ctx: SailParser.ProgramContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let pendingJump = navigator.jumps.popLast() {
            navigator.quadruples[pendingJump].result = navigator.quadruples.count
        }
        
        let endQuadruple = Quadruple(op: .end)
        navigator.quadruples.append(endQuadruple)
        
        // Go through the quadruples
        navigator.sail()
    }
    
    override func enterDeclaration(_ ctx: SailParser.DeclarationContext) { }
    override func exitDeclaration(_ ctx: SailParser.DeclarationContext) { }
    
    override func enterBlock(_ ctx: SailParser.BlockContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        // If it's the beginning of the main fill the first goto with the current quadruple count
        if (ctx.parent as? SailParser.ProgramContext) != nil {
            guard let firstGotoIndex = navigator.jumps.popLast() else {
                return
            }
            
            navigator.quadruples[firstGotoIndex].result = navigator.quadruples.count
        }
    }
    override func exitBlock(_ ctx: SailParser.BlockContext) { }
    
    override func enterStatement(_ ctx: SailParser.StatementContext) { }
    override func exitStatement(_ ctx: SailParser.StatementContext) { }
    
    override func enterAssignment(_ ctx: SailParser.AssignmentContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let idNode = ctx.IDENTIFIER() {
            let variableName = idNode.getText()
            
            guard let variable = navigator.getVariable(name: variableName) else {
                let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\(variableName) does not exist")
                navigator.errors.append(error)
                return
            }
            
            navigator.operands.append(variable.address)
            navigator.operandDataTypes.append(variable.type)
        }
    }
    override func exitAssignment(_ ctx: SailParser.AssignmentContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let resultAddress = navigator.operands.popLast()!
        let resultDataType = navigator.operandDataTypes.popLast()!
        let idAddress = navigator.operands.popLast()!
        let idDataType = navigator.operandDataTypes.popLast()!
        
        let assignmentDataType = SemanticCube.check(op: .assign, leftType: idDataType, rightType: resultDataType)
        
        if assignmentDataType == .error {
            let error = NavigatorError(type: .semantic, atLine: ctx.ASSIGN()?.getSymbol()?.getLine(), positionInLine: ctx.ASSIGN()?.getSymbol()?.getCharPositionInLine(), description: "\(resultDataType.string) can not be assigned to a \(idDataType.string)")
            navigator.errors.append(error)
            return
        } else {
            let quadruple = Quadruple(op: .assign, left: resultAddress, right: nil, result: idAddress)
            navigator.quadruples.append(quadruple)
        }
    }
    
    override func enterCondition(_ ctx: SailParser.ConditionContext) { }
    override func exitCondition(_ ctx: SailParser.ConditionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        // Get the pending jump quadruple index
        let endConditionJumpIndex = navigator.jumps.popLast()!
        // Fill in the result address property of the quadruple with the last quadruple index
        navigator.quadruples[endConditionJumpIndex].result = navigator.quadruples.count
    }
    
    override func enterConditionAction(_ ctx: SailParser.ConditionActionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let expressionType = navigator.operandDataTypes.popLast()
        
        if expressionType != .bool {
            let ctxParent = ctx.parent as! SailParser.ConditionContext
            let error = NavigatorError(type: .compile, atLine: ctxParent.CLOSE_PARENTHESIS()?.getSymbol()?.getLine(), positionInLine: ctxParent.CLOSE_PARENTHESIS()?.getSymbol()?.getCharPositionInLine(), description: "Conditional expression data type is a(n) \(expressionType!.string), it must be a Bool")
            navigator.errors.append(error)
            return
        }
        
        let expressionResult = navigator.operands.popLast()
        let quadruple = Quadruple(op: .gotoFalse, left: expressionResult, right: nil, result: nil)
        navigator.jumps.append(navigator.quadruples.count)
        navigator.quadruples.append(quadruple)
    }
    override func exitConditionAction(_ ctx: SailParser.ConditionActionContext) { }
    
    override func enterConditionElseAction(_ ctx: SailParser.ConditionElseActionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let quadruple = Quadruple(op: .goto)
        let falseJumpIndex = navigator.jumps.popLast()!
        navigator.jumps.append(navigator.quadruples.count)
        navigator.quadruples.append(quadruple)
        navigator.quadruples[falseJumpIndex].result = navigator.quadruples.count
    }
    override func exitConditionElseAction(_ ctx: SailParser.ConditionElseActionContext) { }
    
    override func enterLoop(_ ctx: SailParser.LoopContext) { }
    override func exitLoop(_ ctx: SailParser.LoopContext) { }
    
    override func enterForStmt(_ ctx: SailParser.ForStmtContext) {
        // TODO: Implement For Statement
    }
    override func exitForStmt(_ ctx: SailParser.ForStmtContext) {
        // TODO: Implement For Statement
    }
    
    override func enterForStride(_ ctx: SailParser.ForStrideContext) { }
    override func exitForStride(_ ctx: SailParser.ForStrideContext) { }
    
    override func enterWhileStmt(_ ctx: SailParser.WhileStmtContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        // Save reference to begin of while
        navigator.jumps.append(navigator.quadruples.count)
    }
    override func exitWhileStmt(_ ctx: SailParser.WhileStmtContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let startWhileIndex = navigator.jumps.popLast()!
        let redoWhileIndex = navigator.jumps.popLast()!
        
        let quadruple = Quadruple(op: .goto, left: nil, right: nil, result: redoWhileIndex)
        navigator.quadruples.append(quadruple)
        
        navigator.quadruples[startWhileIndex].result = navigator.quadruples.count
    }
    
    override func enterPrintStmt(_ ctx: SailParser.PrintStmtContext) { }
    override func exitPrintStmt(_ ctx: SailParser.PrintStmtContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let printOperandAddress = navigator.operands.popLast()
        _ = navigator.operandDataTypes.popLast()
        
        let quadruple = Quadruple(op: .print, left: nil, right: nil, result: printOperandAddress)
        navigator.quadruples.append(quadruple)
    }
    
    override func enterVariable(_ ctx: SailParser.VariableContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let variableName = ctx.IDENTIFIER()!.getText()
        
        if navigator.getVariable(name: variableName) != nil {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\"\(variableName)\" already exists")
            navigator.errors.append(error)
            return
        }
        
        let variableType = navigator.getDataType(from: ctx.type()!)
        
        if let arraySizeText = ctx.CONSTANT_INT()?.getText() {
            
            // ARRAY
            let arraySize = Int(arraySizeText)!
            
            do {
                // Allocate the first block of memory for the array and get the address to save it in it's Variable object
                let startAddress = try navigator.getAddress(for: variableType)
                
                // Allocate memory for the array size of the vector
                for _ in 1..<arraySize {
                    _ = try navigator.getAddress(for: variableType)
                }
                
                let variable = Variable(name: variableName, type: variableType, address: startAddress, arraySize: arraySize)
                navigator.currentFunction.save(variable: variable)
                
            } catch let error as NavigatorError {
                error.atLine = ctx.getStart()?.getLine()
                error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                navigator.errors.append(error)
                return
            } catch { }
            
        } else {
            
            // VARIABLE
            do {
                let variableAddress = try navigator.getAddress(for: variableType)
                
                let variable = Variable(name: variableName, type: variableType, address: variableAddress)
                navigator.currentFunction.save(variable: variable)
                
            } catch let error as NavigatorError {
                error.atLine = ctx.getStart()?.getLine()
                error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                navigator.errors.append(error)
                return
            } catch { }
        }
    }
    override func exitVariable(_ ctx: SailParser.VariableContext) { }
    
    override func enterType(_ ctx: SailParser.TypeContext) { }
    override func exitType(_ ctx: SailParser.TypeContext) { }
    
    override func enterArray(_ ctx: SailParser.ArrayContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let arrayName = ctx.IDENTIFIER()?.getText()
        
        guard navigator.getVariable(name: arrayName!) != nil else {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\"\(arrayName!)\" already exists")
            navigator.errors.append(error)
            return
        }
        
        // If called in an expression create a scope expression-wise or if theres nesting.
        navigator.operators.append(.falseBottom)
    }
    override func exitArray(_ ctx: SailParser.ArrayContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        // After expression is done look for the index to access, get the data type of the result
        let calculatedIndexAddress = navigator.operands.popLast()!
        let calculatedIndexDataType = navigator.operandDataTypes.popLast()!
        
        guard calculatedIndexDataType == .int else {
            let error = NavigatorError(type: .semantic, atLine: ctx.CLOSE_BRACKET()?.getSymbol()?.getLine(), positionInLine: ctx.CLOSE_BRACKET()?.getSymbol()?.getCharPositionInLine(), description: "Array index data type is \(calculatedIndexDataType.string), it must be an Int")
            navigator.errors.append(error)
            return
        }
        
        let arrayName = ctx.IDENTIFIER()?.getText()
        let array = navigator.getVariable(name: arrayName!)!
        
        let quadruple = Quadruple(op: .verify, left: nil, right: array.arraySize!, result: calculatedIndexAddress)
        navigator.quadruples.append(quadruple)
        
        do {
            // Get an address for the real address it is trying to access
            let indexAddress = try navigator.getTemporalAddress(for: .int)
            
            // Save the address of where the array starts
            let startAddressArrayConstantAddress = navigator.constantsMemory.save(int: array.address)
            
            // Generate quadruple to calculate the real index address
            let quadruple = Quadruple(op: .addition, left: calculatedIndexAddress, right: startAddressArrayConstantAddress, result: indexAddress)
            navigator.quadruples.append(quadruple)
            
            // Negative to distinguish that it is the address of an address
            navigator.operands.append(-indexAddress)
            navigator.operandDataTypes.append(array.type)
        } catch let error as NavigatorError {
            error.atLine = ctx.getStart()?.getLine()
            error.positionInLine = ctx.getStart()?.getCharPositionInLine()
            navigator.errors.append(error)
            return
        } catch { }
        
        // Remove false bottom inserted in enterArray
        _ = navigator.operators.popLast()
    }
    
    override func enterFunction(_ ctx: SailParser.FunctionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let functionName = ctx.IDENTIFIER()?.getText()
        
        guard navigator.functionTable[functionName!] == nil else {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "Function \"\(functionName!)\" already defined")
            navigator.errors.append(error)
            return
        }
        
        guard navigator.currentFunction.getVariable(name: functionName!) == nil else {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\"\(functionName!)\" is a variable")
            navigator.errors.append(error)
            return
        }
        
        navigator.localMemory.clear()
        
        var functionReturnType: DataType
        
        if ctx.VOID() != nil {
            functionReturnType = .void
        } else {
            functionReturnType = navigator.getDataType(from: ctx.type()!)
        }
        
        let startQuadrupleIndex = navigator.quadruples.count
        let startAddress = navigator.functionTable.count
        
        let function = Function(name: functionName!, hasParameters: true, returnType: functionReturnType, quadrupleIndex: startQuadrupleIndex, address: startAddress)
        
        navigator.currentFunction = function
        navigator.functionTable.updateValue(function, forKey: function.name)
        
        let functionVariableAddress = navigator.globalMemory.getAddress(for: functionReturnType)
        let functionVariable = Variable(name: functionName!, type: functionReturnType, address: functionVariableAddress)
        navigator.globalFunction.save(variable: functionVariable)
    }
    override func exitFunction(_ ctx: SailParser.FunctionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let functionName = ctx.IDENTIFIER()?.getText()
        
        if ctx.RETURN() != nil {
            guard let typeNode = ctx.type() else {
                let error = NavigatorError(type: .semantic, atLine: ctx.RETURN()?.getSymbol()?.getLine(), positionInLine: ctx.RETURN()?.getSymbol()?.getCharPositionInLine(), description: "Function declared as Void can not return a value, try changing the return type to any other than Void or delete the return statement.")
                navigator.errors.append(error)
                return
            }
            
            let returnFunctionDataType = navigator.getDataType(from: typeNode)
            let returnValueAddress = navigator.operands.popLast()!
            let returnValueDataType = navigator.operandDataTypes.popLast()!
            
            guard returnFunctionDataType == returnValueDataType else {
                let error = NavigatorError(type: .semantic, atLine: ctx.RETURN()?.getSymbol()?.getLine(), positionInLine: ctx.RETURN()?.getSymbol()?.getCharPositionInLine(), description: "Return type must be the same as defined in function \"\(functionName!)\". Return value type is \(returnValueDataType.string) and it is defined in the function as \(returnFunctionDataType.string).")
                navigator.errors.append(error)
                return
            }
            
            let quadruple = Quadruple(op: .returnValue, left: nil, right: nil, result: returnValueAddress)
            navigator.quadruples.append(quadruple)
        } else {
            guard ctx.VOID() != nil else {
                let error = NavigatorError(type: .semantic, atLine: ctx.CLOSE_CURLY()?.getSymbol()?.getLine(), positionInLine: ctx.CLOSE_CURLY()?.getSymbol()?.getCharPositionInLine(), description: "Missing a return statement in function \(functionName!).")
                navigator.errors.append(error)
                return
            }
        }
        
        navigator.currentFunction = navigator.globalFunction
        navigator.temporalLocalMemory.clear()
        navigator.localMemory.clear()
        
        let quadruple = Quadruple(op: .endFunction)
        navigator.quadruples.append(quadruple)
    }
    
    override func enterParameters(_ ctx: SailParser.ParametersContext) { }
    override func exitParameters(_ ctx: SailParser.ParametersContext) { }
    
    override func enterParameter(_ ctx: SailParser.ParameterContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let parameterName = ctx.IDENTIFIER()?.getText()
        let parameterType = navigator.getDataType(from: ctx.type()!)
        
        guard navigator.getVariable(name: parameterName!) == nil else {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "Parameter \"\(parameterName!)\" already exists")
            navigator.errors.append(error)
            return
        }
        
        do {
            let parameterAddress = try navigator.getAddress(for: parameterType)
            
            let variable = Variable(name: parameterName!, type: parameterType, address: parameterAddress)
            
            navigator.currentFunction.save(variable: variable)
        } catch let error as NavigatorError {
            error.atLine = ctx.getStart()?.getLine()
            error.positionInLine = ctx.getStart()?.getCharPositionInLine()
            navigator.errors.append(error)
            return
        } catch { }
    }
    override func exitParameter(_ ctx: SailParser.ParameterContext) { }
    
    override func enterCall(_ ctx: SailParser.CallContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let functionName = ctx.IDENTIFIER()?.getText()
        
        // Verify procedure is in Function Table
        guard let function = navigator.functionTable[functionName!] else {
            let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "Function \"\(functionName!)\" does not exist.")
            navigator.errors.append(error)
            return
        }
        
        let returnDataType = function.returnType!
        
        if (ctx.parent as? SailParser.StatementContext) != nil {
            guard returnDataType == .void else {
                let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "Function \(functionName!) has a return value of type \(returnDataType.string) not being used.")
                navigator.errors.append(error)
                return
            }
        } else {
            guard returnDataType != .void else {
                let error = NavigatorError(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "Function \"\(functionName!)\" has a return type of Void and does not return any value.")
                navigator.errors.append(error)
                return
            }
        }
        
        let quadruple = Quadruple(op: .era, left: nil, right: nil, result: function.address)
        navigator.quadruples.append(quadruple)
        
        // Start parameter counter in 0 (Zero-index)
        navigator.parameterCounter = 0
        // Add a pointer to the first parameter type in the parameter table
        
        // If called in an expression create a scope expression-wise.
        navigator.operators.append(.falseBottom)
    }
    override func exitCall(_ ctx: SailParser.CallContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let functionName = ctx.IDENTIFIER()?.getText()
        let function = navigator.functionTable[functionName!]
        
        guard navigator.parameterCounter == function?.parameters?.count else {
            let error = NavigatorError(type: .semantic, atLine: ctx.CLOSE_PARENTHESIS()?.getSymbol()?.getLine(), positionInLine: ctx.CLOSE_PARENTHESIS()?.getSymbol()?.getCharPositionInLine(), description: "There are missing arguments.")
            navigator.errors.append(error)
            return
        }
        
        let quadruple = Quadruple(op: .gosub, left: nil, right: nil, result: function?.address)
        navigator.quadruples.append(quadruple)
        
        guard let functionReturnDataType = function?.returnType else {
            return
        }
        
        // If it has a return value save it in temporals
        if functionReturnDataType != .void {
            do {
                let temporalAddress = try navigator.getTemporalAddress(for: functionReturnDataType)
                
                let quadruple = Quadruple(op: .assign, left: function?.address, right: nil, result: temporalAddress)
                navigator.quadruples.append(quadruple)
                
                navigator.operands.append(temporalAddress)
                navigator.operandDataTypes.append(functionReturnDataType)
            } catch let error as NavigatorError {
                error.atLine = ctx.getStart()?.getLine()
                error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                navigator.errors.append(error)
                return
            } catch { }
        }
    }
    
    override func enterCallParameters(_ ctx: SailParser.CallParametersContext) { }
    override func exitCallParameters(_ ctx: SailParser.CallParametersContext) { }
    
    override func enterCallParameter(_ ctx: SailParser.CallParameterContext) { }
    override func exitCallParameter(_ ctx: SailParser.CallParameterContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        let ctxFunctionCall = ctx.parent?.parent as? SailParser.CallContext
        let functionName = ctxFunctionCall?.IDENTIFIER()?.getText()
        
        guard let argumentAddress = navigator.operands.popLast(), let argumentDataType = navigator.operandDataTypes.popLast() else {
            let error = NavigatorError(type: .other, atLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getLine(), positionInLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getCharPositionInLine(), description: "Function \"\(functionName!)\" does not accept parameters.")
            navigator.errors.append(error)
            return
        }
        
        guard let parameter = navigator.functionTable[functionName!]?.parameters?[navigator.parameterCounter] else {
            let error = NavigatorError(type: .other, atLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getLine(), positionInLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getCharPositionInLine(), description: "Could not get the parameters from function \"\(functionName!)\".")
            navigator.errors.append(error)
            return
        }
        
        guard parameter.type == argumentDataType else {
            let error = NavigatorError(type: .semantic, atLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getLine(), positionInLine: ctxFunctionCall?.CLOSE_PARENTHESIS()?.getSymbol()?.getCharPositionInLine(), description: "The argument type in the function call \"\(functionName!)\" does not match the parameter \"\(String(describing: parameter.name))\" type defined in the function.")
            navigator.errors.append(error)
            return
        }
        
        let quadruple = Quadruple(op: .parameter, left: argumentAddress, right: nil, result: parameter.address)
        navigator.quadruples.append(quadruple)
        
        navigator.parameterCounter += 1
    }
    
    override func enterLogicExp(_ ctx: SailParser.LogicExpContext) { }
    override func exitLogicExp(_ ctx: SailParser.LogicExpContext) { }
    
    override func enterLogicExpP(_ ctx: SailParser.LogicExpPContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if ctx.AND() != nil {
            navigator.operators.append(.and)
        }
        
        if ctx.OR() != nil {
            navigator.operators.append(.or)
        }
    }
    override func exitLogicExpP(_ ctx: SailParser.LogicExpPContext) { }
    
    override func enterRelationalExp(_ ctx: SailParser.RelationalExpContext) { }
    override func exitRelationalExp(_ ctx: SailParser.RelationalExpContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let lastOperator = navigator.operators.last {
            switch lastOperator {
            case .and, .or:
                do {
                    try navigator.generateExpressionQuadruple()
                } catch let error as NavigatorError {
                    error.atLine = ctx.getStart()?.getLine()
                    error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                    navigator.errors.append(error)
                    return
                } catch { }
            default:
                break
            }
        }
    }
    
    override func enterRelationalExpP(_ ctx: SailParser.RelationalExpPContext) { }
    override func exitRelationalExpP(_ ctx: SailParser.RelationalExpPContext) { }
    
    override func enterRelationalOp(_ ctx: SailParser.RelationalOpContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if ctx.EQUAL() != nil {
            navigator.operators.append(.equal)
        } else if ctx.EQUAL_GREATER_THAN() != nil {
            navigator.operators.append(.greaterEqual)
        } else if ctx.EQUAL_LESS_THAN() != nil {
            navigator.operators.append(.lessEqual)
        } else if ctx.GREATER_THAN() != nil {
            navigator.operators.append(.greater)
        } else if ctx.LESS_THAN() != nil {
            navigator.operators.append(.less)
        } else if ctx.NOT_EQUAL() != nil {
            navigator.operators.append(.notEqual)
        }
    }
    override func exitRelationalOp(_ ctx: SailParser.RelationalOpContext) { }
    
    override func enterExpression(_ ctx: SailParser.ExpressionContext) { }
    override func exitExpression(_ ctx: SailParser.ExpressionContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let lastOperator = navigator.operators.last {
            switch lastOperator {
            case .equal, .greaterEqual, .lessEqual, .greater, .less, .notEqual:
                do {
                    try navigator.generateExpressionQuadruple()
                } catch let error as NavigatorError {
                    error.atLine = ctx.getStart()?.getLine()
                    error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                    navigator.errors.append(error)
                    return
                } catch { }
            default:
                break
            }
        }
    }
    
    override func enterExpressionP(_ ctx: SailParser.ExpressionPContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if ctx.PLUS() != nil {
            navigator.operators.append(.addition)
        }
        
        if ctx.MINUS() != nil {
            navigator.operators.append(.subtraction)
        }
    }
    override func exitExpressionP(_ ctx: SailParser.ExpressionPContext) { }
    
    override func enterTerm(_ ctx: SailParser.TermContext) { }
    override func exitTerm(_ ctx: SailParser.TermContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let lastOperator = navigator.operators.last {
            
            switch lastOperator {
            case .addition, .subtraction:
                do {
                    try navigator.generateExpressionQuadruple()
                } catch let error as NavigatorError {
                    error.atLine = ctx.getStart()?.getLine()
                    error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                    navigator.errors.append(error)
                    return
                } catch { }
            default:
                break
            }
        }
    }
    
    override func enterTermP(_ ctx: SailParser.TermPContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if ctx.MULTIPLICATION() != nil {
            navigator.operators.append(.multiplication)
        }
        
        if ctx.DIVISION() != nil {
            navigator.operators.append(.division)
        }
    }
    override func exitTermP(_ ctx: SailParser.TermPContext) { }
    
    override func enterFactor(_ ctx: SailParser.FactorContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if ctx.OPEN_PARENTHESIS() != nil {
            navigator.operators.append(.falseBottom)
        }
    }
    override func exitFactor(_ ctx: SailParser.FactorContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let id = ctx.varLiteral()?.IDENTIFIER() {
            guard let variable = navigator.getVariable(name: id.getText()) else {
                let error = NavigatorError(type: .compile, atLine: id.getSymbol()?.getLine(), positionInLine: id.getSymbol()?.getCharPositionInLine(), description: "\"\(id.getText())\" not declared")
                navigator.errors.append(error)
                return
            }
            
            navigator.operands.append(variable.address)
            navigator.operandDataTypes.append(variable.type)
        }
        
        if ctx.CLOSE_PARENTHESIS() != nil {
            _ = navigator.operators.popLast()
        }
        
        if let lastOperator = navigator.operators.last {
            switch lastOperator {
            case .multiplication, .division:
                do {
                    try navigator.generateExpressionQuadruple()
                } catch let error as NavigatorError {
                    error.atLine = ctx.getStart()?.getLine()
                    error.positionInLine = ctx.getStart()?.getCharPositionInLine()
                    navigator.errors.append(error)
                    return
                } catch { }
            default:
                break
            }
        }
    }
    
    override func enterLiteral(_ ctx: SailParser.LiteralContext) { }
    override func exitLiteral(_ ctx: SailParser.LiteralContext) { }
    
    override func enterVarLiteral(_ ctx: SailParser.VarLiteralContext) {
        
        guard navigator.errors.isEmpty else { return }
       
        if let boolNode = ctx.CONSTANT_BOOLEAN() {
            var bool: Bool
            
            switch boolNode.getText() {
            case "true": bool = true
            default: bool = false
            }
            
            // Get address for constant
            if let boolAddress = navigator.constantsMemory.findConstant(bool: bool) {
                navigator.operands.append(boolAddress)
                navigator.operandDataTypes.append(.bool)
            } else {
                let boolAddress = navigator.constantsMemory.save(bool: bool)
                navigator.operands.append(boolAddress)
                navigator.operandDataTypes.append(.bool)
            }
        }
        
        if let floatNode = ctx.CONSTANT_FLOAT() {
            var float = Float(floatNode.getText())!
            
            if ctx.MINUS() != nil { float = -float }
            
            // Get address for constant
            if let floatAddress = navigator.constantsMemory.findConstant(float: float) {
                navigator.operands.append(floatAddress)
                navigator.operandDataTypes.append(.float)
            } else {
                let floatAddress = navigator.constantsMemory.save(float: float)
                navigator.operands.append(floatAddress)
                navigator.operandDataTypes.append(.float)
            }
        }
        
        if let intNode = ctx.CONSTANT_INT() {
            var int = Int(intNode.getText())!
            
            if ctx.MINUS() != nil { int = -int }
            
            // Get address for constant
            if let intAddress = navigator.constantsMemory.findConstant(int: int) {
                navigator.operands.append(intAddress)
                navigator.operandDataTypes.append(.int)
            } else {
                let intAddress = navigator.constantsMemory.save(int: int)
                navigator.operands.append(intAddress)
                navigator.operandDataTypes.append(.int)
            }
        }
    }
    override func exitVarLiteral(_ ctx: SailParser.VarLiteralContext) { }
    
    override func enterLetterLiteral(_ ctx: SailParser.LetterLiteralContext) {
        
        guard navigator.errors.isEmpty else { return }
        
        if let characterNode = ctx.CONSTANT_CHAR() {
            var characterText = characterNode.getText()
            // Remove the open single quote
            characterText.removeFirst()
            let character = characterText.removeFirst()
            
            // Get address for constant
            if let characterAddress = navigator.constantsMemory.findConstant(character: character) {
                navigator.operands.append(characterAddress)
                navigator.operandDataTypes.append(.character)
            } else {
                let characterAddress = navigator.constantsMemory.save(character: character)
                navigator.operands.append(characterAddress)
                navigator.operandDataTypes.append(.character)
            }
        }
        
        if let stringNode = ctx.CONSTANT_STRING() {
            var string = stringNode.getText()
            // Remove the double quotes
            string.removeFirst()
            _ = string.popLast()
            
            // Get address for constant
            if let stringAddress = navigator.constantsMemory.findConstant(string: string) {
                navigator.operands.append(stringAddress)
                navigator.operandDataTypes.append(.string)
            } else {
                let stringAddress = navigator.constantsMemory.save(string: string)
                navigator.operands.append(stringAddress)
                navigator.operandDataTypes.append(.string)
            }
        }
    }
    override func exitLetterLiteral(_ ctx: SailParser.LetterLiteralContext) { }
    
    
    
    override func enterEveryRule(_ ctx: ParserRuleContext) {
        guard navigator.errors.isEmpty else { return }
    }
    
    override func exitEveryRule(_ ctx: ParserRuleContext) { }
    
    override func visitTerminal(_ node: TerminalNode) { }
    
    override func visitErrorNode(_ node: ErrorNode) { }

}
