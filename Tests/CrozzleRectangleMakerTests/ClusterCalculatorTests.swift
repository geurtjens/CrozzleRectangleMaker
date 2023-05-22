//
//  ClusterCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ClusterCalculatorTests: XCTestCase {

    func test_Execute_8612() throws {
        let words = getWords_8612()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(1149,result.count)
        XCTAssertEqual(170, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8702() throws {
        let words = getWords_8702()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(7853,result.count)
        XCTAssertEqual(220, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8705() throws {
        let words = getWords_8705()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(13596,result.count)
        XCTAssertEqual(182, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8710() throws {
        let words = getWords_8710()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(15273,result.count)
        XCTAssertEqual(186, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8711() throws {
        let words = getWords_8711()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(24231,result.count)
        XCTAssertEqual(220, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8802() throws {
        let words = getWords_8802()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(9802,result.count)
        XCTAssertEqual(226, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8803() throws {
        let words = getWords_8803()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(11751,result.count)
        XCTAssertEqual(192, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    func test_Execute_8804() throws {
        let words = getWords_8804()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(24757,result.count)
        XCTAssertEqual(322, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func testC2x2_LR_UD_Example() throws {
        let words = ["SNOW","NAZARETH","ZION","WALNUT"]
        let reversed = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        
        let result = ClusterCalculator.C2x2_LR_UD(start: words, end: reversed, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        let item = result[0]
        XCTAssertEqual(10, item.width)
        XCTAssertEqual(12, item.height)
        
        let shape = item.toShape()
        let left1 = shape.placements[0]
        XCTAssertEqual(3, left1.y)
        XCTAssertEqual(0, left1.x)
        XCTAssertTrue(left1.h)
        
        let right2 = shape.placements[1]
        XCTAssertEqual(4, right2.y)
        XCTAssertEqual(2, right2.x)
        XCTAssertTrue(right2.h)
        
        let up1 = shape.placements[2]
        XCTAssertEqual(0, up1.y)
        XCTAssertEqual(3, up1.x)
        XCTAssertFalse(up1.h)
        
        let down2 = shape.placements[3]
        XCTAssertEqual(2, down2.y)
        XCTAssertEqual(4, down2.x)
        XCTAssertFalse(up1.h)
        
        let text = item.ToText(words: words)
        let textExpected = "   .      \n   S      \n   N.     \n.ZION.    \n  .WALNUT.\n   .Z     \n    A     \n    R     \n    E     \n    T     \n    H     \n    .     "
        XCTAssertEqual(textExpected,text)
        print(text)
        /*
         .
         Z
         I
      .SNOW.
        .NAZARETH.
          L
          N
          U
          T
          .
         
         
         */
        
        
        
    }
    
    func testC2x2_LR_UD() throws {
        let result = ClusterCalculator.C2x2_LR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(256, result.count)
        
        print("C2x2_LR_UD")
        print(result[0].ToText(words: words))
    }

    func testC2x2_RL_DU() throws {
        let result = ClusterCalculator.C2x2_RL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(446, result.count)
        
        var textArray:[String] = []
        for item in result {
            textArray.append(item.ToText(words: words))
            //textArray.append(item.ToTextFlipped(words: words))
        }
        textArray.sort()
        
        var duplicates = 0
        for i in 1..<textArray.count {
            let textBefore = textArray[i - 1]
            let textCurrent = textArray[i]
            if textBefore == textCurrent {
                duplicates += 1
            }
        }
        XCTAssertEqual(0, duplicates)
    }
    
    func testC2x2_RL_UD() throws {
        let result = ClusterCalculator.C2x2_RL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(97, result.count)
        
        print("C2x2_RL_UD")
        print(result[0].ToText(words: words))
    }
    
    func testC2x3_LRL_DU() throws {
        let result = ClusterCalculator.C2x3_LRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(64, result.count)
        
        print("C2x3_LRL_DU")
        print(result[0].ToText(words: words))
    }
    
    func testC2x3_LRL_UD() throws {
        let result = ClusterCalculator.C2x3_LRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(152, result.count)
        
        print("C2x3_LRL_UD")
        print(result[0].ToText(words: words))
    }
    
    func testC2x3_RLR_DU() throws {
        let result = ClusterCalculator.C2x3_RLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(56, result.count)
        
        print("C2x3_RLR_DU")
        print(result[0].ToText(words: words))
    }
    
    func testC2x3_RLR_UD() throws {
        let result = ClusterCalculator.C2x3_RLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(20, result.count)
        
        print("C2x3_RLR_UD")
        print(result[0].ToText(words: words))
    }
    
    func testC2x4_RLRL_DU_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x4_RLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(1468, result.count)
        
        print("C2x4_RLRL_DU")
        print(result[0].ToText(words: words))
    }
    
    func testC2x4_RLRL_UD_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x4_RLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(699, result.count)
        
        print("C2x4_RLRL_UD")
        print(result[0].ToText(words: words))
    }
    
    func testC2x4_LRLR_DU_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x4_LRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(473, result.count)
        
        print("C2x4_LRLR_DU")
        print(result[0].ToText(words: words))
    }
    
    func testC2x4_LRLR_UD_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x4_LRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(580, result.count)
        
        print("C2x4_LRLR_UD")
        print(result[0].ToText(words: words))
    }
    
    func testC2x5_RLRLR_DU_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x5_RLRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        XCTAssertEqual(171, result.count)
        
        print("C2x5_RLRLR_DU")
        print(result[0].ToText(words: words))
    }
    
    func testC2x5_RLRLR_UD_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x5_RLRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(130, result.count)
        
        print("C2x5_RLRLR_UD")
        print(result[0].ToText(words:words))
        
    }
    func testC2x5_LRLRL_DU_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x5_LRLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(133, result.count)
        
        print("C2x5_LRLRL_DU")
        print(result[0].ToText(words:words))
    }
    func testC2x5_LRLRL_UD_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x5_LRLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(117, result.count)
        
        print("C2x5_LRLRL_UD")
        print(result[0].ToText(words: words))
    }
    
    

    func testC2x6_LRLRLR_DU_8804() throws {
        let words = getWords_8804()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x6_LRLRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(12, result.count)
        
        print("C2x6_LRLRLR_DU")
        print(result[0].ToText(words:words))
    }
    func testC2x6_LRLRLR_UD() throws {
        let result = ClusterCalculator.C2x6_LRLRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x6_RLRLRL_DU_8802() throws {
        let words = getWords_8802()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x6_RLRLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(288, result.count)
        
        print("C2x6_RLRLRL_DU")
        print(result[0].ToText(words:words))
        
    }
    func testC2x6_RLRLRL_UD_8802() throws {
        let words = getWords_8802()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C2x6_RLRLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(0, result.count)
    }
    

    func testC3x3_LRL_UDU() throws {
        let result = ClusterCalculator.C3x3_LRL_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(4, result.count)
        
        print("C3x3_LRL_UDU")
        print(result[0].ToText(words: words))
    }
    func testC3x3_RLR_DUD() throws {
        let result = ClusterCalculator.C3x3_RLR_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(5, result.count)
        
        print("C3x3_RLR_DUD")
        print(result[0].ToText(words: words))
    }
    
    
    // this one does not require duplicate checking as it flips to become LRL_DUD
    func testC3x3_RLR_UDU_8702() throws {
        let words = getWords_8702()
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C3x3_RLR_UDU(start: words, end: reversedWords, len: lengths,scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(2, result.count)
        
        print("C3x3_RLR_UDU")
        print(result[0].ToText(words: words))
    }
    
    func testC3x4_RLRL_DUD_8705() throws {
        let words = getWords_8705()
        
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        print("C3x4_RLRL_DUD")
        print(result[0].ToText(words: words))
    }
    
    func testC3x4_RLRL_DUD_8705_Example() throws {
        let words = ["TAP","CALENDULA","BONSAI","TREES", "TUBER", "ALOE", "PANSY"]
        
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(1, result.count)
        
        print("C3x4_RLRL_DUD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x4_LRLR_UDU_8710() throws {
        let words = getWords_8710()
        
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C3x4_LRLR_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(4, result.count)
        
        print("C3x4_LRLR_UDU")
        print(result[0].ToText(words: words))
    }
    
    func testC3x4_RLRL_UDU_8711() throws {
        let words = getWords_8711()
        
        let reversedWords = reverseWords(words: words)
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(2, result.count)
        
        print("C3x4_RLRL_UDU")
        print(result[0].ToText(words: words))
    }
    
    func getWords_8804() -> [String] {
        return [ "MEZZO","MAZURKA","HYMN","STRUM","KEY","STOP","SLOW","SLUR","MUTE","REST","TUNE","HUM","LOW","SONG","TRIO","BASSO","DUO","NOTE","TONE","TEMPO","HIT","SIGN","TIME","TIE","FORTE","SCORE","FRET","VIOLA","MOOD","HARP","MARCH","HOLD","ARIA","ECHO","JAZZ","WALTZ","PIZZICATO","SYMPHONY","OPUS","RHYTHM","TRUMPET","SYNCOPATE","HARMONY","RHAPSODY","XYLOPHONE","LUTE","OVERTURE","MELODY","STRING","GAMUT","LULLABY","BASS","DUET","SOLO","CHORUS","MINUET","VOLUME","PAUSE","QUAVER","SONATA","DRUM","MOVEMENT","NOCTURNE","TENOR","CYMBAL","GUITAR","SOPRANO","FLUTE","FUGUE","NATURAL","SAXOPHONE","CONDUCTOR","TREMOLO","OCTAVE","ETUDE","SHARP","STAFF","TACET","ALTO","INTERVAL","KEYBOARD","TROMBONE","CORNET","VIOLIN","ORCHESTRA","CANTO","MINOR","HORN","LILT","DULCET","CANTATA","PITCH","QUICK","CONCERTO","POLONAISE","MINIM","THEME","BARITONE","FLAT","BREVE","MAJOR","ORGAN","PIANO","BUNGLE","LEGATO","PRELUDE","OBLIGATO","CLARINET","ANDANTE","TREBLE","OPERA","CRESCENDO","BEAT","PIPE","SERENADE","LARGO","POLKA","SCALE","PICCOLO","OBOE","ENCORE","ARPEGGIO","BANJO","CAROL","CHORD","ALLEGRO","BAR","JIG","HIGH","REEL","CHIME","FANFARE","ADAGIO","PEDAL","BAND","CODA","REED","BALLAD","CLEF","FIFE"]
    }
    func getWords_8802() -> [String] {
        return [ "PRIZE","STUDY","GYM","BOYS","SUMS","SWOT","BLAZER","COPY","PHYSICS","PLAY","SPORT","CRAYON","MATHS","QUIET","TENNIS","MATES","ART","TERM","CLASS","TABLES","LINES","CAPTAIN","PEN","ROLL","INK","CANE","HISTORY","STUDENT","SONGS","CHEMISTRY","PRIMARY","GEOMETRY","ROSTER","SETSQUARE","TUCKSHOP","MUSIC","PLAYGROUND","SEAT","HOLIDAYS","TEXTBOOK","LABORATORY","SECONDARY","BIOLOGY","WOODWORK","BURSAR","MASTER","COMPASS","LIBRARY","MONITOR","WRITING","POEMS","PROTRACTOR","SPANISH","PUPIL","JUNIOR","PROJECTS","GEOGRAPHY","UNIFORM","RECESS","SENIOR","BOOKS","RULER","OVAL","HSC","FRACTIONS","HOMEWORK","VACATION","GIRLS","LECTURE","PARSING","EXAM","SCHOOL","LUNCH","EDUCATION","FORM","LANGUAGES","CALCULATOR","ERASER","RUBBER","DRAWING","SPELLING","TIMETABLE","HEADMASTER","INDONESIAN","DESK","ENGLISH","FRIENDS","SHAKESPEARE","FOOTBALL","GRAMMAR","ITALIAN","PREFECT","SPEECH","PAPER","COOKING","CRICKET","GERMAN","PRINCIPAL","SCIENCE","TEACHER","CRAM","FOOD","DECIMALS","LOCKER","PENCIL","FRENCH","READING","CHAIR","REFERENCE","COLLEGE","BLACKBOARD","ALGEBRA","CHALK","BELL","FLAG"]
    }
    func getWords_8711() -> [String] {
        return
        ["AZURE","ZOFFANY","SOOTY","RUBY","BAY","RUDDY","SANDY","GOYA","GREY","EBONY","DYCK","BRUSH","TUBE","ART","DUN","RUBENS","TAN","TONE","COROT","COLOUR","PAINT","ROUGE","HUE","JET","UMBER","SEPIA","BLUE","AMBER","RED","LAKE","LAC","JADE","TAWNY","CEZANNE","RUSSET","SCOTT","ROMNEY","YELLOW","TEXTURE","ROSSETTI","LELY","TINTORETTO","REYNOLDS","TURNER","MIX","STAIN","MATISSE","MAUVE","WHISTLER","AUBURN","UTRILLO","BROWN","MONET","WHITE","SILVER","TITIAN","VIOLET","PICASSO","SARGENT","BEARDSLEY","CRIMSON","GAUGUIN","CANVAS","PURPLE","MURILLO","SICKERT","OPAQUE","MANET","PALETTE","PIGMENT","SCARLET","FAWN","GILT","PUCE","MAROON","GAINSBOROUGH","VERMILION","OLIVE","ORPEN","CANALETTO","CONSTABLE","HOGARTH","RAEBURN","SAFFRON","VERMEER","HALS","SAPPHIRE","MILLET","RENOIR","REMBRANDT","BOTTICELLI","JOHN","PINK","NOLAN","LACQUER","MAGENTA","MILLAIS","CERISE","CLARET","COBALT","BUFF","OPIE","LANDSEER","LAVENDER","LAWRENCE","CHROME","ORANGE","CHOCOLATE","DEGAS","EASEL","INDIGO","FRAGONARD","CORAL","GREEN","HENNA","MODEL","OCHRE","GOLDEN","HOLBEIN","ANIL","CREAM","ENAMEL","MICHELANGELO","RAPHAEL","DRAB","BEIGE","BLACK","BICE"]
    }
    
    func getWords_8803() -> [String] {
        return ["SUEZ","ZURICH","SYDNEY","AYR","TOKYO","YORK","QUITO","TORONTO","BOMBAY","OMSK","OSLO","LAGOS","BOGOTA","HOBART","TOLEDO","BONN","RENO","ROME","OSAKA","CORK","CAIRO","OMAHA","LIMA","DELHI","TUCSON","HOUSTON","TULSA","BUTTE","TURIN","OTTAWA","WARSAW","BRUSSELS","BOSTON","MOSCOW","PITTSBURGH","SEOUL","VANCOUVER","HONOLULU","ISTANBUL","TASHKENT","YOKOHAMA","SEATTLE","ATHENS","JUNEAU","DETROIT","STOCKHOLM","CALGARY","GLASGOW","PARIS","PERTH","BUCHAREST","CALCUTTA","EDMONTON","SANTIAGO","OXFORD","ATLANTA","MEMPHIS","PHOENIX","AMSTERDAM","LISBON","MUNICH","MONTREAL","JERUSALEM","LIVERPOOL","HAMILTON","WINNIPEG","DARWIN","NAPLES","PRAGUE","VIENNA","SINGAPORE","RANGOON","NOME","MELBOURNE","BOISE","DENVER","LONDON","MADRAS","BELFAST","BATH","DUBLIN","GDANSK","TEHERAN","HAVANA","BRISBANE","SHANGHAI","JAKARTA","QUEBEC","NAGASAKI","HANOI","MIAMI","BUFFALO","BREMEN","DALLAS","PEKING","AUCKLAND","ALEXANDRIA","CARACAS","HALIFAX","GENOA","COPENHAGEN","BERLIN","MANILA","REGINA","LENINGRAD","BANGKOK","MADRID","CANBERRA","CASABLANCA","ERIE","NICE","CHICAGO","KARACHI","DAKAR","MECCA","BAGHDAD","ADELAIDE","DACCA"]
    }
    func getWords_8710() -> [String] {
        return["LORY","TURKEY","JAY","MYNA","TIT","TUI","TOMTIT","SWAN","SKYLARK","SKUA","ROOSTER","SPARROW","SWALLOW","OWL","OWLET","CANARY","GROUSE","EMU","TERN","WREN","SNIPE","AUK","ROOK","IBIS","SHAG","EGRET","CHAT","ROC","TEAL","HEN","BUZZARD","QUETZEL","OSPREY","APTERYX","CASSOWARY","STILT","VULTURE","SWIFT","CYGNET","THRUSH","BOOBY","STORK","BUSTARD","TOUCAN","CROW","PARROT","PULLET","OSTRICH","ALBATROSS","FROGMOUTH","PIPIT","CURLEW","PEEWIT","BITTERN","LYREBIRD","STARLING","AVOCET","PLOVER","GOOSE","FOWL","KESTREL","BULBUL","PHEASANT","RAVEN","PENGUIN","PHOENIX","DOVE","GULL","LOON","LINNET","SEAGULL","WAGTAIL","QUAIL","CUCKOO","GANNET","PETREL","PUFFIN","HAWK","KITE","SANDPIPER","BANTAM","MOPOKE","SHRIKE","ROSELLA","COCKATOO","MOA","PEN","HERON","MACAW","ROBIN","WADER","LORIKEET","WHIPBIRD","PARTRIDGE","LOVEBIRD","ORIOLE","PIGEON","FANTAIL","DIPPER","HORNBILL","HARRIER","DODO","ERNE","BLUEBIRD","BOBOLINK","COCKATIEL","MAGPIE","JACKDAW","LARK","CRANE","FALCON","GANDER","MALLARD","PELICAN","COCK","RHEA","FINCH","PEACOCK","DRAKE","EIDER","GREBE","BELLBIRD","BLACKBIRD","EAGLE","KEA"]
    }
    
    func getWords_8705() -> [String] {
        return ["ZINNIA","MAY","ALYSSUM","SOW","PANSY","POPPY","AZALEA","GAZANIA","LOTUS","PEONY","DAISY","LILY","POT","PEST","STEM","SHRUBS","WORDSWORTH","OMARKHAYYAM","BOUQUET","DISPLAY","TULIP","WATTLE","SNOWDROP","GRASS","STOCK","NATIVES","TRIM","CACTUS","HYACINTH","BLOSSOM","ASTER","SWEEP","TREES","TUBER","WATER","TAP","CROCUS","ROSE","MOWER","PRUNE","STALK","VIOLET","LARKSPUR","IRIS","SOIL","FLOWERS","HIBISCUS","MIMOSA","PLANT","ROCKS","HOSE","LAWN","PATH","VINE","CYCLAMEN","JONQUIL","SALVIA","NITROGEN","HYDRANGEA","POOL","JASMIN","BROOM","MULCH","VIOLA","SPRINKLE","BUD","ANNUAL","BONSAI","LILIUM","CORM","IXIA","PLUMBAGO","CARNATION","EARTH","DISEASE","SAXIFRAGE","BULB","PINK","BLOOM","SPADE","SHAKESPEARE","VERBENA","BALSAM","FORK","PALM","SEED","WEED","ANEMONE","PREPARE","EDGES","FREESIA","ORGANIC","LANDSCAPE","PERENNIAL","FERN","MARIGOLD","DRAIN","GREEN","HOE","ORCHID","CALENDULA","CANNA","GARDEN","BEGONIA","CLIMBER","CAN","ALOE","RAKE","GARDENIA","CLARKIA","LOBELIA","CAMELLIA","DIG","DAFFODIL","LILAC","DAHLIA","LEAF","ACACIA","BED"]
    }
    
    func getWords_8702() -> [String] {
        let words8702 = ["EMBEZZLE","GAZUMP","BUY","SQUEEZE","PROXY","TRUST","PAY","SPOT","BUYER","UNITS","PARITY","MONEY","CUT","TAX","ASSETS","LOSS","PAYMENT","TRUSTEE","COST","MONOPOLY","SHORT","BONUS","NOTES","QUOTE","PROSPECTUS","CURRENCY","INVESTMENT","IOU","TIP","STOCK","JUMP","DISCOUNT","INTEREST","SETTLEMENT","FUNDS","YIELD","NET","OPTION","RIGHTS","SECURITIES","REPORT","SHARES","DEPOSIT","LIABILITY","CONTRACT","ACCOUNT","PREMIUM","RESERVE","REVENUE","PROFIT","SCRIP","SOLD","VENDOR","MARKET","GUARANTEE","BOOM","BULL","SELL","DEBENTURE","AGENT","DRAWER","DEFAULT","CREDITOR","INFLATION","PAR","CASH","RING","SALE","CORNER","RECEIPT","CARTEL","CHEQUE","CREDIT","MARGIN","ORDER","FIRM","CAPITAL","PERCENTAGE","RIG","BROKER","INCOME","MERGER","DEBIT","COLLATERAL","AVERAGE","BOND","DIVIDEND","EXCHANGE","PRICE","ADVICE","GOLD","OFFER","BANKER","JOBBER","BANK","FINANCE","BEAR","BILL","BALANCE","CALL","BID","DEAL","DEED"]
        return words8702
    }
    
    
    func getWords_8612() -> [String] {
        let wordList = [
            "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW", "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK", "TREE", "EVE", "INN", "BELLS", "CAKE",
            
            "GLAZE", "PARTYHATS", "TWENTYFIFTH", "WALNUT", "PEANUTS", "PRESENTS", "FRUIT", "NUTMEG", "CUSTARD", "CHRISTMAS", "MISTLETOE", "GIFTS", "SANTACLAUS", "FESTIVE", "RAISINS", "LIGHTS", "WREATH", "HOLIDAY", "WISEMEN", "CRANBERRY", "OPENHOUSE", "SILENTNIGHT", "STOCKING", "PUNCH", "WINE", "SHOPPING", "PLUMPUDDING", "WRAPPING", "NEIGHBOURS", "GREETINGS", "DECORATIONS", "ALMONDS", "LANTERN", "KRISSKRINGLE", "SPICE", "GOODWILL", "BONBON", "CHURCH", "FRIENDS", "PARCELS", "CINNAMON", "NICHOLAS", "MINCEPIES", "CHERRIES", "SLEIGH", "ALMOND", "MANGER", "RIBBON", "CHOCOLATE", "MIXEDPEEL", "DRINK", "CANDLES", "FOOD", "GINGER", "BETHLEHEM", "CAROL", "REINDEER", "GOODCHEER", "CREAM", "CORDIAL", "CHILDREN", "ICECREAM", "CHICKEN", "CARD", "DECEMBER", "PEACE"]
        return wordList
    }
    
    func getLengths() -> [Int] {
        let words = getWords_8612()
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        return lengths
    }
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var reversedWords:[String] = []
    var lengths: [Int] = []
    var wordCount: Int = 0
    override func setUpWithError() throws {
        words = getWords_8612()
        lengths = RectangleCalculator.WordListToLengths(words: words)
        wordCount = words.count
        
        reversedWords = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
    }
    
    func reverseWords(words:[String]) -> [String] {
        reversedWords = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
        return reversedWords
    }
}
