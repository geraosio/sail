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
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, 
                 T__6 = 7, T__7 = 8, T__8 = 9, T__9 = 10, T__10 = 11, T__11 = 12, 
                 T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17, 
                 T__17 = 18, T__18 = 19, T__19 = 20, T__20 = 21, T__21 = 22, 
                 T__22 = 23, T__23 = 24, T__24 = 25, T__25 = 26, T__26 = 27, 
                 T__27 = 28, T__28 = 29, T__29 = 30, T__30 = 31, T__31 = 32, 
                 T__32 = 33, T__33 = 34, T__34 = 35, T__35 = 36, T__36 = 37, 
                 T__37 = 38, T__38 = 39, T__39 = 40, T__40 = 41, IDENTIFIER = 42, 
                 INT = 43, FLOAT = 44, BOOLEAN = 45, STRING = 46, WHITESPACE = 47, 
                 NEWLINE = 48, COMMENTS = 49
	}

	public
	static let RULE_program = 0, RULE_block = 1, RULE_statute = 2, RULE_basicStatute = 3, 
            RULE_statement = 4, RULE_assignment = 5, RULE_condition = 6, 
            RULE_conditionStmt = 7, RULE_loop = 8, RULE_forStmt = 9, RULE_forStride = 10, 
            RULE_whileStmt = 11, RULE_print = 12, RULE_variables = 13, RULE_type = 14, 
            RULE_typeSpec = 15, RULE_function = 16, RULE_parameters = 17, 
            RULE_parameter = 18, RULE_functionCall = 19, RULE_parametersDec = 20, 
            RULE_logicExp = 21, RULE_logicExpP = 22, RULE_relationalExp = 23, 
            RULE_relationalExpP = 24, RULE_relationalOp = 25, RULE_expression = 26, 
            RULE_expressionP = 27, RULE_term = 28, RULE_termP = 29, RULE_factor = 30, 
            RULE_literal = 31, RULE_varLiteral = 32, RULE_stringLiteral = 33

	public
	static let ruleNames: [String] = [
		"program", "block", "statute", "basicStatute", "statement", "assignment", 
		"condition", "conditionStmt", "loop", "forStmt", "forStride", "whileStmt", 
		"print", "variables", "type", "typeSpec", "function", "parameters", "parameter", 
		"functionCall", "parametersDec", "logicExp", "logicExpP", "relationalExp", 
		"relationalExpP", "relationalOp", "expression", "expressionP", "term", 
		"termP", "factor", "literal", "varLiteral", "stringLiteral"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'sail'", "'{'", "'}'", "'='", "';'", "'if'", "'('", "')'", "'else'", 
		"'for'", "'in'", "'by'", "'to'", "'through'", "'while'", "'print'", "'var'", 
		"','", "':'", "'['", "']'", "'Bool'", "'Int'", "'Float'", "'Character'", 
		"'String'", "'func'", "'->'", "'return'", "'&&'", "'||'", "'<'", "'>'", 
		"'=='", "'<='", "'>='", "'!='", "'+'", "'-'", "'*'", "'/'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		"IDENTIFIER", "INT", "FLOAT", "BOOLEAN", "STRING", "WHITESPACE", "NEWLINE", 
		"COMMENTS"
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
		try enterRule(_localctx, 0, SailParser.RULE_program)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(68)
		 	try match(SailParser.Tokens.T__0.rawValue)
		 	setState(69)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(70)
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
		try enterRule(_localctx, 2, SailParser.RULE_block)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(72)
		 	try match(SailParser.Tokens.T__1.rawValue)
		 	setState(76)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.T__5.rawValue,SailParser.Tokens.T__9.rawValue,SailParser.Tokens.T__14.rawValue,SailParser.Tokens.T__15.rawValue,SailParser.Tokens.T__16.rawValue,SailParser.Tokens.T__26.rawValue,SailParser.Tokens.IDENTIFIER.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(73)
		 		try statute()


		 		setState(78)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(79)
		 	try match(SailParser.Tokens.T__2.rawValue)

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
		try enterRule(_localctx, 4, SailParser.RULE_statute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(83)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__5:fallthrough
		 	case .T__9:fallthrough
		 	case .T__14:fallthrough
		 	case .T__15:fallthrough
		 	case .T__16:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(81)
		 		try basicStatute()

		 		break

		 	case .T__26:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(82)
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
			func variables() -> VariablesContext? {
				return getRuleContext(VariablesContext.self, 0)
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
		try enterRule(_localctx, 6, SailParser.RULE_basicStatute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(87)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__5:fallthrough
		 	case .T__9:fallthrough
		 	case .T__14:fallthrough
		 	case .T__15:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(85)
		 		try statement()

		 		break

		 	case .T__16:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(86)
		 		try variables()

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
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
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
		try enterRule(_localctx, 8, SailParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(94)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(89)
		 		try assignment()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(90)
		 		try condition()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(91)
		 		try loop()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(92)
		 		try print()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(93)
		 		try functionCall()

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
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
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
		try enterRule(_localctx, 10, SailParser.RULE_assignment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(96)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(97)
		 	try match(SailParser.Tokens.T__3.rawValue)
		 	setState(100)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__6:fallthrough
		 	case .IDENTIFIER:fallthrough
		 	case .INT:fallthrough
		 	case .FLOAT:fallthrough
		 	case .BOOLEAN:
		 		setState(98)
		 		try logicExp()

		 		break

		 	case .STRING:
		 		setState(99)
		 		try stringLiteral()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(102)
		 	try match(SailParser.Tokens.T__4.rawValue)

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
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func conditionStmt() -> [ConditionStmtContext] {
				return getRuleContexts(ConditionStmtContext.self)
			}
			open
			func conditionStmt(_ i: Int) -> ConditionStmtContext? {
				return getRuleContext(ConditionStmtContext.self, i)
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
		try enterRule(_localctx, 12, SailParser.RULE_condition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(104)
		 	try match(SailParser.Tokens.T__5.rawValue)
		 	setState(105)
		 	try match(SailParser.Tokens.T__6.rawValue)
		 	setState(106)
		 	try logicExp()
		 	setState(107)
		 	try match(SailParser.Tokens.T__7.rawValue)
		 	setState(108)
		 	try conditionStmt()
		 	setState(111)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__8.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(109)
		 		try match(SailParser.Tokens.T__8.rawValue)
		 		setState(110)
		 		try conditionStmt()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionStmtContext: ParserRuleContext {
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_conditionStmt
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterConditionStmt(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitConditionStmt(self)
			}
		}
	}
	@discardableResult
	 open func conditionStmt() throws -> ConditionStmtContext {
		var _localctx: ConditionStmtContext = ConditionStmtContext(_ctx, getState())
		try enterRule(_localctx, 14, SailParser.RULE_conditionStmt)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(113)
		 	try match(SailParser.Tokens.T__1.rawValue)
		 	setState(114)
		 	try statement()
		 	setState(115)
		 	try match(SailParser.Tokens.T__2.rawValue)

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
		 	setState(119)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__9:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(117)
		 		try forStmt()

		 		break

		 	case .T__14:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(118)
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
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func varLiteral() -> [VarLiteralContext] {
				return getRuleContexts(VarLiteralContext.self)
			}
			open
			func varLiteral(_ i: Int) -> VarLiteralContext? {
				return getRuleContext(VarLiteralContext.self, i)
			}
			open
			func forStride() -> ForStrideContext? {
				return getRuleContext(ForStrideContext.self, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
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
		 	setState(121)
		 	try match(SailParser.Tokens.T__9.rawValue)
		 	setState(122)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(123)
		 	try match(SailParser.Tokens.T__10.rawValue)
		 	setState(124)
		 	try varLiteral()
		 	setState(125)
		 	try forStride()
		 	setState(126)
		 	try varLiteral()
		 	setState(127)
		 	try match(SailParser.Tokens.T__11.rawValue)
		 	setState(128)
		 	try varLiteral()
		 	setState(129)
		 	try match(SailParser.Tokens.T__1.rawValue)
		 	setState(130)
		 	try statement()
		 	setState(131)
		 	try match(SailParser.Tokens.T__2.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForStrideContext: ParserRuleContext {
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
		 	setState(133)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__12.rawValue || _la == SailParser.Tokens.T__13.rawValue
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
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
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
		 	setState(135)
		 	try match(SailParser.Tokens.T__14.rawValue)
		 	setState(136)
		 	try match(SailParser.Tokens.T__6.rawValue)
		 	setState(137)
		 	try logicExp()
		 	setState(138)
		 	try match(SailParser.Tokens.T__7.rawValue)
		 	setState(139)
		 	try match(SailParser.Tokens.T__1.rawValue)
		 	setState(140)
		 	try statement()
		 	setState(141)
		 	try match(SailParser.Tokens.T__2.rawValue)

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
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
			}
			open
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
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
		try enterRule(_localctx, 24, SailParser.RULE_print)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(143)
		 	try match(SailParser.Tokens.T__15.rawValue)
		 	setState(144)
		 	try match(SailParser.Tokens.T__6.rawValue)
		 	setState(148)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,7, _ctx)) {
		 	case 1:
		 		setState(145)
		 		try logicExp()

		 		break
		 	case 2:
		 		setState(146)
		 		try stringLiteral()

		 		break
		 	case 3:
		 		setState(147)
		 		try functionCall()

		 		break
		 	default: break
		 	}
		 	setState(150)
		 	try match(SailParser.Tokens.T__7.rawValue)
		 	setState(151)
		 	try match(SailParser.Tokens.T__4.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariablesContext: ParserRuleContext {
			open
			func IDENTIFIER() -> [TerminalNode] {
				return getTokens(SailParser.Tokens.IDENTIFIER.rawValue)
			}
			open
			func IDENTIFIER(_ i:Int) -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, i)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_variables
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterVariables(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitVariables(self)
			}
		}
	}
	@discardableResult
	 open func variables() throws -> VariablesContext {
		var _localctx: VariablesContext = VariablesContext(_ctx, getState())
		try enterRule(_localctx, 26, SailParser.RULE_variables)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(153)
		 	try match(SailParser.Tokens.T__16.rawValue)
		 	setState(154)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(159)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__17.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(155)
		 		try match(SailParser.Tokens.T__17.rawValue)
		 		setState(156)
		 		try match(SailParser.Tokens.IDENTIFIER.rawValue)


		 		setState(161)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(162)
		 	try match(SailParser.Tokens.T__18.rawValue)
		 	setState(163)
		 	try type()
		 	setState(164)
		 	try match(SailParser.Tokens.T__4.rawValue)

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
			func typeSpec() -> TypeSpecContext? {
				return getRuleContext(TypeSpecContext.self, 0)
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
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(171)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__21:fallthrough
		 	case .T__22:fallthrough
		 	case .T__23:fallthrough
		 	case .T__24:fallthrough
		 	case .T__25:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(166)
		 		try typeSpec()

		 		break

		 	case .T__19:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(167)
		 		try match(SailParser.Tokens.T__19.rawValue)
		 		setState(168)
		 		try typeSpec()
		 		setState(169)
		 		try match(SailParser.Tokens.T__20.rawValue)

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

	public class TypeSpecContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_typeSpec
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterTypeSpec(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitTypeSpec(self)
			}
		}
	}
	@discardableResult
	 open func typeSpec() throws -> TypeSpecContext {
		var _localctx: TypeSpecContext = TypeSpecContext(_ctx, getState())
		try enterRule(_localctx, 30, SailParser.RULE_typeSpec)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(173)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.T__21.rawValue,SailParser.Tokens.T__22.rawValue,SailParser.Tokens.T__23.rawValue,SailParser.Tokens.T__24.rawValue,SailParser.Tokens.T__25.rawValue]
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
			func IDENTIFIER() -> [TerminalNode] {
				return getTokens(SailParser.Tokens.IDENTIFIER.rawValue)
			}
			open
			func IDENTIFIER(_ i:Int) -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, i)
			}
			open
			func parameters() -> ParametersContext? {
				return getRuleContext(ParametersContext.self, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func basicStatute() -> [BasicStatuteContext] {
				return getRuleContexts(BasicStatuteContext.self)
			}
			open
			func basicStatute(_ i: Int) -> BasicStatuteContext? {
				return getRuleContext(BasicStatuteContext.self, i)
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
		 	setState(175)
		 	try match(SailParser.Tokens.T__26.rawValue)
		 	setState(176)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(177)
		 	try match(SailParser.Tokens.T__6.rawValue)
		 	setState(179)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.IDENTIFIER.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(178)
		 		try parameters()

		 	}

		 	setState(181)
		 	try match(SailParser.Tokens.T__7.rawValue)
		 	setState(184)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__27.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(182)
		 		try match(SailParser.Tokens.T__27.rawValue)
		 		setState(183)
		 		try type()

		 	}

		 	setState(186)
		 	try match(SailParser.Tokens.T__1.rawValue)
		 	setState(188) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(187)
		 		try basicStatute()


		 		setState(190); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.T__5.rawValue,SailParser.Tokens.T__9.rawValue,SailParser.Tokens.T__14.rawValue,SailParser.Tokens.T__15.rawValue,SailParser.Tokens.T__16.rawValue,SailParser.Tokens.IDENTIFIER.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(195)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__28.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(192)
		 		try match(SailParser.Tokens.T__28.rawValue)
		 		setState(193)
		 		try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 		setState(194)
		 		try match(SailParser.Tokens.T__4.rawValue)

		 	}

		 	setState(197)
		 	try match(SailParser.Tokens.T__2.rawValue)

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
		 	setState(199)
		 	try parameter()
		 	setState(204)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__17.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(200)
		 		try match(SailParser.Tokens.T__17.rawValue)
		 		setState(201)
		 		try parameter()


		 		setState(206)
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
		 	setState(207)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(208)
		 	try match(SailParser.Tokens.T__18.rawValue)
		 	setState(209)
		 	try type()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(SailParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func parametersDec() -> ParametersDecContext? {
				return getRuleContext(ParametersDecContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_functionCall
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterFunctionCall(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitFunctionCall(self)
			}
		}
	}
	@discardableResult
	 open func functionCall() throws -> FunctionCallContext {
		var _localctx: FunctionCallContext = FunctionCallContext(_ctx, getState())
		try enterRule(_localctx, 38, SailParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(211)
		 	try match(SailParser.Tokens.IDENTIFIER.rawValue)
		 	setState(212)
		 	try match(SailParser.Tokens.T__6.rawValue)
		 	setState(214)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.IDENTIFIER.rawValue,SailParser.Tokens.INT.rawValue,SailParser.Tokens.FLOAT.rawValue,SailParser.Tokens.BOOLEAN.rawValue,SailParser.Tokens.STRING.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(213)
		 		try parametersDec()

		 	}

		 	setState(216)
		 	try match(SailParser.Tokens.T__7.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParametersDecContext: ParserRuleContext {
			open
			func literal() -> [LiteralContext] {
				return getRuleContexts(LiteralContext.self)
			}
			open
			func literal(_ i: Int) -> LiteralContext? {
				return getRuleContext(LiteralContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_parametersDec
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterParametersDec(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitParametersDec(self)
			}
		}
	}
	@discardableResult
	 open func parametersDec() throws -> ParametersDecContext {
		var _localctx: ParametersDecContext = ParametersDecContext(_ctx, getState())
		try enterRule(_localctx, 40, SailParser.RULE_parametersDec)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(218)
		 	try literal()
		 	setState(223)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__17.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(219)
		 		try match(SailParser.Tokens.T__17.rawValue)
		 		setState(220)
		 		try literal()


		 		setState(225)
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
		try enterRule(_localctx, 42, SailParser.RULE_logicExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(226)
		 	try relationalExp()
		 	setState(228)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__29.rawValue || _la == SailParser.Tokens.T__30.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(227)
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
		try enterRule(_localctx, 44, SailParser.RULE_logicExpP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(230)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__29.rawValue || _la == SailParser.Tokens.T__30.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(231)
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
		try enterRule(_localctx, 46, SailParser.RULE_relationalExp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(233)
		 	try expression()
		 	setState(235)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.T__31.rawValue,SailParser.Tokens.T__32.rawValue,SailParser.Tokens.T__33.rawValue,SailParser.Tokens.T__34.rawValue,SailParser.Tokens.T__35.rawValue,SailParser.Tokens.T__36.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(234)
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
		try enterRule(_localctx, 48, SailParser.RULE_relationalExpP)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(237)
		 	try relationalOp()
		 	setState(238)
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
		try enterRule(_localctx, 50, SailParser.RULE_relationalOp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(240)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.T__31.rawValue,SailParser.Tokens.T__32.rawValue,SailParser.Tokens.T__33.rawValue,SailParser.Tokens.T__34.rawValue,SailParser.Tokens.T__35.rawValue,SailParser.Tokens.T__36.rawValue]
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
		try enterRule(_localctx, 52, SailParser.RULE_expression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(242)
		 	try term()
		 	setState(244)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__37.rawValue || _la == SailParser.Tokens.T__38.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(243)
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
		try enterRule(_localctx, 54, SailParser.RULE_expressionP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(246)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__37.rawValue || _la == SailParser.Tokens.T__38.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(247)
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
		try enterRule(_localctx, 56, SailParser.RULE_term)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(249)
		 	try factor()
		 	setState(251)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__39.rawValue || _la == SailParser.Tokens.T__40.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(250)
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
		try enterRule(_localctx, 58, SailParser.RULE_termP)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(253)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == SailParser.Tokens.T__39.rawValue || _la == SailParser.Tokens.T__40.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(254)
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
			func logicExp() -> LogicExpContext? {
				return getRuleContext(LogicExpContext.self, 0)
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
		try enterRule(_localctx, 60, SailParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(261)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .INT:fallthrough
		 	case .FLOAT:fallthrough
		 	case .BOOLEAN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(256)
		 		try varLiteral()

		 		break

		 	case .T__6:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(257)
		 		try match(SailParser.Tokens.T__6.rawValue)
		 		setState(258)
		 		try logicExp()
		 		setState(259)
		 		try match(SailParser.Tokens.T__7.rawValue)


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
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
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
		try enterRule(_localctx, 62, SailParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(265)
		 	try _errHandler.sync(self)
		 	switch (SailParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IDENTIFIER:fallthrough
		 	case .INT:fallthrough
		 	case .FLOAT:fallthrough
		 	case .BOOLEAN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(263)
		 		try varLiteral()

		 		break

		 	case .STRING:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(264)
		 		try stringLiteral()

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
			func INT() -> TerminalNode? {
				return getToken(SailParser.Tokens.INT.rawValue, 0)
			}
			open
			func FLOAT() -> TerminalNode? {
				return getToken(SailParser.Tokens.FLOAT.rawValue, 0)
			}
			open
			func BOOLEAN() -> TerminalNode? {
				return getToken(SailParser.Tokens.BOOLEAN.rawValue, 0)
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
		try enterRule(_localctx, 64, SailParser.RULE_varLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(267)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SailParser.Tokens.IDENTIFIER.rawValue,SailParser.Tokens.INT.rawValue,SailParser.Tokens.FLOAT.rawValue,SailParser.Tokens.BOOLEAN.rawValue]
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

	public class StringLiteralContext: ParserRuleContext {
			open
			func STRING() -> TerminalNode? {
				return getToken(SailParser.Tokens.STRING.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SailParser.RULE_stringLiteral
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.enterStringLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? SailListener {
				listener.exitStringLiteral(self)
			}
		}
	}
	@discardableResult
	 open func stringLiteral() throws -> StringLiteralContext {
		var _localctx: StringLiteralContext = StringLiteralContext(_ctx, getState())
		try enterRule(_localctx, 66, SailParser.RULE_stringLiteral)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(269)
		 	try match(SailParser.Tokens.STRING.rawValue)

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