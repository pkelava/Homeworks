from JackOutput import *
from JackError import *

#
#   Constants.
#
TK_KEYWORD = 1
TK_SYMBOL = 2
TK_IDENTIFIER = 3
TK_INT_CONST = 4
TK_STRING_CONST = 5
tokenTypes = ('<unknown>', '<keyword>', '<symbol>', '<identifier>',
              '<integer constant>', '<string constant>')

KW_BOOLEAN = 1
KW_CHAR = 2
KW_CLASS = 3
KW_CONSTRUCTOR = 4
KW_DO = 5
KW_ELSE = 6
KW_FALSE = 7
KW_FIELD = 8
KW_FUNCTION = 9
KW_IF = 10
KW_INT = 11
KW_LET = 12
KW_METHOD = 13
KW_NULL = 14
KW_RETURN = 15
KW_STATIC = 16
KW_THIS = 17
KW_TRUE = 18
KW_VAR = 19
KW_VOID = 20
KW_WHILE = 21
keywords = {
    'boolean' : KW_BOOLEAN,
    'char' : KW_CHAR,
    'class' : KW_CLASS,
    'constructor' : KW_CONSTRUCTOR,
    'do' : KW_DO,
    'else' : KW_ELSE,
    'false' : KW_FALSE,
    'field' : KW_FIELD,
    'function' : KW_FUNCTION,
    'if' : KW_IF,
    'int' : KW_INT,
    'let' : KW_LET,
    'method' : KW_METHOD,
    'null' : KW_NULL,
    'return' : KW_RETURN,
    'static' : KW_STATIC,
    'this' : KW_THIS,
    'true' : KW_TRUE,
    'var' : KW_VAR,
    'void' : KW_VOID,
    'while' : KW_WHILE
    }

symbols = '{}()[].,;+-*/&|<>=~'

numberChars = '0123456789'

numberStart = numberChars

identStart = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_'

identChars = identStart + numberChars
#
#   End constants.
#

class Tokenizer:

    def __init__(self, ifile, ofile = None):
        self._ifile = ifile
        self._ofile = ofile

        self._line = ""
        self._lineNum = 0
        self._comment = False

    def next(self):
        while True:
            if len(self._line) == 0:
                # Citamo i procesuiramo sirovu liniju iz datoteke.
                self._rawline = self._ifile.readline()
                if len(self._rawline) == 0: return False
                self._rawline = self._rawline.replace('\n', ' ')
                self._lineNum += 1
                self._line = self._rawline

                # Ako je potrebno, pisemo source kod.
                if (self._ofile != None):
                    self._ofile.writeXML('source', '/// %d: %s' %(self._lineNum, self._rawline))

                # Parsiranje komentara //.
                i = self._line.find("//")
                if i != -1 and self._comment == False: self._line = self._line[:i]

                # Parsiranje komentara /**/.
                # Zatvaranje komentara.
                if self._comment:
                    i = self._line.find("*/")
                    if i == -1:
                        self._line = ""
                    else:
                        self._line = self._line[i + 2:]
                        self._comment = False

                # Otvaranje komentara.
                while True:
                    i = self._line.find("/*")
                    if i == -1: break
                    j = self._line.find("*/")

                    # Jednolinijski komentar.
                    if j != -1:
                        self._line = self._line[:i] + ' ' + self._line[j + 2:]
                    # Viselinijeski komentar.
                    else:
                        self._line = self._line[:i]
                        self._comment = True
                        break

                # Brisemo sve razmake.
                self._line = self._line.replace('\t', ' ').strip()

                # Jesmo li uhvatili nepraznu liniju?
                if len(self._line) == 0: continue

            # Uhvatili smo nepraznu liniju.
            self._parseToken()
            if (self._tokenType == None): continue
            return True

    def lineNum(self):
        return self._lineNum

    def lineRaw(self):
        return self._rawline

    def line(self):
        return self._line

    def tokenType(self):
        return self._tokenType

    def tokenTypeStr(self):
        if self._tokenType == TK_SYMBOL:
            return '"' + self._symbol + '"'
        if self._tokenType == TK_KEYWORD:
            return '"' + self._keyword + '"'
        return tokenTypes[self._tokenType]

    def keyword(self):
        return keywords[self._keyword]

    def keywordStr(self, keywordId = None):
        if (keywordId != None):
            for k in keywords:
                if keywords[k] == keywordId:
                    return k
            raise ValueError
        return self._keyword

    def symbol(self):
        return self._symbol

    def identifier(self):
        return self._identifier

    def intVal(self):
        return self._intVal

    def stringVal(self):
        return self._stringVal

    def _parseToken(self):
        self._tokenType = None
        self._keyword = None
        self._symbol = None
        self._identifier = None
        self._intVal = None
        self._stringVal = None

        while len(self._line):
            # Token cemo identificirati prema prvom znaku koji nije razmak na
            # kojega naidjemo.
            c = self._line[0]

            # Preskacemo razmake.
            if c == ' ':
                self._line = self._line[1:]
                continue
            # Pronasli smo simbol (jedan char).
            if c in symbols:
                self._line = self._line[1:]
                self._tokenType = TK_SYMBOL
                self._symbol = c
                return
            # Pronasli smo integer konstantu (mozda dulja od jednog chara).
            if c in numberStart:
                self._tokenType = TK_INT_CONST
                self._intVal = self._parseInt()
                return
            # Pronasli smo naziv - kljucna rijec ili neko ime (var, fun, itd.).
            if c in identStart:
                ident = self._parseIdent()
                if ident in keywords:
                    self._tokenType = TK_KEYWORD
                    self._keyword = ident
                else:
                    self._tokenType = TK_IDENTIFIER
                    self._identifier = ident
                return
            # Pronasli smo string.
            if c == '"':
                self._tokenType = TK_STRING_CONST
                self._stringVal = self._parseString()
                return;
            raise JackError('Syntax error in line ' + str(self._lineNum) + ': illegal character "' + c + '"')

        self.tokenType = TK_NONE;

    def _parseInt(self):
        ret = 0;
        while len(self._line):
            c = self._line[0]
            if c in numberChars:
                ret = ret * 10 + int(c)
                self._line = self._line[1:]
            else:
                raise JackError('Syntax error in line ' + str(self._lineNum) + ': illegal character "' + c + '"')
            if ret > 32767 or ret < -32767:
                raise JackError('Overflow error in line ' + str(self._lineNum) + ': integer border crossed (-32768, 32768)')
                
        return ret

    def _parseIdent(self):
        ret = "";
        while len(self._line):
            c = self._line[0]
            if c in identChars:
                ret = ret + c
                self._line = self._line[1:]
            else:
                break
        return ret

    def _parseString(self):
        ret = ''
        self._line = self._line[1:]
        while len(self._line):
            c = self._line[0]
            if c == '"':
                self._line = self._line[1:]
                return ret
            else:
                ret = ret + c
                self._line = self._line[1:]
        raise JackError('Syntax error in line ' + str(self._lineNum) + ': open string constant')