// Generated from /Users/geraosio/Documents/Developer/apple/iOS/Projects/Sailing/Sailing/Compiler/Sail.g4 by ANTLR 4.7.2
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
	static let SAIL=1, IDENTIFIER=2, INT=3, FLOAT=4, BOOL=5, CHARACTER=6, STRING=7, 
            VOID=8, VAR=9, PRINT=10, FUNC=11, RETURN=12, IF=13, ELSE=14, 
            WHILE=15, FOR=16, IN=17, TO=18, THROUGH=19, BY=20, DIVISION=21, 
            MINUS=22, MULTIPLICATION=23, PLUS=24, AND=25, ASSIGN=26, EQUAL=27, 
            EQUAL_GREATER_THAN=28, EQUAL_LESS_THAN=29, GREATER_THAN=30, 
            LESS_THAN=31, NOT=32, NOT_EQUAL=33, OR=34, OPEN_BRACKET=35, 
            CLOSE_BRACKET=36, OPEN_CURLY=37, CLOSE_CURLY=38, OPEN_PARENTHESIS=39, 
            CLOSE_PARENTHESIS=40, ARROW=41, COLON=42, COMMA=43, DOT=44, 
            SEMICOLON=45, CONSTANT_INT=46, CONSTANT_FLOAT=47, CONSTANT_BOOLEAN=48, 
            CONSTANT_CHAR=49, CONSTANT_STRING=50, COMMENTS=51, WHITESPACE=52, 
            NEWLINE=53

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
		"DOUBLE_QUOTE", "SINGLE_QUOTE", "SIGN", "DIGIT", "LETTER", "CHAR", "SAIL", 
		"IDENTIFIER", "INT", "FLOAT", "BOOL", "CHARACTER", "STRING", "VOID", "VAR", 
		"PRINT", "FUNC", "RETURN", "IF", "ELSE", "WHILE", "FOR", "IN", "TO", "THROUGH", 
		"BY", "DIVISION", "MINUS", "MULTIPLICATION", "PLUS", "AND", "ASSIGN", 
		"EQUAL", "EQUAL_GREATER_THAN", "EQUAL_LESS_THAN", "GREATER_THAN", "LESS_THAN", 
		"NOT", "NOT_EQUAL", "OR", "OPEN_BRACKET", "CLOSE_BRACKET", "OPEN_CURLY", 
		"CLOSE_CURLY", "OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", "ARROW", "COLON", 
		"COMMA", "DOT", "SEMICOLON", "CONSTANT_INT", "CONSTANT_FLOAT", "CONSTANT_BOOLEAN", 
		"CONSTANT_CHAR", "CONSTANT_STRING", "COMMENTS", "WHITESPACE", "NEWLINE"
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