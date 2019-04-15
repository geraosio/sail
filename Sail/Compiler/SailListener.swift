// Generated from /Users/geraosio/Documents/Developer/apple/iOS/Projects/Sailing/Sailing/Compiler/Sail.g4 by ANTLR 4.7.2
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SailParser}.
 */
public protocol SailListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SailParser#sail}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSail(_ ctx: SailParser.SailContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#sail}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSail(_ ctx: SailParser.SailContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: SailParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: SailParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#block}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlock(_ ctx: SailParser.BlockContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#block}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlock(_ ctx: SailParser.BlockContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#statute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatute(_ ctx: SailParser.StatuteContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#statute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatute(_ ctx: SailParser.StatuteContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#basicStatute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBasicStatute(_ ctx: SailParser.BasicStatuteContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#basicStatute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBasicStatute(_ ctx: SailParser.BasicStatuteContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: SailParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: SailParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#stmtBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStmtBlock(_ ctx: SailParser.StmtBlockContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#stmtBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStmtBlock(_ ctx: SailParser.StmtBlockContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignment(_ ctx: SailParser.AssignmentContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignment(_ ctx: SailParser.AssignmentContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#condition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCondition(_ ctx: SailParser.ConditionContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#condition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCondition(_ ctx: SailParser.ConditionContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#loop}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLoop(_ ctx: SailParser.LoopContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#loop}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLoop(_ ctx: SailParser.LoopContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#forStmt}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterForStmt(_ ctx: SailParser.ForStmtContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#forStmt}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitForStmt(_ ctx: SailParser.ForStmtContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#forStride}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterForStride(_ ctx: SailParser.ForStrideContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#forStride}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitForStride(_ ctx: SailParser.ForStrideContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#whileStmt}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhileStmt(_ ctx: SailParser.WhileStmtContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#whileStmt}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhileStmt(_ ctx: SailParser.WhileStmtContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#print}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrint(_ ctx: SailParser.PrintContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#print}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrint(_ ctx: SailParser.PrintContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariable(_ ctx: SailParser.VariableContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariable(_ ctx: SailParser.VariableContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterType(_ ctx: SailParser.TypeContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitType(_ ctx: SailParser.TypeContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunction(_ ctx: SailParser.FunctionContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunction(_ ctx: SailParser.FunctionContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#parameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameters(_ ctx: SailParser.ParametersContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#parameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameters(_ ctx: SailParser.ParametersContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameter(_ ctx: SailParser.ParameterContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameter(_ ctx: SailParser.ParameterContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCall(_ ctx: SailParser.CallContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCall(_ ctx: SailParser.CallContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#logicExp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLogicExp(_ ctx: SailParser.LogicExpContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#logicExp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLogicExp(_ ctx: SailParser.LogicExpContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#logicExpP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLogicExpP(_ ctx: SailParser.LogicExpPContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#logicExpP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLogicExpP(_ ctx: SailParser.LogicExpPContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#relationalExp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRelationalExp(_ ctx: SailParser.RelationalExpContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#relationalExp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRelationalExp(_ ctx: SailParser.RelationalExpContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#relationalExpP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRelationalExpP(_ ctx: SailParser.RelationalExpPContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#relationalExpP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRelationalExpP(_ ctx: SailParser.RelationalExpPContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#relationalOp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRelationalOp(_ ctx: SailParser.RelationalOpContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#relationalOp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRelationalOp(_ ctx: SailParser.RelationalOpContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: SailParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: SailParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#expressionP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressionP(_ ctx: SailParser.ExpressionPContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#expressionP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressionP(_ ctx: SailParser.ExpressionPContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTerm(_ ctx: SailParser.TermContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTerm(_ ctx: SailParser.TermContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#termP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTermP(_ ctx: SailParser.TermPContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#termP}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTermP(_ ctx: SailParser.TermPContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFactor(_ ctx: SailParser.FactorContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFactor(_ ctx: SailParser.FactorContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLiteral(_ ctx: SailParser.LiteralContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLiteral(_ ctx: SailParser.LiteralContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#varLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVarLiteral(_ ctx: SailParser.VarLiteralContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#varLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVarLiteral(_ ctx: SailParser.VarLiteralContext)
	/**
	 * Enter a parse tree produced by {@link SailParser#letterLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLetterLiteral(_ ctx: SailParser.LetterLiteralContext)
	/**
	 * Exit a parse tree produced by {@link SailParser#letterLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLetterLiteral(_ ctx: SailParser.LetterLiteralContext)
}