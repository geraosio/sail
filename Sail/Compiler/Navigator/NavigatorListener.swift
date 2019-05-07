//
//  Navigator+GrammarActions.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

class NavigatorListener: SailBaseListener {
    
    let navigator = Navigator.shared
    
    override func enterProgram(_ ctx: SailParser.ProgramContext) { }
    
    override func exitProgram(_ ctx: SailParser.ProgramContext) {
        let endQuadruple = Quadruple(op: .end, left: nil, right: nil, result: nil)
        navigator.quadruples.append(endQuadruple)
        
        navigator.printQuadruples()
        
        print("End of program!")
    }
    
    override func enterDeclaration(_ ctx: SailParser.DeclarationContext) { }
    override func exitDeclaration(_ ctx: SailParser.DeclarationContext) { }
    
    override func enterBlock(_ ctx: SailParser.BlockContext) { }
    override func exitBlock(_ ctx: SailParser.BlockContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterStatement(_ ctx: SailParser.StatementContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitStatement(_ ctx: SailParser.StatementContext) { }
    
    override func enterAssignment(_ ctx: SailParser.AssignmentContext) {
        
        if let idNode = ctx.IDENTIFIER() {
            let variableName = idNode.getText()
            
            guard let variable = navigator.getVariable(name: variableName) else {
                let error = NavigatorError.init(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\(variableName) does not exists")
                navigator.errors.append(error)
                return
            }
            
            if ctx.OPEN_BRACKET() != nil {
                // TODO: Vector - Get vector address and add to operands
            } else {
                navigator.operands.append(variable.address)
                navigator.operandDataTypes.append(variable.type)
            }
        }
    }
    override func exitAssignment(_ ctx: SailParser.AssignmentContext) {
        
        let resultAddress = navigator.operands.popLast()!
        let resultDataType = navigator.operandDataTypes.popLast()!
        let idAddress = navigator.operands.popLast()!
        let idDataType = navigator.operandDataTypes.popLast()!
        
        let assignmentDataType = SemanticCube.check(op: .assign, leftType: idDataType, rightType: resultDataType)
        
        if assignmentDataType == .error {
            let error = NavigatorError.init(type: .semantic, atLine: ctx.ASSIGN()?.getSymbol()?.getLine(), positionInLine: ctx.ASSIGN()?.getSymbol()?.getCharPositionInLine(), description: "\(resultDataType.string) can not be assigned to a \(idDataType.string)")
            navigator.errors.append(error)
            return
        } else {
            let quadruple = Quadruple(op: .assign, left: resultAddress, right: nil, result: idAddress)
            navigator.quadruples.append(quadruple)
        }
    }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterCondition(_ ctx: SailParser.ConditionContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitCondition(_ ctx: SailParser.ConditionContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterLoop(_ ctx: SailParser.LoopContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitLoop(_ ctx: SailParser.LoopContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterForStmt(_ ctx: SailParser.ForStmtContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitForStmt(_ ctx: SailParser.ForStmtContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterForStride(_ ctx: SailParser.ForStrideContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitForStride(_ ctx: SailParser.ForStrideContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterWhileStmt(_ ctx: SailParser.WhileStmtContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitWhileStmt(_ ctx: SailParser.WhileStmtContext) { }
    
    override func enterPrintStmt(_ ctx: SailParser.PrintStmtContext) { }
    override func exitPrintStmt(_ ctx: SailParser.PrintStmtContext) {
        
        let printOperandAddress = navigator.operands.popLast()
        _ = navigator.operandDataTypes.popLast()
        
        let quadruple = Quadruple(op: .print, left: nil, right: nil, result: printOperandAddress)
        navigator.quadruples.append(quadruple)
    }
    
    override func enterVariable(_ ctx: SailParser.VariableContext) {
        
        let variableName = ctx.IDENTIFIER()!.getText()
        
        if navigator.getVariable(name: variableName) != nil {
            let error = NavigatorError.init(type: .semantic, atLine: ctx.IDENTIFIER()?.getSymbol()?.getLine(), positionInLine: ctx.IDENTIFIER()?.getSymbol()?.getCharPositionInLine(), description: "\"\(variableName)\" already exists")
            navigator.errors.append(error)
            return
        }
        
        let variableType = navigator.getDataType(from: ctx.type()!)
        
        // TODO: VECTOR
        
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
    override func exitVariable(_ ctx: SailParser.VariableContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterType(_ ctx: SailParser.TypeContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitType(_ ctx: SailParser.TypeContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterFunction(_ ctx: SailParser.FunctionContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitFunction(_ ctx: SailParser.FunctionContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterParameters(_ ctx: SailParser.ParametersContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitParameters(_ ctx: SailParser.ParametersContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterParameter(_ ctx: SailParser.ParameterContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitParameter(_ ctx: SailParser.ParameterContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterCall(_ ctx: SailParser.CallContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitCall(_ ctx: SailParser.CallContext) { }
    
    override func enterLogicExp(_ ctx: SailParser.LogicExpContext) { }
    override func exitLogicExp(_ ctx: SailParser.LogicExpContext) { }
    
    override func enterLogicExpP(_ ctx: SailParser.LogicExpPContext) {
        
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
        
        if ctx.MULTIPLICATION() != nil {
            navigator.operators.append(.multiplication)
        }
        
        if ctx.DIVISION() != nil {
            navigator.operators.append(.division)
        }
    }
    override func exitTermP(_ ctx: SailParser.TermPContext) { }
    
    override func enterFactor(_ ctx: SailParser.FactorContext) { }
    override func exitFactor(_ ctx: SailParser.FactorContext) {
        
        if ctx.OPEN_PARENTHESIS() != nil {
            navigator.operators.append(.falseBottom)
        }
        
        if let id = ctx.varLiteral()?.IDENTIFIER() {
            guard let variable = navigator.getVariable(name: id.getText()) else {
                let error = NavigatorError(type: .compile, atLine: id.getSymbol()?.getLine() ?? 0, positionInLine: id.getSymbol()?.getCharPositionInLine() ?? 0, description: "\"\(id.getText())\" not declared")
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
        if !navigator.errors.isEmpty {
            return
        }
    }
    override func exitEveryRule(_ ctx: ParserRuleContext) { }
    
    override func visitTerminal(_ node: TerminalNode) { }
    
    override func visitErrorNode(_ node: ErrorNode) { }

}
