// Generated from Sail.g4 by ANTLR 4.7.2
import Antlr4

open class SailParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = SailParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(SailParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, SAIL = 1, INT = 2, FLOAT = 3, BOOL = 4, CHARACTER = 5, 
                 STRING = 6, VOID = 7, VAR = 8, PRINT = 9, FUNC = 10, RETURN = 11, 
                 IF = 12, ELSE = 13, WHILE = 14, FOR = 15, IN = 16, TO = 17, 
                 THROUGH = 18, BY = 19, DIVISION = 20, MINUS = 21, MULTIPLICATION = 22, 
                 PLUS = 23, AND = 24, ASSIGN = 25, EQUAL = 26, EQUAL_GREATER_THAN = 27, 
                 EQUAL_LESS_THAN = 28, GREATER_THAN = 29, LESS_THAN = 30, 
                 NOT = 31, NOT_EQUAL = 32, OR = 33, OPEN_BRACKET = 34, CLOSE_BRACKET = 35, 
                 OPEN_CURLY = 36, CLOSE_CURLY = 37, OPEN_PARENTHESIS = 38, 
                 CLOSE_PARENTHESIS = 39, ARROW = 40, COLON = 41, COMMA = 42, 
                 DOT = 43, SEMICOLON = 44, CONSTANT_INT = 45, CONSTANT_FLOAT = 46, 
                 CONSTANT_BOOLEAN = 47, CONSTANT_CHAR = 48, CONSTANT_STRING = 49, 
                 IDENTIFIER = 50, COMMENTS = 51, WHITESPACE = 52, NEWLINE = 53
	}

	public
	static let RULE_program = 0, RULE_declaration = 1, RULE_block = 2, RULE_statement = 3, 
            RULE_assignment = 4, RULE_condition = 5, RULE_conditionAction = 6, 
            RULE_conditionElseAction = 7, RULE_loop = 8, RULE_forStmt = 9, 
            RULE_forStride = 10, RULE_whileStmt = 11, RULE_printStmt = 12, 
            RULE_variable = 13, RULE_type = 14, RULE_function = 15, RULE_parameters = 16, 
            RULE_parameter = 17, RULE_call = 18, RULE_logicExp = 19, RULE_logicExpP = 20, 
            RULE_relationalExp = 21, RULE_relationalExpP = 22, RULE_relationalOp = 23, 
            RULE_expression = 24, RULE_expressionP = 25, RULE_term = 26, 
            RULE_termP = 27, RULE_factor = 28, RULE_literal = 29, RULE_varLiteral = 30, 
            RULE_letterLiteral = 31

	public
	static let ruleNames: [String] = [
		"program", "declaration", "block", "statement", "assignment", "condition", 
		"conditionAction", "conditionElseAction", "loop", "forStmt", "forStride", 
		"whileStmt", "printStmt", "variable", "type", "function", "parameters", 
		"parameter", "call", "logicExp", "logicExpP", "relationalExp", "relationalExpP", 
		"relationalOp", "expression", "expressionP", "term", "termP", "factor", 
		"literal", "varLiteral", "letterLiteral"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'Int'", "'Float'", "'Bool'", "'Character'", "'String'", "'Void'", 
		"'var'", "'print'", "'func'", "'return'", "'if'", "'else'", "'while'", 
		"'for'", "'in'", "'to'", "'through'", "'by'", "'/'", "'-'", "'*'", "'+'", 
		"'&&'", "'='", "'=='", "'>='", "'<='", "'>'", "'<'", "'!'", "'!='", "'||'", 
		"'['", "']'", "'{'", "'}'", "'('", "')'", "'->'", "':'", "','", "'.'", 
		"';'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "SAIL", "INT", "FLOAT", "BOOL", "CHARACTER", "STRING", "VOID", "VAR", 
		"PRINT", "FUNC", "RETURN", "IF", "ELSE", "WHILE", "FOR", "IN", "TO", "THROUGH", 
		"BY", "DIVISION", "MINUS", "MULTIPLICATION", "PLUS", "AND", "ASSIGN", 
		"EQUAL", "EQUAL_GREATER_THAN", "EQUAL_LESS_THAN", "GREATER_THAN", "LESS_THAN", 
		"NOT", "NOT_EQUAL", "OR", "OPEN_BRACKET", "CLOSE_BRACKET", "OPEN_CURLY", 
		"CLOSE_CURLY", "OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", "ARROW", "COLON", 
		"COMMA", "DOT", "SEMICOLON", "CONSTANT_INT", "CONSTANT_FLOAT", "CONSTANT_BOOLEAN", 
		"CONSTANT_CHAR", "CONSTANT_STRING", "IDENTIFIER", "COMMENTS", "WHITESPACE", 
		"NEWLINE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Sail.g4" }

	override open
	func getRuleNames() -> [String] { return SailParser.ruleNames }

	override open
	func getSerializedATN() -> String { return SailParser._serializedATN }

	override open
	func getATN() -> ATN { return SailParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return SailParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,SailParser._ATN,SailParser._decisionToDFA, SailParser._sharedContextCache)
	}


	public class ProgramContext: ParserRuleContext {
			open
			func SAIL() -> TerminalNode? {
				return getToken(SailParser.Tokens.SAIL.rawValue, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
			open
			func EOF() -> TerminalNode? {
				return getToken(SailParser.Tokens.EOF.rawValue, 0)
			}
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitProgram(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, SailParser.RULE_program)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(67)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.VAR.rawValue || _la == SailParser.Tokens.FUNC.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(64)
		 		try declaration()


		 		setState(69)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(70)
		 	try match(SailParser.Tokens.SAIL.rawValue)
		 	setState(71)
		 	try block()
		 	setState(72)
		 	try match(SailParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclarationContext: ParserRuleContext {
			open
			func variable() -> VariableContext? {
				return getRuleContext(VariableContext.self, 0)
			}
			open
			func function() -> FunctionContext? {
				return getRuleContext(FunctionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_declaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func declaration() throws -> DeclarationContext {
		var _localctx: DeclarationContext = DeclarationContext(_ctx, getState())
		try enterRule(_localctx, 2, SailParser.RULE_declaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(76)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .VAR:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(74)
		 		try variable()

		 		break

		 	case .FUNC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(75)
		 		try function()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockContext: ParserRuleContext {
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_block
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitBlock(self)
			}
		}
	}
	@discardableResult
	 open func block() throws -> BlockContext {
		var _localctx: BlockContext = BlockContext(_ctx, getState())
		try enterRule(_localctx, 4, SailParser.RULE_block)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(78)
		 	try match(SailParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(82)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.PRINT.rawValue,SailParser.Tokens.IF.rawValue,SailParser.Tokens.WHILE.rawValue,SailParser.Tokens.FOR.rawValue,SailParser.Tokens.IDENTIFIER.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(79)
		 		try statement()


		 		setState(84)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(85)
		 	try match(SailParser.Tokens.CLOSE_CURLY.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func assignment() -> AssignmentContext? {
				return getRuleContext(AssignmentContext.self, 0)
			}
			open
			func condition() -> ConditionContext? {
				return getRuleContext(ConditionContext.self, 0)
			}
			open
			func loop() -> LoopContext? {
				return getRuleContext(LoopContext.self, 0)
			}
			open
			func printStmt() -> PrintStmtContext? {
				return getRuleContext(PrintStmtContext.self, 0)
			}
			open
			func call() -> CallContext? {
				return getRuleContext(CallContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitStatement(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext = StatementContext(_ctx, getState())
		try enterRule(_localctx, 6, SailParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(92)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(87)
		 		try assignment()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(88)
		 		try condition()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(89)
		 		try loop()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(90)
		 		try printStmt()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(91)
		 		try call()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(SailParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func letterLiteral() -> LetterLiteralContext? {
				return getRuleContext(LetterLiteralContext.self, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_assignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterAssignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitAssignment(self)
			}
		}
	}
	@discardableResult
	 open func assignment() throws -> AssignmentContext {
		var _localctx: AssignmentContext = AssignmentContext(_ctx, getState())
		try enterRule(_localctx, 8, SailParser.RULE_assignment)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(94)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(99)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.OPEN_BRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(95)
		 		try match(SailParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(96)
		 		try expression()
		 		setState(97)
		 		try match(SailParser.Tokens.CLOSE_BRACKET.rawValue)

		 	}

		 	setState(101)
		 	try match(SailParser.Tokens.ASSIGN.rawValue)
		 	setState(104)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MINUS:fallthrough
		 	case .OPEN_PARENTHESIS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:fallthrough
		 	case .IDENTIFIER:
		 		setState(102)
		 		try logicExp()

		 		break
		 	case .CONSTANT_CHAR:fallthrough
		 	case .CONSTANT_STRING:
		 		setState(103)
		 		try letterLiteral()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(106)
		 	try match(SailParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionContext: ParserRuleContext {
			open
			func IF() -> TerminalNode? {
				return getToken(SailParser.Tokens.IF.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func conditionAction() -> ConditionActionContext? {
				return getRuleContext(ConditionActionContext.self, 0)
			}
			open
			func block() -> [BlockContext] {
				return getRuleContexts(BlockContext.self)
			}
			open
			func block(_ i: Int) -> BlockContext? {
				return getRuleContext(BlockContext.self, i)
			}
			open
			func conditionElseAction() -> ConditionElseActionContext? {
				return getRuleContext(ConditionElseActionContext.self, 0)
			}
			open
			func ELSE() -> TerminalNode? {
				return getToken(SailParser.Tokens.ELSE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_condition
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterCondition(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitCondition(self)
			}
		}
	}
	@discardableResult
	 open func condition() throws -> ConditionContext {
		var _localctx: ConditionContext = ConditionContext(_ctx, getState())
		try enterRule(_localctx, 10, SailParser.RULE_condition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(108)
		 	try match(SailParser.Tokens.IF.rawValue)
		 	setState(109)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(110)
		 	try logicExp()
		 	setState(111)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(112)
		 	try conditionAction()
		 	setState(113)
		 	try block()
		 	setState(118)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.ELSE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(114)
		 		try conditionElseAction()
		 		setState(115)
		 		try match(SailParser.Tokens.ELSE.rawValue)
		 		setState(116)
		 		try block()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionActionContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_conditionAction
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterConditionAction(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitConditionAction(self)
			}
		}
	}
	@discardableResult
	 open func conditionAction() throws -> ConditionActionContext {
		var _localctx: ConditionActionContext = ConditionActionContext(_ctx, getState())
		try enterRule(_localctx, 12, SailParser.RULE_conditionAction)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionElseActionContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_conditionElseAction
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterConditionElseAction(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitConditionElseAction(self)
			}
		}
	}
	@discardableResult
	 open func conditionElseAction() throws -> ConditionElseActionContext {
		var _localctx: ConditionElseActionContext = ConditionElseActionContext(_ctx, getState())
		try enterRule(_localctx, 14, SailParser.RULE_conditionElseAction)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LoopContext: ParserRuleContext {
			open
			func forStmt() -> ForStmtContext? {
				return getRuleContext(ForStmtContext.self, 0)
			}
			open
			func whileStmt() -> WhileStmtContext? {
				return getRuleContext(WhileStmtContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_loop
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterLoop(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitLoop(self)
			}
		}
	}
	@discardableResult
	 open func loop() throws -> LoopContext {
		var _localctx: LoopContext = LoopContext(_ctx, getState())
		try enterRule(_localctx, 16, SailParser.RULE_loop)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(126)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FOR:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(124)
		 		try forStmt()

		 		break

		 	case .WHILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(125)
		 		try whileStmt()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForStmtContext: ParserRuleContext {
			open
			func FOR() -> TerminalNode? {
				return getToken(SailParser.Tokens.FOR.rawValue, 0)
			}
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func IN() -> TerminalNode? {
				return getToken(SailParser.Tokens.IN.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func forStride() -> ForStrideContext? {
				return getRuleContext(ForStrideContext.self, 0)
			}
			open
			func BY() -> TerminalNode? {
				return getToken(SailParser.Tokens.BY.rawValue, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_forStmt
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterForStmt(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitForStmt(self)
			}
		}
	}
	@discardableResult
	 open func forStmt() throws -> ForStmtContext {
		var _localctx: ForStmtContext = ForStmtContext(_ctx, getState())
		try enterRule(_localctx, 18, SailParser.RULE_forStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(128)
		 	try match(SailParser.Tokens.FOR.rawValue)
		 	setState(129)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(130)
		 	try match(SailParser.Tokens.IN.rawValue)
		 	setState(131)
		 	try expression()
		 	setState(132)
		 	try forStride()
		 	setState(133)
		 	try expression()
		 	setState(134)
		 	try match(SailParser.Tokens.BY.rawValue)
		 	setState(135)
		 	try expression()
		 	setState(136)
		 	try block()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForStrideContext: ParserRuleContext {
			open
			func TO() -> TerminalNode? {
				return getToken(SailParser.Tokens.TO.rawValue, 0)
			}
			open
			func THROUGH() -> TerminalNode? {
				return getToken(SailParser.Tokens.THROUGH.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_forStride
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterForStride(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitForStride(self)
			}
		}
	}
	@discardableResult
	 open func forStride() throws -> ForStrideContext {
		var _localctx: ForStrideContext = ForStrideContext(_ctx, getState())
		try enterRule(_localctx, 20, SailParser.RULE_forStride)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(138)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.TO.rawValue || _la == SailParser.Tokens.THROUGH.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class WhileStmtContext: ParserRuleContext {
			open
			func WHILE() -> TerminalNode? {
				return getToken(SailParser.Tokens.WHILE.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func conditionAction() -> ConditionActionContext? {
				return getRuleContext(ConditionActionContext.self, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_whileStmt
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterWhileStmt(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitWhileStmt(self)
			}
		}
	}
	@discardableResult
	 open func whileStmt() throws -> WhileStmtContext {
		var _localctx: WhileStmtContext = WhileStmtContext(_ctx, getState())
		try enterRule(_localctx, 22, SailParser.RULE_whileStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(140)
		 	try match(SailParser.Tokens.WHILE.rawValue)
		 	setState(141)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(142)
		 	try logicExp()
		 	setState(143)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(144)
		 	try conditionAction()
		 	setState(145)
		 	try block()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrintStmtContext: ParserRuleContext {
			open
			func PRINT() -> TerminalNode? {
				return getToken(SailParser.Tokens.PRINT.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func letterLiteral() -> LetterLiteralContext? {
				return getRuleContext(LetterLiteralContext.self, 0)
			}
			open
			func call() -> CallContext? {
				return getRuleContext(CallContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_printStmt
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterPrintStmt(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitPrintStmt(self)
			}
		}
	}
	@discardableResult
	 open func printStmt() throws -> PrintStmtContext {
		var _localctx: PrintStmtContext = PrintStmtContext(_ctx, getState())
		try enterRule(_localctx, 24, SailParser.RULE_printStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(147)
		 	try match(SailParser.Tokens.PRINT.rawValue)
		 	setState(148)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(152)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,8, _ctx)) {
		 	case 1:
		 		setState(149)
		 		try logicExp()

		 		break
		 	case 2:
		 		setState(150)
		 		try letterLiteral()

		 		break
		 	case 3:
		 		setState(151)
		 		try call()

		 		break
		 	default: break
		 	}
		 	setState(154)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(155)
		 	try match(SailParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableContext: ParserRuleContext {
			open
			func VAR() -> TerminalNode? {
				return getToken(SailParser.Tokens.VAR.rawValue, 0)
			}
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.COLON.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func CONSTANT_INT() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_INT.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_variable
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterVariable(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitVariable(self)
			}
		}
	}
	@discardableResult
	 open func variable() throws -> VariableContext {
		var _localctx: VariableContext = VariableContext(_ctx, getState())
		try enterRule(_localctx, 26, SailParser.RULE_variable)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(157)
		 	try match(SailParser.Tokens.VAR.rawValue)
		 	setState(158)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(162)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.OPEN_BRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(159)
		 		try match(SailParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(160)
		 		try match(SailParser.Tokens.CONSTANT_INT.rawValue)
		 		setState(161)
		 		try match(SailParser.Tokens.CLOSE_BRACKET.rawValue)

		 	}

		 	setState(164)
		 	try match(SailParser.Tokens.COLON.rawValue)
		 	setState(165)
		 	try type()
		 	setState(166)
		 	try match(SailParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeContext: ParserRuleContext {
			open
			func BOOL() -> TerminalNode? {
				return getToken(SailParser.Tokens.BOOL.rawValue, 0)
			}
			open
			func INT() -> TerminalNode? {
				return getToken(SailParser.Tokens.INT.rawValue, 0)
			}
			open
			func FLOAT() -> TerminalNode? {
				return getToken(SailParser.Tokens.FLOAT.rawValue, 0)
			}
			open
			func CHARACTER() -> TerminalNode? {
				return getToken(SailParser.Tokens.CHARACTER.rawValue, 0)
			}
			open
			func STRING() -> TerminalNode? {
				return getToken(SailParser.Tokens.STRING.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_type
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitType(self)
			}
		}
	}
	@discardableResult
	 open func type() throws -> TypeContext {
		var _localctx: TypeContext = TypeContext(_ctx, getState())
		try enterRule(_localctx, 28, SailParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(168)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.INT.rawValue,SailParser.Tokens.FLOAT.rawValue,SailParser.Tokens.BOOL.rawValue,SailParser.Tokens.CHARACTER.rawValue,SailParser.Tokens.STRING.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionContext: ParserRuleContext {
			open
			func FUNC() -> TerminalNode? {
				return getToken(SailParser.Tokens.FUNC.rawValue, 0)
			}
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func ARROW() -> TerminalNode? {
				return getToken(SailParser.Tokens.ARROW.rawValue, 0)
			}
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func VOID() -> TerminalNode? {
				return getToken(SailParser.Tokens.VOID.rawValue, 0)
			}
			open
			func parameters() -> ParametersContext? {
				return getRuleContext(ParametersContext.self, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
			open
			func RETURN() -> TerminalNode? {
				return getToken(SailParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func letterLiteral() -> LetterLiteralContext? {
				return getRuleContext(LetterLiteralContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_function
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterFunction(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitFunction(self)
			}
		}
	}
	@discardableResult
	 open func function() throws -> FunctionContext {
		var _localctx: FunctionContext = FunctionContext(_ctx, getState())
		try enterRule(_localctx, 30, SailParser.RULE_function)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(170)
		 	try match(SailParser.Tokens.FUNC.rawValue)
		 	setState(171)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(172)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(174)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.IDENTIFIER.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(173)
		 		try parameters()

		 	}

		 	setState(176)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(177)
		 	try match(SailParser.Tokens.ARROW.rawValue)
		 	setState(180)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .INT:fallthrough
		 	case .FLOAT:fallthrough
		 	case .BOOL:fallthrough
		 	case .CHARACTER:fallthrough
		 	case .STRING:
		 		setState(178)
		 		try type()

		 		break

		 	case .VOID:
		 		setState(179)
		 		try match(SailParser.Tokens.VOID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(182)
		 	try match(SailParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(186)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.PRINT.rawValue,SailParser.Tokens.IF.rawValue,SailParser.Tokens.WHILE.rawValue,SailParser.Tokens.FOR.rawValue,SailParser.Tokens.IDENTIFIER.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(183)
		 		try statement()


		 		setState(188)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(196)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.RETURN.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(189)
		 		try match(SailParser.Tokens.RETURN.rawValue)
		 		setState(192)
		 		try _errHandler.sync(self)
		 		switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .MINUS:fallthrough
		 		case .OPEN_PARENTHESIS:fallthrough
		 		case .CONSTANT_INT:fallthrough
		 		case .CONSTANT_FLOAT:fallthrough
		 		case .CONSTANT_BOOLEAN:fallthrough
		 		case .IDENTIFIER:
		 			setState(190)
		 			try logicExp()

		 			break
		 		case .CONSTANT_CHAR:fallthrough
		 		case .CONSTANT_STRING:
		 			setState(191)
		 			try letterLiteral()

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(194)
		 		try match(SailParser.Tokens.SEMICOLON.rawValue)

		 	}

		 	setState(198)
		 	try match(SailParser.Tokens.CLOSE_CURLY.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParametersContext: ParserRuleContext {
			open
			func parameter() -> [ParameterContext] {
				return getRuleContexts(ParameterContext.self)
			}
			open
			func parameter(_ i: Int) -> ParameterContext? {
				return getRuleContext(ParameterContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(SailParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(SailParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_parameters
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterParameters(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitParameters(self)
			}
		}
	}
	@discardableResult
	 open func parameters() throws -> ParametersContext {
		var _localctx: ParametersContext = ParametersContext(_ctx, getState())
		try enterRule(_localctx, 32, SailParser.RULE_parameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(200)
		 	try parameter()
		 	setState(205)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(201)
		 		try match(SailParser.Tokens.COMMA.rawValue)
		 		setState(202)
		 		try parameter()


		 		setState(207)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.COLON.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_parameter
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterParameter(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitParameter(self)
			}
		}
	}
	@discardableResult
	 open func parameter() throws -> ParameterContext {
		var _localctx: ParameterContext = ParameterContext(_ctx, getState())
		try enterRule(_localctx, 34, SailParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(208)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(209)
		 	try match(SailParser.Tokens.COLON.rawValue)
		 	setState(210)
		 	try type()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CallContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(SailParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(SailParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_call
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterCall(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitCall(self)
			}
		}
	}
	@discardableResult
	 open func call() throws -> CallContext {
		var _localctx: CallContext = CallContext(_ctx, getState())
		try enterRule(_localctx, 36, SailParser.RULE_call)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(212)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(213)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(222)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.MINUS.rawValue,SailParser.Tokens.OPEN_PARENTHESIS.rawValue,SailParser.Tokens.CONSTANT_INT.rawValue,SailParser.Tokens.CONSTANT_FLOAT.rawValue,SailParser.Tokens.CONSTANT_BOOLEAN.rawValue,SailParser.Tokens.IDENTIFIER.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(214)
		 		try expression()
		 		setState(219)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.COMMA.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(215)
		 			try match(SailParser.Tokens.COMMA.rawValue)
		 			setState(216)
		 			try expression()


		 			setState(221)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(224)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(225)
		 	try match(SailParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LogicExpContext: ParserRuleContext {
			open
			func relationalExp() -> RelationalExpContext? {
				return getRuleContext(RelationalExpContext.self, 0)
			}
			open
			func logicExpP() -> LogicExpPContext? {
				return getRuleContext(LogicExpPContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_logicExp
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterLogicExp(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitLogicExp(self)
			}
		}
	}
	@discardableResult
	 open func logicExp() throws -> LogicExpContext {
		var _localctx: LogicExpContext = LogicExpContext(_ctx, getState())
		try enterRule(_localctx, 38, SailParser.RULE_logicExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(227)
		 	try relationalExp()
		 	setState(229)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.AND.rawValue || _la == SailParser.Tokens.OR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(228)
		 		try logicExpP()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LogicExpPContext: ParserRuleContext {
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func AND() -> TerminalNode? {
				return getToken(SailParser.Tokens.AND.rawValue, 0)
			}
			open
			func OR() -> TerminalNode? {
				return getToken(SailParser.Tokens.OR.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_logicExpP
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterLogicExpP(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitLogicExpP(self)
			}
		}
	}
	@discardableResult
	 open func logicExpP() throws -> LogicExpPContext {
		var _localctx: LogicExpPContext = LogicExpPContext(_ctx, getState())
		try enterRule(_localctx, 40, SailParser.RULE_logicExpP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(231)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.AND.rawValue || _la == SailParser.Tokens.OR.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(232)
		 	try logicExp()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RelationalExpContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func relationalExpP() -> RelationalExpPContext? {
				return getRuleContext(RelationalExpPContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_relationalExp
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterRelationalExp(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitRelationalExp(self)
			}
		}
	}
	@discardableResult
	 open func relationalExp() throws -> RelationalExpContext {
		var _localctx: RelationalExpContext = RelationalExpContext(_ctx, getState())
		try enterRule(_localctx, 42, SailParser.RULE_relationalExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(234)
		 	try expression()
		 	setState(236)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.EQUAL.rawValue,SailParser.Tokens.EQUAL_GREATER_THAN.rawValue,SailParser.Tokens.EQUAL_LESS_THAN.rawValue,SailParser.Tokens.GREATER_THAN.rawValue,SailParser.Tokens.LESS_THAN.rawValue,SailParser.Tokens.NOT_EQUAL.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(235)
		 		try relationalExpP()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RelationalExpPContext: ParserRuleContext {
			open
			func relationalOp() -> RelationalOpContext? {
				return getRuleContext(RelationalOpContext.self, 0)
			}
			open
			func relationalExp() -> RelationalExpContext? {
				return getRuleContext(RelationalExpContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_relationalExpP
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterRelationalExpP(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitRelationalExpP(self)
			}
		}
	}
	@discardableResult
	 open func relationalExpP() throws -> RelationalExpPContext {
		var _localctx: RelationalExpPContext = RelationalExpPContext(_ctx, getState())
		try enterRule(_localctx, 44, SailParser.RULE_relationalExpP)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(238)
		 	try relationalOp()
		 	setState(239)
		 	try relationalExp()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RelationalOpContext: ParserRuleContext {
			open
			func EQUAL() -> TerminalNode? {
				return getToken(SailParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func EQUAL_GREATER_THAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.EQUAL_GREATER_THAN.rawValue, 0)
			}
			open
			func EQUAL_LESS_THAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.EQUAL_LESS_THAN.rawValue, 0)
			}
			open
			func GREATER_THAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.GREATER_THAN.rawValue, 0)
			}
			open
			func LESS_THAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.LESS_THAN.rawValue, 0)
			}
			open
			func NOT_EQUAL() -> TerminalNode? {
				return getToken(SailParser.Tokens.NOT_EQUAL.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_relationalOp
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterRelationalOp(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitRelationalOp(self)
			}
		}
	}
	@discardableResult
	 open func relationalOp() throws -> RelationalOpContext {
		var _localctx: RelationalOpContext = RelationalOpContext(_ctx, getState())
		try enterRule(_localctx, 46, SailParser.RULE_relationalOp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(241)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.EQUAL.rawValue,SailParser.Tokens.EQUAL_GREATER_THAN.rawValue,SailParser.Tokens.EQUAL_LESS_THAN.rawValue,SailParser.Tokens.GREATER_THAN.rawValue,SailParser.Tokens.LESS_THAN.rawValue,SailParser.Tokens.NOT_EQUAL.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func expressionP() -> ExpressionPContext? {
				return getRuleContext(ExpressionPContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitExpression(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 48, SailParser.RULE_expression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(243)
		 	try term()
		 	setState(245)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue || _la == SailParser.Tokens.PLUS.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(244)
		 		try expressionP()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionPContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func PLUS() -> TerminalNode? {
				return getToken(SailParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(SailParser.Tokens.MINUS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_expressionP
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterExpressionP(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitExpressionP(self)
			}
		}
	}
	@discardableResult
	 open func expressionP() throws -> ExpressionPContext {
		var _localctx: ExpressionPContext = ExpressionPContext(_ctx, getState())
		try enterRule(_localctx, 50, SailParser.RULE_expressionP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(247)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue || _la == SailParser.Tokens.PLUS.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(248)
		 	try expression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TermContext: ParserRuleContext {
			open
			func factor() -> FactorContext? {
				return getRuleContext(FactorContext.self, 0)
			}
			open
			func termP() -> TermPContext? {
				return getRuleContext(TermPContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_term
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterTerm(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitTerm(self)
			}
		}
	}
	@discardableResult
	 open func term() throws -> TermContext {
		var _localctx: TermContext = TermContext(_ctx, getState())
		try enterRule(_localctx, 52, SailParser.RULE_term)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(250)
		 	try factor()
		 	setState(252)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.DIVISION.rawValue || _la == SailParser.Tokens.MULTIPLICATION.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(251)
		 		try termP()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TermPContext: ParserRuleContext {
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func MULTIPLICATION() -> TerminalNode? {
				return getToken(SailParser.Tokens.MULTIPLICATION.rawValue, 0)
			}
			open
			func DIVISION() -> TerminalNode? {
				return getToken(SailParser.Tokens.DIVISION.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_termP
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterTermP(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitTermP(self)
			}
		}
	}
	@discardableResult
	 open func termP() throws -> TermPContext {
		var _localctx: TermPContext = TermPContext(_ctx, getState())
		try enterRule(_localctx, 54, SailParser.RULE_termP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(254)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.DIVISION.rawValue || _la == SailParser.Tokens.MULTIPLICATION.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(255)
		 	try term()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FactorContext: ParserRuleContext {
			open
			func varLiteral() -> VarLiteralContext? {
				return getRuleContext(VarLiteralContext.self, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_factor
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterFactor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitFactor(self)
			}
		}
	}
	@discardableResult
	 open func factor() throws -> FactorContext {
		var _localctx: FactorContext = FactorContext(_ctx, getState())
		try enterRule(_localctx, 56, SailParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(262)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MINUS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(257)
		 		try varLiteral()

		 		break

		 	case .OPEN_PARENTHESIS:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(258)
		 		try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 		setState(259)
		 		try logicExp()
		 		setState(260)
		 		try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)


		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LiteralContext: ParserRuleContext {
			open
			func varLiteral() -> VarLiteralContext? {
				return getRuleContext(VarLiteralContext.self, 0)
			}
			open
			func letterLiteral() -> LetterLiteralContext? {
				return getRuleContext(LetterLiteralContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_literal
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitLiteral(self)
			}
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 58, SailParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(266)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MINUS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(264)
		 		try varLiteral()

		 		break
		 	case .CONSTANT_CHAR:fallthrough
		 	case .CONSTANT_STRING:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(265)
		 		try letterLiteral()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarLiteralContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func CONSTANT_INT() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_INT.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(SailParser.Tokens.MINUS.rawValue, 0)
			}
			open
			func CONSTANT_FLOAT() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_FLOAT.rawValue, 0)
			}
			open
			func CONSTANT_BOOLEAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_BOOLEAN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_varLiteral
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterVarLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitVarLiteral(self)
			}
		}
	}
	@discardableResult
	 open func varLiteral() throws -> VarLiteralContext {
		var _localctx: VarLiteralContext = VarLiteralContext(_ctx, getState())
		try enterRule(_localctx, 60, SailParser.RULE_varLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(278)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,26, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(268)
		 		try match(SailParser.Tokens.IDENTIFIER.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(270)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(269)
		 			try match(SailParser.Tokens.MINUS.rawValue)

		 		}

		 		setState(272)
		 		try match(SailParser.Tokens.CONSTANT_INT.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(274)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(273)
		 			try match(SailParser.Tokens.MINUS.rawValue)

		 		}

		 		setState(276)
		 		try match(SailParser.Tokens.CONSTANT_FLOAT.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(277)
		 		try match(SailParser.Tokens.CONSTANT_BOOLEAN.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LetterLiteralContext: ParserRuleContext {
			open
			func CONSTANT_CHAR() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_CHAR.rawValue, 0)
			}
			open
			func CONSTANT_STRING() -> TerminalNode? {
				return getToken(SailParser.Tokens.CONSTANT_STRING.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_letterLiteral
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterLetterLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitLetterLiteral(self)
			}
		}
	}
	@discardableResult
	 open func letterLiteral() throws -> LetterLiteralContext {
		var _localctx: LetterLiteralContext = LetterLiteralContext(_ctx, getState())
		try enterRule(_localctx, 62, SailParser.RULE_letterLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(280)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.CONSTANT_CHAR.rawValue || _la == SailParser.Tokens.CONSTANT_STRING.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = SailParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}