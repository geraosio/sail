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
    
    override func enterProgram(_ ctx: SailParser.ProgramContext) {
        navigator.currentFunction = Function(name: "sail")
        navigator.functionTable[navigator.currentFunction.name] = navigator.currentFunction
    }
    
    override func exitProgram(_ ctx: SailParser.ProgramContext) {
        navigator.printQuadruples()
        print("End of program!")
    }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterDeclaration(_ ctx: SailParser.DeclarationContext) {
        
    }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitDeclaration(_ ctx: SailParser.DeclarationContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterBlock(_ ctx: SailParser.BlockContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
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
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterAssignment(_ ctx: SailParser.AssignmentContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitAssignment(_ ctx: SailParser.AssignmentContext) { }
    
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
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterPrintStmt(_ ctx: SailParser.PrintStmtContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitPrintStmt(_ ctx: SailParser.PrintStmtContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterVariable(_ ctx: SailParser.VariableContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
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
    
    override func enterLogicExpP(_ ctx: SailParser.LogicExpPContext) { }
    override func exitLogicExpP(_ ctx: SailParser.LogicExpPContext) {
        
        if ctx.AND() != nil {
            navigator.operators.append(.and)
        }
        
        if ctx.OR() != nil {
            navigator.operators.append(.or)
        }
    }
    
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
    
    override func enterRelationalOp(_ ctx: SailParser.RelationalOpContext) { }
    override func exitRelationalOp(_ ctx: SailParser.RelationalOpContext) {
        
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
    
    override func enterExpressionP(_ ctx: SailParser.ExpressionPContext) { }
    override func exitExpressionP(_ ctx: SailParser.ExpressionPContext) {

        if ctx.PLUS() != nil {
            navigator.operators.append(.addition)
        }
        
        if ctx.MINUS() != nil {
            navigator.operators.append(.subtraction)
        }
    }
    
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
    
    override func enterTermP(_ ctx: SailParser.TermPContext) { }
    override func exitTermP(_ ctx: SailParser.TermPContext) {
        
        if ctx.MULTIPLICATION() != nil {
            navigator.operators.append(.multiplication)
        }
        
        if ctx.DIVISION() != nil {
            navigator.operators.append(.division)
        }
    }
    
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
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterLiteral(_ ctx: SailParser.LiteralContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitLiteral(_ ctx: SailParser.LiteralContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterVarLiteral(_ ctx: SailParser.VarLiteralContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitVarLiteral(_ ctx: SailParser.VarLiteralContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterLetterLiteral(_ ctx: SailParser.LetterLiteralContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
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
