// Generated from Sail.g4 by ANTLR 4.7.2
import Antlr4

open class SailLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = SailLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(SailLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let SAIL=1, INT=2, FLOAT=3, BOOL=4, CHARACTER=5, STRING=6, VOID=7, 
            VAR=8, PRINT=9, FUNC=10, RETURN=11, IF=12, ELSE=13, WHILE=14, 
            FOR=15, IN=16, TO=17, THROUGH=18, BY=19, DIVISION=20, MINUS=21, 
            MULTIPLICATION=22, PLUS=23, AND=24, ASSIGN=25, EQUAL=26, EQUAL_GREATER_THAN=27, 
            EQUAL_LESS_THAN=28, GREATER_THAN=29, LESS_THAN=30, NOT=31, NOT_EQUAL=32, 
            OR=33, OPEN_BRACKET=34, CLOSE_BRACKET=35, OPEN_CURLY=36, CLOSE_CURLY=37, 
            OPEN_PARENTHESIS=38, CLOSE_PARENTHESIS=39, ARROW=40, COLON=41, 
            COMMA=42, DOT=43, SEMICOLON=44, CONSTANT_INT=45, CONSTANT_FLOAT=46, 
            CONSTANT_BOOLEAN=47, CONSTANT_CHAR=48, CONSTANT_STRING=49, IDENTIFIER=50, 
            COMMENTS=51, WHITESPACE=52, NEWLINE=53

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"SAIL", "INT", "FLOAT", "BOOL", "CHARACTER", "STRING", "VOID", "VAR", 
		"PRINT", "FUNC", "RETURN", "IF", "ELSE", "WHILE", "FOR", "IN", "TO", "THROUGH", 
		"BY", "DIVISION", "MINUS", "MULTIPLICATION", "PLUS", "AND", "ASSIGN", 
		"EQUAL", "EQUAL_GREATER_THAN", "EQUAL_LESS_THAN", "GREATER_THAN", "LESS_THAN", 
		"NOT", "NOT_EQUAL", "OR", "OPEN_BRACKET", "CLOSE_BRACKET", "OPEN_CURLY", 
		"CLOSE_CURLY", "OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", "ARROW", "COLON", 
		"COMMA", "DOT", "SEMICOLON", "CONSTANT_INT", "CONSTANT_FLOAT", "CONSTANT_BOOLEAN", 
		"CONSTANT_CHAR", "CONSTANT_STRING", "IDENTIFIER", "COMMENTS", "WHITESPACE", 
		"NEWLINE", "DOUBLE_QUOTE", "SINGLE_QUOTE", "SIGN", "DIGIT", "LETTER", 
		"CHAR"
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
	func getVocabulary() -> Vocabulary {
		return SailLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, SailLexer._ATN, SailLexer._decisionToDFA, SailLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "Sail.g4" }

	override open
	func getRuleNames() -> [String] { return SailLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return SailLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return SailLexer.channelNames }

	override open
	func getModeNames() -> [String] { return SailLexer.modeNames }

	override open
	func getATN() -> ATN { return SailLexer._ATN }


	public
	static let _serializedATN: String = SailLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}