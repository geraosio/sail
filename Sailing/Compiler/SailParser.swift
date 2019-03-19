// Generated from /Users/geraosio/Documents/Developer/apple/iOS/Projects/Sailing/Sailing/Compiler/Sail.g4 by ANTLR 4.7.2
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
		case EOF = -1, SAIL = 1, IDENTIFIER = 2, INT = 3, FLOAT = 4, BOOL = 5, 
                 CHARACTER = 6, STRING = 7, VOID = 8, VAR = 9, PRINT = 10, 
                 FUNC = 11, RETURN = 12, IF = 13, ELSE = 14, WHILE = 15, 
                 FOR = 16, IN = 17, TO = 18, THROUGH = 19, BY = 20, DIVISION = 21, 
                 MINUS = 22, MULTIPLICATION = 23, PLUS = 24, AND = 25, ASSIGN = 26, 
                 EQUAL = 27, EQUAL_GREATER_THAN = 28, EQUAL_LESS_THAN = 29, 
                 GREATER_THAN = 30, LESS_THAN = 31, NOT = 32, NOT_EQUAL = 33, 
                 OR = 34, OPEN_BRACKET = 35, CLOSE_BRACKET = 36, OPEN_CURLY = 37, 
                 CLOSE_CURLY = 38, OPEN_PARENTHESIS = 39, CLOSE_PARENTHESIS = 40, 
                 ARROW = 41, COLON = 42, COMMA = 43, DOT = 44, SEMICOLON = 45, 
                 CONSTANT_INT = 46, CONSTANT_FLOAT = 47, CONSTANT_BOOLEAN = 48, 
                 CONSTANT_CHAR = 49, CONSTANT_STRING = 50, COMMENTS = 51, 
                 WHITESPACE = 52, NEWLINE = 53
	}

	public
	static let RULE_sail = 0, RULE_program = 1, RULE_block = 2, RULE_statute = 3, 
            RULE_basicStatute = 4, RULE_statement = 5, RULE_stmtBlock = 6, 
            RULE_assignment = 7, RULE_condition = 8, RULE_loop = 9, RULE_forStmt = 10, 
            RULE_forStride = 11, RULE_whileStmt = 12, RULE_print = 13, RULE_variable = 14, 
            RULE_type = 15, RULE_function = 16, RULE_parameters = 17, RULE_parameter = 18, 
            RULE_call = 19, RULE_logicExp = 20, RULE_logicExpP = 21, RULE_relationalExp = 22, 
            RULE_relationalExpP = 23, RULE_relationalOp = 24, RULE_expression = 25, 
            RULE_expressionP = 26, RULE_term = 27, RULE_termP = 28, RULE_factor = 29, 
            RULE_literal = 30, RULE_varLiteral = 31, RULE_letterLiteral = 32

	public
	static let ruleNames: [String] = [
		"sail", "program", "block", "statute", "basicStatute", "statement", "stmtBlock", 
		"assignment", "condition", "loop", "forStmt", "forStride", "whileStmt", 
		"print", "variable", "type", "function", "parameters", "parameter", "call", 
		"logicExp", "logicExpP", "relationalExp", "relationalExpP", "relationalOp", 
		"expression", "expressionP", "term", "termP", "factor", "literal", "varLiteral", 
		"letterLiteral"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, "'Int'", "'Float'", "'Bool'", "'Character'", "'String'", 
		"'Void'", "'var'", "'print'", "'func'", "'return'", "'if'", "'else'", 
		"'while'", "'for'", "'in'", "'to'", "'through'", "'by'", "'/'", "'-'", 
		"'*'", "'+'", "'&&'", "'='", "'=='", "'>='", "'<='", "'>'", "'<'", "'!'", 
		"'!='", "'||'", "'['", "']'", "'{'", "'}'", "'('", "')'", "'->'", "':'", 
		"','", "'.'", "';'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "SAIL", "IDENTIFIER", "INT", "FLOAT", "BOOL", "CHARACTER", "STRING", 
		"VOID", "VAR", "PRINT", "FUNC", "RETURN", "IF", "ELSE", "WHILE", "FOR", 
		"IN", "TO", "THROUGH", "BY", "DIVISION", "MINUS", "MULTIPLICATION", "PLUS", 
		"AND", "ASSIGN", "EQUAL", "EQUAL_GREATER_THAN", "EQUAL_LESS_THAN", "GREATER_THAN", 
		"LESS_THAN", "NOT", "NOT_EQUAL", "OR", "OPEN_BRACKET", "CLOSE_BRACKET", 
		"OPEN_CURLY", "CLOSE_CURLY", "OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", 
		"ARROW", "COLON", "COMMA", "DOT", "SEMICOLON", "CONSTANT_INT", "CONSTANT_FLOAT", 
		"CONSTANT_BOOLEAN", "CONSTANT_CHAR", "CONSTANT_STRING", "COMMENTS", "WHITESPACE", 
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


	public class SailContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(SailParser.Tokens.EOF.rawValue, 0)
			}
			open
			func program() -> [ProgramContext] {
				return getRuleContexts(ProgramContext.self)
			}
			open
			func program(_ i: Int) -> ProgramContext? {
				return getRuleContext(ProgramContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_sail
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterSail(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitSail(self)
			}
		}
	}
	@discardableResult
	 open func sail() throws -> SailContext {
		var _localctx: SailContext = SailContext(_ctx, getState())
		try enterRule(_localctx, 0, SailParser.RULE_sail)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(67) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(66)
		 		try program()


		 		setState(69); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.SAIL.rawValue
		 	      return testSet
		 	 }())
		 	setState(71)
		 	try match(SailParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProgramContext: ParserRuleContext {
			open
			func SAIL() -> TerminalNode? {
				return getToken(SailParser.Tokens.SAIL.rawValue, 0)
			}
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func block() -> BlockContext? {
				return getRuleContext(BlockContext.self, 0)
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
		try enterRule(_localctx, 2, SailParser.RULE_program)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(73)
		 	try match(SailParser.Tokens.SAIL.rawValue)
		 	setState(74)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(75)
		 	try block()

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
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
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
		 	setState(77)
		 	try match(SailParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(81)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.IDENTIFIER.rawValue,SailParser.Tokens.VAR.rawValue,SailParser.Tokens.PRINT.rawValue,SailParser.Tokens.FUNC.rawValue,SailParser.Tokens.IF.rawValue,SailParser.Tokens.WHILE.rawValue,SailParser.Tokens.FOR.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(78)
		 		try statute()


		 		setState(83)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(84)
		 	try match(SailParser.Tokens.CLOSE_CURLY.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatuteContext: ParserRuleContext {
			open
			func basicStatute() -> BasicStatuteContext? {
				return getRuleContext(BasicStatuteContext.self, 0)
			}
			open
			func function() -> FunctionContext? {
				return getRuleContext(FunctionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_statute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterStatute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitStatute(self)
			}
		}
	}
	@discardableResult
	 open func statute() throws -> StatuteContext {
		var _localctx: StatuteContext = StatuteContext(_ctx, getState())
		try enterRule(_localctx, 6, SailParser.RULE_statute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(88)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .VAR:fallthrough
		 	case .PRINT:fallthrough
		 	case .IF:fallthrough
		 	case .WHILE:fallthrough
		 	case .FOR:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(86)
		 		try basicStatute()

		 		break

		 	case .FUNC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(87)
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

	public class BasicStatuteContext: ParserRuleContext {
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func variable() -> VariableContext? {
				return getRuleContext(VariableContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_basicStatute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterBasicStatute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitBasicStatute(self)
			}
		}
	}
	@discardableResult
	 open func basicStatute() throws -> BasicStatuteContext {
		var _localctx: BasicStatuteContext = BasicStatuteContext(_ctx, getState())
		try enterRule(_localctx, 8, SailParser.RULE_basicStatute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(92)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .PRINT:fallthrough
		 	case .IF:fallthrough
		 	case .WHILE:fallthrough
		 	case .FOR:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(90)
		 		try statement()

		 		break

		 	case .VAR:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(91)
		 		try variable()

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
			func print() -> PrintContext? {
				return getRuleContext(PrintContext.self, 0)
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
		try enterRule(_localctx, 10, SailParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(99)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,4, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(94)
		 		try assignment()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(95)
		 		try condition()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(96)
		 		try loop()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(97)
		 		try print()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(98)
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

	public class StmtBlockContext: ParserRuleContext {
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(SailParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_stmtBlock
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterStmtBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitStmtBlock(self)
			}
		}
	}
	@discardableResult
	 open func stmtBlock() throws -> StmtBlockContext {
		var _localctx: StmtBlockContext = StmtBlockContext(_ctx, getState())
		try enterRule(_localctx, 12, SailParser.RULE_stmtBlock)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(101)
		 	try match(SailParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(102)
		 	try statement()
		 	setState(103)
		 	try match(SailParser.Tokens.CLOSE_CURLY.rawValue)

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
		try enterRule(_localctx, 14, SailParser.RULE_assignment)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(105)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(110)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.OPEN_BRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(106)
		 		try match(SailParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(107)
		 		try expression()
		 		setState(108)
		 		try match(SailParser.Tokens.CLOSE_BRACKET.rawValue)

		 	}

		 	setState(112)
		 	try match(SailParser.Tokens.ASSIGN.rawValue)
		 	setState(115)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .MINUS:fallthrough
		 	case .OPEN_PARENTHESIS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:
		 		setState(113)
		 		try logicExp()

		 		break
		 	case .CONSTANT_CHAR:fallthrough
		 	case .CONSTANT_STRING:
		 		setState(114)
		 		try letterLiteral()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(117)
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
			func stmtBlock() -> [StmtBlockContext] {
				return getRuleContexts(StmtBlockContext.self)
			}
			open
			func stmtBlock(_ i: Int) -> StmtBlockContext? {
				return getRuleContext(StmtBlockContext.self, i)
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
		try enterRule(_localctx, 16, SailParser.RULE_condition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(119)
		 	try match(SailParser.Tokens.IF.rawValue)
		 	setState(120)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(121)
		 	try logicExp()
		 	setState(122)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(123)
		 	try stmtBlock()
		 	setState(126)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.ELSE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(124)
		 		try match(SailParser.Tokens.ELSE.rawValue)
		 		setState(125)
		 		try stmtBlock()

		 	}


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
		try enterRule(_localctx, 18, SailParser.RULE_loop)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(130)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FOR:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(128)
		 		try forStmt()

		 		break

		 	case .WHILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(129)
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
			func stmtBlock() -> StmtBlockContext? {
				return getRuleContext(StmtBlockContext.self, 0)
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
		try enterRule(_localctx, 20, SailParser.RULE_forStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(132)
		 	try match(SailParser.Tokens.FOR.rawValue)
		 	setState(133)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(134)
		 	try match(SailParser.Tokens.IN.rawValue)
		 	setState(135)
		 	try expression()
		 	setState(136)
		 	try forStride()
		 	setState(137)
		 	try expression()
		 	setState(138)
		 	try match(SailParser.Tokens.BY.rawValue)
		 	setState(139)
		 	try expression()
		 	setState(140)
		 	try stmtBlock()

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
		try enterRule(_localctx, 22, SailParser.RULE_forStride)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(142)
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
			func stmtBlock() -> StmtBlockContext? {
				return getRuleContext(StmtBlockContext.self, 0)
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
		try enterRule(_localctx, 24, SailParser.RULE_whileStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(144)
		 	try match(SailParser.Tokens.WHILE.rawValue)
		 	setState(145)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(146)
		 	try logicExp()
		 	setState(147)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(148)
		 	try stmtBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrintContext: ParserRuleContext {
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
			return SailParser.RULE_print
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterPrint(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitPrint(self)
			}
		}
	}
	@discardableResult
	 open func print() throws -> PrintContext {
		var _localctx: PrintContext = PrintContext(_ctx, getState())
		try enterRule(_localctx, 26, SailParser.RULE_print)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(150)
		 	try match(SailParser.Tokens.PRINT.rawValue)
		 	setState(151)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(155)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,9, _ctx)) {
		 	case 1:
		 		setState(152)
		 		try logicExp()

		 		break
		 	case 2:
		 		setState(153)
		 		try letterLiteral()

		 		break
		 	case 3:
		 		setState(154)
		 		try call()

		 		break
		 	default: break
		 	}
		 	setState(157)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(158)
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
		try enterRule(_localctx, 28, SailParser.RULE_variable)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(160)
		 	try match(SailParser.Tokens.VAR.rawValue)
		 	setState(161)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(165)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.OPEN_BRACKET.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(162)
		 		try match(SailParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(163)
		 		try match(SailParser.Tokens.CONSTANT_INT.rawValue)
		 		setState(164)
		 		try match(SailParser.Tokens.CLOSE_BRACKET.rawValue)

		 	}

		 	setState(167)
		 	try match(SailParser.Tokens.COLON.rawValue)
		 	setState(168)
		 	try type()
		 	setState(169)
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
		try enterRule(_localctx, 30, SailParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(171)
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
			func IDENTIFIER() -> [TerminalNode] {
				return getTokens(SailParser.Tokens.IDENTIFIER.rawValue)
			}
			open
			func IDENTIFIER(_ i:Int) -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, i)
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
			func basicStatute() -> [BasicStatuteContext] {
				return getRuleContexts(BasicStatuteContext.self)
			}
			open
			func basicStatute(_ i: Int) -> BasicStatuteContext? {
				return getRuleContext(BasicStatuteContext.self, i)
			}
			open
			func RETURN() -> TerminalNode? {
				return getToken(SailParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(SailParser.Tokens.SEMICOLON.rawValue, 0)
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
		try enterRule(_localctx, 32, SailParser.RULE_function)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(173)
		 	try match(SailParser.Tokens.FUNC.rawValue)
		 	setState(174)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(175)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(177)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.IDENTIFIER.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(176)
		 		try parameters()

		 	}

		 	setState(179)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(180)
		 	try match(SailParser.Tokens.ARROW.rawValue)
		 	setState(183)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .INT:fallthrough
		 	case .FLOAT:fallthrough
		 	case .BOOL:fallthrough
		 	case .CHARACTER:fallthrough
		 	case .STRING:
		 		setState(181)
		 		try type()

		 		break

		 	case .VOID:
		 		setState(182)
		 		try match(SailParser.Tokens.VOID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(185)
		 	try match(SailParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(187) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(186)
		 		try basicStatute()


		 		setState(189); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.IDENTIFIER.rawValue,SailParser.Tokens.VAR.rawValue,SailParser.Tokens.PRINT.rawValue,SailParser.Tokens.IF.rawValue,SailParser.Tokens.WHILE.rawValue,SailParser.Tokens.FOR.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(194)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.RETURN.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(191)
		 		try match(SailParser.Tokens.RETURN.rawValue)
		 		setState(192)
		 		try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 		setState(193)
		 		try match(SailParser.Tokens.SEMICOLON.rawValue)

		 	}

		 	setState(196)
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
		try enterRule(_localctx, 34, SailParser.RULE_parameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(198)
		 	try parameter()
		 	setState(203)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(199)
		 		try match(SailParser.Tokens.COMMA.rawValue)
		 		setState(200)
		 		try parameter()


		 		setState(205)
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
		try enterRule(_localctx, 36, SailParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(206)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(207)
		 	try match(SailParser.Tokens.COLON.rawValue)
		 	setState(208)
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
		try enterRule(_localctx, 38, SailParser.RULE_call)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(210)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(211)
		 	try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(220)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.IDENTIFIER.rawValue,SailParser.Tokens.MINUS.rawValue,SailParser.Tokens.OPEN_PARENTHESIS.rawValue,SailParser.Tokens.CONSTANT_INT.rawValue,SailParser.Tokens.CONSTANT_FLOAT.rawValue,SailParser.Tokens.CONSTANT_BOOLEAN.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(212)
		 		try expression()
		 		setState(217)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.COMMA.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(213)
		 			try match(SailParser.Tokens.COMMA.rawValue)
		 			setState(214)
		 			try expression()


		 			setState(219)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(222)
		 	try match(SailParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(223)
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
		try enterRule(_localctx, 40, SailParser.RULE_logicExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(225)
		 	try relationalExp()
		 	setState(227)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.AND.rawValue || _la == SailParser.Tokens.OR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(226)
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
		try enterRule(_localctx, 42, SailParser.RULE_logicExpP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(229)
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
		 	setState(230)
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
		try enterRule(_localctx, 44, SailParser.RULE_relationalExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(232)
		 	try expression()
		 	setState(234)
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
		 		setState(233)
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
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
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
		try enterRule(_localctx, 46, SailParser.RULE_relationalExpP)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(236)
		 	try relationalOp()
		 	setState(237)
		 	try expression()

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
		try enterRule(_localctx, 48, SailParser.RULE_relationalOp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(239)
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
		try enterRule(_localctx, 50, SailParser.RULE_expression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(241)
		 	try term()
		 	setState(243)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue || _la == SailParser.Tokens.PLUS.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(242)
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
		try enterRule(_localctx, 52, SailParser.RULE_expressionP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(245)
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
		 	setState(246)
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
		try enterRule(_localctx, 54, SailParser.RULE_term)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(248)
		 	try factor()
		 	setState(250)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.DIVISION.rawValue || _la == SailParser.Tokens.MULTIPLICATION.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(249)
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
		try enterRule(_localctx, 56, SailParser.RULE_termP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(252)
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
		 	setState(253)
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
		try enterRule(_localctx, 58, SailParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(260)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .MINUS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(255)
		 		try varLiteral()

		 		break

		 	case .OPEN_PARENTHESIS:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(256)
		 		try match(SailParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 		setState(257)
		 		try logicExp()
		 		setState(258)
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
		try enterRule(_localctx, 60, SailParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(264)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .MINUS:fallthrough
		 	case .CONSTANT_INT:fallthrough
		 	case .CONSTANT_FLOAT:fallthrough
		 	case .CONSTANT_BOOLEAN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(262)
		 		try varLiteral()

		 		break
		 	case .CONSTANT_CHAR:fallthrough
		 	case .CONSTANT_STRING:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(263)
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
		try enterRule(_localctx, 62, SailParser.RULE_varLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(276)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,26, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(266)
		 		try match(SailParser.Tokens.IDENTIFIER.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(268)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(267)
		 			try match(SailParser.Tokens.MINUS.rawValue)

		 		}

		 		setState(270)
		 		try match(SailParser.Tokens.CONSTANT_INT.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(272)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SailParser.Tokens.MINUS.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(271)
		 			try match(SailParser.Tokens.MINUS.rawValue)

		 		}

		 		setState(274)
		 		try match(SailParser.Tokens.CONSTANT_FLOAT.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(275)
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
		try enterRule(_localctx, 64, SailParser.RULE_letterLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(278)
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