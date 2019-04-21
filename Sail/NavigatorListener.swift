//
//  Navigator+SailBaseListener.swift
//  Sail
//
//  Created by Gerardo Osio on 4/21/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

class NavigatorListener: SailBaseListener {
    
    let navigator = Navigator.shared
    
    override func enterProgram(_ ctx: SailParser.ProgramContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitProgram(_ ctx: SailParser.ProgramContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterDeclaration(_ ctx: SailParser.DeclarationContext) { }
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
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterLogicExp(_ ctx: SailParser.LogicExpContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitLogicExp(_ ctx: SailParser.LogicExpContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterLogicExpP(_ ctx: SailParser.LogicExpPContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitLogicExpP(_ ctx: SailParser.LogicExpPContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterRelationalExp(_ ctx: SailParser.RelationalExpContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitRelationalExp(_ ctx: SailParser.RelationalExpContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterRelationalExpP(_ ctx: SailParser.RelationalExpPContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitRelationalExpP(_ ctx: SailParser.RelationalExpPContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterRelationalOp(_ ctx: SailParser.RelationalOpContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitRelationalOp(_ ctx: SailParser.RelationalOpContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterExpression(_ ctx: SailParser.ExpressionContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitExpression(_ ctx: SailParser.ExpressionContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterExpressionP(_ ctx: SailParser.ExpressionPContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitExpressionP(_ ctx: SailParser.ExpressionPContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterTerm(_ ctx: SailParser.TermContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitTerm(_ ctx: SailParser.TermContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterTermP(_ ctx: SailParser.TermPContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitTermP(_ ctx: SailParser.TermPContext) { }
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterFactor(_ ctx: SailParser.FactorContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitFactor(_ ctx: SailParser.FactorContext) { }
    
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
    
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func enterEveryRule(_ ctx: ParserRuleContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func exitEveryRule(_ ctx: ParserRuleContext) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func visitTerminal(_ node: TerminalNode) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override func visitErrorNode(_ node: ErrorNode) { }
}
