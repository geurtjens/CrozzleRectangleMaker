//
//  GameList.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct GameList {
    
    public var games: [GameModel]
    
    public func getGame(gameId: Int) -> GameModel? {
        let filter = games.filter { $0.gameId == gameId }.first
        return filter
    }
    
    public init() {
    
        games = []
        
        games.append(GameModel(gameId:8612, maxWidth:17, maxHeight:12, winningScore:694, tags:[],
        winningWords:["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"],
        nonWinningWords:["GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"],
        winningGame: [
            "S F C nAzAReTh ",
            "N A A U I  V O ",
            "O M K T O BeLlS",
            "wHiTe sInG   L ",
            "  L  P     jOy ",
            "tOys O   A E  S",
            "O  A R hAzElNUt",
            "A TuRkEy U L  A",
            "S  C   mErRy  R",
            "tREe INn E     "]))

       games.append(GameModel(gameId:8702, maxWidth:17, maxHeight:12, winningScore:736, tags:["P","P33","C","C22"],
                              
       winningWords:["CAPITAL", "NOTES", "SCRIP", "BULL", "SOLD", "STOCK", "UNITS", "PAY", "SPOT", "SHORT", "DEBIT", "BEAR", "CUT", "BUYER", "DEED", "CASH", "SALE", "PARITY", "BUY", "TIP", "COST", "BONUS", "IOU", "NET", "BID", "TRUST", "LOSS", "SELL", "PAR", "RIG", "TAX"],
                              
       nonWinningWords:["EMBEZZLE", "GAZUMP", "SQUEEZE", "PROXY", "MONEY", "ASSETS", "PAYMENT", "TRUSTEE", "MONOPOLY", "QUOTE", "PROSPECTUS", "CURRENCY", "INVESTMENT", "JUMP", "DISCOUNT", "INTEREST", "SETTLEMENT", "FUNDS", "YIELD", "OPTION", "RIGHTS", "SECURITIES", "REPORT", "SHARES", "DEPOSIT", "LIABILITY", "CONTRACT", "ACCOUNT", "PREMIUM", "RESERVE", "REVENUE", "PROFIT", "VENDOR", "MARKET", "GUARANTEE", "BOOM", "DEBENTURE", "AGENT", "DRAWER", "DEFAULT", "CREDITOR", "INFLATION", "RING", "CORNER", "RECEIPT", "CARTEL", "CHEQUE", "CREDIT", "MARGIN", "ORDER", "FIRM", "PERCENTAGE", "BROKER", "INCOME", "MERGER", "COLLATERAL", "AVERAGE", "BOND", "DIVIDEND", "EXCHANGE", "PRICE", "ADVICE", "GOLD", "OFFER", "BANKER", "JOBBER", "BANK", "FINANCE", "BILL", "BALANCE", "CALL", "DEAL"],
        
        winningGame: [
            "cApItAL NOtEs R",
            "A A I     R E I",
            "sCrIp  I Bull G",
            "H I    O  solD ",
            " stOcK unIts   ",
            "Pay O B E  spOt",
            " L  sHoRt   A A",
            "DebIt N  bEAr X",
            "  U  CuT I     ",
            "BUyER S  dEED  "]))

        games.append(GameModel(gameId:8703, maxWidth:17, maxHeight:12, winningScore:758, tags:[],
        winningWords:["ALWAYS","CENTURY","DAY","TODAY","MONTHLY","YEAR","NOW","PAST","WEEKLY","EARLY","FAST","DAILY","JIFFY","OFT","TERM","MORN","PM","WATCH","THEN","TIME","WIND","FIX","DAWN","TICK","EON","LATE","WEEK","DATE","AM","AGO","GAIN","ERA","AGE","FACE"],
        nonWinningWords:["BUZZ","QUARTZ","SLOWLY","YESTERDAY","SUNSET","INSTANTLY","BATTERY","SLOW","AUTUMN","ETERNITY","FUTURE","INSTANT","TOMORROW","SUMMER","UNTIL","HOROLOGY","ADJUST","LATEST","HOUR","MINUTE","WINTER","PUNCTUAL","MONTH","SEASON","ETERNALLY","TONIGHT","MOVEMENT","MIDDAY","MOMENT","NOON","SPRING","DURATION","PENDULUM","STRIKING","FORTNIGHT","EXACT","LOSE","INTERVAL","EVERLASTING","ALREADY","SUNDIAL","AFTERWARDS","NEVER","NIGHT","OFTEN","INTERIM","EVER","AFTERNOON","MORNING","QUICK","SPELL","CHRONOMETER","ANNUAL","FORENOON","HANDS","LATER","SECOND","EVENING","MIDNIGHT","GONG","RING","AFTER","WHILE","ANCIENT","ETERNAL","PERIOD","IMMEDIATE","WEEKEND","ONCE","ELECTRIC","ALARM","EPOCH","PERIODIC","EARLIER","CHIME","CLOCK","BEFORE","BELL","DIAL","DECADE"],
        winningGame: [
            "FIX D  AgE pASt",
            "   daTE A  M  I",
            "tODay  wiNd   C",
            "I  W THen A O K",
            "mORn   E Jiffy ",
            "E   wEek  late ",
            "    A alWays A ",
            " CeNtUry G terM",
            "A O C L NoW R  ",
            "mOnThLy    FaCE"]))

        games.append(GameModel(gameId:8704, maxWidth:17, maxHeight:12, winningScore:704, tags:[],
        winningWords:["STANZA","PRIZE","YEATS","POESY","HYMN","TEXT","SCOTT","GRAY","RHYME","SLESSOR","DOYLE","HARDY","SAXE","ELEGY","FOOT","POET","MILTON","SCAN","HOMER","POE","DONNE","HOOD","HOPE","BRIDGES","LAMB","ODE"],
        nonWinningWords:["SOUTHEY","POETRY","TENNYSON","RHYTHM","NURSERYRHYME","BYRON","BUNYAN","ROSSETTI","STEVENSON","WORDSWORTH","QUOTE","OMARKHAYYAM","SONNET","KINGSLEY","IDYLL","SHELLEY","SONG","CHORUS","LAWSON","VERSE","WHITTIER","JONSON","WRIGHT","SPENSER","NONSENSE","PATERSON","WILCOX","CHESTERTON","KEATS","COUPLET","NEWBOLT","QUATRAIN","THACKERAY","PSALM","EMERSON","COWPER","GOLDSMITH","BROWNING","HOLMES","MARLOWE","ELIOT","DENNIS","RONDEAU","BLANKVERSE","SAGA","DANTE","ADDISON","LONGFELLOW","SHAKESPEARE","MEREDITH","GILBERT","BETJEMAN","GILMORE","BROOKE","MILNE","CARROLL","CHAUCER","KIPLING","MILLER","MASEFIELD","LIMERICK","DOGGEREL","MADRIGAL","EPIC","LEAR","COLERIDGE","MACKELLAR","BELLOC","BARD","LEACOCK","BLAKE"],
        winningGame: [
            "POe  LAmB F  P ",
            "  L H  I HoMEr ",
            "  E O  L  O  I ",
            "B G pOEt stANzA",
            "rHyMe  O L   E ",
            "I    donNe P   ",
            "D  hOod  sCoTt ",
            "gRAy yeATs E E ",
            "E  M L   O sAxE",
            "sCAn E HArDy T "]))

        games.append(GameModel(gameId:8705, maxWidth:17, maxHeight:12, winningScore:738, tags:[],
        winningWords:[
           "POT", "HOSE", "ALYSSUM", "MIMOSA", "SWEEP", "PANSY", "WEED", "MOWER", "STALK", "PATH",
           "PEONY", "DIG", "ROSE", "CAN", "PALM", "WATER", "TRIM", "EDGES", "GRASS", "TAP",
           "LAWN", "MAY", "POOL", "STEM", "POPPY", "BUD", "PEST", "EARTH", "SOW", "SALVIA",
           "LILY"],
        nonWinningWords:["ZINNIA", "AZALEA", "GAZANIA", "LOTUS", "DAISY", "SHRUBS", "WORDSWORTH", "OMARKHAYYAM", "BOUQUET", "DISPLAY", "TULIP", "WATTLE", "SNOWDROP", "STOCK", "NATIVES", "CACTUS", "HYACINTH", "BLOSSOM", "ASTER", "TREES", "TUBER", "CROCUS", "PRUNE", "VIOLET", "LARKSPUR", "IRIS", "SOIL", "FLOWERS", "HIBISCUS", "PLANT", "ROCKS", "VINE", "CYCLAMEN", "JONQUIL", "NITROGEN", "HYDRANGEA", "JASMIN", "BROOM", "MULCH", "VIOLA", "SPRINKLE", "ANNUAL", "BONSAI", "LILIUM", "CORM", "IXIA", "PLUMBAGO", "CARNATION", "DISEASE", "SAXIFRAGE", "BULB", "PINK", "BLOOM", "SPADE", "SHAKESPEARE", "VERBENA", "BALSAM", "FORK", "SEED", "ANEMONE", "PREPARE", "FREESIA", "ORGANIC", "LANDSCAPE", "PERENNIAL", "FERN", "MARIGOLD", "DRAIN", "GREEN", "HOE", "ORCHID", "CALENDULA", "CANNA", "GARDEN", "BEGONIA", "CLIMBER", "ALOE", "RAKE", "GARDENIA", "CLARKIA", "LOBELIA", "CAMELLIA", "DAFFODIL", "LILAC", "DAHLIA", "LEAF", "ACACIA", "BED"],
        winningGame: [
            "pOt G M   HOsE ",
            "A R R A  B  O L",
            "L I alysSuM W I",
            "mImOsa T D E  L",
            "    swEep paNsy",
            "wEeD N moWer A ",
            "A D T P P stAlK",
            "T G A O pAth V ",
            "E E pEoNy   DiG",
            "rOsE  L  CAN A "]))

        games.append(GameModel(gameId:8710, maxWidth:17, maxHeight:12, winningScore:764, tags:["P","P33","C","C22","C23"],
        winningWords:["LORY","TURKEY","JAY","MYNA","TIT","TUI","TOMTIT","SWAN","SKYLARK","SKUA","ROOSTER","SPARROW","SWALLOW","OWL","OWLET","CANARY","GROUSE","EMU","TERN","WREN","SNIPE","AUK","ROOK","IBIS","SHAG","EGRET","CHAT","ROC","TEAL","HEN"],
        nonWinningWords:["BUZZARD","QUETZEL","OSPREY","APTERYX","CASSOWARY","STILT","VULTURE","SWIFT","CYGNET","THRUSH","BOOBY","STORK","BUSTARD","TOUCAN","CROW","PARROT","PULLET","OSTRICH","ALBATROSS","FROGMOUTH","PIPIT","CURLEW","PEEWIT","BITTERN","LYREBIRD","STARLING","AVOCET","PLOVER","GOOSE","FOWL","KESTREL","BULBUL","PHEASANT","RAVEN","PENGUIN","PHOENIX","DOVE","GULL","LOON","LINNET","SEAGULL","WAGTAIL","QUAIL","CUCKOO","GANNET","PETREL","PUFFIN","HAWK","KITE","SANDPIPER","BANTAM","MOPOKE","SHRIKE","ROSELLA","COCKATOO","MOA","PEN","HERON","MACAW","ROBIN","WADER","LORIKEET","WHIPBIRD","PARTRIDGE","LOVEBIRD","ORIOLE","PIGEON","FANTAIL","DIPPER","HORNBILL","HARRIER","DODO","ERNE","BLUEBIRD","BOBOLINK","COCKATIEL","MAGPIE","JACKDAW","LARK","CRANE","FALCON","GANDER","MALLARD","PELICAN","COCK","RHEA","FINCH","PEACOCK","DRAKE","EIDER","GREBE","BELLBIRD","BLACKBIRD","EAGLE","KEA"],
        winningGame: [
            " J sNIPe R  T C",
            " A H   gRoUse A",
            "MyNa R R O wrEn",
            "   G O E sWan A",
            "HeN toMtIt L  R",
            " M Auk   E loRy",
            "tui R sPArrow  ",
            "E B K K   owlEt",
            "A I E U   C   I",
            "L sKyLaRK  CHAt"]))

        games.append(GameModel(gameId:8711, maxWidth:17, maxHeight:12, winningScore:810, tags:[],
        winningWords:["AZURE","ZOFFANY","SOOTY","RUBY","BAY","RUDDY","SANDY","GOYA","GREY","EBONY","DYCK","BRUSH","TUBE","ART","DUN","RUBENS","TAN","TONE","COROT","COLOUR","PAINT","ROUGE","HUE","JET","UMBER","SEPIA","BLUE","AMBER","RED","LAKE","LAC","JADE"],
        nonWinningWords:["TAWNY","CEZANNE","RUSSET","SCOTT","ROMNEY","YELLOW","TEXTURE","ROSSETTI","LELY","TINTORETTO","REYNOLDS","TURNER","MIX","STAIN","MATISSE","MAUVE","WHISTLER","AUBURN","UTRILLO","BROWN","MONET","WHITE","SILVER","TITIAN","VIOLET","PICASSO","SARGENT","BEARDSLEY","CRIMSON","GAUGUIN","CANVAS","PURPLE","MURILLO","SICKERT","OPAQUE","MANET","PALETTE","PIGMENT","SCARLET","FAWN","GILT","PUCE","MAROON","GAINSBOROUGH","VERMILION","OLIVE","ORPEN","CANALETTO","CONSTABLE","HOGARTH","RAEBURN","SAFFRON","VERMEER","HALS","SAPPHIRE","MILLET","RENOIR","REMBRANDT","BOTTICELLI","JOHN","PINK","NOLAN","LACQUER","MAGENTA","MILLAIS","CERISE","CLARET","COBALT","BUFF","OPIE","LANDSEER","LAVENDER","LAWRENCE","CHROME","ORANGE","CHOCOLATE","DEGAS","EASEL","INDIGO","FRAGONARD","CORAL","GREEN","HENNA","MODEL","OCHRE","GOLDEN","HOLBEIN","ANIL","CREAM","ENAMEL","MICHELANGELO","RAPHAEL","DRAB","BEIGE","BLACK","BICE"],
        winningGame: [
            "J tUBe Lac  L D",
            "A A  B  zoFFaNy",
            "dUn CoLOur  K C",
            "E  H N  roUge K",
            "  ruBy Jet R   ",
            "bLue  U   sepIa",
            "R B B M  Goya R",
            "U E aMbEr O I T",
            "sAnDy E E tOnE ",
            "H S   rUdDy T  "]))

        games.append(GameModel(gameId:8712, maxWidth:17, maxHeight:12, winningScore:680, tags:[],
        winningWords:["TOYS","YULE","TURKEY","GUESTS","SWEETS","HOLLY","PLUMS","PARSLEY","PORT","ROAST","WISHES","BUSH","PRESENTS","SALT","JELLY","SUGAR","NUTMEG","DATES","SAUCE","WINE","MEAT","TREE","EGGS","SPICE","FARE"],
        nonWinningWords:["NUTS","GLAZED","MARZIPAN","GRAVY","TOAST","RUM","BUTTER","MIXTURE","SULTANAS","TOMATO","HATS","BISCUITS","CURRANTS","POTATOES","FRUIT","BRANDY","CUSTARD","ONIONS","STREAMERS","GLASSES","STUFFING","MISTLETOE","CELERY","SILVER","CASHEWS","LETTUCE","LIQUEUR","RAISINS","LIGHTS","LIQUOR","FLOWERS","PUMPKIN","APRICOTS","FLOUR","PUNCH","SEASONING","BOWL","PEARS","GREETINGS","PORK","DECORATIONS","ALMONDS","CLOTH","CAROLS","GRAPES","VEGETABLES","FIGS","BALLOONS","BASIN","HERBS","MIXED","PUDDING","MARASCHINO","BEANS","CARDS","LEMON","MELON","TRIFLE","CINNAMON","CHERRIES","BANANAS","CRANBERRIES","BELLS","JUICE","NOEL","CARAMELS","ORANGE","SALAD","CANDLES","PEACHES","PINEAPPLE","GINGER","HAM","CHEESE","LEMONADE","CHAMPAGNE","ICING","CORDIAL","LAMB","PEEL","CHICKEN","CHEER","DRIED","COFFEE","ICE","CAKE","BEEF"],
        winningGame: [
            "DAtEs   F WInE ",
            "  R A MEat  U P",
            " JeLly  roASt A",
            "  E tuRKey  M R",
            "   G L   swEeTs",
            " sAuCe  B I G L",
            " U E  pLuMs   E",
            "EgGs  O S hOLLy",
            " A T  R H E    ",
            "PrEsENtS  sPICE"]))

        games.append(GameModel(gameId:8802, maxWidth:17, maxHeight:12, winningScore:720, tags:[],
        winningWords:["PRIZE","STUDY","GYM","BOYS","SUMS","SWOT","BLAZER","COPY","PHYSICS","PLAY","SPORT","CRAYON","MATHS","QUIET","TENNIS","MATES","ART","TERM","CLASS","TABLES","LINES","CAPTAIN","PEN","ROLL","INK","CANE"],
        nonWinningWords:["HISTORY","STUDENT","SONGS","CHEMISTRY","PRIMARY","GEOMETRY","ROSTER","SETSQUARE","TUCKSHOP","MUSIC","PLAYGROUND","SEAT","HOLIDAYS","TEXTBOOK","LABORATORY","SECONDARY","BIOLOGY","WOODWORK","BURSAR","MASTER","COMPASS","LIBRARY","MONITOR","WRITING","POEMS","PROTRACTOR","SPANISH","PUPIL","JUNIOR","PROJECTS","GEOGRAPHY","UNIFORM","RECESS","SENIOR","BOOKS","RULER","OVAL","HSC","FRACTIONS","HOMEWORK","VACATION","GIRLS","LECTURE","PARSING","EXAM","SCHOOL","LUNCH","EDUCATION","FORM","LANGUAGES","CALCULATOR","ERASER","RUBBER","DRAWING","SPELLING","TIMETABLE","HEADMASTER","INDONESIAN","DESK","ENGLISH","FRIENDS","SHAKESPEARE","FOOTBALL","GRAMMAR","ITALIAN","PREFECT","SPEECH","PAPER","COOKING","CRICKET","GERMAN","PRINCIPAL","SCIENCE","TEACHER","CRAM","FOOD","DECIMALS","LOCKER","PENCIL","FRENCH","READING","CHAIR","REFERENCE","COLLEGE","BLACKBOARD","ALGEBRA","CHALK","BELL","FLAG"],
        winningGame: [
            "tABLEs   P     ",
            "E    U  ClASs B",
            "rOLl M Q A  W O",
            "M  I sTuDy copy",
            " cAnE  I  Maths",
            " R E  peN  P Y ",
            " A sPOrt MAtEs ",
            "GyM   I A  A I ",
            " O BLAzEr  I C ",
            "InK   E tENnIs "]))

        games.append(GameModel(gameId:8803, maxWidth:17, maxHeight:12, winningScore:626, tags:["P","P33","C","C22"],
        winningWords:["SUEZ","ZURICH","SYDNEY","AYR","TOKYO","YORK","QUITO","TORONTO","BOMBAY","OMSK","OSLO","LAGOS","BOGOTA","HOBART","TOLEDO","BONN","RENO","ROME","OSAKA","CORK","CAIRO","OMAHA","LIMA","DELHI"],
        nonWinningWords:["TUCSON","HOUSTON","TULSA","BUTTE","TURIN","OTTAWA","WARSAW","BRUSSELS","BOSTON","MOSCOW","PITTSBURGH","SEOUL","VANCOUVER","HONOLULU","ISTANBUL","TASHKENT","YOKOHAMA","SEATTLE","ATHENS","JUNEAU","DETROIT","STOCKHOLM","CALGARY","GLASGOW","PARIS","PERTH","BUCHAREST","CALCUTTA","EDMONTON","SANTIAGO","OXFORD","ATLANTA","MEMPHIS","PHOENIX","AMSTERDAM","LISBON","MUNICH","MONTREAL","JERUSALEM","LIVERPOOL","HAMILTON","WINNIPEG","DARWIN","NAPLES","PRAGUE","VIENNA","SINGAPORE","RANGOON","NOME","MELBOURNE","BOISE","DENVER","LONDON","MADRAS","BELFAST","BATH","DUBLIN","GDANSK","TEHERAN","HAVANA","BRISBANE","SHANGHAI","JAKARTA","QUEBEC","NAGASAKI","HANOI","MIAMI","BUFFALO","BREMEN","DALLAS","PEKING","AUCKLAND","ALEXANDRIA","CARACAS","HALIFAX","GENOA","COPENHAGEN","BERLIN","MANILA","REGINA","LENINGRAD","BANGKOK","MADRID","CANBERRA","CASABLANCA","ERIE","NICE","CHICAGO","KARACHI","DAKAR","MECCA","BAGHDAD","ADELAIDE","DACCA"],
        winningGame: [
            " S   BoGOtA    ",
            "QuItO M  O    C",
            " E O  A  L  L O",
            " zUrICh DeLhi R",
            "   O  A  D omsk",
            "BoNn    BoMbay ",
            " S toKyO   A D ",
            "LaGos O    rEnO",
            " K  L rOME T E ",
            "CaIRo K     AyR"]))

        games.append(GameModel(gameId:8804, maxWidth:17, maxHeight:12, winningScore:836, tags:[],
        winningWords:["MEZZO","MAZURKA","HYMN","STRUM","KEY","STOP","SLOW","SLUR","MUTE","REST","TUNE","HUM","LOW","SONG","TRIO","BASSO","DUO","NOTE","TONE","TEMPO","HIT","SIGN","TIME","TIE","FORTE","SCORE","FRET","VIOLA","MOOD","HARP","MARCH","HOLD","ARIA","ECHO"],
        nonWinningWords:["JAZZ","WALTZ","PIZZICATO","SYMPHONY","OPUS","RHYTHM","TRUMPET","SYNCOPATE","HARMONY","RHAPSODY","XYLOPHONE","LUTE","OVERTURE","MELODY","STRING","GAMUT","LULLABY","BASS","DUET","SOLO","CHORUS","MINUET","VOLUME","PAUSE","QUAVER","SONATA","DRUM","MOVEMENT","NOCTURNE","TENOR","CYMBAL","GUITAR","SOPRANO","FLUTE","FUGUE","NATURAL","SAXOPHONE","CONDUCTOR","TREMOLO","OCTAVE","ETUDE","SHARP","STAFF","TACET","ALTO","INTERVAL","KEYBOARD","TROMBONE","CORNET","VIOLIN","ORCHESTRA","CANTO","MINOR","HORN","LILT","DULCET","CANTATA","PITCH","QUICK","CONCERTO","POLONAISE","MINIM","THEME","BARITONE","FLAT","BREVE","MAJOR","ORGAN","PIANO","BUNGLE","LEGATO","PRELUDE","OBLIGATO","CLARINET","ANDANTE","TREBLE","OPERA","CRESCENDO","BEAT","PIPE","SERENADE","LARGO","POLKA","SCALE","PICCOLO","OBOE","ENCORE","ARPEGGIO","BANJO","CAROL","CHORD","ALLEGRO","BAR","JIG","HIGH","REEL","CHIME","FANFARE","ADAGIO","PEDAL","BAND","CODA","REED","BALLAD","CLEF","FIFE"],
        winningGame: [
            "   sOnG D R hIt",
            " K I O tuNe A I",
            " E G tRio strUm",
            "hymn E E stop E",
            "U E A B  L N   ",
            "mAzUrKa mute  E",
            "  Z I sCore F C",
            "VIola S O mArCh",
            "   O HoLd P E O",
            "SLOw     FoRtE "]))

        games.append(GameModel(gameId:8805, maxWidth:17, maxHeight:12, winningScore:688, tags:[],
        winningWords:["MAIZE","RYE","GRAZING","HAY","STUD","STRAW","MOW","OATS","ROOT","STOCK","HARVEST","WOOL","ROTATION","SILO","SOIL","WHEAT","PLANT","TANK","CART","MEAT","EWE","SHEEP","SHED","SEED","PIG","BIN","HOE","LAMB","RAKE"],
        nonWinningWords:["PRIZES","POULTRY","FERTILIZER","MUSTER","COWS","BUTTER","STATION","HUSBANDRY","AGRONOMY","HAYSTACK","PASTURE","DAIRY","SOWING","TROUGH","VINEYARD","YIELD","CULTIVATION","TRACTOR","AGISTMENT","STALL","BARLEY","HARVESTER","PASTURAGE","PRUNING","LIVESTOCK","HARROW","CHURN","RURAL","PLANTATION","APIARIST","AGRICULTURE","FARROW","MANURE","PLOUGH","THRESHING","ELEVATOR","CROFT","DROVING","CATTLE","SHEAVE","STABLE","GRAPES","HOMESTEAD","PLOUGHING","IRRIGATION","CROP","HOGGET","MERINO","MILLET","ANIMALS","WINDMILL","FALLOW","LUCERNE","GRAFTING","SHEARING","RINGER","BUCOLIC","DIPPING","SILAGE","JILLAROO","GRAIN","FARMING","MILKING","REAPING","TILLAGE","BARN","REAPER","BRANDING","JACKEROO","FOALING","BINDER","DAM","HERD","FODDER","PADDOCK","BREEDING","HEIFER","ARABLE","CEREAL","CALF","CHAFF","FEED"],
        winningGame: [
            "sTOcK  rAKe R  ",
            "T  A HAy  wooL ",
            "U  R   E Meat  ",
            "D stRAw G  taNK",
            "  E   hArVEst  ",
            "sHeD  E A   I  ",
            "H D  maIzE soIl",
            "E  ROot I Bin A",
            "E    W  N  L  M",
            "pLANT PIg HoE B"]))

        games.append(GameModel(gameId:8806, maxWidth:17, maxHeight:12, winningScore:816, tags:[],
        winningWords:["GUY","YAW","STAY","PLY","BUOY","QUAY","JETTY","DORY","AHOY","SET","YACHT","MAST","PORT","PROW","BOWSPRIT","TRANSOM","TRIM","ASTERN","BOW","BOX","SPAR","HAWSER","JUNK","MOOR","SHIP","WATCH","CREW","AFT","SAIL","OAR","TACK","LOG","FOG"],
        nonWinningWords:["MIZZEN","HORIZON","STORM","SEXTANT","VOYAGE","STERN","CUTTER","HATCHWAY","GANGWAY","QUARTERS","JETTISON","KNOT","DINGHY","SLOOP","STEER","COURSE","SCUPPER","WINDLASS","STEAMSHIP","SWELL","SQUALL","TOPSAIL","SLIP","SHEET","GALLEY","HYDROFOIL","STEAMBOAT","OUTRIGGER","CAPSTAN","HALYARD","STEAMER","CANVAS","BUNK","DHOW","WIND","PENNANT","WINDWARD","WEATHER","STARBOARD","SAILOR","SCHOONER","PAINTER","PITCH","SHOAL","NAUTICAL","NAVIGATE","ASHORE","TANKER","SPINNAKER","BALLAST","FORWARD","BOOM","ROPE","ALOFT","BERTH","CHART","WHARF","LUGGER","RUDDER","TILLER","TIDE","WAKE","LAUNCH","SPLICE","LIGHTER","CAULK","FLUKE","HATCH","KETCH","WHEEL","CATAMARAN","FREIGHTER","PIER","FRIGATE","RIG","ANCHOR","LINER","CLIPPER","LEEWARD","RIGGING","TACKLE","LIFEBOAT","INBOARD","PINNACE","LOCKER","GALLEON","BRIG","HELM","HOLD","LINE","BULKHEAD","ANCHORAGE","BOLLARD","JIG","DOCK","RAKE","BLOCK","ABOARD","CAREEN","BINNACLE","BRIDGE","CABIN","BEAM","ABEAM","BILGE","ALEE","DECK"],
        winningGame: [
            "tRaNsOM S sHIP ",
            "A S A   P E   P",
            "C tRiM mast G L",
            "K E L Port buOy",
            "  R  D O ahoy  ",
            "jUnK oAr yaw  W",
            "E    R  F W C A",
            "T QUay boWsPrIt",
            "T   F Log E E C",
            "yACHt  X PrOw H"]))

        games.append(GameModel(gameId:8807, maxWidth:17, maxHeight:12, winningScore:764, tags:[],
        winningWords:["ZSA","LIZA","TONY","JUDY","WOODY","MURPHY","RYAN","TAYLOR","DUNAWAY","SIDNEY","TOM","BURT","STEVE","DUSTIN","FAYE","FINNEY","BOW","NOVAK","PETER","TAB","OMAR","JOHN","ROD","MEL","ALAN","CAINE","DEAN","AL","ALDA"],
        nonWinningWords:["KOZLOWSKI","SYLVESTER","BEATTY","ELIZABETH","AUDREY","CURTIS","BUSTER","SHIRLEY","REYNOLDS","CONNERY","TURNER","THORNTON","SHELLEY","TRAVOLTA","EASTWOOD","MARX","BRONSON","STREISAND","ANDREWS","BAXTER","MARTIN","OTOOLE","BATES","PAUL","STALLONE","DOUGLAS","STEIGER","NEWMAN","ROBERT","WARREN","WILLIAMS","POITIER","SEAN","GIBSON","HARRIS","OLIVER","SOPHIA","HEPBURN","CLINT","MOORE","KEATON","RAQUEL","MCQUEEN","JAMES","LEMMON","MARLON","SIGRID","JACKSON","LONG","HARPO","JULIE","LOREN","ROBIN","ROGER","SHARIF","ALBERT","SEGAL","WELCH","CAPUCINE","CHARLES","KIM","EDWARD","GARNER","PACINO","MINNELLI","HOGAN","DEPARDIEU","ANNE","KIRK","BRANDO","HOFFMAN","SELLECK","GABOR","ONEAL","GEORGE","REMICK","REDFORD","DIRK","FONDA","GERARD","RICHARD","JANE","ALLEN","LINDA","BARBRA","BOGARDE","MACLAINE","MICHAEL","GLENDA","CLARA","DIANE","REED","JACK","LEE","EDDIE"],
        winningGame: [
            "AlDa JOHn     F",
            " I L    omAr  I",
            " zsa StEve O  N",
            "CainE O al dEAn",
            "  D   N K D   E",
            "DUnAwAy  MuRpHy",
            "  E O   J S E  ",
            "tAyLoR BuRt tAb",
            "O   D   D I E O",
            "M FAyE RyAn R W"]))

        games.append(GameModel(gameId:8808, maxWidth:17, maxHeight:12, winningScore:696, tags:[],
        winningWords:["STUTZ","SUZUKI","BENZ","VW","MAZDA","VORTEX","ROCKY","CAMRY","SUPRA","TURBO","TELSTAR","ASTRA","BMW","RENAULT","ROLLS","COLT","ROMEO","TARAGO","AUDI","MG","SEDAN","NOMAD","SAAB","GOLF","ALFA","LADA"],
        nonWinningWords:["PIAZZA","TOYOTA","SPORTS","PLYMOUTH","ROYCE","VOLVO","AUSTIN","SUBARU","SKYLINE","HYUNDAI","TORQUE","CHRYSLER","BENTLEY","TRIUMPH","MINX","NISSAN","PULSAR","MITSUBISHI","ROVER","AUTOMATIC","PEUGEOT","VAUXHALL","DAIHATSU","LEYLAND","PATROL","NASH","NIVA","MASERATI","SINGER","FAIRMONT","CHEVROLET","CITROEN","HARDTOP","PINTARA","PONTIAC","PORSCHE","EXA","HUMBER","MANUAL","CRESSIDA","FUEGO","LASER","INTEGRA","FIAT","JAGUAR","PRELUDE","COMMODORE","MAVERICK","REGATA","BUICK","CIVIC","HATCH","SECA","LINCOLN","PAJERO","CABRIOLET","MERCEDES","KOMBI","COROLLA","FORD","CALAIS","FERRARI","HILLMAN","HONDA","MAGNA","JACKAROO","HOLDEN","DARRACQ","BARINA","CAMIRA","CORDIA","FALCON","DAIMLER","LAGONDA","ACCORD","FAIRLANE","LANCIA","LEGEND","DODGE","GHIA","CHARADE","CADILLAC","CELICA"],
        winningGame: [
            "      R   rOLLs",
            " B   CoLt E   E",
            " mG R C E nOmAd",
            "vw  O K L A A A",
            "O CAmRy sTutz N",
            "R   E   T ladA ",
            "tURbo A astra A",
            "E  E SuPra A  L",
            "X  N  D  A gOLf",
            " SUzUKi  B O  A"]))

        games.append(GameModel(gameId:8809, maxWidth:17, maxHeight:12, winningScore:676, tags:[],
        winningWords:["PIZZA","NUTS","PASTRY","TURKEY","GRAVY","SOUP","GORGONZOLA","TART","MINTS","PARSLEY","STILTON","ROLLS","STEAK","SAGO","MEAT","PORK","TEA","EGGS","SPICE","DUCK","LOIN","VEAL","MILK","PEAR","PIE","LAMB","EDAM"],
        nonWinningWords:["OYSTERS","SCHNITZEL","CURRY","MARZIPAN","ZUCCHINI","SWEETS","WALNUT","GRUYERE","CROUTONS","BUTTER","OXTONGUE","POTATO","PRAWNS","MUSHROOM","CUTLET","FRUIT","JELLY","SUGAR","PLUM","CUSTARD","DESSERT","BUN","ROQUEFORT","CELERY","OXTAIL","FRITTER","LOBSTER","GOULASH","LYCHEE","SALMON","CHOPS","SAUCE","WINE","SOUFFLE","GATEAU","LUNCH","PARMESAN","QUINCE","VEGETABLES","MERINGUE","HERBS","PROFITEROLE","ENTREE","WAFER","TRIFLE","AVOCADO","SEAFOOD","JUICE","DINNER","CHOCOLATE","COCKTAIL","SALAD","PINEAPPLE","GINGER","APPLE","HAM","JAM","CHEESE","WAFFLE","MARINADE","BACON","BREAM","CREAM","CREPE","ICING","PECAN","RICE","GARLIC","CARAMEL","PANCAKE","CHEESECAKE","CHICKEN","ECLAIR","MELBA","PEACH","BREAD","COFFEE","ICE","CAKE","BEEF"],
        winningGame: [
            "lOIn   D SpICE ",
            "A  U SOuP I   P",
            "mINts  C meAt A",
            "B  stEAk I  E S",
            "  P I    L taRt",
            "  E L pOrk U  R",
            "E A T I O GrAvy",
            "gOrGoNzOlA K E ",
            "G   N Z L  eDaM",
            "sAGO PaRsLEy L "]))

        games.append(GameModel(gameId:8810, maxWidth:17, maxHeight:12, winningScore:716, tags:[],
        winningWords:["ORCZY","ZOLA","PEPYS","HAY","SAYERS","AYRES","GLYN","CHEYNEY","GREY","KYNE","HENRY","DOYLE","HARDY","HEYER","SHAW","DUMAS","WAUGH","HUGO","SAND","MANN","POPE","GASKIN","ROHMER","POE","JACOBS","EDEN"],
        nonWinningWords:["TOLSTOY","BALZAC","HUXLEY","QUEUX","SCOTT","SWIFT","FITZGERALD","PRIESTLEY","STEVENSON","MONTGOMERY","AUSTEN","TURNER","JOYCE","TWAIN","BURROUGHS","LOOS","HEMINGWAY","MARX","WREN","CHESTERTON","ALCOTT","HAMMETT","THOREAU","CERVANTES","BALLANTYNE","BENNETT","SIMENON","PLATO","WOOLF","BOSWELL","EMERSON","BRONTE","HILTON","SAPPER","STACPOOLE","AESOP","VERNE","HOLMES","CHRISTIE","ELIOT","DARWIN","COLLINS","QUENNELL","GRIMM","HARTE","COWARD","LONDON","MAUGHAM","STEINBECK","BUCK","DREISER","FAULKNER","BIGGERS","BUCHAN","VIDAL","WILDE","HOPE","MELVILLE","MITCHELL","DICKENS","ARNOLD","FARNOL","JEROME","CHURCHILL","DISRAELI","MILNE","CARROLL","KIPLING","CARR","CONRAD","GARDNER","ARLEN","MICHENER","MAILER","WALLACE","BACON","ARCHER","BARRIE","GODDEN","GRAHAME","LAMB","CHANDLER","HAGGARD","CLARKE","CAINE","BOCCACCIO","DEFOE","DELL"],
        winningGame: [
            "gAsKIN DUMAs  H",
            "L H   R    A  A",
            "Y A H O ChEyNey",
            "N wAuGh  E E D ",
            " H  G mANn R E ",
            " E pope  R sand",
            "KyNe orCzy  Y O",
            " E P E  O HArDy",
            "GrEy    L   E L",
            "   S   JaCOBs E"]))

        games.append(GameModel(gameId:8811, maxWidth:17, maxHeight:12, winningScore:630, tags:[],
        winningWords:["SOY","MAIZE","YAM","ZUCCHINI","CITRUS","PARSLEY","POTATO","CHERRY","PAPAYA","PLUM","COS","TARO","CELERY","MARROW","GUAVA","LYCHEE","SAGO","RAISIN","MANGO","DATE","ORANGE","PEAR","PECAN","PEA","FIG"],
        nonWinningWords:["SPROUT","BUTTERNUT","STRAWBERRY","BOYSENBERRY","SALSIFY","SQUASH","WALNUT","MUSCAT","TURNIP","KUMQUAT","MULBERRY","TOMATO","RASPBERRY","LOQUAT","GOOSEBERRY","PASSIONFRUIT","CRESS","PAWPAW","PEANUT","COCONUT","CURRANT","BLUEBERRY","PRUNE","LETTUCE","ASPARAGUS","PUMPKIN","CRANBERRY","LOGANBERRY","PERSIMMON","BEETROOT","PARSNIP","SHALLOT","SWEDE","MANGOSTEEN","CARROT","CAPSICUM","ONION","CASHEW","CUCUMBER","QUANDONG","APRICOT","WAXBEAN","OLIVE","CANTALOUPE","DURIAN","PIPPIN","QUINCE","BLACKBERRY","CORN","PLANTAIN","JACKFRUIT","LENTIL","POMELO","SPINACH","TANGELO","FOXGRAPE","POMEGRANATE","BLACKCURRANT","LEMON","RADISH","RHUBARB","EGGPLANT","SCALLION","ROCKMELON","AVOCADO","ENDIVE","CHIVE","ARTICHOKE","BEET","ALMOND","MANDARIN","CHOKO","PINEAPPLE","GHERKIN","APPLE","GRAPE","BROCCOLI","LIME","BANANA","GARLIC","GREENGAGE","CHILLI","PEACH","BEAN","JACKBEAN","GAGE","KALE","LEEK","CABBAGE"],
        winningGame: [
            "PEcAN  F pApAyA",
            "  I  mAize E A ",
            "DAtE A guaVa M ",
            "  R  N  C  R  P",
            "pLum G  C O L A",
            "O saGo ChErRy R",
            "T  R    I A cOs",
            "A  rAIsIn N H L",
            "tARo  O I G E E",
            "O  W  Y  CeLeRy"]))

        games.append(GameModel(gameId:8812, maxWidth:17, maxHeight:12, winningScore:720, tags:["P","33","C","C22"],
        winningWords:[
            "AZALEA", "ALOW", "ANNUAL", "VIOLET", "TAP", "TRIM", "PEST", "PANSY", "TUBER", "LILY",
            "HOSE", "CAN", "SOW", "RAKE", "NATIVES", "VINE", "STOCK", "LOTUS", "BED", "WATTLE",
            "ROSE", "ZINNIA", "LAWN", "LEAF", "PLANT", "MAY", "POT", "SPADE", "POPPY"],
        nonWinningWords:["ALYSSUM", "GAZANIA", "PEONY", "DAISY", "STEM", "SHRUBS", "BLOSSUM", "BOUQUET", "DISPLAY", "TULIP", "SNOWDROP", "GRASS", "CACTUS", "HYACINTH", "ASTER", "SWEEP", "TREES", "WATER", "CROCUS", "MOWER", "STALK", "LARKSPUR", "IRIS", "SOIL", "FLOWERS", "HIBISCUS", "MIMOSA", "ROCKS", "PATH", "CYCLAMEN", "JONQUIL", "SALVIA", "NITROGEN", "HYDRANGEA", "POOL", "JASMIN", "BROOM", "MULCH", "VIOLA", "SPRINKLE", "BUD", "BONSAI", "LILIUM", "CORN", "IXIA", "PLUMBAGO", "CARNATION", "EARTH", "DISEASE", "SAXIFRAGE", "BULB", "PINK", "BLOOM", "PRIME", "VERBENA", "BALSAM", "FORK", "PALM", "SEED", "WEED", "ANEMONE", "PREPARE", "EDGES", "FREESIA", "ORGANIC", "LANDSCAPE", "PERENNIAL", "FERN", "MARIGOLD", "DRAIN", "GREEN", "HOE", "ORCHID", "CALENDULA", "CANNA", "GARDEN", "BEGONIA", "CLIMBER", "GARDENIA", "CLARKIA", "LOBELIA", "CAMELLIA", "DIG", "DAFFODIL", "LILAC", "DAKLIA", "ACACIA"],
        winningGame: [
            "      AzAlEA   ",
            "  ALOw I E  P P",
            " V   aNnUaL O O",
            "ViOlEt N F  tAp",
            " N O tRiM  M  P",
            "Pest L A  paNsy",
            "  tuber lIly P ",
            " Hose O A A CaN",
            "  C D sOw N  D ",
            "RAkE  E nAtIVeS"]))

        games.append(GameModel(gameId:8902, maxWidth:17, maxHeight:12, winningScore:746, tags:[],
        winningWords:["WALTZ","TRYST","POSY","JOY","TRUST","RENDEZVOUS","HYMN","POST","GUESTS","TOAST","WOO","KISS","ROSES","WORDS","TAXI","MIX","WIN","USHER","TRIP","PEW","FLOWERS","WINE","GROOM","GIFT","DATE","OLD","ADORE"],
        nonWinningWords:["PYRAMUS","STARS","ELIZABETH","HAPPY","THOUGHTS","COURT","SURPRISE","WISHES","HONEYMOON","STROLL","MUSIC","TOUCH","SWEETHEARTS","GOWN","SONG","LOVERS","PICTURES","SENTIMENT","SECRETS","TREASURE","NEW","INVITATION","PRESENT","SMILES","FIDELITY","MINISTER","CONGRATULATIONS","MOON","LETTER","HOLIDAY","BARRETT","PROMISE","CARESS","JULIET","HOPES","PLANS","LOVE","TOGETHER","ROBERT","THISBE","BROWNING","CONFETTI","HUSBAND","MOONLIGHT","VALENTINE","HOTEL","ROMEO","BORROWED","COUPLE","POEM","WALK","VEIL","ALTAR","HEART","VIDEO","DREAMS","MEETING","BLUE","RING","WIFE","CHURCH","CORSAGE","BREAKFAST","TELEPHONE","BRIDESMAIDS","CONFIDANT","AISLE","ENGAGEMENT","HOME","PAIR","ROMANCE","WEDDING","DINNER","MARRIAGE","HOLD","CHAMPAGNE","ICING","FONDLE","DINE","LANE","KNIFE","CAMERA","BRIDE","CARD","DANCE","CALL","CAKE"],
        winningGame: [
            "  H tOASt P P  ",
            "JOy A   R O oLd",
            "  mIx  GuEsts A",
            "wIn I K S trySt",
            "I    GiFt  I  E",
            "N G U S  W pEw ",
            "E rOsEs  A   O ",
            "  O H   FlOwErS",
            "ADoRe    T O D ",
            "  M rENDEzVoUs "]))

        games.append(GameModel(gameId:8903, maxWidth:17, maxHeight:12, winningScore:652, tags:[],
        winningWords:["ZAIRE","CYPRUS","ZAMBIA","URUGUAY","TANZANIA","BELIZE","TURKEY","SYRIA","ITALY","GUYANA","HUNGARY","YEMEN","KENYA","GERMANY","TOGO","SUDAN","PERU","BURMA","CUBA","NIGER"],
        nonWinningWords:["BRAZIL","SWAZILAND","SWITZERLAND","VENEZUELA","ZIMBABWE","EGYPT","NORWAY","MOZAMBIQUE","TUVALU","VANUATU","YUGOSLAVIA","RUSSIA","NAURU","MAURITIUS","CZECHOSLOVAKIA","KUWAIT","PARAGUAY","AUSTRIA","LIBYA","BOTSWANA","MALAYSIA","LUXEMBOURG","SEYCHELLES","PORTUGAL","BHUTAN","TAIWAN","BURUNDI","VIETNAM","HONDURAS","SURINAME","AUSTRALIA","SWEDEN","SPAIN","TONGA","LAOS","PAKISTAN","ANTIGUA","QATAR","SAMOA","DJIBOUTI","MAURITANIA","LIECHTENSTEIN","MALDIVES","BRUNEI","MEXICO","TOBAGO","SINGAPORE","NETHERLANDS","OMAN","MALTA","PHILIPPINES","RWANDA","BRITAIN","MOROCCO","SOMALIA","GUATEMALA","AFGHANISTAN","CONGO","HAITI","GUINEA","ISRAEL","MALAWI","MONACO","ETHIOPIA","ARGENTINA","INDONESIA","CAMEROON","MONGOLIA","TRINIDAD","BELGIUM","BOLIVIA","ECUADOR","ROMANIA","UGANDA","IRAN","IRAQ","KIRIBATI","ANDORRA","SENEGAL","JORDAN","POLAND","NICARAGUA","BARBADOS","BULGARIA","THAILAND","BAHAMAS","PANAMA","DENMARK","LEBANON","BENIN","GABON","JAPAN","KOREA","NEPAL","MADAGASCAR","COLOMBIA","DOMINICA","ANGOLA","BANGLADESH","NIGERIA","MALI","BAHRAIN","FINLAND","IRELAND","CHINA","GHANA","INDIA","FRANCE","GRENADA","ALGERIA","LIBERIA","GAMBIA","FIJI","ALBANIA","ICELAND","JAMAICA","GREECE","CHILE","CANADA","CHAD"],
        winningGame: [
            " ItALy  G H C S",
            "  O  E  uRuGuAy",
            "B gERmANy N B R",
            "E O  E  A G A I",
            "L  tAnzAnIa   A",
            "I  U  A A R  B ",
            "zAIrE M  CypRuS",
            "E  K  B    E R ",
            "   E NiGER R M ",
            "KENyA A   SuDaN"]))

        games.append(GameModel(gameId:8904, maxWidth:17, maxHeight:12, winningScore:768, tags:[],
        winningWords:["ZIGZAG","ZIPPER","CITY","KEYS","SUN","PARTY","FLY","WEST","ITALY","MONEY","USA","PORTS","JOURNEY","SWIM","ROUTE","RELAY","EAST","SKI","STAGE","ORIENT","TAHITI","TREK","JET","WALLET","SAND","SEA","CARDS","AIR"],
        nonWinningWords:["COUNTRY","SOUTH","TOURIST","VOYAGE","PASSPORT","QUEUES","SIGHTS","EXPRESS","RESORT","MOUNTAINS","VISA","ITINERARY","JAUNT","TOURING","JETSETTER","TRIP","NORTH","ADVENTURES","OVERSEAS","ESCORT","QANTAS","STREAMERS","ROVE","COSMETICS","WALES","CRUISE","TRAVEL","HOLIDAY","REUNION","TRIPPER","JUMBO","TRAIN","CLOTHES","LEISURE","EUROPE","TICKET","INSURANCE","PASSENGER","SCOTLAND","OUTBACK","PASSAGE","SUNBAKE","HOTEL","BOOKINGS","MEXICO","SAIL","DRIVE","WANDER","OVERLAND","ASIA","DIVE","JAVA","ISLAND","ACCOMMODATION","CREDIT","FLIGHT","GUIDE","CASE","HAWAII","JETLAG","LINER","LUGGAGE","FAREWELL","JAPAN","NEPAL","RANGE","MEANDER","FILM","RAIL","OCEAN","ENGLAND","IRELAND","DINE","CHINA","INDIA","CAMERA","FRANCE","AMERICA","CABIN","COACH","FARE","FIJI","AFRICA","DANCE","BALI","CANADA","BAGGAGE","BAG","DECK","BEACH"],
        winningGame: [
            "P jEt zIGZaG  R",
            "O O R I   I   E",
            "rOuTe P cArDs L",
            "T R K P I   usa",
            "sAnD west Money",
            "  E Party  R A ",
            "KeyS L A sWiM  ",
            " A   L G K E  F",
            " S   E E I N  L",
            " tAHItI   ItALy"]))

        games.append(GameModel(gameId:8905, maxWidth:17, maxHeight:12, winningScore:764, tags:[],
        winningWords:["FIZZ","OUZO","BOOZE","SHIRAZ","RYE","PORPHYRY","WHISKY","TOKAY","TODDY","RUM","PORT","SPLIT","ASTI","SPIRIT","CRUSH","WATER","ROSE","SCOTCH","WINE","NIP","GROG","SACK","MILK","BAR","COKE","COLA","RED","MEAD","ICE"],
        nonWinningWords:["SLIVOVITZ","STOUT","VOUVRAY","SHERRY","VICHY","BURGUNDY","SHANDY","SQUASH","MUSCAT","VERMOUTH","BUBBLY","MIX","BRANDY","SAUTERNE","GLASS","WHITE","LIQUEUR","STINGER","BOTTLE","LIQUOR","SCHNAPPS","PUNCH","TONIC","BOURBON","TEQUILA","COINTREAU","MANHATTAN","MARTINI","SODA","BORDEAUX","TRAMINER","JULEP","ABSINTHE","SAKI","PILSENER","SPARKLING","VODKA","ELIXIR","MOSELLE","ADVOCAAT","CHAMPERS","REISLING","LEMON","MARSALA","DAIQUIRI","NIGHTCAP","BEAUJOLAIS","MARGARITA","APERITIF","CHIANTI","CURACAO","CHASER","CLARET","SHAKE","DRAMBUIE","GIN","CHOCOLATE","COCKTAIL","EGGNOG","CHABLIS","ALCOHOL","FLIP","HOCK","LIME","LEMONADE","CHAMPAGNE","GRENADINE","COGNAC","CORDIAL","ORANGEADE","LAGER","MADEIRA","MALAGA","CIDER","BEER","HIGHBALL","ALE"],
        winningGame: [
            "RUm wInE A    W",
            "  I A I  sCOtCh",
            "sPlIt pORt  O I",
            "P K E    I  K S",
            "I  GrOG B  sack",
            "R R    PoRPhyry",
            "ice R C O  I U ",
            "todDy oUzO rOsE",
            " K  E L E  A H ",
            "MeAD BaR FIzZ  "]))

        games.append(GameModel(gameId:8906, maxWidth:17, maxHeight:12, winningScore:760, tags:[],
        winningWords:["SYZYGY","OZONE","SKY","ZENITH","ZODIAC","SUN","DAY","SATURN","URANUS","YEAR","STAR","URSA","COSMOS","TITAN","EROS","MOON","TIME","METEOR","COMET","ARIES","CLOUD","LIGHT","PHASE","CRATER","EPOCH","ARC"],
        nonWinningWords:["AZIMUTH","HORIZON","SUNSPOT","TAURUS","ASTRONOMY","GRAVITY","VENUS","MERCURY","SIRIUS","MILKY","PLUTO","GALAXY","TRANSIT","SEASONS","NEWTON","SAGITTARIUS","ENERGY","SUPERNOVA","HYPERION","JANUS","CLUSTER","PEGASUS","PULSAR","UNIVERSE","EQUINOX","QUASAR","CANOPUS","EQUATOR","NEPTUNE","ATOM","MARS","NOVA","JUPITER","TIDES","HALLEY","COLOUR","PHOBOS","ORBIT","CONSTELLATION","WIND","GANYMEDE","ATMOSPHERE","AURORA","EUROPA","HESTIA","PLOUGH","METEORITE","SATELLITE","ASTEROID","ORION","CALLISTO","GIANT","IONOSPHERE","DEIMOS","DONATI","HERMES","ISOBAR","PLANET","EARTH","BLUE","DWARF","SPACE","CORONA","OBERON","PALLAS","DEMETER","DOPPLER","FLARES","NEBULA","POLE","ECLIPSE","CHARON","GEMINI","MIRANDA","NADIR","LEO","KEPLER","ANDROMEDA","HALO","HOLE","LIBRA","GALILEO","CIRCLE","CRAB","BLACK"],
        winningGame: [
            "C    TImE M C P",
            "lIGHt  O  ePoCh",
            "O   I coMEt S A",
            "U sAtUrn  E M S",
            "dAy A A   ozoNe",
            "  zEnItH Eros  ",
            "sKy   E    D  U",
            "T G  arIEs I  R",
            "A yEAr   uRaNUs",
            "R    C   N C  A"]))

        games.append(GameModel(gameId:8907, maxWidth:17, maxHeight:12, winningScore:818, tags:["P","P33","C","C23"],
        winningWords:["PUZZLE","QUARTZ","TOYS","ZIPPER","NUTS","CUT","SAW","SEW","WAX","PLYWOOD","TOOLS","BRUSH","SPIN","WOOL","ART","BOW","NET","SCRAPS","CLOWN","PAINT","RULE","AWL","HAT","WHEELS","DRAW","LATH","ROPE","SHAPE","ROD","JEWEL","EASEL"],
        nonWinningWords:["CUBBY","SCISSORS","CRAYON","STITCH","BOLTS","HOUSE","TWINE","WASHERS","PINS","TUBE","FURNITURE","PASTE","PHOTO","SCREW","WOODWORK","BOX","EMBOSS","SQUARE","PATTERN","WOOD","CUSHION","VARNISH","BILLYCART","TREEHOUSE","KNIT","CYLINDER","MEASURE","COLOUR","SHELLS","SCREWDRIVER","WEAVE","EMBROIDERY","WIRE","CLOTHES","SPANNER","MARIONETTE","POLISH","LOOM","BASKET","PLIERS","MATERIALS","CLOTH","SOLDER","ELASTIC","GLUE","KITE","DOWEL","GAMES","METAL","RUBBER","VENEER","AXLE","BELT","DESK","FELT","VICE","DESIGN","ADHESIVE","THREAD","SHELF","PINE","PLAN","PATIENCE","LEATHER","CHISEL","HAMMER","RIBBON","DECORATE","BALSA","TABLE","GINGHAM","MODEL","PLANE","PENCIL","MACRAME","DOLL","NAIL","BOARD","DRILL","FRAME","HINGE","ENAMEL","KNIFE","CAMERA","CARDBOARD","CALICO","HANDLE","BENCH","BEAR","FABRIC","NEEDLE","CHALK","FILE","CAGE","BLADE"],
        winningGame: [
            "L pAINt A   C  ",
            "A L   O wHeElS ",
            "tOys WoOl A O C",
            "H waX L   sEw U",
            " Bow  sHape nEt",
            "B O  N  rulE   ",
            "rOd QuArtz  S D",
            "U  H T O zIPpEr",
            "sCRaPs P L  I A",
            "H  T  JeWeL N W"]))

        games.append(GameModel(gameId:8908, maxWidth:17, maxHeight:12, winningScore:634, tags:[],
        winningWords:["MORITZ","FREEZE","SNOW","FLURRY","ITALY","WET","PASS","OLYMPICS","FROST","SKIS","RESORT","QUIET","GERMANY","DAVOS","COW","WHITE","GLOVES","ALPS","POWDER","LIFT","LUGE","SLED","COLD","GEAR","ICE"],
        nonWinningWords:["BLIZZARD","TYROL","SWITZERLAND","NORWAY","NIPPY","CRYSTALS","SLUSH","TOWNSEND","KLOSTERS","SAINT","AUSTRIA","JUMP","SLOPES","SNOWDRIFT","QUEUE","MOUNTAIN","HOCKEY","SEASON","KOSCIUSKO","SKITUBE","NUMB","WARM","SHIVER","SAPPORO","SNOWLINE","EQUIPMENT","CHARLOTTES","PERMAFROST","AUSTRALIA","CALGARY","SKATING","CRESTA","SWEDEN","SNOWBALL","SNOWFALL","LEISURE","SCOTLAND","SKILIFT","SLALOM","TROIKA","CHRISTIE","SNOWFIELD","SNOWFLAKE","SMIGGIN","HOLES","TRAIL","JASPER","SKIING","CURLING","CHAMONIX","PERISHER","TOBOGGAN","CHRISTIANIA","DOWNHILL","AXEL","BLUE","RINK","SPEED","THREDBO","SCANDINAVIA","HELSINKI","TELEMARK","HOAR","RIME","GLACIARIUM","BOBSLED","BUFFALO","SLEDGE","CARDRONA","GRENOBLE","AVALANCHE","FINLAND","CHILL","CANADA"],
        winningGame: [
            "COLd pOWDEr IcE",
            "   A A    E  O ",
            "gLOvEs L  sNow ",
            "E  O sKis O L F",
            "aLPs   flUrRy R",
            "R   wHite T M E",
            " L  E T D   P E",
            "QuIEt A  MORiTz",
            " G    L     C E",
            "GeRMANy  FROsT "]))

        games.append(GameModel(gameId:8909, maxWidth:17, maxHeight:12, winningScore:616, tags:[],
        winningWords:["ZINNIA","TANSY","MAY","ALYSSUM","PANSY","POPPY","AZALEA","LOTUS","PEONY","LILY","TULIP","STOCK","CACTUS","ASTER","ROSE","IRIS","LUPIN","OXLIP","MIMOSA","SAGE","BALSAM","NERINE","ALOE"],
        nonWinningWords:["GAZANIA","MYRTLE","WAX","DAISY","NASTURTIUM","CANDYTUFT","CONVOLVULUS","SUNDEW","NARCISSUS","BOUQUET","RANUNCULUS","BUTTERCUP","WATTLE","SNOWDROP","HYACINTH","HONEYSUCKLE","AMARYLLIS","SUNFLOWER","CROCUS","DIANTHUS","WISTARIA","POINSETTIA","VIOLET","STATICE","LARKSPUR","AMARANTHUS","PHLOX","COLEUS","PETUNIA","HIBISCUS","LABURNUM","COREOPSIS","AGAPANTHUS","HOLLYHOCK","PRIMROSE","MIGNONETTE","IMPATIENS","CYCLAMEN","FOXGLOVE","JONQUIL","SALVIA","PRIMULA","EDELWEISS","HYDRANGEA","CASSIA","MARGUERITE","BROOM","VIOLA","CLEMATIS","DIOSMA","GLADIOLUS","CORNFLOWER","SNAPDRAGON","FUCHSIA","PELARGONIUM","IXIA","GERANIUM","PLUMBAGO","CARNATION","GENTIAN","JASMINE","GLOXINIA","VERONICA","PINK","NEMESIA","COLUMBINE","DELPHINIUM","CAMPANULA","PIMPERNEL","VERBENA","LAVENDER","ANEMONE","GODETIA","HEATHER","FREESIA","BIGNONIA","MAGNOLIA","MARIGOLD","ORCHID","CALENDULA","LINARIA","BLUEBELL","OLEANDER","CINERARIA","DANDELION","CANNA","BEGONIA","GERBERA","GARDENIA","CLARKIA","LOBELIA","ERICA","DILL","CAMELLIA","DAFFODIL","LILAC","DAHLIA","ACACIA"],
        winningGame: [
            "   AzAlEa TUlIp",
            "  P I I L   U E",
            "  O N L oXlIp O",
            "M pAnSy E O I N",
            "I P I  B  tanSy",
            "mAy A CaCTus   ",
            "O    I L  stOCK",
            "sAGE rOsE  E   ",
            "A    I A NErINE",
            " ALYSsUm       "]))

        games.append(GameModel(gameId:8910, maxWidth:17, maxHeight:12, winningScore:576, tags:[],
        winningWords:["TYPIST","NAVVY","SURVEYOR","VET","AYAH","NURSE","UNIONIST","SCULPTOR","USHER","WRITER","PORTER","PILOT","VALET","CREW","MONK","TILER","AGENT","VICAR","BREWER","CRITIC","SHEARER","MAID"],
        nonWinningWords:["ENVOY","GRAZIER","GLAZIER","ATTORNEY","COWBOY","EQUERRY","ARTIST","QUARRYMAN","WAITRESS","SECRETARY","SERVANT","POSTMAN","SCIENTIST","DENTIST","AUTHOR","PRIEST","BOTANIST","OSTEOPATH","STATIONER","ACTRESS","STEWARD","SURGEON","INVENTOR","JOCKEY","MATRON","PIANIST","DAIRYMAN","BUTLER","FITTER","WAITER","ARTISAN","AUDITOR","INSPECTOR","ACCOUNTANT","SOLICITOR","PRINTER","UMPIRE","WORKER","APIARIST","MUSICIAN","REPORTER","DOCTOR","DROVER","BARRISTER","FRUITERER","LOCKSMITH","SALESMAN","ACTOR","BOXER","BUTCHER","BISHOP","SAILOR","SINGER","TAILOR","ANNOUNCER","COURIER","FURRIER","PAINTER","PLUMBER","TRAINER","AUCTIONEER","BRICKLAYER","DRIVER","EDITOR","OPTICIAN","GUARD","CARTER","WARDEN","SOLDIER","EXAMINER","ARCHITECT","CARPENTER","MINER","HAWKER","TELLER","FISHERMAN","PUBLICAN","RETAILER","ACROBAT","CATERER","WELDER","GUIDE","BUILDER","MILKMAN","AIRMAN","BROKER","RANGER","JEWELLER","MILLINER","SADDLER","TEACHER","BARMAN","DRAPER","FARMER","RIGGER","FARRIER","FIREMAN","MANAGER","ENGINEER","LIBRARIAN","COMEDIAN","GARDENER","FINANCIER","BANKER","MAGICIAN","HAND","HERD","PAGE","CLERK","BARBER","DANCER","BARMAID","CLEANER","MECHANIC","BAKER","COACH","RABBI","CHEF"],
        winningGame: [
            "     T W mAID  ",
            "sURVEyOr O   A ",
            "C    P I nAvVy ",
            "uNIOnist K A A ",
            "L   usheR  L H ",
            "P pOrter  vet  ",
            "T I S A cRitiC ",
            "O L E R R C L  ",
            "R O   E E aGeNT",
            "  T  BrEwEr R  "]))

        games.append(GameModel(gameId:8911, maxWidth:17, maxHeight:12, winningScore:692, tags:["P","P33","C","C33"],
        winningWords:["ZULU","PRIZE","TUESDAY","POST","MONEY","START","WINS","RUN","TURF","WOTAN","HATS","FILLY","BETS","SILKS","COURSE","CUP","OWNER","COLT","TIME","KIWI","TRAINER","TAB","MALUA","TRACK","GATE","MARE","PLACE","RACE","FIELD"],
        nonWinningWords:["FOXZAMI","STAYER","TAXIS","BAYSTONE","SIRIUS","PUNTERS","RUSSIA","HYPERNO","STEWARDS","JOCKEYS","GAULUS","STATESMAN","RIVETTE","SKIPTON","HORSES","OUTSIDER","COLOURS","COLONUS","QUEUE","SWEEP","SPRINTER","STRAIGHT","NUMBERS","TRIVALVE","ARWON","RUNNER","DALRAY","PATRON","TOPOROA","FAVOURITE","WHIP","LIQUOR","HOLIDAY","PIASTRE","SASANOF","WINNER","FASHIONS","BETTING","TICKET","CROWD","BRAVO","POITREL","CERT","ODDS","STABLE","POSEIDON","RAILS","TRIAL","GRANDSTAND","NOVEMBER","MALVOLIO","SPEARFELT","CLASSIC","MARABOU","DISTANCE","MELBOURNE","FLEMINGTON","FINISH","LENGTH","MEETING","PROGRAMME","CATALOGUE","KENSEI","APPRENTICE","NIGHTMARCH","CARNIVAL","DOUBLE","JUDGE","BACKWOOD","WINDBAG","WODALLA","MACDOUGAL","DELTA","ACRASIA","BITALLI","RIMFIRE","BOOKMAKER","GALLOP","BARRIER","FARRIER","PRICE","RAINBIRD","SADDLE","CHAMPAGNE","ARCHER","BANKER","HIRAJI","GELDING","CARBINE","HANDICAP","CHEER","CARD","LEADER","GALILEE"],
        winningGame: [
            "  P tRAcK K B O",
            "mAlUa  O Time W",
            "A A B RuN wotAn",
            "rAcE G R Wins E",
            "E E Hats   E  R",
            " P F tuesDAy   ",
            "TrAiNer I   cUp",
            " I E  fIlLY O O",
            " zUlU   K   L S",
            " E D    sTARt T"]))

        games.append(GameModel(gameId:8912, maxWidth:17, maxHeight:12, winningScore:678, tags:[],
        winningWords:["RAZOR","TOYS","JOY","BLITZEN","NUTS","YULE","SWEETS","HOLLY","TOOLS","TIES","SOCKS","VASE","SANTA","BOX","TINSEL","WATCH","SEASONING","WINE","WALLET","IRON","TREE","VIDEO","BELT","BELLS","CARD"],
        nonWinningWords:["PARTY","TURKEY","NATIVITY","GUESTS","CUTLERY","PETS","PYJAMAS","SURPRISE","TOASTER","QUILT","PRESENTS","SKATES","FRUIT","VIXEN","TRICYCLE","FAMILY","STREAMERS","INVITATION","EPIPHANY","CHRISTMAS","MISTLETOE","GIFTS","TRADITIONS","FESTIVE","RAISINS","SLIPPERS","JEWELLERY","SING","AMULET","LIGHTS","WREATH","HOLIDAY","STOCKING","RACQUET","BOOKS","PUNCH","TORCH","SHOPPING","NEIGHBOURS","GREETINGS","SURFBOARD","BASKET","SCALES","DECORATIONS","ALMONDS","BICYCLE","HAMPERS","FEASTING","PENDANT","PERFUME","GAMES","PUDDING","GOODWILL","RING","SCARF","CHURCH","DONNER","LOCKET","FRIENDS","LIGHTER","PARCELS","NICHOLAS","FOOTBALL","UMBRELLA","DASHER","SLEIGH","HOME","NOEL","CRACKERS","BROOCH","DINNER","RIBBON","CHOCOLATE","CELEBRATION","DRINK","TABLE","CANDLES","FOOD","CAROL","HAM","HANDKERCHIEFS","REINDEER","CHAMPAGNE","CHILDREN","CHINA","CLOCK","CAMERA","DANCER","BANGLE","CHEER","PEACE"],
        winningGame: [
            "    tIEs  bELLs",
            "vIDEo  wINe   E",
            "A   yULe  L   A",
            "sOCKs  E  tOOLs",
            "E    wAtCh    O",
            "     A S O IrOn",
            "tInSEl   L  A I",
            "R U  L  blITzEn",
            "E T  E Joy  O G",
            "E sANtA X CArD "]))

        games.append(GameModel(gameId:9001, maxWidth:17, maxHeight:12, winningScore:612, tags:[],
        winningWords:["JANTZ","MENZIES","QUAY","STURT","LYONS","FYSH","OXLEY","MURRAY","BOYD","EYRE","SIRIUS","MAWSON","SMITH","BASS","ROBERTS","HUME","CHIFLEY","FISK","FISHER","GOLD","DARK","REID","DOBELL"],
        nonWinningWords:["STUART","STRZELECKI","HEYSEN","WENTWORTH","TURNER","FLOREY","WATTLE","GREENWAY","KELLY","CURTIN","HUNTER","LAWSON","WILLS","BURNET","DAWSON","TASMAN","DRYSDALE","PATERSON","LEWIS","HOLT","SUTHERLAND","SCULLIN","HUGHES","JONES","STEAD","BARTON","MACARTHUR","RUDD","HARTOG","HARGRAVES","DENNIS","PARKES","BURKE","HOVELL","HINDMARSH","BRUCE","GILES","NOLAN","BLACKETT","MACQUARIE","FLINDERS","HARGRAVE","EUREKA","COOK","MITCHELL","GILMORE","FLEET","LALOR","PHILLIP","BLAXLAND","GRAINGER","MONCRIEFF","DAMPIER","HINKLER","LEICHHARDT","GALLIPOLI","GRIFFIN","EMDEN","MACKELLAR","DEAKIN","BLIGH","MELBA","FADDEN"],
        winningGame: [
            "FIsHER L mAWSoN",
            "  I   EyRe   X ",
            "  R    O N GOlD",
            "rEiD JAnTz   E ",
            "O U    S I BOyd",
            "bAss D   E    O",
            "E  T A fIsK Q B",
            "R MuRrAy   HuMe",
            "T  R K S    A L",
            "sMItH ChIFLEy L"]))

        games.append(GameModel(gameId:9002, maxWidth:17, maxHeight:12, winningScore:714, tags:["P","P34"],
        winningWords:["ZEUS","STYX","TROY","AMAZONS","SATYR","ULYSSES","OLYMPUS","MUSES","URANUS","ROMULUS","REMUS","JANUS","JUNO","NEPTUNE","EROS","MARS","MEDUSA","JASON","ERIS","CHAOS","PAN","AENEAS","NIKE","KAMA"],
        nonWinningWords:["ODYSSEUS","TWINS","VENUS","SATURN","MERCURY","PSYCHE","PLUTO","VESTA","TITANS","CALYPSO","CYCLOPS","QUIRINUS","NARCISSUS","ORESTES","PERSEUS","NESTOR","THETIS","CLYTEMNESTRA","POLLUX","SPHINX","HYPERION","PEGASUS","ARGONAUTS","ORPHEUS","MINOS","PROMETHEUS","MINOTAUR","MORPHEUS","PAX","CASTOR","CROCUS","PYGMALION","EURYDICE","JUPITER","ATLAS","FURIES","HYGEIA","ICARUS","VULCAN","ARTEMIS","GORGONS","NEMESIS","OEDIPUS","CENTAUR","EREBUS","FATES","PARIS","SIREN","LUNA","GANYMEDE","HESTIA","ORION","WODEN","PHOENIX","TERPSICHORE","THEBES","POSEIDON","MINERVA","HERCULES","ADONIS","HERMES","PERSEPHONE","ANTIGONE","ATALANTA","CASSANDRA","CUPID","MIDAS","HELIOS","BACCHUS","HARPIES","AJAX","CERES","PRIAM","APHRODITE","LAOCOON","APOLLO","ATHENA","AGAMEMNON","HERO","PANDORA","CHARON","PENELOPE","HADES","ELECTRA","GEMINI","IRENE","ACHILLES","HECATE","ANDROMEDA","GALATEA","GRIFFIN","DAPHNE","BELLONA","QABANIL","ECHO","CHLOE","HELEN","ARIADNE","LEANDER","CIRCE","DIANA","MEDEA","HEBE"],
        winningGame: [
            "aENeAs   J M  E",
            "M  R T   A E  R",
            "A  oLyMPus D  I",
            "zEUs X  romuLus",
            "O      Janus L ",
            "nIkE R  N saTyR",
            "S A NeptuNe  S ",
            "  M  mars S  S ",
            "  A Juno     E ",
            "     S Y CHAOs "]))

        games.append(GameModel(gameId:9003, maxWidth:17, maxHeight:12, winningScore:672, tags:[],
        winningWords:["FITZROY","YASS","SYDNEY","TULLY","AYR","YOUNG","BREEZA","OUYEN","WYEE","HAY","BUNBURY","TEXAS","STAWELL","NOWRA","UKI","EXETER","SCONE","CAIRNS","QUILPIE","AVOCA","LORNE","MOE","NHILL","EDEN","BEGA"],
        nonWinningWords:["ZEEHAN","ELIZABETH","SNUG","ALBURY","TAMWORTH","GYMPIE","PAXTON","QUORN","TOWNSVILLE","WHYALLA","KINGAROY","BRANXTON","DEVONPORT","TOOWOOMBA","ALBANY","MACKAY","LAUNCESTON","LITHGOW","SHEPPARTON","NORTHAM","PERTH","WANGARATTA","NEWCASTLE","NORSEMAN","WARWICK","BOWEN","COWRA","WOLLONGONG","HORSHAM","LISMORE","MORWELL","PENRITH","JINDABYNE","ROCKHAMPTON","GOSFORD","GRAFTON","JUGIONG","WODONGA","QUIRINDI","WARRNAMBOOL","BOURKE","BURNIE","CASINO","DARWIN","HOBART","PARKES","OMEO","MELBOURNE","JUNEE","IVANHOE","MILDURA","KATOOMBA","SALE","DUBBO","TAREE","BROOME","HEXHAM","GERALDTON","FREMANTLE","MAITLAND","RENMARK","COOMA","MOREE","KATHERINE","BRISBANE","ORANGE","BUNDABERG","BALLARAT","BERRI","KALGOORLIE","ECHUCA","BENDIGO","CANBERRA","COLLIE","ARMIDALE","CLARE","ADELAIDE"],
        winningGame: [
            "StAWElL  Q    S",
            " E   O  BuNbURy",
            "ExETEr   I R  D",
            " A   nHILl eDEn",
            " scOne   P E  E",
            "T A O B FiTzRoy",
            "uKi wYeE E A U ",
            "L R R G M H AyR",
            "L N A aVoCa  E ",
            "yAsS    E yOUnG"]))

        games.append(GameModel(gameId:9004, maxWidth:17, maxHeight:12, winningScore:720, tags:[],
        winningWords:["TOPAZ","ZINC","QUARTZ","ONYX","ZIRCON","RUBY","GYPSUM","PORPHYRY","QUARRY","PYRITES","CLAY","PIT","TIN","PEWTER","SILVER","STEEL","JET","IRON","JASPER","RADIUM","TALC","ROCK","OCHRE","REEF","FACE"],
        nonWinningWords:["BRONZE","ZIRCONIUM","AMETHYST","STRONTIUM","MERCURY","ANTIMONY","TUNGSTEN","TURQUOISE","EMERY","ASBESTOS","BERYL","TITANIUM","TUNNEL","URANIUM","BRASS","ORMOLU","SANDSTONE","SPAR","RUTILE","BAUXITE","PLATINUM","SHAFT","SLATE","DEPOSIT","MOLYBDENITE","ALUMINIUM","QUICKSILVER","LIMESTONE","MAGNESIUM","VEIN","FOSSICK","CHROMIUM","EXCAVATE","VANADIUM","BASALT","MAGNESITE","WOLFRAM","FLINT","GARNET","PUMICE","MARCASITE","CHALCEDONY","DOLOMITE","SAPPHIRE","ANTHRACITE","ALUMINA","GRANITE","ORE","COPPER","CADMIUM","LIGNITE","GRAPHITE","COBALT","SHALE","MINE","OPAL","SILICA","AGATE","KAOLIN","DIAMOND","GOLD","DRILL","MARBLE","COAL","LODE","MICA","NICKEL","EMERALD","DIG","DREDGE","JADE","LEAD"],
        winningGame: [
            "jAsPEr G  TOpAz",
            "E I  oNyX   I I",
            "tAlC C P pEWtEr",
            "  V  K S O    C",
            "REef  quArTz  O",
            "  raDIum P iRon",
            "   C  A  H N C ",
            "StEeL rUBy C H ",
            " I    R  R   R ",
            " N CLAy PyRITeS"]))

        games.append(GameModel(gameId:9005, maxWidth:17, maxHeight:12, winningScore:734, tags:[],
        winningWords:["MEZZO","MOZART","BIZET","PINZA","OPUS","TUNE","SCENERY","HAYDN","BASS","CHORUS","DUET","SOLO","SONG","TRIO","BASSO","DUO","TEMPO","TENOR","STAGE","ALTO","BATON","FORTE","RUFFO","JOAN","OBOE","LIND","DANCE"],
        nonWinningWords:["DONIZETTI","STRAUSS","KEY","LARYNX","SEXTET","TRUMPET","FAUST","SOLOIST","HARMONY","QUINTET","QUARTET","OVERTURE","TURANDOT","LOW","MELODY","MUSIC","PATTI","ROSSINI","VOLUME","PAVAROTTI","TOSCA","MASSENET","CARUSO","VOCALIST","SOPRANO","PROMPTER","TANNHAUSER","SING","CONTRALTO","SUTHERLAND","CONDUCTOR","RIGOLETTO","OPERETTA","ORATORIO","GOUNOD","JULIET","TAUBER","COMPOSER","INTERVAL","LIBRETTO","MUSICIAN","COLORATURA","VIOLIN","ORCHESTRA","MINOR","SCORE","THEATRE","SINGER","NORMA","PITCH","ROMEO","MIGNON","WAGNER","VERDI","VOCAL","VOICE","PUCCINI","BARITONE","DIVA","MAJOR","DOMINGO","PRELUDE","CLARINET","BORODIN","LEONORA","NABUCCO","TREBLE","OPERA","CRESCENDO","LOHENGRIN","OBBLIGATO","ENSEMBLE","ELEKTRA","REHEARSAL","SERENADE","CHOIR","BALLET","CARMEN","ENCORE","CHORD","COMIC","GRAND","FIGARO","DRAMA","CHALIAPIN","ARIA","HIGH","GIGLI","LAKME","FANFARE","FINALE","HANDEL","MELBA","PAGLIACCI","AIDA"],
        winningGame: [
            "bAsSO B    T   ",
            "A C   I J RuFFo",
            "S E MEzZo  N  B",
            "sOnG  E A temPo",
            "  E D tEnor O E",
            "  R A    piNzA ",
            "HayDn S duo A L",
            " L  cHoRus  R I",
            "StAGe L E BAtOn",
            " O   FoRtE    D"]))

        games.append(GameModel(gameId:9006, maxWidth:17, maxHeight:12, winningScore:686, tags:[],
        winningWords:["TUNNY","BRONZE","ZANDER","RAY","TROUT","DORY","STINGRAY","NETS","TUNA","EXPORT","SQUID","BASS","BOX","MINNOW","BONITO","SOLE","LAX","MANTA","DART","SAND","SHARK","ROE","SEAL","WHALER","ORCA","LINE","BREAM","EEL"],
        nonWinningWords:["STARGAZER","TURBOT","OCTOPUS","TREVALLY","ANCHOVY","SPRAT","STURGEON","SOCKEYE","TRUMPETER","SMELT","CAVALLY","QUINNAT","WATER","CRAYFISH","SWORDFISH","MULLET","SKATE","LOBSTER","WHITING","JELLYFISH","PORPOISE","POINTER","SALMON","DRUMMER","SNAPPER","WHITEBAIT","CLOWNFISH","DUGONG","SINKER","TAILOR","HALIBUT","JEWFISH","CATFISH","ELVER","FLOAT","GROPER","PUFFER","FLOUNDER","BAIT","HOOK","REMORA","BLOATER","SARDINE","BARRAMUNDI","KINGFISH","GEMFISH","MANATEE","MARLIN","WHALE","MAKO","DOLPHIN","HERRING","TIDDLER","STICKLEBACK","PIRANHA","CARP","LING","BARRACUDA","PERCH","ROACH","PIKE","BRILL","OCEAN","FLATHEAD","PILCHARD","HAMMERHEAD","COD","MACKEREL","PLAICE","HADDOCK","HAKE"],
        winningGame: [
            "sHArK   MINNOw ",
            "O  O EEl     H ",
            "lIne   A D sEaL",
            "E E  bOx O A L ",
            "  T  O  brOnze ",
            "B stInGRay dart",
            "R  R I  S T N U",
            "eXPoRt  sQuId N",
            "A  U O    N E N",
            "mANtA  ORCa rAy"]))

        games.append(GameModel(gameId:9007, maxWidth:17, maxHeight:12, winningScore:626, tags:[],
        winningWords:["JAZZ","ZONES","JULY","TYLER","STOWE","HAYES","TEXAS","QUOTA","LIBERTY","BUSH","UTAH","TWAIN","TAFT","WEBSTER","NIXON","KANSAS","SEQUOIA","HOWE","IOWA","ARKANSAS","ADAMS","OHIO","LEE"],
        nonWinningWords:["ARIZONA","PLYMOUTH","WHITNEY","PERRY","STARS","GETTYSBURG","WYOMING","KENTUCKY","MASSACHUSETTS","CUSTER","STRIPES","MISSOURI","TRUMAN","MISSISSIPPI","VERMONT","WILSON","PENNSYLVANIA","MAYFLOWER","WISCONSIN","FOURTH","FULTON","ROOSEVELT","WRIGHT","LEWIS","KENNEDY","MARYLAND","JOHNSON","MINNESOTA","HOOVER","CONNECTICUT","GRANT","EMERSON","MONTANA","LOUISIANA","EISENHOWER","MADISON","PERSHING","EDISON","PENN","ILLINOIS","EQUAL","CARTER","OREGON","REVERE","JACKSON","GERONIMO","VIRGINIA","POLK","CABOT","EARHART","ROCKWELL","JEFFERSON","REPUBLIC","NEBRASKA","LINCOLN","HAWAII","NEVADA","COLORADO","FORD","ALASKA","BANNER","FRANKLIN","OKLAHOMA","ALAMO","MAINE","CAROLINA","DELAWARE","CLEVELAND","GEORGIA","HARDING","MICHIGAN","CALIFORNIA","REAGAN","FLORIDA","INDIANA","COOLIDGE","LINDBERGH","INDEPENDENCE","CLARK","IDAHO","GARFIELD","ALABAMA","BELL"],
        winningGame: [
            " B tEXAS H UtAH",
            "JuLy     A  A  ",
            " S lIBERty  F  ",
            " H E    weBstER",
            "  ArkANSas E   ",
            "    A   I  Q S ",
            "J   nIXon QuOtA",
            "aDAMs  H L O O ",
            "Z   A  I E iOwA",
            "zONEs HoWe A E "]))

        games.append(GameModel(gameId:9008, maxWidth:17, maxHeight:12, winningScore:592, tags:[],
        winningWords:["SASSY","YAM","CYPRESS","BUTTONS","MYRTLE","EUCALYPTUS","WAX","MYALL","SALTBUSH","GUM","HUON","SIMLAX","HIBISCUS","YACCA","YALBAH","ASH","QUENA","HOOP","HOP","HEATH","CORAL","OAK","COLANE"],
        nonWinningWords:["LOTUS","TUART","SNEEZEWEED","CHORIZEMA","RUSH","FLYTRAP","SUNDEW","PITURI","WATTLE","DRUMSTICKS","SASSAFRAS","SATINWOOD","TURPENTINE","MESSMATE","CYMBIDIUM","BOXWOOD","BOTTLEBRUSH","MAHOGANY","MISTLETOE","RIVERGUM","WAXFLOWER","BOTTLE","TICKBUSH","PANDANUS","CUNJEVOI","SPINIFEX","OONDOROO","SENNA","WARATAH","BLACKBUTT","CASSIA","BANGALAY","CORKWOOD","MANGROVE","QUANDONG","KURRAJONG","DOGROSE","KAURI","MULGA","CLEMATIS","MANUKA","CASUARINA","FUCHSIA","BLOODWOOD","HOVEA","CROWEA","MOONAH","SPEEDWELL","KENTIA","BRIGALOW","BLACKTHORN","ANGOPHORA","BANGALOW","DUCKWEED","UMBRELLA","BORONIA","NALGOO","NONDA","IRONBARK","BANKSIA","GEEBUNG","BAUERA","BAUHINIA","KANOOKA","GREVILLEA","POINCIANA","INDIGO","CORREA","PAPERBARK","FIREWEED","JARRAH","MELALEUCA","BOREE","BALDOO","OLEARIA","COOLABAH","KARALLA","MALLEE","MACADAMIA","CANE","PIGFACE","FIG","CEDAR","FLAG","BAOBAB","GIDGEE","BELAH","HAKEA","ACACIA","CABBAGE"],
        winningGame: [
            " C   hIBIsCUs W",
            "MyRTLe   A  A A",
            " P   A C sIMlAx",
            " R BUtToNs  T  ",
            " E   H R yALbAh",
            "AsH Q yam   U O",
            " S EuCalyPTUs O",
            "  G E C A   hop",
            " HuOn cOlANE A ",
            "  M A A L    K "]))

        games.append(GameModel(gameId:9009, maxWidth:17, maxHeight:12, winningScore:736, tags:[],
        winningWords:["ZIGZAG","ZONE","ZENITH","ESTUARY","WEST","BAY","SOUTH","ISTHMUS","PORTS","ROUTES","STREETS","EAST","TREES","METRES","ATLAS","SOIL","TROPIC","WIND","CITIES","SEA","GULF","ASIA","SPACE","CABLES","AREA","REEF"],
        nonWinningWords:["ZODIAC","COUNTRY","TOWNS","INDUSTRY","HISTORY","TERRITORY","PROMONTORY","STATIONS","STRAIT","SOUND","SWAMP","VALLEY","TRANSPORT","TOPOGRAPHY","BOUNDARY","RAILWAY","MOUNTAINS","CONTOUR","HIGHWAY","CULTURE","HARVEST","TUNNEL","GEOLOGY","COAST","NORTH","WATER","RESOURCES","COMPASS","CURRENT","CROPS","CLAYPAN","ISOBARS","CONTINENT","EXPLORERS","GEOGRAPHY","LIVESTOCK","ENVIRONMENT","TEMPERATURE","LIGHTHOUSE","VEGETATION","LATITUDE","AIRPORT","ORIENT","EXPLORATION","PLANS","RIVER","ROCKS","WORLD","TIME","MONOLITH","EARTHQUAKES","MINOR","ROADS","HEIGHTS","PASSAGE","PLATEAU","LONGITUDE","GRAPHS","ELEVATION","HARBOUR","VOLCANO","ATOLL","INLET","PROJECTION","ANTARCTIC","PRODUCE","WELL","MINERALS","BASIN","CHART","HILLS","INDEX","TRACK","MAP","TIDE","FAUNA","MAJOR","TRADE","ISLAND","HEMISPHERE","BEACONS","ARCTIC","LAGOON","FALLS","CAPRICORN","MINE","RAIN","CLIMATE","GORGE","SCALE","LANDSCAPE","BORE","BORDER","COMMERCE","FLORA","RANGE","RAILROAD","WILDLIFE","GRID","LINE","OCEAN","CHANNEL","DIAGRAM","PARALLEL","DAM","LAND","GLOBE","CANCER","GLACIER","BRIDGE","RELIEF","CANAL","CREEK","FENCE","LAKE"],
        winningGame: [
            "AsIA      PORtS",
            " P  wiND C   R ",
            "CaBLes   I AReA",
            " C  stReEtS  E ",
            "zeNIth S I East",
            "I    mEtRes T R",
            "G  R U U soIl O",
            "zONe sEa  U A P",
            "A  E   rOUtEs I",
            "gULf BAy  H   C"]))

        games.append(GameModel(gameId:9010, maxWidth:17, maxHeight:12, winningScore:722, tags:[],
        winningWords:["JAZZ","CRAZY","MOTLEY","PLAY","SET","SHOW","STAR","TIGHTS","WINGS","EXIT","PIT","SMASH","AUTHOR","CAST","SONG","BOX","HIT","SATIRE","STAGE","DEBUT","GODS","MASK","ACTOR","TRICK","ACT","HERO","DRAMA","MAGIC","BILL","GAG"],
        nonWinningWords:["MYSTERY","EXTRAVAGANZA","VARIETY","FANTASY","FOYER","REPERTORY","SKIT","PARODY","SCENERY","COMPANY","VENTRILOQUIST","PUPPET","STALLS","OVERTURE","TRAGEDY","PLAYER","PROMPT","IMPROMPTU","MUSIC","COMEDY","SPOTLIGHT","ACTRESS","OVATION","QUEUE","REVUE","AUDITORIUM","TINSEL","MINSTREL","BURLESQUE","FOOTLIGHTS","EXOTIC","CURTAIN","GALLERY","SLAPSTICK","PRODUCTION","PROSCENIUM","OPERETTA","CLOWN","AUDITION","LIBRETTO","MUSICIAN","THESPIAN","MUSICAL","REVIVAL","SKETCH","ENTERTAIN","ORCHESTRA","APPLAUSE","PANTOMIME","WAND","CONJURER","ENTERTAINER","INTERLUDE","VAUDEVILLE","PRODUCER","REPERTOIRE","CONCERT","PROGRAM","TABLEAU","FLAT","SCENE","JUGGLER","MATINEE","PAGEANT","PRELUDE","EPILOGUE","SPECTACLE","ACROBAT","FOLLIES","CLAQUE","OPERA","FLOP","MIME","REHEARSE","PERFORMANCE","PREMIERE","ASIDE","MIMIC","BENEFIT","BALLET","ENCORE","MELODRAMA","COMIC","AUDIENCE","BACKDROP","MAGICIAN","CIRCLE","FINALE","PALACE","DANCE","FARCE","GALA","LEAD"],
        winningGame: [
            "gODs  sET T  J ",
            "A  heRo  DrAMa ",
            "G Box N   I  Z ",
            "   wiNgs  cRAzY",
            "HIt T  mask    ",
            "  I    act D   ",
            "MAgIc  staGe  P",
            "  H aUThor bILl",
            "PIt S   R  U  A",
            "  sAtIRE MOtLEy"]))

        games.append(GameModel(gameId:9011, maxWidth:17, maxHeight:12, winningScore:652, tags:[],
        winningWords:["BRAZIL","ORLY","TURKEY","ZIMBABWE","EGYPT","OXYGEN","SAFETY","ITALY","TAXI","VIEW","VISA","RUG","CLASS","PILOT","TRAVEL","WALES","PARIS","TIME","NARITA","TEA","SLEEP","ASIA","FIN","INDIA","MEAL"],
        nonWinningWords:["TOKYO","SWITZERLAND","MAGAZINE","HOSTESS","PASSPORT","ECONOMY","WINGS","MUSIC","QUIET","TOWEL","AUSTRIA","GERMANY","TRIP","BOMBAY","FLYING","STEWARD","QUEUE","VANCOUVER","BUMP","HONOLULU","SLIPSTREAM","ATHENS","HOLIDAY","DISNEYLAND","DESTINATION","AIRPORT","TAHITI","MOVIE","PERTH","HEATHROW","SHOPPING","COMFORT","EUROPE","PILLOW","TICKET","WHEELS","FRANKFURT","SCOTLAND","THEATRE","CREW","LOUNGE","ALTIMETER","DARWIN","HOBART","MEXICO","SINGAPORE","LIFT","ROME","TAIL","MELBOURNE","AGENT","RELAX","LONDON","RUDDER","TARMAC","COCKPIT","MOROCCO","SPEED","ISRAEL","DUNEDIN","ARGENTINA","FLIGHT","HEIGHT","HEADPHONES","BRISBANE","HAWAII","JETLAG","JORDAN","THAILAND","AILERON","LUGGAGE","FOOD","ALASKA","AUCKLAND","JAPAN","KOREA","NEPAL","HANGAR","BANGKOK","HOLLAND","BOARD","BAHRAIN","ENGLAND","FINLAND","IRELAND","BANK","FLAP","LAND","FRANCE","CHICAGO","CABIN","CARIBBEAN","READ","AFRICA","GREECE","BANFF","BALI","CANADA","COFFEE","BAGGAGE","ADELAIDE"],
        winningGame: [
            "InDIA TrAvEL  E",
            " A     U I  M G",
            "BrAzIL G sAFeTy",
            " I I  C  A  A P",
            " tImE L   pIlot",
            " A B taXi A  X ",
            "  WaLes tUrKEy ",
            " F B asIa I  G ",
            "ViEw    L sLEeP",
            " N E ORLy    N "]))

        games.append(GameModel(gameId:9012, maxWidth:17, maxHeight:12, winningScore:634, tags:[],
        winningWords:["TINY","FROSTY","MONEY","YEAR","HAPPY","PAST","HOLLY","FOGGY","FUTURE","TURNER","GHOST","MARLEY","TIM","WINTER","NEW","SILVER","BLESS","POOR","SLEET","SOLE","EVE","GRATE","FIRM","JOE","DREAM","BOB"],
        nonWinningWords:["FEZZIWIG","CITY","SHUTTERS","MERRY","EBENEZER","WANT","BUSINESS","DESTITUTE","QUESTION","CHARITY","SPIRIT","TWELVE","WORKHOUSE","EXECUTOR","PRESENT","CHRISTMAS","MISTLETOE","GREEDY","HUMBUG","TOPPER","MOURNER","CRUTCH","WILKINS","PARLOUR","PHANTOM","SPECTRE","GRINDSTONE","MELANCHOLY","EXTERNAL","PETER","SCRATCH","WILL","QUARREL","SCROOGE","GRUEL","CRATCHIT","MARTHA","NEPHEW","CLOUD","UNCLE","LONDON","PUDDING","FUNERAL","PIGTAIL","GENTLEMEN","LAMPLIGHTER","TREADMILL","CHARLES","DICKENS","DANCES","CORNHILL","IGNORANCE","LINK","CAROL","PENANCE","GOLD","COAL","COLD","CHAIN","CLERK","DILBER","CHILL","EAGER","JACOB","FRED","BELINDA","FIDDLER","CANDLE","OFFICE","BELL","DICK","BELLE","BLEAK","BAH","CAKE"],
        winningGame: [
            "  J GHOsT FOgGy",
            "  O    O N  R E",
            "DReAm SlEet A A",
            "    A  E wiNtEr",
            "fUtUrE  B N E  ",
            "I U L hOlLy  P ",
            "R R E A E   BoB",
            "mOnEy pAst E O ",
            "  E   P siLvEr ",
            " FrOSTy  M E   "]))

        games.append(GameModel(gameId:9101, maxWidth:17, maxHeight:12, winningScore:734, tags:[],
        winningWords:["QUAY","JETTY","SUN","PARTY","STOVE","SPORT","REST","TENT","BUSH","QUIET","FLYING","TENNIS","DUNES","AMUSEMENT","FOREST","FUN","TAN","OARS","SCUBA","HAT","CASUAL","SAND","BAT","RELAX","SLEEP","ROD","SPADE","EASE","REEF"],
        nonWinningWords:["LAZE","MAGAZINE","PLAY","YACHT","SURF","OUTDOORS","COSTUME","RUG","OUTING","JAUNT","TOWEL","INSECTS","TOURING","COAST","FAMILY","SUNSCREEN","GLASSES","BLISTERS","SWIMMING","SURFING","AQUATICS","CRUISE","LOTION","ROWING","TRAVEL","CYCLING","HOLIDAY","PASTIME","MOTORING","WINDSURFING","OUTBOARD","SHELLS","CAVES","ROCKS","SHORE","TRAIN","VACATION","REGATTA","SANDALS","BUCKET","LOUNGE","SKINDIVING","IDLENESS","DRIVING","WALK","EXERCISE","SPEEDBOAT","GAMES","JEANS","DIVING","BOATING","TRAILER","BAIT","FISHING","SAILING","UMBRELLA","BASKING","BATHING","CARAVAN","BOOK","CRICKET","JOG","HEALTH","SAILBOARDING","LINER","WEEKEND","CAMP","RADIO","HIKING","PICNIC","GOLF","BARBECUE","GLIDING","FIRE","GEAR","LOAF","RIDE","CLIMB","CAMERA","BACKPACKING","BREAK","HIKE","PADDLE","BALL","BEACH"],
        winningGame: [
            "  FoREsT C  rOD",
            "   A  P bat E  ",
            "sPOrt aMuseMeNt",
            "L  saNd sun F E",
            "E   N E hat   N",
            "eAsE J   L  FUn",
            "P C reLAX  Q  I",
            " QuIet    DuNEs",
            "  B stOVE  A   ",
            " PaRty   FLyING"]))

        games.append(GameModel(gameId:9102, maxWidth:17, maxHeight:12, winningScore:712, tags:[],
        winningWords:["ZERO","WYSE","ZENITH","SONY","UNISYS","TYPE","MOUSE","WINDOW","DOT","MENU","EPSON","LAPTOP","WANG","SCROLL","TAPE","PITCH","DRIVE","VIDEO","SCREEN","DISC","RAM","SPEED","CANON","DATA","MODE","IBM","NEC","FILE"],
        nonWinningWords:["QWERTY","DAISY","BATTERY","MEMORY","INSTRUMENTS","FUJITSU","TEXAS","FLOPPY","TRANSISTOR","PORT","STORE","XEROX","SAMSUNG","DISPLAY","SWITCH","WORKSTATION","BINARY","MATRIX","NETWORK","TECHNOLOGY","OLIVETTI","SOFTWARE","CURRENT","HEWLETT","MONITOR","BOOT","COMPUTER","MEGABYTE","PROCESSOR","POWER","ROBOT","NASHUA","DESKTOP","DOCUMENT","TRANSFER","AMSTRAD","CONTROL","PRINTER","COLOUR","SHARP","MACINTOSH","KEYBOARD","TOSHIBA","FORMAT","REMOTE","ENTER","PERSONAL","INFORMATION","BROTHER","FAX","ACCESS","PROGRAM","SILICON","PANASONIC","LASER","CALCULATOR","PORTABLE","EDIT","JOIN","COMPAQ","RANDOM","GRAPHICS","COMMODORE","MODEM","COMPATIBLE","ELECTRONIC","DATABASE","HARDWARE","COPIER","RIBBON","RICOH","CATHODE","DIGITAL","INTERFACE","LINK","FACSIMILE","MAINFRAME","APPLE","CHIP","AMIGA","IMAGE","PACKARD","ACER","CODE","JACK","CABLE"],
        winningGame: [
            " P zENItH mOuSE",
            "FiLe   A  E N  ",
            " T R  EpSOn iBM",
            "ScRolL E  U S  ",
            " H  A      wysE",
            "   spEEd  Disc ",
            "  dot  rAm N R ",
            " Canon I O D E ",
            "  type vIdEo E ",
            "  A  C E E wAnG"]))

        games.append(GameModel(gameId:9103, maxWidth:17, maxHeight:12, winningScore:518, tags:[],
        winningWords:["OLYMPUS","VESUVIUS","SNOW","WHITNEY","ROCKY","EVEREST","WHITE","MCKINLEY","ALPS","JUNGFRAU","JURA","URAL","ETNA","CENIS","ANDES","BLUE","WILHELM","COOK","RIGI","CRAG","PEAK","PELEE","HECLA"],
        nonWinningWords:["KAZBEK","CHIMBORAZO","PARNASSUS","PYRENEES","SNOWDON","POLLUX","WOLDS","SLOPES","CAUCASUS","COTSWOLD","FUJIYAMA","MOUNTAIN","RUSHMORE","KOSCIUSKO","GHATS","ROPES","MOURNE","VERNON","QUIRAUK","HIMALAYAS","STROMBOLI","ATLAS","MASSIF","COTOPAXI","QUANTOCK","MATTERHORN","EREBUS","PAMIRS","CHEVIOT","AUVERGNE","ESCARPMENT","PLATEAU","WARNING","LAURENTIAN","POPOCATEPETL","ANNAPURNA","LIVERPOOL","VOLCANO","SINAI","SIERRA","GRAMPIANS","WALL","CATSKILL","ARARAT","ROCKIES","RUAHINE","PALISADES","CAIRNGORM","FLINDERS","KRAKATOA","PENNINE","HEIGHT","CARPATHIAN","BALKANS","MENDIP","BLUFF","SCALE","TABLE","RAINIER","KILIMANJARO","DIVIDE","KILAUEA","RANGE","PINNACLE","SCAFELL","ADIRONDAK","PRECIPICE","CHAIN","CLIMB","EIGER","RIDGE","CASCADE","BLANC","BLACK","CLIFF"],
        winningGame: [
            "S   B V    PEaK",
            "N wIlHeLM A  N ",
            "O H U S   L  D ",
            "wHiTe U C peLeE",
            "  T  EvErEst S ",
            "cEnIS I A  N  R",
            "O E  juNgFrau O",
            "oLyMPus   I R C",
            "K    R    G A K",
            " HECLa MCKiNlEy"]))

        games.append(GameModel(gameId:9104, maxWidth:17, maxHeight:12, winningScore:728, tags:[],
        winningWords:["ZERO","SKY","ZENITH","SUN","WEST","SOUTH","STARS","SEXTANT","WAVES","PORT","SIGNS","AXIS","TROPICS","STEER","BOX","MIDDAY","MOON","PILOT","ORBIT","TIME","FIX","TABLES","EARTH","POLE","LOG","RANGE","LINE","GLOBE","LEE"],
        nonWinningWords:["AZIMUTH","HORIZON","VENUS","VOYAGE","INSTRUMENT","CROSS","GYROSCOPE","ADJUST","EAST","POSITION","NORTH","POINT","WATER","COURSE","COMPASS","CURRENT","EQUATOR","QUARTER","MAPS","SOUNDING","OBSERVATION","NOON","CHARTS","CLOUDS","SHADOW","DESTINATION","LIGHTHOUSE","ALTITUDE","LATITUDE","QUADRANT","MEASURE","RHUMB","NAVIGATOR","WIND","SIGHTING","SATELLITE","LONGITUDE","STARBOARD","CRESCENT","VERTICAL","CHRONOMETER","DRIFT","SIGNAL","MIDNIGHT","LORAN","TRIANGLE","DIRECTION","HEMISPHERE","CELESTIAL","MAGNETIC","GIMBALS","GAUGE","GUIDE","JUDGE","CAPRICORN","GREENWICH","DATA","MARINE","RECKONING","DEGREES","NADIR","RADIO","LANDMARK","MERIDIAN","MIRAGE","FORCE","OCEAN","RADAR","BEARING","READING","ARC","HIGH","ANGLE","BEACON","CANCER","HEADING","NEEDLE","LEAD"],
        winningGame: [
            "pOlE     taBLEs",
            "O I sUN Fix   K",
            "rAnGe  E miDDAy",
            "T E X waVes    ",
            "   StEer       ",
            "P   A stARs LoG",
            "I zEnIth  I  R ",
            "lEe T   B gLObE",
            "O R    MoOn  I ",
            "tRoPICS X sOUtH"]))

        games.append(GameModel(gameId:9105, maxWidth:17, maxHeight:12, winningScore:506, tags:[],
        winningWords:["DYNASTY","ROYALTY","MAJESTY","HENRY","LOUIS","ARTHUR","THRONE","IVAN","RULE","VICTORIA","CORONET","ATTILA","REGENT","MIDAS","EMPEROR","OBERON","LORD","RANI","CABINET","BANNER","COLE"],
        nonWinningWords:["CZARINA","ELIZABETH","COUNTESS","SULTAN","XERXES","CHIVALRY","MARQUIS","WINDSOR","MINOS","CEREMONY","EMPRESS","SOLOMON","TIBERIUS","CROWN","DUCHESS","ROMANOV","CONSTANTINE","STEPHEN","COURTIER","PRINCESS","GOVERNMENT","TUTANKHAMEN","MAGISTRATE","CLAUDIUS","PROTOCOL","SCEPTRE","CANUTE","LUDWIG","SOVEREIGN","WENCESLAS","FOOTMAN","PRESIDENT","DICTATOR","PETER","QUEEN","CORONATION","BEATRIX","CHRISTINA","STANDARD","ALFONSO","GARTER","KNIGHT","JAMES","JEHOSHAPHAT","DUNCAN","ETHELBERT","PARLIAMENT","DUKE","MAJOR","PRIAM","KAISER","NICHOLAS","HAMMURABI","HARDICANUTE","CLEOPATRA","GUARDIAN","MONARCH","JUDGE","CHARLES","KINGDOM","SHERIFF","CAESAR","EDWARD","EMPIRE","CATHERINE","COMMANDER","DAVID","LEOPOLD","PHARAOH","ALEXANDER","KING","ETHELRED","HEROD","CALIGULA","CAROLINE","GEORGE","HAROLD","MIKADO","CHANCELLOR","RICHARD","CHAMBERLAIN","RAJAH","CALIPH","OFFICER","MAHARAJAH","FREDERICK","ALARIC","ALFRED","PALACE","BOADICEA"],
        winningGame: [
            "V  MiDAS  H A  ",
            "I C V   O E T  ",
            "C O A CAbInEt  ",
            "tHrOne  E R I D",
            "O O  M  rOyAlTy",
            "rAnI P  O   A N",
            "I E reGEnT C  A",
            "aRtHur    LoUIs",
            "    loRD   L  T",
            "BANNer  MAJeSTy"]))

        games.append(GameModel(gameId:9106, maxWidth:17, maxHeight:12, winningScore:676, tags:[],
        winningWords:["ZEUS","ZEPHYRUS","SATYR","ULYSSES","OLYMPUS","NYMPHS","SATURN","MERCURY","PLUTO","ISIS","NESTOR","SETH","EROS","MARS","FURIES","JASON","PARIS","ORION","ADONIS","CREON","ABAS","ODIN","IONIA","RHEA"],
        nonWinningWords:["AMAZONS","ABYSRTUS","DIONYSUS","HIPPOLYTUS","URANUS","ROMULUS","PSYCHE","HORUS","TITANS","CYCLOPS","THESEUS","TANTALUS","NARCISSUS","ORESTES","PERSEUS","CLYTEMNESTRA","THOTH","OSIRIS","POLLUX","HORATIUS","PEGASUS","THOR","ORPHEUS","MINOS","PROMETHEUS","MINOTAUR","CASTOR","SPARTA","PYGMALION","NEPTUNE","YGGDRASIL","THULE","ISHTAR","JUPITER","MITHRAS","ATLAS","ANUBIS","ATHENS","GORGONS","NEMESIS","CHARYBDIS","CENTAUR","MEDUSA","TROJAN","ARGOS","GANYMEDE","HYGIEIA","AURORA","EUROPA","THISBE","MENELAUS","WODEN","TELEMACHUS","LAERTES","TERPSICHORE","ARES","HATHOR","CERBERUS","ANTIOPE","MINERVA","ACHELOUS","HERCULES","HECTOR","MARDUK","PERSEPHONE","ATALANTA","ANTIGONE","CASSANDRA","ACHATES","HEIDRUN","CHARIS","APHRODITE","LAVINIA","APOLLO","ASGARD","LETHE","AGAMEMNON","BRUNHILDE","HERO","PANDORA","CHARON","BELLEROPHON","PENELOPE","HADES","ELECTRA","LOKI","SIEGFRIED","NIOBE","ACHILLES","VALHALLA","ANDROMEDA","CLIO","IPHIGENIA","ENLIL","DAPHNE","ORACLE","MIDGARD","DIDO","DELPHI","LEANDER","ALDER","CIRCE","DIANA","MEDIA","BALDER","ALCIMEDE"],
        winningGame: [
            "zEUs    C   N A",
            "E  E  mErCuRy B",
            "pLUtO A E L M A",
            "H  H  R oLyMpUs",
            "Y N Jason S H  ",
            "rHeA D R IsIs P",
            "U S  oDiN E   A",
            "sAtURn O  sATYr",
            "  O  iOnIA    I",
            "FUrIEs     EROs"]))

        games.append(GameModel(gameId:9107, maxWidth:17, maxHeight:12, winningScore:710, tags:[],
        winningWords:["DAZZLE","DUTY","TYRE","NUT","BENZINE","KEY","SAFETY","SPORT","AUTO","VANS","ROYCE","SEATS","ROTOR","HUBS","BOOT","ROLLS","GAS","SPARE","CARS","HORN","ROOF","TAIL","AXLE","BELT","SPEED","ROAD","AIR","LOCK","BRAKE","CARE"],
        nonWinningWords:["LUXURY","SPORTS","STANLEY","BATTERY","CUSTOM","PISTONS","MOTORIST","EXHAUST","SUSPENSION","ROADWAY","SWITCH","MOTOR","TRANSMISSION","BENTLEY","HIGHWAY","TOWING","THROTTLE","DISTRIBUTOR","WINDOW","CYLINDERS","BUGATTI","CHASSIS","ARROW","GLASS","POWER","FLYWHEEL","AUTOMATIC","HYDRAULIC","LIGHTS","NEUTRAL","TURBINE","CARBURETTOR","HORSEPOWER","CYLINDER","VETERAN","PETROL","SPARK","INDUCTION","MOTORCAR","STEERING","VOLTAGE","HUB","CLUTCH","WHEELS","WIRING","INSURANCE","COUPE","DIPSTICK","IGNITION","AUTOMOBILE","STUDEBAKER","LUBRICANT","REPAIRS","ODOMETER","SPEEDOMETER","MANUAL","COMPACT","DRIVING","DOOR","TAILLIGHT","GEARS","LEVER","RADIATOR","DUESENBERG","WINDSHIELD","FUEL","SEDAN","DESIGN","FILTER","GASOLINE","TAILPIPE","HEADLIGHTS","OLDSMOBILE","GAUGE","PARK","TRAFFIC","FORD","ELECTRIC","VEHICLE","ENGINE","RACING","IDLING","PIERCE","DAIMLER","CAM","GEAR","CHOKE","GARAGE","PEDAL"],
        winningGame: [
            "L  G  bELt VANs",
            "O  aXLe  Y    P",
            "cArs  N  rOaD A",
            "K O dAzZLe I  R",
            "  T U I   brAKe",
            "sPort nUT O    ",
            "E royce  horN  ",
            "A  L A  Auto  K",
            "tAIl R   B O  E",
            "S  sPeED sAfETy"]))

        games.append(GameModel(gameId:9108, maxWidth:17, maxHeight:12, winningScore:696, tags:[],
        winningWords:["ZEPHYR","OZONE","DUSTY","GUST","MUGGY","SNOW","EURUS","WET","STORM","CUMULUS","FROSTS","MIST","FOGGY","THAW","HOT","LOW","SMOG","SLEET","TROPIC","METEOR","DULL","CLOUD","HILLS","POLAR","GALE"],
        nonWinningWords:["BLIZZARD","SULTRY","STRATUS","TYPHOON","SOUTHERLY","AUTUMN","VORTEX","WATERSPOUT","HUMIDITY","VELOCITY","STEPPES","SUMMER","MOUNTAINS","CURRENTS","SANDSTORM","DOWNPOUR","NUBILOUS","MONSOON","METEOROLOGY","WAVE","NIMBUS","SHOWER","WINTER","CLOUDBURST","OVERCAST","SIMOOM","TUNDRA","WESTERLIES","CELSIUS","EQUATOR","FRONT","SQUALL","CYCLONE","DROUGHT","MISTRAL","WHIRLWINDS","VELDT","SPRING","ISOBARS","THUNDER","DOLDRUMS","TEMPERATURE","THUNDERBOLT","HAILSTORM","ALTITUDE","LATITUDE","DESERT","TURBULENCE","WIND","HEATWAVE","THERMALS","EVAPORATION","THERMOMETER","TORNADO","ATMOSPHERE","AURORA","HARMATTAN","WEATHER","LONGITUDE","WEATHERVANE","PLAINS","FORECAST","RAINBOW","SIROCCO","HUMID","PAMPERO","THERMAL","WINDMILL","BAROMETER","LIGHTNING","HURRICANE","RAINCLOUD","HEMISPHERE","RAIN","CHINOOK","CLIMATE","CIRRI","FAHRENHEIT","DAMP","DELUGE","CENTIGRADE","FLOOD","MERIDIAN","FOG","AVALANCHE","OCEAN","FOGBANK","RAINFALL","HIGH","GLACIER","HAIL","FIREBALL","CHANGEABLE"],
        winningGame: [
            " C C L H mIsT  ",
            " L U ozoNe M H ",
            " O M wet tRoPiC",
            "EuRuS P  E G L ",
            " D L  H  O   L ",
            "  dusTy frOsTs ",
            " Gust R O  L  S",
            "  L O   gALe  N",
            "POlAr   G  E  O",
            "    mUGGy  tHAw"]))

        games.append(GameModel(gameId:9109, maxWidth:17, maxHeight:12, winningScore:636, tags:[],
        winningWords:["BUZZERS","PAY","KEYS","POST","MAGAZINE","MONEY","BONUS","LIST","PASTE","ANSWER","COPYPAPER","LETTER","TIME","ENTER","SEND","TAPE","ERROR","INDEX","SCREEN","TELLER","ORDER","PAPER","EARN","BANK"],
        nonWinningWords:["TAX","STATIONERY","TYPEWRITER","REPLY","SCISSORS","SALARY","PHOTOCOPY","PHOTOSTAT","SECRETARY","COMPANY","QUARTO","INVESTMENT","STATEMENT","CUSTOMER","DIRECTORY","STOREROOM","FURNITURE","DELIVERY","SUPERANNUATION","COMPUTER","INTERVIEW","PROCESSOR","REPORT","SALES","WAGES","AUDITOR","DEPOSIT","REWRITE","EQUIPMENT","ACCOUNTANT","APPOINTMENT","DOCUMENT","DRAWERS","STOCKTAKING","GOODS","STAFF","INVOICES","KEYBOARD","REMUNERATION","MESSENGER","PORTFOLIO","SWITCHBOARD","JOURNAL","PERSONNEL","NOTEBOOK","MEMORANDUM","PHOTOCOPIER","NOTEPAPER","NOTICE","CORRECT","OPERATE","FLEXITIME","CARPET","MEETING","DIRECTOR","RADIATOR","DESK","FIGURE","RECEIPT","LIGHTING","SCHEDULE","TELEPHONE","AIRCONDITIONER","CREDIT","DOCKET","MARGIN","DEBT","SAFE","CASHIER","CAPITAL","INK","RIBBON","DEBIT","FOLIO","LEASE","CARBON","DIVIDEND","EXCHANGE","FACSIMILE","BROMIDE","MANAGER","MAIL","FOLDER","PARCEL","MACHINE","CHAIR","CLERK","CALENDAR","CHARGE","LEDGER","CARD","OFFICE","DEADLINE","BALANCE","FILE"],
        winningGame: [
            "  M lETtER B B ",
            "  O I  I   U A ",
            "BOnUs  mAGAzInE",
            "  E tApe   Z K ",
            "Keys  A    E  E",
            " A cOPypAper  R",
            " R R   A ansWEr",
            "InDeX  pOst   O",
            "   E   E teLLEr",
            " SEnD OrDer    "]))

        games.append(GameModel(gameId:9110, maxWidth:17, maxHeight:12, winningScore:598, tags:[],
        winningWords:["SQUEEZER","TRAY","FREEZER","SPOONS","STOOL","TRIVET","SIEVES","BOTTLES","SAUCERS","TRAYMOBILE","GLASS","TILES","SHEARS","SINK","GAS","KETTLE","BASKET","SCALES","APRON","TEA","FAN"],
        nonWinningWords:["PANTRY","STOVE","CUTLERY","SCISSORS","TROLLEY","UTENSILS","FRYPAN","TOASTER","WORKTOP","SWITCH","TEASPOONS","COUNTERTOP","SPATULA","WINDOW","CURTAINS","WATER","TEAPOT","TUREEN","EXTRACTOR","POWERPOINT","ROASTER","SHELVES","OVEN","PROCESSOR","ROTISSERIE","ELECTRICITY","KNIVES","TEATOWEL","LIGHTS","STRAINER","EQUIPMENT","DRAWERS","MEASURE","STEAMER","NUTCRACKERS","FORKS","TIMER","HOTPLATE","THERMOMETER","CONTAINERS","CONVECTION","DISHWASHER","TABLESPOON","CORKSCREW","MICROWAVE","CANISTER","MATCHES","SKILLET","SKIMMER","CUPBOARDS","IRON","SAUCEPAN","TERRINE","TENDERISER","FUNNEL","GRATER","CASSEROLE","PERCOLATOR","GADGETS","GASRING","LIDS","CABINETS","RAMEKINS","BASIN","LIGHT","COOKWARE","FLOOR","BLINDS","FILTER","LIGHTER","CUPBOARD","GROCERIES","TELEPHONE","AIRCONDITIONER","REFRIGERATOR","KITCHEN","COOKER","MINCER","TABLE","CLEAVER","GRINDER","MANDOLINE","POACHER","DRAIN","GRILL","BOILER","BARBECUE","COLANDER","LARDER","CLOCK","BLENDER","CEILING","DREDGER","GRIDDLE","BENCH","LADLE"],
        winningGame: [
            "bOTtLES S gLAsS",
            "A  I    H A  P ",
            "sCAlEs  E stOoL",
            "K  E Q  A  R O ",
            "E  sAuCErs I N ",
            "tEa  E  siEvEs ",
            "  P  E T N E   ",
            " FrEEzEr kEtTLE",
            "  O  E A       ",
            "FAn TrAyMOBILE "]))

        games.append(GameModel(gameId:9111, maxWidth:17, maxHeight:12, winningScore:616, tags:[],
        winningWords:["HYDROZOA","PROTOZOA","OYSTER","MUSSELS","SURF","ROSES","PRAWNS","STING","SALT","MOLLUSCS","COAST","DUNES","SHARKS","SHELLS","ROCKS","WEEDS","FINS","WIND","CASTLE","SAND","REEFS","MARINE","LINE"],
        nonWinningWords:["SQUIRTS","TURRET","OCTOPUS","WAVES","SQUIDS","TRITON","TROCHUS","CURRENTS","PISTOL","JELLY","SHRIMPS","TUNICATES","SUNLIGHT","FLATWORMS","SPONGES","POOLS","WATER","CRAYFISH","NATURE","SUNSCREEN","PROTOPLASM","NEPTUNE","TEXTILE","SKELETONS","PRAWN","CHITONS","LETTUCE","LIMPETS","URCHINS","ESTUARINE","CRUSTACEANS","GASTEROPODS","MOON","CLAWS","TIDES","KEYHOLE","LOBSTER","SEAWATER","STROMBID","JELLYFISH","STRAPWEED","UNDERWATER","BIVALVES","LITTORAL","MEDUSA","SPADES","MITRE","SHORE","TENTACLES","CUNJEVOI","SCALLOPS","DUMPER","FRONDS","WHALES","PLANKTON","SEASHORE","SEAWEEDS","RIPPLES","SLIPPER","SNORKEL","WARATAH","BUCKET","PINCERS","SNAIL","TIGER","EELGRASS","COWRIE","FISH","CREVICES","SCAVENGE","SEABIRDS","CLAMS","LARVA","MICROSCOPIC","PLANULA","SOLDIER","ASCIDIANS","LIFESAVER","ASTEROIDEA","BREAKWATER","PIPI","CRABS","WHELK","HELMET","ISLAND","FISHING","SEAWEED","PERIWINKLE","ECHINODERMS","BAITWEED","CUNJEE","BREAKERS","ANEMONE","ANCHOR","RIBBON","BARNACLES","GREENWEED","CLIFFS","BEACHCOMBERS","CORAL","BUBBLE","KELP","OCEAN","BAILER","CRAB","REEF","CARAPACE","PADDLE","CILIA","ALGAE","BEACH"],
        winningGame: [
            "ROsEs  pRAwNs M",
            "  U A  R  I T U",
            "mArInE O  N I S",
            "O F D  T  dUnEs",
            "L  O   O C  G E",
            "L HyDrOzOa R  L",
            "U  S O O sHeLls",
            "sALt cOaSt E I ",
            "C  E K   L fInS",
            "sHArKs WEeDs E "]))

        games.append(GameModel(gameId:9112, maxWidth:17, maxHeight:12, winningScore:552, tags:[],
        winningWords:["TOY","BLITZEN","MARZIPAN","TURKEY","WHISKY","MERRY","TOAST","SWEETS","STAR","HOLLY","PRESENTS","BRANDY","SEASON","TREE","DONNER","PIPER","EGGNOG","CREAM","DANCE","FOOD"],
        nonWinningWords:["NATIVITY","GORGONZOLA","CUSTOMS","GUESTS","WALNUTS","JANUARY","PEANUTS","BISCUITS","CURRANTS","MUSCATELS","FESTIVITIES","CUSTARD","STOCKINGS","STREAMERS","GLASSES","EPIPHANY","HOGMANAY","SINGSONG","CHRISTMAS","MISTLETOE","ORNAMENTS","TINSEL","CASHEWS","FESTIVE","RAISINS","PARTIES","MERRYMAKING","FESTIVAL","PUNCH","FIREWORKS","SEASONING","WENCESLAS","WINE","BONBONS","SCOTLAND","GREETINGS","PANTOMIME","PISTACHIO","BOXING","NOWELL","DECORATIONS","SHEPHERDS","ALMONDS","RIBBONS","SINGING","BUFFET","CAROLS","TINFOIL","GIFT","BALLOONS","PUDDING","GOODWILL","MIDNIGHT","CELEBRATIONS","CARDS","CHURCH","TRIFLE","FRIENDS","NICHOLAS","BAGPIPES","CORDIALS","HAGGIS","SLEIGH","BELLS","CRACKERS","FRANKINCENSE","PRANCER","CANDLES","BETHLEHEM","LEMONADE","REINDEER","CHAMPAGNE","DANCING","ANGEL","DANCER","CALENDAR","CHICKEN","DECEMBER","PEACE","CAKE"],
        winningGame: [
            "CREAm     tOASt",
            "    E  StAr   U",
            " F  R   O E P R",
            " O brANDy E R K",
            "HoLly    S  E E",
            " D I P D wHIsKy",
            "   T I A E  E  ",
            "MARzIpAn eGGnOG",
            "   E E C T  T  ",
            "DONnEr E sEAsON"]))

        games.append(GameModel(gameId:9201, maxWidth:17, maxHeight:12, winningScore:522, tags:[],
        winningWords:["STURT","LIZARDS","OPOSSUMS","CASSOWARY","MACROZAMIA","LILLYPILLY","STATION","BATS","OREILLY","WOMBAT","SWAGMEN","WONGA","IDRIESS","SKINK","IRON","MULGA","EWE","ION","MATILDA"],
        nonWinningWords:["COUNTRY","PLATYPUS","GUMNUTS","EUCALYPTUS","BRUMBY","MOSQUITO","WENTWORTH","SETTLERS","STOCKYARD","SYCAMORE","WATTLE","POTOROO","LAWSON","SCRUB","WILLS","BOTTLEBRUSH","PATERSON","CHRISTMAS","DROUGHT","LASSETER","KIMBERLEYS","BUSHMEN","FLOWERS","STOCKMAN","WATERHOLES","LYREBIRD","HORSE","REPTILES","SPINIFEX","JUMBUCK","DROVER","FERNS","DROVING","OUTBACK","RABBITS","WARATAH","KOOKABURRAS","CASSIA","EXPLORER","PIONEERS","BUSHRANGER","PACKHORSES","KURRAJONG","TEATREE","GEEBUNGS","CALLISTEMON","RANGES","TIMBER","CALLITRIS","CASUARINA","HOMESTEAD","KANGAROOS","WALLAROO","BURKE","JUNGLE","MOPOKE","COCKATOO","OVERLAND","BUDGERIGARS","SHEOAK","TELOPEA","TRACKER","ANGOPHORA","BANDICOOT","WALLABIES","FLINDERS","BORONIA","BULLOCK","CAMELS","LAGOON","BOOMERANG","CAMPDRAFT","TELEGRAPH","IRONBARK","BANKSIA","GOANNA","DINGO","GREVILLEA","DAMPER","BLAXLAND","PADEMELON","PAPERBARK","BANJO","JACKAROO","DOG","BROLGA","INLAND","KIDMAN","SADDLE","MELALEUCA","ABORIGINAL","BERNARD","CROCODILE","COOEE","CICADAS","FLANNEL","PELICAN","BILLABONG","BARK","KOALA","GLIDER","MALLEE","ECHIDNA","CEDAR","ACACIA"],
        winningGame: [
            "E   M IDRiEsS L",
            "wOmBaT   O T  I",
            "E A C  WonGa  L",
            " StUrT  P  T  L",
            "B I O I oREiLLy",
            "A lIzArDs  O  P",
            "T D A O sKInK I",
            "sWaGmEn U     L",
            "    I   M     L",
            "MULGa CAsSOWARy"]))

        games.append(GameModel(gameId:9202, maxWidth:17, maxHeight:12, winningScore:558, tags:[],
        winningWords:["LIZARDS","PUSS","RAPUNZEL","BEAUTY","STRAW","SHUTTLE","GRYPHON","TOWER","SERVANT","TROLLS","THUMB","IMPS","NOSE","SPELLS","GOOSE","WAND","GIANT","DREAMS","DUCK","FROG","HARE","LIE"],
        nonWinningWords:["TRUMPETS","SISTERS","TWOSHOES","COURTYARD","WHITTINGTON","WOODCUTTER","RUMPELSTILTSKIN","COURTIERS","ORPHEUS","STEPMOTHER","TREASURE","DORMOUSE","EURYDICE","WITCH","PIXIES","SLIPPERS","ELVES","KNIGHTS","PUMPKIN","BROTHERS","BROWNIES","PRINCESS","BANQUET","DWARFS","GNOMES","WARLOCKS","MIRROR","SHEPHERDESS","CHRISTIAN","FAIRYLAND","CASTLE","TAILOR","SPELLBOUND","TWEEDLEDUM","ENCHANTMENT","SWINEHERD","DRAGONS","SPELL","NUTCRACKER","CHARMS","GODMOTHER","THUMBELINA","GOBLINS","BANSHEES","GRIMM","EMPEROR","SOLDIER","SPINDLE","HANDSOME","BEANSTALK","EXCALIBUR","ROBIN","GRETEL","HANSEL","MERMAN","ANDERSEN","SLEEPING","SHOEMAKER","HOBGOBLINS","GOODFELLOW","SHEPHERD","SINBAD","DEMON","GOLDILOCKS","LEPRECHAUN","DUCKLING","NIGHTINGALE","FAIRIES","TINKERBELL","DRAGON","PRINCE","CATHERINE","PINOCCHIO","GOLDEN","BLUEBEARD","DONALD","MAIDEN","MAGICIAN","CHANGELING","GINGERBREAD","ARIEL","GENIE","MAGIC","CINDERELLA","COACH","ALADDIN","NEEDLE","PALACE"],
        winningGame: [
            "sHUtTlE GiAnT G",
            "E  H I   M O  O",
            "rAPuNzEL P S  O",
            "V  M A   speLLs",
            "A  B R B  U   E",
            "N T  dReAMs F  ",
            "tRoLls A  sTrAw",
            "  W I DuCK  O A",
            "  E E  T    G N",
            "HArE GRyPHON  D"]))

        games.append(GameModel(gameId:9203, maxWidth:17, maxHeight:12, winningScore:548, tags:[],
        winningWords:["STAY","CUSTODY","WITNESS","WRIT","LAWSUIT","ASSAULT","PENALTY","COURT","FELONY","USHER","FORGERY","GUILT","BRIBERY","LARCENY","LEGACY","LAW","AVER","PROOF","SEAL","JUDGE","PLEA"],
        nonWinningWords:["ASSIZES","EMBEZZLEMENT","TESTIMONY","ONUS","INJURY","ATTORNEY","SUMMONS","PERJURY","SUSPECT","LAWYER","TRESPASS","RESTITUTION","DURESS","INQUEST","ACCESSORY","BURGLARY","HEARSAY","TRESPASSER","STIPENDIARY","PROSECUTOR","CONSPIRACY","SETTLEMENT","ROBBERY","PROSECUTION","ARREST","CORRUPTION","JUSTICE","TREASON","UNLAWFUL","ASSIGNMENT","PETITION","JUDICIARY","IMPRISONMENT","CONVICT","COUNSEL","CONVEYANCING","EXTRADITION","MAGISTRATE","ACQUITTAL","COLLUSION","SOLICITOR","PRISONER","SUBPOENA","FRAUDULENT","JUDGMENT","COMPENSATION","CONFESSION","BARRISTER","VERDICT","PROBATION","ARBITRATION","SENTENCE","INDICTMENT","LITIGATION","MISDEMEANOUR","FORECLOSURE","DETECTIVE","TRIAL","ACTION","CORONER","DISORDER","FORENSIC","REPRIEVE","AWARD","FRAUD","ACCUSED","SLANDER","ORDER","PLAINTIFF","DEFAMATION","PAROLE","DAMAGES","FISCAL","REMAND","CRIMINAL","DEFENDANT","INNOCENCE","CRIME","PENAL","EVIDENCE","POLICE","PREAMBLE","APPEAL","HOMICIDE","OFFENDER","OFFENCE","CHARGE","BENCH","DECREE","DEFENCE"],
        winningGame: [
            "  L P  wITNEsS ",
            "  aVeR R    E  ",
            "  W N  I PlEa  ",
            " AsSaUlt  E L C",
            "  U L A   G   U",
            "Guilt R P A J S",
            " stay C R cOuRt",
            " H W FeLoNy D O",
            " E    N O   G D",
            "BrIBERy fORGeRy"]))

        games.append(GameModel(gameId:9204, maxWidth:17, maxHeight:12, winningScore:674, tags:[],
        winningWords:["HYSON","SPRAY","AMOY","SET","TIPS","URN","SHOOT","TASTE","YEMEN","KENYA","CHESTS","SHRUB","SAUCERS","ASSAM","CEREMONY","CUP","TEAPOT","RITUAL","BREW","TEA","ANHWEI","ASIA","BEANS","MOCHA","PEKOE","NICE","ICED"],
        nonWinningWords:["TANZANIA","TWANKAY","HUSKS","BRAZILIAN","POUR","VACUUM","INSTANT","ROBUSTA","TURKISH","BOSTON","BISCUITS","ESPRESSO","CEYLON","TEASPOONS","ASTRINGENCY","SUGAR","STIMULATING","GROUNDS","TROPICS","WATER","CHICORY","NYASALAND","ROASTING","SOUCHONG","EXTRACTION","STRAINER","CULTIVATED","COLOUR","LUSHAI","SAUCER","TANNIN","PLANTATION","GRANULES","PAKISTAN","STEEPING","FORMOSA","KETTLE","POWDER","CANISTER","MANIPURI","IRISH","FILTRATION","SANDWICHES","INFUSED","VOLATILE","AFTERNOON","OOLONG","PERCOLATOR","TROPICAL","LIQUID","JASMINE","JAVA","CONGO","FILTER","ETHIOPIA","POWDERED","INDONESIA","CAPPUCCINO","DECOCTION","EVERGREEN","CAUCASIA","CHERRIES","UGANDA","AROMA","FERMENTED","CHINESE","BREWED","GRINDING","THAILAND","CAKES","DRINK","MILK","IMPERIAL","BOILING","GREEN","MADAGASCAR","BEVERAGE","COLOMBIA","INDIAN","INDOCHINA","CREAM","CADDIES","PINHEAD","BLENDING","BRICK","CHINA","INDIA","AMERICA","DARJEELING","CAMBODIA","CHEKIANG","DECAFFEINATED","BOHEA","AREA","CAMELLIA","AFRICA","ARABIA","ARABICA","COFFEE","CAFFEINE","BLACK"],
        winningGame: [
            "N tAsTE KENyA C",
            "I I H      E  E",
            "cUp rituaL M  R",
            "E sAucers PeKOe",
            "    beans  N  M",
            "S M  D  A H   O",
            "H O    amOy B N",
            "O cHEsTs  sPrAy",
            "O H  E I  O E  ",
            "tEaPOt A AnHwEI"]))

        games.append(GameModel(gameId:9205, maxWidth:17, maxHeight:12, winningScore:506, tags:[],
        winningWords:[
            "MIDAS", "CABINET", "THRONE", "ROYALTY", "RANI", "REGENT", "ARTHUR", "LOUIS", "LORD", "BANNER",
            "MAJESTY", "VICTORIA", "CORONET", "IVAN", "RULE", "EMPEROR", "OBERON", "HENRY", "COLE", "ATTILA",
            "DYNASTY"],
        nonWinningWords:["CZARINA", "ELIZABETH", "COUNTESS", "SULTAN", "XERXES", "CHIVALRY", "MARQUIS", "WINDSOR", "MINOS", "CEREMONY", "EMPRESS", "SOLOMON", "TIBERIUS", "CROWN", "DUCHESS", "ROMANOV", "CONSTANTINE", "STEPHEN", "COURTIER", "PRINCESS", "GOVERNMENT", "TUTANKHAMEN", "MAGISTRATE", "CLAUDIUS", "PROTOCOL", "SCEPTRE", "CANUTE", "LUDWIG", "SOVEREIGN", "WENCESLAS", "FOOTMAN", "PRESIDENT", "PETER", "QUEEN", "CORONATION", "BEATRIX", "CHRISTINA", "STANDARD", "ALFONSO", "GARTER", "KNIGHT", "JAMES", "JEHOSHAPHAT", "DUNCAN", "ETHELBERT", "PARLIAMENT", "HARDINCANUTE", "DUKE", "MAJOR", "PRIAM", "KAISER", "DICATOR", "NICHOLAS", "HAMMURABI", "CLEOPATRA", "GUARDIAN", "MONARCH", "JUDGE", "CHARLES", "KINGDOM", "SHERIFF", "CAESAR", "EDWARD", "EMPIRE", "CATHERINE", "COMMANDER", "DAVID", "LEOPOLD", "PHARAOH", "ALEXANDER", "KING", "ETHELRED", "HEROD", "CALIGULA", "CAROLINE", "GEORGE", "HAROLD", "MIKADO", "CHANCELLOR", "RICHARD", "CHAMBERLAIN", "RAJAH", "CALIPH", "OFFICER", "MAHARAJAH", "FREDERICK", "ALARIC", "ALFRED", "PALACE", "BOADICEA"],
        winningGame: [
            "V  MiDAS  H A  ",
            "I C V   O E T  ",
            "C O A CAbInEt  ",
            "tHrOne  E R I D",
            "O O  M  rOyAlTy",
            "rAnI P  O   A N",
            "I E reGEnT C  A",
            "aRtHur    LoUIs",
            "    loRD   L  T",
            "BANNer  MAJeSTy"]))

        games.append(GameModel(gameId:9206, maxWidth:17, maxHeight:12, winningScore:590, tags:[],
        winningWords:["ECZEMA","LOZENGE","EYES","VIRUS","OXYGEN","BODY","ANATOMY","EMBRYO","NURSE","PULSE","REMEDY","THOMAS","BURNET","SALVE","CLOT","CURE","DOSE","SALK","PAIN","BONE","IODINE","COLD","GALEN","REID","AIL"],
        nonWinningWords:["SCHIZOID","MURRAY","INFLUENZA","LARYNX","NOSTRUM","HYSTERICS","HARVEY","SYRINGE","MYOPIA","DYSLEXIA","FLOREY","SPLINT","NEURITIS","DRUGS","HUNTER","STETHOSCOPE","PHYSICIAN","SURGEON","INSULIN","COMPRESS","LISTER","SULPHA","ASTHMA","ABSCESS","ALLERGY","HYGIENE","PATIENT","RADIOLOGY","STERILISE","ANTISEPTIC","HOSPITAL","ACUTE","GERMS","PARACELSUS","CAUTERISE","POULTICE","ANAESTHETICS","GASTRIC","CRAMPS","DOCTOR","TENDON","ANTIDOTE","ASPIRIN","MEASLES","DIAGNOSIS","OPERATION","HIPPOCRATES","ATAXIA","TABLET","FRACTURE","LIGATURE","INOCULATE","FORMULA","COUGH","OPIATE","RADIUM","ANTIBIOTIC","FORCEPS","HEART","ULCER","PEDIATRICS","ELIXIR","DISEASE","LUMBAGO","APPENDIX","AMNESIA","DELIRIUM","INFECTION","VACCINATE","CHLOROFORM","DIABETES","INVALID","NEURALGIA","METCHNIKOFF","SCALPEL","JENNER","AMBULANCE","JAUNDICE","CARTILAGE","BROMIDE","MICROBE","PENICILLIN","KOCH","ADRENALIN","CHOLERA","MALARIA","CLINIC","MACLEOD","EPIDEMIC","MEDICINE","BANDAGE","EARACHE","HEAL"],
        winningGame: [
            "    A sALK BoNe",
            "GALEn A   D X M",
            "    aIl  boDy B",
            " ClOt vIRus G R",
            "R O O E  reMeDy",
            "eCzEmA P N  N O",
            "I E Y CuRe C P ",
            "D N    L tHoMaS",
            "  G NURsE  L I ",
            "EYeS   E IOdInE"]))

        games.append(GameModel(gameId:9207, maxWidth:17, maxHeight:12, winningScore:518, tags:[],
        winningWords:["TOKYO","TROPHY","SPORT","CYCLIST","ROYCROFT","MOSCOW","SCULLS","OLYMPIC","DISCUS","SOLO","WINTER","MEDLEY","TEAMMATES","TORCH","OATH","TEAM","ROME","SOCCER","TABLE"],
        nonWinningWords:["BRONZE","SWITZERLAND","BUTTERFLY","GYMNASTICS","CZECHOSLOVAKIA","SUMMER","FREESTYLE","HEAVYWEIGHT","WRESTLER","YACHTING","SWIMMER","AMATEURS","CEREMONY","SPRINTER","COMPETITORS","HOCKEY","ARMSTRONG","RUNNER","SILVER","BREASTSTROKE","ARCHERY","CUTHBERT","EQUESTRIAN","ATHENS","ROWING","EMOTIVE","VOLLEYBALL","STOCKHOLM","ATHLETES","SKATING","PARIS","PENTATHLON","HURDLES","EUROPE","BOXER","CONTENDERS","HEPTATHLON","AMSTERDAM","LIGHTWEIGHT","MUNICH","SLALOM","MARATHON","MONTREAL","KONRADS","WEIGHTLIFTER","GOULD","TRAINING","SKIING","CHAMPIONS","STRICKLAND","CHARLTON","MEDALLIST","MELBOURNE","GAMES","TRACK","BACKSTROKE","SPRINGBOARD","DIVING","FRASER","LONDON","JACKSON","DOWNHILL","CONTENDER","AWARD","FIGHT","LAUREL","BIATHLON","ALBERTVILLE","SAMARANCH","HELSINKI","JAVELIN","CHAMPION","BASKETBALL","HAMMER","DECATHLON","BOBSLED","RECORD","CANOEING","BERLIN","MOCKRIDGE","GOLD","EXCELLENCE","FENCING","BARCELONA","PEARCE","COACH","FLAME","MEDAL","HANDBALL","GREECE","ACCOLADE"],
        winningGame: [
            "       D sCULLs",
            "tABLE  I P    O",
            "E    mOsCoW R L",
            "A RoMe C R  O O",
            "M  L D U toKyO ",
            "M CyClIst A C  ",
            "A  M E  E tOrCH",
            "tROpHy  A H O  ",
            "E  I    M   F  ",
            "sOCcER   WINtER"]))

        games.append(GameModel(gameId:9208, maxWidth:17, maxHeight:12, winningScore:532, tags:[],
        winningWords:["TETRAZZINI","INTERMEZZO","BIZET","TUTU","DONIZETTI","DUETS","CHORUS","TRIO","VALOIS","ULANOVA","OPERETTA","LIBRETTO","THEATRE","SINGER","MANON","BORODIN","CARMEN","ARIA"],
        nonWinningWords:["STRAUSS","DEBUSSY","NUREYEV","STANISLAVSKY","FONTEYN","FAUST","SCENERY","NIJINSKY","TCHAIKOVSKY","SYLPHIDES","COSTUME","QUARTET","OVERTURE","TOUMANOVA","DUET","PIROUETTE","ORPHEUS","MASSENET","CARUSO","SOPRANO","TANNHAUSER","BRITTEN","CURTAIN","MASSINE","PAVLOVA","CONTRALTO","PROSCENIUM","SUTHERLAND","RIGOLETTO","DANSEUR","GOUNOD","METROPOLITAN","CHOREOGRAPHY","ORCHESTRA","PASTORALE","APPLAUSE","TERPSICHORE","PETROUCHKA","IMPRESARIO","MIGNON","WAGNER","BEETHOVEN","ENTRECHAT","OTHELLO","GREASEPAINT","ARABESQUE","PUCCINI","BARITONE","HARLEQUIN","PROGRAMME","JETE","GLUCK","LEOTARD","SHEARER","ENTRANCE","FLAGSTAD","CHARPENTIER","FALSTAFF","MASCAGNI","OPERA","LOHENGRIN","HELPMANN","REHEARSE","BALLETOMANE","PERFORMANCE","SERENADE","GISELLE","BALLET","CALLAS","SIEGFRIED","GRECO","AUDIENCE","COPPELIA","BARCAROLLE","FIREBIRD","BALLERINA","BALANCHINE","FIDELIO","ADAGIO","MELBA","FAME","AIDA"],
        winningGame: [
            "CARmEN LiBREtTo",
            "   A  A N   E P",
            " SInGEr tHEAtRe",
            "D  O  I E   R R",
            "uLAnOva R   A E",
            "E    A  M BIzEt",
            "tUtU L  E   Z T",
            "S R DoNIzETTi A",
            "  I  I  Z   N  ",
            "CHoRUs BoRODiN "]))

        games.append(GameModel(gameId:9209, maxWidth:17, maxHeight:12, winningScore:608, tags:["P","P33","C","C43"],
        winningWords:["SMUTS","TNT","YPRES","ARMY","TURRET","ENEMY","FORAY","FORTIFY","MONS","ONSET","DIVISIONS","FORT","CORPS","ARMOUR","SLIM","ALLENBY","UNIFORM","PATROL","ACTION","BREN","ALAMO","RIFLE","MEDAL"],
        nonWinningWords:["DUTY","SCHWARZKOPF","BADAJOZ","ZEEBRUGGE","BLITZKRIEG","BAYONETS","ASSAULT","MONTGOMERY","INFANTRY","TRANSPORT","MILITARY","COMPANY","PATTON","MORTARS","SALVO","TANKS","SORTIE","TOBRUK","ARTILLERY","BULLETS","SQUADRON","SOMME","LUCKNOW","TACTICS","TROOPER","PRIVATE","EQUIPMENT","LIEUTENANT","PLATOON","GUNNER","AGINCOURT","SAPPER","GUARDSMAN","SERGEANT","BOMBS","BATTLE","CHOPPERS","FUSILIER","EISENHOWER","BATTALION","SHERMAN","PERSHING","DRIVER","TRENCH","PARACHUTE","DUNKIRK","CROMWELL","REGIMENT","FORCES","ROMMEL","SOLDIER","NCO","MAJOR","CANNON","ARSENAL","CAPTAIN","CORPORAL","NAPOLEON","ENGINEERS","SCRIMMAGE","HELICOPTER","CULLODEN","FIGHTER","GLIDERS","CLIVE","SIEGE","KITCHENER","FLANDERS","GRENADES","CATERPILLAR","COMMAND","COMMANDER","COLONEL","ALEXANDER","CAMPAIGN","RIFLEMAN","GALLIPOLI","LENINGRAD","GENERAL","HANNIBAL","MAFEKING","FLODDEN","OFFICER","BRIGADIER","KHAKI","BRIGADE","DEFENCE"],
        winningGame: [
            "FORt R F  ARMy ",
            "   uNiFoRM   P ",
            "   R F R   F R ",
            "PaTrol aLamo E ",
            " R enemy corPs ",
            "SmUts E  tnt   ",
            " O  E dIVisiONs",
            " U  T A  O F  L",
            "BrEN AlLEnBy  I",
            "              M"]))

        games.append(GameModel(gameId:9210, maxWidth:17, maxHeight:12, winningScore:626, tags:[],
        winningWords:["FIZZY","DRY","SHERRY","TOAST","VAT","VAULT","MANZANILLA","SWEET","TASTE","PORT","PRESS","ASTI","NEGUS","BRANDY","STILL","MULL","SPAIN","WINE","SEC","DREGS","DRINK","RHINE","MARC","FRANCE","CELLAR"],
        nonWinningWords:["PARTY","DIONYSUS","WHISKY","TOKAY","WINERY","ITALY","BURGUNDY","HUNGARY","MUSCAT","VERMOUTH","BOUQUET","PORTUGUESE","ENOLOGY","VINEYARD","CRUSH","SUGAR","GERMANY","FESTIVITIES","DESSERT","EXTRACT","VINTNER","SAUTERNE","CURRANT","GLASSES","OLOROSO","WHITE","AMOROSO","COWSLIP","LIQUEUR","PORTUGAL","BOTTLE","SCOTCH","RETSINA","VINCENT","CRUSHING","BANQUET","PRESSED","MAGNUM","CUVEE","CHARDONNAY","BOURBON","VINTAGE","BOTTLED","BORDEAUX","ELDERBERRY","GRAPES","CALVADOS","SPARKLING","BACCHUS","MOSELLE","REISLING","HUNGARIAN","GOBLET","BARRELS","MARSALA","RHUBARB","BEAUJOLAIS","AMONTILLADO","AMPHORA","CHIANTI","ITALIAN","CLARET","AROMA","JUICE","FERMENTED","FINO","DRAMBUIE","SICILIAN","COOLER","FORTIFIED","CELEBRATION","JEROBOAM","ARGOL","TABLE","GINGER","CHABLIS","LIEBFRAUMILCH","BEVERAGE","FLAGON","ALCOHOL","ARMAGNAC","DECANTED","CHAMPAGNE","DANDELION","MEDOC","CALIFORNIA","GREEK","MADEIRA","MALAGA","PLEDGE","BODEGA","CARAFE","AGED"],
        winningGame: [
            "pRESs fRANcE  M",
            "O   P I   E   A",
            "R  MaNzANIlLa R",
            "T D I Z   L sEc",
            " BrAnDy tOast  ",
            "S I     A rhinE",
            "wInE  M S  E E ",
            "E K vAuLt DrEgS",
            "E   A L E  R U ",
            "T  StIlL DRy S "]))

        games.append(GameModel(gameId:9211, maxWidth:17, maxHeight:12, winningScore:602, tags:[],
        winningWords:["SPITZ","SPHYNX","SCHNAUZER","SKYE","MACAVITY","ASTA","CATS","CROFTS","MANX","FLUSH","CLAWS","SALUKI","KORAT","CHOW","DOGS","LASSIE","BOXER","WHINE","COON","SPANIEL","FELIS","NANA","HAIR","LAIKA"],
        nonWinningWords:["BORZOI","HUSKY","PUPPY","TABBY","LOYAL","SETTER","SAMOYED","MONTMORENCY","TURKISH","LITTERS","ABYSSINIAN","CYMRIC","GREYHOUND","BASSET","PYRENIAN","PUPPIES","OTTERHOUND","SEALYHAM","ROTTWEILER","KITTEN","TORTOISESHELL","WHIPPET","BURMESE","POINTER","ARGOS","HOUND","MIAOW","THOMASINA","TONKINESE","WOLFHOUND","CARNIVORES","HIMALAYAN","RETRIEVER","SPRINGER","MALTESE","MASTIFF","SIAMESE","ESKIMO","SOMALI","CERBERUS","PERSIAN","TERRIER","ALSATIAN","MOGGIES","GUARD","DACHSHUND","BLOODHOUND","CHIHUAHUA","WEIMARANER","BEDLINGTON","POMERANIAN","SCHIPPERKE","KEESHOND","PAPILLON","PEKINESE","SHEEPDOG","BULLDOG","GUIDE","BASENJI","ANGORA","BIRMAN","POODLE","DALMATIAN","CHESHIRE","AFFENPINSCHER","CORGI","DINGO","GRIFFON","HARRIER","BALINESE","DOBERMAN","MEHITABEL","CAIRN","FIGARO","KENNEL","PARIAH","LABRADOR","CAMEO","BRIARD","CANINE","BARK","DHOLE","COLLIE","KELPIE","ARCHANGEL","CHINCHILLA","PEDIGREED","AFGHAN","FELINE","HEELER","DANE","RIDGEBACK","AIREDALE","CANIDAE","FELIDAE"],
        winningGame: [
            "  S     cHOw   ",
            "CLaWs C A  hAIR",
            "  L cRoFts I   ",
            "fLuSh O spAnIEl",
            "E K nAna H E  A",
            "lAiKa  sKyE K S",
            "I   U  T N DoGs",
            "sPITz MaNx  R I",
            "    E       A E",
            "BOXEr MACAVItY "]))

        games.append(GameModel(gameId:9212, maxWidth:17, maxHeight:12, winningScore:576, tags:[],
        winningWords:["BLIZZARD","BREEZE","NORWAY","SNOW","SCOTT","MOSSES","FURS","TENT","WALRUS","SOMERSET","OWL","NUNATAKS","KAYAK","FOX","ESKIMOS","ATLAS","DOGS","NANSEN","NOME","BASE","ERMINE","BEAR","ICE"],
        nonWinningWords:["HUTS","SOUTH","THURSTON","MACKENZIE","LIVERWORTS","MAWSON","SNOWDRIFTS","TRACTORS","METEOROLOGY","HUDSON","ASTROFIXES","CREVASSES","NORTH","OATES","TUNDRA","PENGUINS","VESTFOLD","DAVIS","SEALS","PETRELS","SORSDAL","VIKINGS","TEMPERATURE","SPITSBERGEN","WILDERNESS","AMUNDSEN","BARENTS","SWEDEN","LAPPS","CRAMPONS","THERMOMETER","AURORA","BARROW","IGLOOS","WHALES","GEOLOGIST","WEATHER","EXPLORER","EXPEDITION","CHRONOMETER","FJORDS","LARSEN","ANTARCTIC","ROOKERIES","SHACKLETON","THEODOLITE","BELUGAS","BALLOONS","BANKS","FLOES","NARWHAL","BAROMETER","POLAR","CARIBOU","HURRICANE","MACQUARIE","LICHENS","ARCTIC","POLE","AIRCRAFT","CLIMATE","LEMMING","SIBERIA","ANORAK","ELLESMERE","GLACIERS","PEMMICAN","FAHRENHEIT","BLUBBER","CREVICE","CAMP","ALASKA","DIESEL","SLEDGE","FRANKLIN","ICEBERGS","RADIO","WILDLIFE","AMPHIBIAN","LABRADOR","REINDEER","GREENLAND","FINLAND","CIRCLE","HEARD","BAFFIN","CANADA","ADELIE"],
        winningGame: [
            "nANsEN   bAsE I",
            "U  C  BeAr O  C",
            "N NoME S eRmINe",
            "A  T   K E E   ",
            "tEnt BLiZzArD M",
            "A O O  M E S  O",
            "K R W foX  E  S",
            "S wAlRus  AtLAs",
            "  A   R       E",
            "KAyAK sNOW DOGs"]))

        games.append(GameModel(gameId:9301, maxWidth:17, maxHeight:12, winningScore:636, tags:[],
        winningWords:["SALZBURG","BRAZIL","YORK","EGYPT","NORWAY","CUSTOMS","ITALY","BUS","TAX","YACHT","VOYAGE","BOSTON","TRIP","TICKETS","ATHENS","SHIP","JET","BOAT","GIFT","ASIA","VENICE","CAR","CHINA","BALI","CAB"],
        nonWinningWords:["ARIZONA","TOKYO","SWITZERLAND","ZIMBABWE","GETTYSBURG","JOURNEY","YELLOWSTONE","FERRY","PASSPORT","TRANSPORT","BOSPHORUS","YORKSHIRE","VISA","DONKEY","ITINERARY","GERMANY","BROADWAY","HOLIDAYS","OVERSEAS","STREAMERS","HONOLULU","MOTORBOAT","STEAMSHIP","PORTUGAL","HOUSEBOAT","CRUISE","TRAVEL","TRAWLER","BUDAPEST","STEAMER","PARIS","SPAIN","TRAIN","SNOWMOBILE","EUROPE","MANHATTAN","SCOTLAND","DEVON","DEPARTURE","ETNA","SCHOONER","HOVERCRAFT","RIVERCRAFT","MEXICO","SINGAPORE","CORNWALL","PHILIPPINES","LONDON","BRITAIN","WINDJAMMER","ANDES","DUBLIN","LAUNCH","INDONESIA","HELICOPTER","CARAVAN","FLIGHT","CATAMARAN","GREENWICH","AIRCRAFT","THAILAND","LINER","BALLOON","GONDOLA","LUGGAGE","DJAKARTA","FAREWELL","AEROPLANE","KOREA","PADDLEBOAT","COCKLESHELL","BERLIN","MANILA","AMPHIBIAN","AIRLINE","BANGKOK","HOLLAND","NILE","FLORENCE","CANOE","CALIFORNIA","ENGLAND","FINLAND","FLORIDA","IRELAND","NIAGARA","IDAHO","INDIA","FRANCE","AMERICA","AFRICA","GREECE","CANADA"],
        winningGame: [
            "vEnICE B  ItALy",
            "O O   CaR  R  A",
            "yOrK   L sHiP C",
            "A W  CHiNa P  H",
            "G A A    L  JEt",
            "eGyPt bRAzIL   ",
            "    H U  B  B A",
            "tIcKeTs CuSToMs",
            "A A N    R  A I",
            "X bOsTON gIFt A"]))

        games.append(GameModel(gameId:9302, maxWidth:17, maxHeight:12, winningScore:524, tags:[],
        winningWords:["KUNZITE","ONYX","RUBY","AMAZONITE","AMETHYST","BEAUTY","RARITY","PYROPE","TRINKETS","CROWN","WATCH","GARNET","CARAT","LOCKET","COIN","AGATE","BUCKLE","CORAL","FIRE"],
        nonWinningWords:["IVORY","SARDONYX","CRYSTAL","STONES","TURQUOISE","TORQUE","BERYL","CLUSTER","MOONSTONE","SNUFFBOX","TREASURE","CORUNDUM","SILVER","TRINKET","PLATINUM","JEWELLERY","AVENTURINE","CHRISOBERYL","AMULET","PRECIOUS","COLOUR","RHINESTONE","TOURMALINE","CORONET","BLOODSTONE","SERPENTINE","OPAQUE","POLISH","TRANSLUCENCE","SOLITAIRE","HATPIN","SPINEL","PERIDOT","AIGRETTE","CHARMS","JASPER","PEARLS","MARCASITE","MORGANITE","SINHALITE","CHALCEDONY","OLIVINE","PENDANT","EARRINGS","MINERALS","NEPHRITE","SAPPHIRE","CUFFLINKS","PAILLETTE","CLASP","TIARA","COLLARS","FASHION","DIAMONDS","ANKLET","ALABASTER","AQUAMARINE","DECORATION","ALEXANDRITE","BRILLIANT","CAIRNGORM","OPAL","EMERALDS","HAIRPIN","BROOCH","SCARAB","LABRADORITE","DURABLE","CARBUNCLE","OPALESCENCE","COMB","MALACHITE","BEADS","BRACELET","GEM","CHOKER","GOLD","ALMANDINE","CARNELIAN","AMBER","CAMEO","CHAIN","FILIGREE","BANGLE","DIADEM","NECKLACE","JADE"],
        winningGame: [
            "CoRAL      F   ",
            " N   B A A I   ",
            "PyROPe M gArNEt",
            " X   A A A E  R",
            "  C KuNzItE L I",
            "C A  T O E CoIn",
            "rArITy N  R C K",
            "O A    I BuCkLe",
            "wAtCH  T  B E T",
            "N    AMeTHySt S"]))

        games.append(GameModel(gameId:9303, maxWidth:17, maxHeight:12, winningScore:654, tags:[],
        winningWords:["BUY","PROXY","PAY","SOU","ANNUITY","SECURITY","PENNY","SALARY","BONUS","NOTES","QUOTE","POUNDS","YIELD","NET","PISTOLE","AUDIT","DUCAT","RUPEE","ECU","ROUBLE","TRADE","MARGIN","DINERO","LIRA","AID"],
        nonWinningWords:["QUETZAL","CRUZEIRO","MONEY","ASSETS","TURNOVER","LIQUIDITY","INVESTMENT","FORTUNES","DISCOUNT","INTEREST","SUCRE","TIGHT","POUND","WAGES","DEPOSIT","PIASTRE","HALFPENNY","CONTRACT","ACCOUNT","CENTAVO","REVENUE","ESCUDO","KORUNA","LEGACY","PESETA","PROFIT","SOVEREIGN","VENDOR","WALLET","SIXPENCE","JACOBUS","OVERDRAFT","CENT","DRAW","BUDGET","DOUBLOON","SHEKELS","GOURDE","MARKET","BULLION","MILREIS","MORTGAGE","SHARE","KRONER","TENDER","BOLIVER","GUARANI","CREDITOR","CARTWHEEL","CASH","AWARD","COLON","KRONA","CENTIME","RECEIPT","FARTHING","NAPOLEON","SHILLING","GUILDER","MOIDORE","CHEQUE","CREDIT","JUDGE","SCHILLING","COIN","CAPITAL","BROKER","INCOME","WINDFALL","DEBIT","LEMPIRA","PFENNIG","EARN","EXCHANGE","ADVANCE","BROKE","DINAR","PRICE","DOLLAR","KOPECK","CORDOBA","FRANC","OFFER","BARGAIN","DIME","NICKEL","DRACHMA","FINANCE","CHANGE","BALBAO","BALANCE"],
        winningGame: [
            " MArGIn POUnDs ",
            "D  O  O    E A ",
            "I DuCAt pIstOlE",
            "N  B  E E E  A ",
            "E  L  S N C  R ",
            "rUpee  anNuIty ",
            "O R C Buy R R  ",
            " BoNus D LiRa A",
            "  X  O I  T D I",
            "PAy QuOtE yIeLd"]))

        games.append(GameModel(gameId:9304, maxWidth:17, maxHeight:12, winningScore:676, tags:[],
        winningWords:["OUTSIZE","TROY","TUN","KILOHERTZ","WATT","MOIETY","DYNE","UNIT","YARD","STEP","STONE","QUARTO","PINT","FOOT","BUSHEL","PROOF","OHM","POCKET","CASK","TIERCE","FEET","POLE","DRAM","REAM","ERG","ACRE","KEG"],
        nonWinningWords:["QUANTITY","VOLT","QUANTUM","GROSS","QUART","YARDSTICK","PENNYWEIGHT","HEAVYWEIGHT","MINUTE","POTTLE","YARDWAND","KILOWATT","SPOONFUL","OCTANT","CELSIUS","QUARTER","EQUIDISTANT","QUARTERN","POUND","AVOIRDUPOIS","SHEET","SCRUPLE","DIVISION","MUTCHKIN","MEASURE","OCTAVE","WEIGHT","QUIRE","ISOMETRIC","MILESTONE","THERMOMETER","QUADRUPLE","OUNCE","FURLONG","TARE","PUNCHEON","ALTIMETER","AMPLITUDE","BISEGMENT","KILOCYCLE","MODICUM","TONNAGE","LITRE","CENTIMETRE","PLATEFUL","FATHOM","METRIC","DIMENSION","CENTILITRE","ROOD","DISTANCE","MEGACYCLE","MINIM","SECOND","FOOLSCAP","AREOMETER","KILOMETRE","AMP","CARAT","NOGGIN","HECTOGRAM","ELEPHANT","BUNDLE","GAUGE","GRAMME","SHEKEL","HOGSHEAD","KILOGRAM","CUBIC","GRAIN","FAHRENHEIT","HECTARE","MILLIGRAM","AMPERE","FIRKIN","GALLON","LEAGUE","IMPERIAL","CENTIGRADE","PERCH","EQUIBALANCE","MICROFARAD","INCH","MILE","BARREL","DRACHM","GILL","PECK","CHAIN","MILEAGE","BRACE","ACREAGE","BALE","CABLE"],
        winningGame: [
            "  B D pRoOf    ",
            " QuArTo U O    ",
            "C S A L T oHm  ",
            "A H M E S T O S",
            "step    I  PiNt",
            "kiloHeRtz   E O",
            " E C R reaM tun",
            " R kEg O C Dyne",
            " C E   yArD  I ",
            "FeEt     E WAtT"]))

        games.append(GameModel(gameId:9305, maxWidth:17, maxHeight:12, winningScore:632, tags:[],
        winningWords:["SPRITZ","SYRUP","BRAZIL","NUTS","YOGURT","PASTRY","RUSSE","TARTS","SWEETS","GUMS","TAFFY","MINTS","TORTE","FLOSS","FRUIT","SORBET","DROPS","TRUFFLES","PIES","BARS","SIMNEL","TRIFLE","PEEL"],
        nonWinningWords:["MARZIPAN","WALNUTS","MOUSSE","TURNOVERS","HONEY","BULLSEYES","CLUSTERS","FLUMMERY","STREUSEL","DOUGHNUTS","DESSERTS","SUCROSE","BISCUITS","HUMBUGS","ALLSORTS","STRUDEL","NOUGAT","MOLASSES","BUTTERSCOTCH","CUSTARD","PUFFS","FRUCTOSE","PRESERVES","JUJUBES","JUNKET","STRAWBERRIES","STOLLEN","FROSTING","ROLLS","BROWNIES","CRESCENTS","PASTILLES","PEPPERMINTS","MARSHMALLOWS","CONFECTIONERY","DUMPLINGS","CONSERVE","SPONGE","SUNDAE","WAFERS","JELLYBEANS","BONBONS","BRITTLE","GLUCOSE","JUMBLES","POPCORN","SHERBET","SOUFFLE","NAPOLEONS","PINWHEELS","GATEAU","SHORTCAKE","COMFIT","SUGARCANE","FONDANT","MERINGUE","PRALINES","CHOCOLATES","FONDUE","COOKIES","PUDDING","WAFFLES","BUBBLEGUM","FRUITCAKE","MELON","KUCHEN","LOLLIES","PARFAIT","TAPIOCA","CINNAMON","LOLLIPOP","MINCEMEAT","MACAROON","GELATIN","VANILLA","CARAMELS","PANCAKES","TOFFEE","CAKES","FUDGE","CANDIES","JELLIES","PRALINE","PINEAPPLE","ALASKA","GINGER","COOKIE","BOMBE","CAROB","CREAM","ICING","LICORICE","GINGERBREAD","ICECREAM","ECLAIR","DRAGEE"],
        winningGame: [
            "DROpS B  sOrBEt",
            "   E TaFFy U  R",
            "P  E  R  R S  U",
            "A FlOss Gums  F",
            "S    W S pies F",
            "tRIfLe I  N P L",
            "R  R E M  tOrTe",
            "yOGuRt nUTs I S",
            "   I S E    T  ",
            "TARtS  L BRAzIL"]))

        games.append(GameModel(gameId:9306, maxWidth:17, maxHeight:12, winningScore:554, tags:[],
        winningWords:["BUZZARDET","EPIZOON","ZORAPTERA","DAYFLY","ZEUGLOPTERA","TAU","TSETSE","BOTFLY","MAYBUG","WASP","THRIPS","MANTIS","TERMITE","MITE","DIPTERANS","APHIS","BORER","LEMA"],
        nonWinningWords:["BUTTERFLY","MOSQUITO","LOCUST","CHRYSALIS","BLOWFLY","GNATS","LOUSE","DYNASTIDAN","MOTH","MYRIAPOD","KATYDID","VESPA","BOT","BURNET","CHURRWORM","CHRYSOMELA","LAMPFLY","PUPA","NOCTURNA","FRITILLARY","TARANTULA","BRIMSTONE","DERMESTES","ORTHOPTERA","NEUROPTERA","TETRAPOD","FIREFLY","ACARUS","COCCUS","GADFLY","HORNET","GRASSHOPPER","ENTOMOLITE","MULTIPED","GALLFLY","WEEVIL","PARASITE","EMMET","BLUEBOTTLE","SKIPPER","MAGGOT","LADYBIRD","PUPIPARA","ROTIFER","SPIDER","VORTICELLA","ANTENNA","TICK","SPARKLER","HOPPER","ROTIFERA","COCOON","EARWIG","MIDGET","DIPTERA","ANOPHELES","HEMIPTERA","LONGICORN","COLEOPTERA","LEPIDOPTERA","DUMBLEDOR","WHIRLIGIG","WOODLICE","LARVAE","COMMA","DRONE","FLIES","CATERPILLAR","CRICKET","SCARAB","COCKTAIL","COLORADO","CENTIPEDE","DORBEETLE","MICROBE","BEDBUG","BEETLE","CADDIS","BOMBARDIER","BEEHIVE","BULLHEAD","EPHEMERA","COCKROACH","JIGGER","DAPHNIA","EPEIRID","MIDGE","CHIGOE","CHIGGER","ARACHNID","COCHINEAL","MILLEPEDE","COCCINELLA","COCKCHAFER","CHAFER","CICINDELA","CICADA","BEE"],
        winningGame: [
            "bORER EPIzOON  ",
            "U    B   O    D",
            "zEUGLoPtErA M I",
            "Z    T E A WaSp",
            "A M  F R P  N T",
            "R A  L M tSEtSe",
            "dAyFly I E  I R",
            "E B E  tHrIPs A",
            "tAu mITe A    N",
            "  G A     APHIs"]))

        games.append(GameModel(gameId:9307, maxWidth:17, maxHeight:12, winningScore:610, tags:[],
        winningWords:["BRAZIL","URUGUAY","TANZANIA","BELIZE","TURKEY","VENEZUELA","EGYPT","SYRIA","ITALY","YEMEN","KENYA","AUSTRIA","LIBYA","SUDAN","PERU","QATAR","MALTA","CUBA","IRAN","IRAQ","FIJI"],
        nonWinningWords:["CYPRUS","SWAZILAND","ZIMBABWE","NORWAY","MOZAMBIQUE","VANUATU","GUYANA","HUNGARY","MAURITIUS","CZECHOSLOVAKIA","KUWAIT","TUNISIA","PARAGUAY","GERMANY","TOGO","BOTSWANA","MALAYSIA","LUXEMBOURG","SEYCHELLES","COMOROS","LESOTHO","PORTUGAL","BHUTAN","BURUNDI","VIETNAM","HONDURAS","AUSTRALIA","SWEDEN","SPAIN","LAOS","PAKISTAN","ANTIGUA","BURMA","DJIBOUTI","MAURITANIA","BRUNEI","MEXICO","SINGAPORE","NETHERLANDS","PHILIPPINES","RWANDA","MOROCCO","SOMALIA","GUATEMALA","AFGHANISTAN","CONGO","HAITI","GUINEA","ISRAEL","MALAWI","ETHIOPIA","ARGENTINA","INDONESIA","CAMEROON","COLUMBIA","MONGOLIA","BELGIUM","BOLIVIA","ECUADOR","ROMANIA","UGANDA","SENEGAL","JORDAN","POLAND","NICARAGUA","BARBADOS","BULGARIA","THAILAND","NIGER","BAHAMAS","PANAMA","DENMARK","LEBANON","BENIN","GABON","JAPAN","NEPAL","MADAGASCAR","DOMINICA","ANGOLA","BANGLADESH","NIGERIA","MALI","BAHRAIN","FINLAND","IRELAND","CHINA","GHANA","INDIA","FRANCE","GRENADA","CAMBODIA","ALGERIA","LIBERIA","GAMBIA","ALBANIA","ICELAND","JAMAICA","GREECE","CHILE","CANADA","CHAD"],
        winningGame: [
            " M  B   S C T S",
            "QaTAr V uRuGuAy",
            " L  A E D B R R",
            " tANzAnIa A K I",
            " A  I E N   E A",
            "  BelIzE LiByA ",
            " P G  U F T   I",
            "KeNyA E iRaQ  R",
            " R P  L J L   A",
            "AuStRIa I yEMEn"]))

        games.append(GameModel(gameId:9308, maxWidth:17, maxHeight:12, winningScore:598, tags:[],
        winningWords:["VELAZQUEZ","GREUZE","WATTS","CEZANNE","SCOTT","ROMNEY","LELY","WEYDEN","DYCK","ERNST","EYCK","STEER","RUBENS","VERNET","HEYDEN","SARGENT","HALS","REDON","HOOCH","BRIL"],
        nonWinningWords:["ZOFFANY","ROSSETTI","ROUSSEAU","TINTORETTO","WATTEAU","REYNOLDS","MORISOT","TURNER","GIOTTO","MATISSE","FURSE","DAUBIGNY","PISSARRO","WHISTLER","DESPORTES","UTRILLO","MONET","MOSER","TITIAN","ABBEY","STAEL","BUTLER","CLOUET","NATTIER","PICASSO","SUTHERLAND","BEARDSLEY","FABRITIUS","AUDUBON","GAUGUIN","MABUSE","MARLOW","MEISSONIER","BELLOTTO","MURILLO","COTMAN","GIRTIN","VILLON","BONINGTON","MANET","WARHOL","MACWHIRTER","PERRONNEAU","GAINSBOROUGH","PRENDERGAST","MOORE","BARTOLOMMEO","BOUDIN","CANALETTO","CONSTABLE","ORCHARDSON","HOGARTH","RAEBURN","VERMEER","MILLET","RENOIR","REMBRANDT","BOTTICELLI","BOUCHER","LAMBERT","MILLAIS","AVERCAMP","BRUGGHEN","CROME","GIORGIONE","SAENREDAM","LANDSEER","LAWRENCE","POLLOCK","CORREGGIO","DELACROIX","DOMENICHINO","DAVID","DEGAS","CARAVAGGIO","BERNINI","BOLDONI","ALBERTINELLI","FRAGONARD","GRECO","MODIGLIANI","DICKSEE","HOLBEIN","MICHELANGELO","RAPHAEL","BELLINI","CARRACCI","DALI","BLAKE","HEDA"],
        winningGame: [
            " HOOCh  G  HALs",
            "     E BrIL   A",
            "ROMNEy  E   C R",
            "     D  U R E G",
            "  E veLAzQuEz E",
            "wEyDen  E B A N",
            "A C R  L  eRnSt",
            "T K N ReDOn N  ",
            "T   E  L  sTeER",
            "sCOTt DyCK     "]))

        games.append(GameModel(gameId:9309, maxWidth:17, maxHeight:12, winningScore:570, tags:[],
        winningWords:["PASSAMEZZO","TWIST","TROT","ZAPATEADO","TWOSTEP","POUSSETTE","STEP","MINUET","PIROUETTE","PAS","TAP","VALSE","TANGO","JOTA","VALETA","HOP","HULA","JIVE","POLKA","CANCAN","FAN","REEL","BALL"],
        nonWinningWords:["MAZURKA","SHIMMY","STRATHSPEY","MUSETTE","FOXTROT","KANTIKOY","BOSTON","CANTICOY","GAVOTTE","MAYPOLE","ROUNDELAY","TRIPUDIUM","MORRIS","ONESTEP","QUICKSTEP","LAVOLT","SCHOTTISCHE","VARSOVIENNE","MAXIXE","DANSEUSE","JITTERBUG","COURANTE","ECOSSAISE","FRUG","MORESCO","TAMBOURINE","CORANT","RUMBA","CHASSE","CHARLESTON","HOEDOWN","MADISON","ROUNDEL","POLONAISE","SALTARELLO","BOURREE","SHUFFLE","ARABESQUE","COTILLION","STEPDANCE","TARANTELLA","COUPEE","PAVANE","REDOWA","HORNPIPE","GIGUE","SAMBA","CANTICO","LANCERS","BREAKDOWN","KRAKOWIAK","PASODOBLE","MORRICE","CRACOVIENNE","PASSACAGLIA","MAMBO","CORROBOREE","QUADRILLE","BALLROOM","RIGADOON","BEGUINE","BOLERO","SARABAND","GALOP","RONDEA","CONGA","CAPRIOLE","CAKEWALK","CHACONNE","FANDANGO","BEBOP","BOREE","CAPER","FLING","FARANDOLE","JIG","CARIOCA","BARNDANCE","GALLOPADE","ALLEMANDE","FOLKDANCE","GALLIARD","HABANERA"],
        winningGame: [
            "pIrOUETtE F    ",
            "A E    A vaLEtA",
            "sTeP CAnCan  R ",
            "S L    G L   O ",
            "A  H  PoUsSEttE",
            "mINuET   E  W  ",
            "E  L  B J  JiVE",
            "zApatEaDo H S  ",
            "Z A A L tWoStEP",
            "O S pOlKa P    "]))

        games.append(GameModel(gameId:9310, maxWidth:17, maxHeight:12, winningScore:440, tags:[],
        winningWords:["SZYMANOWSKI","DONIZETTI","RODRIGUEZ","STRAUSS","MOUSSORGSKY","DEBUSSY","STRAVINSKY","TOSTI","RAYBOULD","MARKS","DELIUS","GAUL","VERDI","MASCAGNI"],
        nonWinningWords:["VIEUXTEMPS","TCHAIKOVSKY","ROSSINI","BIRTWISTLE","RAWSTHORNE","SULLIVAN","STOCKHAUSEN","KABALEVSKY","RUBINSTEIN","SCHUBERT","BRITTEN","SCHUMANN","SIBELIUS","SCARLATTI","GERSHWIN","MONCKTON","GOUNOD","MONTEVERDI","BERNSTEIN","MEYERBEER","COWEN","NIELSON","MENDELSSOHN","COUPERIN","WILLAERT","PALESTRINA","VIVALDI","DIMITRIESEN","BARTOK","BRAHMS","DVORAK","WAGNER","BEETHOVEN","PROKOFIEV","WALDTEUFEL","RAVEL","RACHMANINOV","PUCCINI","PURCELL","PERGOLESI","GLUCK","WEBER","ANSELL","LAMBERT","KREISLER","HUMPERDINCK","HINDEMITH","HOLBROOK","BORODIN","HERMANN","CHOPIN","SCHOENBERG","KERN","LEONCAVALLO","GERMAN","MACDOWELL","LOCATELLI","ORFF","ALBINONI","GRAINGER","PAGANINI","SCHNABEL","ADDINSELL","BERLIN","DELIBES","GRIEG","BOCCHERINI","FRANKEL","BLOCH","ELGAR","LEHAR","BELLINI","HANDEL","OFFENBACH","ANCLIFFE","BACH","GADE"],
        winningGame: [
            "mArKS  StRAUsS ",
            "A A   R O   T D",
            "sZyMANoWsKI R E",
            "C B   D T   A B",
            "A O VErDi   V U",
            "gAuL  I  DELiUs",
            "N L   G     N S",
            "I D MOuSSORGsKy",
            "      E     K  ",
            "  DONIzETTI Y  "]))

        games.append(GameModel(gameId:9311, maxWidth:17, maxHeight:12, winningScore:552, tags:[],
        winningWords:["MIZZENTOP","HORIZON","BUOY","JETTY","STOWAWAY","SEAWORTHY","MAST","SCUTTLE","PORT","TARPAULIN","WIND","CREW","AFT","ASHORE","FLOAT","TRICE","AFTER","HATCH","RIG","EMBARGO"],
        nonWinningWords:["RENDEZVOUS","SEXTANT","SPARS","BOWSPRIT","GANGWAY","CROSSTREES","JETTISON","ATHWART","CROSSWIND","YARDARM","COMPASS","WINDLASS","SHIPWRIGHT","DAVIT","JETSAM","FLOTSAM","DOLDRUMS","LIGHTHOUSE","FOREMAST","OUTBOARD","HALYARD","OAKUM","COASTGUARD","NAVIGATOR","FOUL","SHIPMATE","BULWARK","OARSMAN","DRIFTWOOD","PORTHOLE","CHARTROOM","AWNING","ENSIGN","SAILOR","PLIMSOLL","DOGWATCH","NAVIGATE","TELESCOPE","SALVAGE","HELMSMAN","MARITIME","SEMAPHORE","BERTH","ALONGSHORE","MIDSHIPMAN","FORECASTLE","LUFF","CRAFT","SPLICE","HURRICANE","BILGEWATER","MOORAGE","FLOTILLA","MARINE","GRAPNEL","LEEWARD","RIGGING","TAFFRAIL","LANDLUBBER","GANGPLANK","FOG","ENGINE","FIGUREHEAD","HELM","LIFEBELT","ANCHORAGE","MAINBRACE","BEACON","CORDAGE","BINNACLE","BRIDGE","DEBARK","BECALMED","KEDGE","DECK"],
        winningGame: [
            " EmBArGO    C B",
            "A A  I  aFTEr U",
            "S S  G  F   E O",
            "hAtCh  stOwAwAy",
            "O   O  C  I    ",
            "R tArPAuLIn F J",
            "E R I  T  D L E",
            " MiZzENtOP PoRt",
            "  C O  L    A T",
            "  E N SeAWORtHy"]))

        games.append(GameModel(gameId:9312, maxWidth:17, maxHeight:12, winningScore:506, tags:[],
        winningWords:["QUIZAPU","RUWENZORI","VESUVIUS","ROCKY","BARRY","EVEREST","ROSA","OLIVES","ATLAS","SIMPLON","EREBUS","ALPS","JURA","SULAIMAN","URAL","ITACULOMI","PETEROA","FUJI","PELEE","CAHA"],
        nonWinningWords:["TUPUNGATO","VOSGES","PARNASSUS","COTSWOLDS","PYRENEES","TOWNSEND","SNOWDON","LOOKOUT","CAUCASUS","MANTURK","RUSHMORE","KOSCIUSKO","LAFAYETTE","HELVELLYN","MOURNE","TOMBORO","MOORFOOT","HIMALAYAS","STROMBOLI","LIVINGSTONE","VULCANO","COTOPAXI","MCKINLEY","QUANTOCK","MATTERHORN","NELSON","PAMIRS","CAIRNTOUL","JUNGFRAU","CHEVIOT","WELLINGTON","TONGARIRO","AUVERGNE","PENNINES","LAURENTIAN","LIVERPOOL","MALVERN","SINAI","CAIRNGORMS","LAMMERMUIR","ESTRELLE","DARWIN","HOOSAC","CUCHULLIN","DARDISTAN","GRAMPIANS","SOLFATARA","CATSKILL","NILGIRIS","APENNINES","ARARAT","RUAHINE","RAKAPOSHI","BLUE","ANDES","MONCH","COOPER","DAPSANG","CHILTERN","WRANGELL","MALADETTA","KWATHLAMBA","FAUCILLES","FLINDERS","KRAKATOA","CARPATHIAN","CHUMALARI","BALKANS","DEMAVEND","GOATFELL","KATAHDIN","LOGAN","RAINIER","ACONCAGUA","KARAKORAM","KILIMANJARO","SNAEFELL","BROCKEN","HOFFMAN","HUALALAI","DARLING","ILLAMPA","SCAFELL","ADIRONDACK","APPALACHIAN","CASCADE","BLANC","EDGEHILL","HECLA"],
        winningGame: [
            "PeLEE   P Q  F ",
            " V   J VeSuVIuS",
            " eREBus T I  J ",
            " R   ruWeNzORi ",
            " E Ural R A   O",
            " S  O A O P R L",
            "atLAs iTacuLoMi",
            "L   A M  A  C V",
            "P     A  H  K E",
            "sIMPLOn BaRRy S"]))

        games.append(GameModel(gameId:9401, maxWidth:17, maxHeight:15, winningScore:656, tags:[],
        winningWords:["WALTZING","BEZIQUE","TEST","RUGBY","PLAY","QUOITS","LOTTO","SQUASH","SKITTLES","HOBBY","BOWLS","TENNIS","DARTS","HOCKEY","CROQUET","SKATING","JUDO","CANASTA","SKIING","DIVING","BAIT","RODEO","NETBALL","GOLF","BALL"],
        nonWinningWords:["QUATORZE","SWIM","EURYTHMICS","GYMNASTICS","OLYMPICS","TOURNAMENT","FLYING","ROULETTE","SPELEOLOGY","WOODWORK","WRESTLING","DRAUGHTS","ROUNDERS","EQUESTRIANISM","ARCHERY","SURFING","AQUATICS","SHUTTLECOCK","CHESS","ROWING","OUTRIDE","GYMKHANA","VOLLEYBALL","HOPSCOTCH","ATHLETICS","LACROSSE","SCULLING","STALKING","SOLITAIRE","DOMINOES","MARATHON","MOUNTAINEERING","BICYCLE","TRAMPOLINING","WEIGHTLIFTING","CALISTHENICS","CURLING","TOBOGGAN","BADMINTON","STEEPLECHASING","SOCCER","HURDLING","ACROBATICS","SKATEBOARD","TOBOGGANING","CARDS","MARBLES","SAILING","RECREATION","FOOTBALL","EUCHRE","KARATE","BIATHALON","CRICKET","BALLOONING","BILLIARDS","RIDING","ANGLING","BACKGAMMON","LEAPFROG","HIKING","GARDENING","CLIMBING","MANEGE","FENCING","GLIDING","BASEBALL","REFEREE","BRIDGE"],
        winningGame: [
            "   C   B G B T ",
            "   rOdEo O E E ",
            "JUDo I wAlTzInG",
            "   Q V L F I N ",
            "N QuOiTs   Q I ",
            "E  E N   sQuAsh",
            "tEst G C K E  O",
            "B K    A I  B C",
            "A A H  N T  A K",
            "lOtTo DaRtS L E",
            "L I B  S L PlAy",
            "  N bAIt E     ",
            "RUgBy  A sKIING"]))

        games.append(GameModel(gameId:9402, maxWidth:17, maxHeight:15, winningScore:636, tags:[],
        winningWords:["ZONURUS","LIZARD","PYTHON","STEGOSAURUS","TESTUDO","NEWT","TURTLE","TUATARA","MONITOR","SERPENT","DINOSAUR","DIPSAS","RATTLER","WORREL","SKINK","TOAD","KRAIT","TAIPAN","KUFI","ELAPS","SNAKE","WARAL","FROG","LAMIA","PADDOCK"],
        nonWinningWords:["TYPHLOPS","TYRANNOSAURUS","COTYLOSAUR","ICHTHYOSAURUS","MOSASAURUS","HYLAESAURUS","BRONTOSAURUS","TRITON","COTTONMOUTH","TORTOISE","VARANUS","OPHIOSAURUS","PTEROSAUR","SCINCUS","PTERODACTYL","CAYMAN","BUSHMASTER","PLESIOSAUR","AXOLOTL","TRICERATOPS","DOLICHOSAURUS","SAURIAN","CERASTES","BASILISKS","SNAPPER","RATTLESNAKE","ACONTIAS","MUGGER","MATAMATA","TERRAPIN","DIPLODOCUS","HAMADRYAD","BOOMSLANG","GALLIWASP","SCHAAPSTICKER","GARTERSNAKE","LEVIATHAN","NATTERJACK","COBRAS","MAMBAS","DRAGONET","LACHESIS","MOCCASIN","RINGHALS","OPHIDIANS","IGUANA","COLUBER","TADPOLE","URODELA","AMPHIBIANS","ALLIGATOR","MOLOCH","SALAMANDER","DRAGON","LACERTA","COCKATRICE","ANOLE","BATRACHIA","COPPERHEAD","CHAMELEON","CROCODILE","ABOMA","CHELONE","LABARRI","ANACONDA","CHELONIA","HICCATEE","JIBOA","GHARIAL","HELLBENDER","JARARACA","LANGAHA","DABOIA","ADDER","KEELBACK"],
        winningGame: [
            "E wARAl L D S  ",
            "L O   A I I E  ",
            "A R F M zOnUrUs",
            "P R R I A O P N",
            "sTeGoSaUrUs E A",
            "  L G   D A N K",
            " M     P turtLe",
            "ToAd TUaTara   ",
            " N I   D I T   ",
            " I P K D pYtHOn",
            " tEsTuDo A L  E",
            " O A F C N E  W",
            " R sKiNk  KrAIt"]))

        games.append(GameModel(gameId:9403, maxWidth:17, maxHeight:15, winningScore:710, tags:[],
        winningWords:["PIZZARO","VELASQUEZ","ROSS","SCOTT","STANLEY","MOSTO","BYRD","STEWART","PEARY","AUSTIN","BURTON","MAWSON","TORRES","HUDSON","EVANS","OATES","CORTES","TASMAN","OSBORN","KENNEDY","NANSEN","POLO","JENKINSON","EANNES","ADAMS","COOK","LEIF"],
        nonWinningWords:["HURLEY","MACKENZIE","TRISTAM","DULUTH","SMITH","OMMANNEY","SVERDRUP","THOMPSON","STEFANSSON","MORTON","KINGSLEY","SPIES","COLUMBUS","JOHNSTON","VANCOUVER","LEWIS","HILLARY","VESPUCCI","LIVINGSTONE","FAWCETT","ETHERTON","RADISSON","ADVENTURE","AMUNDSEN","HAWKINS","KROPOTKIN","HUMBOLDT","FREMONT","DISCOVER","ENDEAVOUR","GONSALVEG","HARTOG","EXPLORE","KELLETT","AFRICANUS","LANCASTER","SHACKLETON","INTREPID","JOHANSEN","BURKE","BARNES","FORBES","FRASER","KOSLOFF","SHIPPEE","TWEEDIE","RICHARDSON","BOUGAINVILLE","CARTIER","CHARCOT","FROBISHER","BELLINGHAUSEN","MCCLINTOCK","GRANVILLE","FLINDERS","GILBERT","PRADO","CHAMPION","LAWRENCE","PHILIP","MANDEVILLE","FRANKLIN","DAMPIER","LEICHHARDT","BERING","CHAMPLAIN","BEHRING","BELGONI","MENDANA","CHANCELLOR","DANGER","FILCHNER","GRENFELL","MAGELLAN","COCKERILL","RALEIGH","CLIFFORD","DRAKE","INGLEFIELD","ALMEIDA","BAFFIN","BALBOA","CABRAL","BEKE"],
        winningGame: [
            " ScOTt M O CoOk",
            "S O  aDaMs  A E",
            "tOrREs W bURtOn",
            "E T  mOsTo  E N",
            "W E  A O rOSs E",
            "aUsTIn N N    D",
            "R         pEARy",
            "T E  N  H I    ",
            "  vELaSQuEz P  ",
            "L A  N  D Z O B",
            "eAnNEs  sTaNlEy",
            "I S  E  O R O R",
            "F  JEnKInSoN  D"]))

        games.append(GameModel(gameId:9404, maxWidth:17, maxHeight:15, winningScore:740, tags:[],
        winningWords:["ZINNIA","SCHIZANTHUS","THYME","FORSYTH","LOTUS","HENRY","SHRUBS","ASTERS","STAMENS","GUM","FRUIT","RUE","SPORE","FLOWERS","LUPIN","PETALS","REEVES","SEEDS","KEW","FERNS","WARD","VIOLA","FLORES","BANKS","HERBS","TWEEDIE","ROBIN","DAVID","HAKE"],
        nonWinningWords:["BRYOPHYTA","HYBRIDIZING","ESCHSCHOLZ","FORESTRY","BOTANY","PLINY","WALNUT","CUTTINGS","TURNER","WILLMOTT","CULTIVARS","WESTRING","MORPHOLOGY","COTYLEDON","BOTANIST","PISTIL","DELAVAY","ECOLOGY","FORTUNE","ARISTOTLE","COMPTON","GUAVA","COULTER","BELLAMY","BAILEY","ANGIOSPERMS","PLANT","MIGNONETTE","LINNAEUS","THUNBERG","DOUGLAS","TRADESCANT","VEITCH","MATTHIOLI","PARKINSON","JOVELLANOS","COLLINSON","DARWIN","MARIES","BARTRAM","PROPAGATE","STELLARIA","GODET","CUNNINGHAM","MUELLER","SOLANDER","EUGENE","MAGNOL","POLLEN","GREVILLE","KNIPHOF","SIEBOLD","AGAVA","BALSA","LONICER","BARONE","FARRER","ALLIONI","BEGON","GRAPE","HERRARIA","JARDIN","KALM","KAEMPFER","GARDEN","GERARD","LOBB","DEODAR","BREEDING","LAPAGERIA","FOLIAGE","BLAIKIE","DAHL","ABEL"],
        winningGame: [
            "D   sChIzANThUs",
            "A F T E I   E P",
            "vIoLa R N A N O",
            "I R M bAnKs R R",
            "D sEeDs I tHyMe",
            "  Y N  HaKe    ",
            "lOtUs F   rOBIN",
            "U H  FlOrEs    ",
            "P  F  O E  K F ",
            "I  R TwEeDIe E ",
            "N GuM E V  wArD",
            "   I  rUe    N ",
            " PEtALs sHRUBs "]))

        games.append(GameModel(gameId:9406, maxWidth:17, maxHeight:15, winningScore:718, tags:[],
        winningWords:["RAMAZZINI","WHYTT","ZOLLNER","TETANY","MAYO","SURGERY","OXYGEN","BOTANY","HARVEY","STOKES","NURSE","SIMPSON","FLOREY","MORTON","VITAMINS","EVANS","WRIGHT","INSULIN","HYGIENE","MONRO","GERMS","SARPI","MASHRIG","FRANK","HAND","BILE"],
        nonWinningWords:["INFLUENZA","VIRUS","ANATOMY","SHARPEY","CHEMISTRY","PASTEUR","WHITLOW","PATHOLOGY","VESALIUS","TRANSFUSION","OCULIST","SYDENHAM","DRUGS","HUNTER","STETHOSCOPE","BIOLOGY","ARTHRITIS","DOCTORS","SEMMELWEISS","IMMUNISATION","LISTER","MANSON","VIRCHOW","BASSI","CAIUS","JUDET","WILLIS","CORTISONE","BEAUMONT","HOSPITAL","RONTGEN","PARIS","PARACELSUS","LOWE","ANTIBIOTICS","QUARANTINE","MESMER","WITHERING","DIAGNOSIS","LAVOISIER","HIPPOCRATES","GULL","MULLER","SALERNO","INCISION","ANAESTHESIA","DORSAL","MONTPELLIER","VACCINATION","CURIE","BRIGHT","GORDON","TRANCE","DIGITALIS","MAIMONIDES","FEVER","PADUA","CULLEN","ADDISON","DENTAL","AVICENNA","NIGHTINGALE","JENNER","HOOKE","CHRONIC","HAHNEMANN","FEMORAL","MANIA","PENICILLIN","BACTERIA","MALPIGHI","BARNARD","BORELLI","FLEMING","KOCH","BACON","CARREL","AGRICOLA","GALEN","EHRLICH","MEDICINE","REED","ACHE"],
        winningGame: [
            " sArPi  MORtOn ",
            " U A N F   E U ",
            " R mAsHrIg T R ",
            " G A U A eVaNs ",
            " E zOlLnEr N E ",
            " R Z I K mAyo V",
            "hyGiEnE  S  X I",
            "A  N   B  wHyTt",
            "R SimPSoN R G A",
            "V   O  T BiLe M",
            "E HAnD A  G N I",
            "Y   R  N  H   N",
            "  FLoREy StOKEs"]))

        games.append(GameModel(gameId:9407, maxWidth:17, maxHeight:15, winningScore:804, tags:[],
        winningWords:["BLIZZARD","SUBZERO","FROZEN","HORIZON","GUST","SNOW","SCOTT","STORM","BYRD","SKUAS","WALRUS","SASTRUGI","INUIT","SUPPLIES","WINTER","HILLARY","WEASELS","DRIFTS","FUCHS","PETRELS","SEALS","WIND","IGLOOS","WHALES","POLE","ALASKA","ICE"],
        nonWinningWords:["SOUTH","CRYSTALS","FREEZING","TENT","SNOWSHOES","PEARY","FROST","ROOKERY","MUKLUKS","MAWSON","MOUNTAINS","TRACTORS","SNOWBOUND","ASTROFIX","NUNATAKS","SNOWDRIFT","HUSKIES","SEISMOLOGIST","NORTH","GREELY","COMPASS","WIRELESS","PENGUINS","FROSTBITE","HARNESS","WILKINS","CREVASSE","EXPLORERS","TEMPERATURE","METEOROLOGIST","AMUNDSEN","LATITUDE","SNOWMOBILE","TOBOGGANS","CRAMPONS","THERMOMETER","ISLANDS","AURORA","NANSEN","CARIBOUS","NAVIGATION","WEATHER","ESKIMO","SAVAGE","EXPEDITION","LEMMINGS","AXE","FJORDS","NANUCK","PLANES","SKIING","ANTARCTIC","PARACHUTE","SHACKLETON","ANTENNA","BALLOONS","BIRDS","FLOES","GLISSADE","BAROMETER","MONOPLANE","SLED","BEARS","FAUNA","NORGE","HURRICANE","ARCTIC","AIRCRAFT","ANORAK","ERMINE","GLACIERS","PEMMICAN","SLEDGE","BOLLING","PARKA","RADIO","WILDLIFE","FOG","GAP","FOKKER","NOBILE","WEDDELL","OCEAN","CHANNEL","BERG","PACK","LICHEN","BALACLAVA","CRACK","ICEBERG","ICECAP","GLACIAL","ADELIE"],
        winningGame: [
            "   G sUpPLiEs W",
            " INuit E  G A H",
            "   scoTt AlAsKa",
            "WINter R  O T L",
            "     M E  O R E",
            "    S  L  sKuAs",
            " H FuChs P  G  ",
            " I  B O  O wiNd",
            "BlIZzArD L A  R",
            " L  E I seAlS I",
            " A FrOzEn  R  F",
            " R  O O O  U  T",
            "ByRD  N wEAsELs"]))

        games.append(GameModel(gameId:9408, maxWidth:17, maxHeight:15, winningScore:828, tags:[],
        winningWords:["STYLUS","TYPES","PAPYRUS","TEXT","TYPOGRAPHY","DEMY","ROYAL","SEWN","PRESS","QUARTO","SCRIPT","PRINT","BOX","COSTER","EMS","FONT","CROWN","TITLE","PROOFS","PLATES","ROLLS","MOULD","PAPERS","QUILL","ROLLERS","FORME","PAIR","INK","BALLOON","REAM","PAGE","PICA","BED"],
        nonWinningWords:["MAZARIN","HORIZONTAL","ROTARY","MAGAZINE","TYPESETTING","MONOTYPE","TYPEWRITER","STEREOTYPE","NEWS","LINOTYPE","SLUG","FOUNT","FUTURA","SOUVENIR","COPYRIGHT","TIMES","XEROGRAPHY","CULTURE","LETTERS","MATRIX","VOLUME","BROADWAY","LETTERPRESS","STATIONER","PASTE","MANUSCRIPT","CAXTON","OCTAVO","OPTIMO","STEREO","COMPOSITOR","NEWSPAPERS","LIBRARY","LITHOGRAPHY","VELLUM","BAUHAUS","HYDRAULIC","ATLAS","BOOKWORM","CYLINDER","PRINTER","OFFSET","BOOKS","FORMAT","COVER","PUBLISHER","GUTENBERG","PARCHMENT","INDEX","METAL","OBLIQUE","ENGRAVER","EXTENDED","FOOLSCAP","ENGRAVING","INKWELL","ROCKWELL","BOOKPLATE","BASKERVILLE","DUODECIMO","DESIGNER","ELEPHANT","CONDENSED","BODONI","ITALIC","GARAMOND","FOLIO","CHELTENHAM","DIGITEK","IMPERIAL","MEDIEVAL","HEADLINES","DELETE","LIBRARIAN","BINDING","CAMEO","FLATBED","BOLD","PREFACE","LEADER"],
        winningGame: [
            " pROOFs  COStEr",
            " I    T M   Y O",
            " C D TyPoGRApHy",
            "paGe  L U   E A",
            "A  M quIlL  S L",
            "pApyRus D R    ",
            "E A  A B FoNt E",
            "R I  rEaM L I M",
            "scrIpt L plAtEs",
            " R  roLlErs L  ",
            "FoRMe  O I beD ",
            " W  S  O N O   ",
            "InK sEWn tExT  "]))

        games.append(GameModel(gameId:9409, maxWidth:17, maxHeight:15, winningScore:766, tags:[],
        winningWords:["STULTZ","ROZIER","STRUT","SMITHY","GYROSTAT","ZEPPELIN","STABILIZER","CURTISS","BYRD","MERCURY","SHUTTLE","WINGS","ULM","TIRO","UFO","KITES","HASTE","PILOT","RISE","DIVE","EJECTOR","HEATH","AIRLINER","GREEN","BANK","GALIEN","BELL"],
        nonWinningWords:["CAYLEY","SIKORSKY","JOYSTICK","ASTRONAUT","BRUNT","STRATOJET","COSMONAUT","PEGASUS","AUTOPILOT","TURBOJET","SUPERSONIC","WRIGHT","COMPASS","HYDROGEN","BROWN","AUTOGIRO","AIRBUS","DROGUES","AERODYNE","AERONAUT","ALTITUDE","AMUNDSEN","NAVIGATOR","BIOT","AVIATION","ROBERT","VERNE","PHOENIX","GODWIN","ALTIMETER","SPACESHIP","RODGERS","HOP","ROCKET","ORVILLE","VOLPLANE","BLERIOT","COCKPIT","LUNARDI","RADIATOR","MONOPLANE","SPACE","LEVINE","WALKER","AIRCREW","EARHART","FUSELAGE","HELICOPTER","HINDENBURG","PROPELLER","GLIDERS","FLIGHT","SADLER","CHARLES","AIRMAN","AERODROME","LEONARDO","CLEAT","LILIENTHAL","AILERON","RENARD","AEROPLANE","HINKLER","FOKKER","AMPHIBIAN","BACON","COBHAM","BIPLANE","LINDBERGH","ANDREE","GODDARD","PICCARD","DIRIGIBLE","AERIAL","ALCOCK","GIFFARD"],
        winningGame: [
            "G D C    STuLTz",
            "R I uLm S  F  E",
            "E V R E tIRo  P",
            "eJeCtOr R     P",
            "N   I C U hAsTe",
            " P  sHuTtLe M L",
            "KiTEs R   A I I",
            " L   gyrOStAt N",
            " O   A O  H H  ",
            "StAbIlIzER byrD",
            "   E I I   A I ",
            "   L E E WInGs ",
            "AIRlInEr   K E "]))

        games.append(GameModel(gameId:9410, maxWidth:17, maxHeight:15, winningScore:688, tags:["P","P33"],
        winningWords:["USURY","JURY","GUILTY","SURTAX","TORT","ATTORNEY","CRUELTY","WITNESS","WRIT","SUSPECT","TRESPASS","INQUEST","FELONY","RULES","EXECUTOR","BIGAMY","JUSTICE","ACQUITTAL","LEGACY","OATH","TRIAL","CASE","FORGER","FALSE","LIEN"],
        nonWinningWords:["ASSIZES","EMBEZZLEMENT","TESTIMONY","INJURY","PERJURY","RESTITUTION","DISTRESS","BANKRUPTCY","ACCESSORY","COPYRIGHT","EXTORTION","BURGLARY","HEARSAY","STIPENDIARY","PROSECUTOR","FORGERY","TRESPASSING","ROBBERY","JUROR","ARREST","ESCROW","PRISON","LITIGIOUS","ARSON","BRIBERY","LARCENY","PETITION","REMISSION","EXTRADITION","COLLUSION","ENDOWMENT","SOLICITOR","CONTRACT","PRISONER","FRAUDULENT","CHANCERY","CONFESSION","MURDER","BARRISTER","LITIGANT","VERDICT","ARBITRATION","PERJURER","SENTENCE","STEALING","INDICTMENT","LITIGATION","GUARANTEE","ADVOCATE","FORENSIC","REPRIEVE","ACCUSED","SLANDER","AGREEMENT","DISBAR","JUDGE","PLAINTIFF","ABET","DEFAMATION","PAROLE","RELEASE","REMAND","CRIMINAL","ENTAILED","DEFENDANT","DISCHARGE","INNOCENCE","CRIME","EVIDENCE","POLICE","REPEAL","HOMICIDE","DOCK","CODICIL","OFFENCE","CHARGE","MALICE","BENCH","BLACKMAIL","ILLEGAL","LEGAL","BAILIFF","DEFENCE"],
        winningGame: [
            "EXEcUToR  wRIT ",
            "   R  A   I    ",
            "ACQuITtAL tRiAL",
            "   E  H   N N  ",
            "   L F  C E Q  ",
            " J tReSPass U A",
            "JuRy L  susPeCt",
            " S  FoRger  S T",
            " T F N U tOrt O",
            "BiGaMy I A U  R",
            " C L   L X lIEn",
            " E S   T   E  E",
            "  LeGACy  UsURy"]))

        games.append(GameModel(gameId:9411, maxWidth:17, maxHeight:15, winningScore:696, tags:[],
        winningWords:["HOWITZER","MAGAZINE","GUNS","SHOT","SWORD","QUIVER","BRASS","DARTS","BOW","MAUSER","ARROW","MORTAR","DETONATOR","SIREN","TANK","TORPEDO","JET","SPEAR","AXE","PETARD","HELMET","RAM","BOLO","MINE","TABARD","BOMB","DERINGER","DIRK","LANCE","BARB"],
        nonWinningWords:["MUSKET","CUTLASS","BAYONET","SPONTOON","CROSSBOW","PISTOL","ARTILLERY","ARQUEBUS","GAUNTLET","BLUNDERBUSS","CATAPULT","CLAYMORE","TRIDENT","REVOLVER","GUNPOWDER","TRUNCHEON","MISSILE","EXOCET","GRAPESHOT","SCIMITAR","TOMAHAWK","BOURDON","BULLET","CANISTER","CORSELET","BATON","SLING","BROADSWORD","POWDERHORN","KNOBSTICK","BREASTPLATE","QUARREL","ASSEGAI","HACKBUT","HARPOON","ARBALEST","BLOWPIPE","SHRAPNEL","SIDEWINDER","CLUB","POKER","CANNON","RAMROD","REPEATER","FLINTLOCK","CHOPPER","BOOMERANG","MATCHLOCK","POIGNARD","CALIVER","RAPIER","SHIELD","CARTRIDGE","GELIGNITE","CLARION","FLAGELLUM","CUDGEL","KNOBKERRIE","BODKIN","CARRONADE","BOMBARD","FOIL","PIKE","BANDOLIER","FIRELOCK","KNIFE","RIFLE","CARBINE","GRENADE","PLACARD","DAGGER","MACE","HALBERD","FLAIL"],
        winningGame: [
            "  sWORd    G   ",
            "  I   A  mAuSEr",
            "bArB  R  O N  A",
            "O E JEt brAss M",
            "mInE  sHot  P  ",
            "B   H   laNCe B",
            " DEToNAtor  A O",
            "H   W  O  aRrOw",
            "E QUiVEr  X    ",
            "L   T  P PetARd",
            "mAGAzINe   A  I",
            "E   E  dERInGEr",
            "tABArD O   K  K"]))

        games.append(GameModel(gameId:9412, maxWidth:17, maxHeight:15, winningScore:874, tags:[],
        winningWords:["JOY","YULE","AWAY","HAY","EGYPT","NATIVITY","MYRRH","SNOW","GLORY","SON","STAR","HOLLY","FROST","KISS","PRAYER","WISH","SPIRIT","SAINT","EAST","STALL","BLESS","WATCH","TIDINGS","FEAST","LOVE","NIGHT","STABLE","EVE","INN","THREE","FATHER","NOEL","HALO","MAGI"],
        nonWinningWords:["NAZARETH","BALTHAZAR","SAVIOUR","CHRISTIANITY","TESTAMENT","PASSOVER","DONKEY","WORSHIP","WINTER","SCRIPTURE","CHIMNEY","CHRISTMAS","MISTLETOE","GIFTS","SERMON","SILVER","FESTIVE","GOSPELS","HOLIDAY","DAMASCUS","COVENANT","FESTIVAL","ADVENT","WENCESLAS","KINDNESS","MESSIAH","KINGS","MESSAGE","AURA","NOWELL","REVELATION","JERUSALEM","SHEPHERDS","CAROLS","GASPAR","TEMPLE","REDEMPTION","BORN","SHEEP","DOCTRINE","GOODWILL","ANGELS","CHURCH","FLOCKS","ISRAEL","FLIGHT","HEAVEN","BELLS","FAITH","HOPE","FRANKINCENSE","LEGENDS","MANGER","DAVID","JUDEA","TEACHER","AMEN","FIELDS","MELCHIOR","BETHLEHEM","HEROD","DOLL","GOLD","CHILDREN","HERALD","DECEMBER","CRADLE","CHILD","PEACE","GALILEE","BABE"],
        winningGame: [
            " fEAsT wAtCH N ",
            " A  P  I H   I ",
            " tIDiNGs R MAgI",
            " H  R  H E   H ",
            " E  iNN  eGyPt ",
            "FrOst  J   U  M",
            "   A  soN GlORy",
            "nATiVIty K E  R",
            "O  N  A  I  H R",
            "eAst  blEss O H",
            "L N hAlo stAlL ",
            "  O A evE A L  ",
            " AwAy  E PrAyER"]))

        games.append(GameModel(gameId:9501, maxWidth:17, maxHeight:15, winningScore:800, tags:[],
        winningWords:["BUY","DUTY","SUM","EQUITY","BUYER","ASSETS","UNIT","FUTURES","BUSINESS","STAMP","TERMS","HOUSE","INTEREST","RUIN","YIELD","BULLS","TITLE","AUCTION","AUTOMATED","RISK","SHARES","TRANSFER","LOANS","BONDS","GILT","CASH","PAR","SALE","BOOK","DEBT","FREE","FEE"],
        nonWinningWords:["TAX","ORGANIZATION","REGISTRY","PAYMENT","CAPITALIZE","INVESTORS","STOCKS","LIQUIDITY","PROSPECTUS","COMPANY","VENTURE","INVESTMENT","QUOTATION","COUPONS","DISCOUNT","ORDINARY","IMPUTATION","SPECULATORS","MAXIMUM","UNDERWRITERS","OPTION","IMPORTANT","MULTIPLES","SECURITIES","WARRANT","NOTE","OWNERSHIP","COMMISSION","TRANSACTION","VALUE","LIABILITY","ASSOCIATION","CONTRACT","ACCOUNT","PROFIT","DEBENTURES","CORPORATION","PURCHASE","RATE","CONTANGO","OBLIGATIONS","MARKET","STOCKHOLDING","LEGISLATION","SELL","WALL","EARNINGS","BANKS","FACTOR","TRADING","BEARS","CLIENT","BANKERS","MANAGEMENT","SHAREHOLDING","CERTIFICATE","CAPITAL","ACCRUE","INCOME","DEALERS","CHARTERED","DIVIDEND","EXCHANGE","PRICE","BROKERAGE","PREFERENCE","JOBBER","BARGAIN","CLEARING","CLAIM","FINANCE","DEFERRED"],
        winningGame: [
            " A U bUlLs   D ",
            "RuIn U O A  FeE",
            " C I Y A L D B ",
            " tItLe N eQuIty",
            " I   rIsK  T  I",
            "BoNDs    bUy  E",
            " N  H  F O  S L",
            "G   A auToMAtEd",
            "iNTErEst K  A  ",
            "L   E suM C M F",
            "tRANsFer  A pAr",
            "      teRMs   E",
            "BUSINEss  hOUSe"]))

        games.append(GameModel(gameId:9502, maxWidth:17, maxHeight:15, winningScore:654, tags:[],
        winningWords:["ZONE","TRAPEZIUM","TORUS","LOCUS","EVOLUTE","ROULETTE","PRISM","OCTANT","SECTOR","SHEET","TRIDENT","HYPERBOLA","CYLINDER","QUADRANT","LUNE","SPLINE","OGIVE","SOLID","KITE","RHOMB","CUBE","CONOID","CONE","CONIC","LAMINA","LINE","ARC"],
        nonWinningWords:["POLYGON","ANNULUS","INVOLUTE","PYRAMID","CATENARY","SQUARE","WITCH","POLYHEDRON","ANTIPRISM","TAUTOCHRONE","RADIUS","SEGMENT","TANGENT","CYCLOID","PSEUDOSPHERE","OVAL","HYPERBOLOID","CISSOID","CYLINDROID","SERPENTINE","MULTIFOIL","PRISMOID","LOXODROME","LOOP","FOLIUM","SPIRAL","EPICYCLE","PENTAGON","TETRAHEDRON","DIRECTRIX","OCTAGON","SURFACE","SPHERE","ISOCHRONE","HEPTAGON","SPHEROID","CRUCIFORM","LEMNISCATE","NORMAL","HEXAGON","TREFOIL","ENVELOPE","PENTAHEDRON","HELIX","TRIANGLE","PENTANGLE","OCTAHEDRON","EPITROCHOID","QUADRILATERAL","ICOSAHEDRON","HEMISPHERE","ELLIPSE","PERPENDICULAR","NAPPE","HEXAHEDRON","QUADRANGLE","CATENOID","RHOMBOID","WEDGE","SEMICIRCLE","LIMACON","CIRCUMFERENCE","GEODESIC","PARALLELOGRAM","CHORD","PLANE","PARABOLOID","CONCHOID","CONICOID","PENCIL","PARABOLA","DECAGON","CARDIOID","CIRCLE"],
        winningGame: [
            " C  A C lOCUs  ",
            "HyPErBoLa   P  ",
            " L  C N M sOlID",
            "KiTE  oGiVe I  ",
            " N  L I N cOnE ",
            " D QuAdraNt E C",
            " E  N  O  O   U",
            "trApezIuM rHoMb",
            "O  R O L C  C E",
            "R  I N eVoLUtE ",
            "U  sHeEt N  A  ",
            "S  M   tRiDEnT ",
            "    LINe C  T  "]))

        games.append(GameModel(gameId:9503, maxWidth:17, maxHeight:15, winningScore:746, tags:[],
        winningWords:["SULKY","SHAY","YAWL","LORRY","TILBURY","BUGGY","BUS","YACHT","DRAY","JITNEY","JALOPY","TAXI","TRUCK","TUBE","VAN","LITTER","SHIP","COASTER","HANSOM","SALOON","WAIN","SAMPAN","CART","TANKER","MONORAIL","SEDAN","SLEDGE","GIG","BIKE","CAB"],
        nonWinningWords:["ZEPPELIN","BULLDOZER","DROSHKY","MOTOR","SNOWPLOUGH","OMNIBUS","SCOOTER","TRACTOR","PADDYWAGON","AUTOGIRO","WAGONETTE","PENNYFARTHING","LIMOUSINE","OUTBOARD","ROADSTER","HOTROD","TRAIN","WAGON","LOCOMOTIVE","QUADRICYCLE","FLIVVER","SUBMARINE","PULLMAN","RICKSHAW","SCHOONER","AUTOMOBILE","BARQUENTINE","FUNICULAR","BICYCLE","HOVERCRAFT","LANDAULETTE","ROCKET","PALANQUIN","CONVERTIBLE","BROUGHAM","TOBOGGAN","SPEEDBOAT","CHARIOT","MONOPLANE","SLED","HURDLE","LAUNCH","PANTECHNICON","BRIGANTINE","HELICOPTER","CURRICLE","CARAVAN","SLEIGH","CATAMARAN","BAROUCHE","FRIGATE","LINER","BALLOON","CLIPPER","GONDOLA","BUCKBOARD","DIESEL","CONCORDE","LIFEBOAT","VELOCIPEDE","AEROPLANE","PLANE","CANOE","CAR","JEEP","GLIDER","CARRIAGE","COACH","DILIGENCE","FIACRE","HACK"],
        winningGame: [
            "sHAy  V J   bUs",
            "L  A taXi S I H",
            "E  wAin tRuCk I",
            "D  L L  N L E P",
            "gIG  B  E K    ",
            "E   BuGGy yACHt",
            " C C R        A",
            "JaLoPy H sAlOOn",
            " B A   A A I  K",
            "   sEdAn M tUBe",
            "CARt R S P T  R",
            "   E A O A E   ",
            " LOrRy mOnOrAIL"]))

        games.append(GameModel(gameId:9504, maxWidth:17, maxHeight:15, winningScore:824, tags:[],
        winningWords:["ENZYMES","SAVOURY","SWISS","YEAST","INDUSTRY","YAK","GORGONZOLA","BYRE","TINT","COWS","GRUYERE","DAIRY","DERBY","GOATS","EWES","DESSERT","MATURE","RAW","WHITE","KETONES","SKIM","CHURN","FAT","SAPID","AROMA","FETA","MILK","CREAM","BAR","HARD","ACID","AGED"],
        nonWinningWords:["PIZZA","MOZZARELLA","SWITZERLAND","YELLOW","GUERNSEY","TEXTURE","JERSEY","STILTON","STRONG","PHOSPHORUS","AYRSHIRE","VITAMINS","CULTURE","PASTEURISE","ACIDITY","PIQUANT","HOOPS","ROQUEFORT","FLAVOUR","RICOTTA","BUTTERMILK","DAIRYMAIDS","ACIDULOUS","PROVOLONE","CRIMSON","PROTEIN","MOULD","SHARP","SEASONING","RENNET","PEPTIDES","MARES","COTTAGE","LACTOSE","CURD","SALTED","DEVONSHIRE","TECHNIQUE","PARMESAN","SMOKED","FERMENT","NETHERLANDS","GOUDA","FONDUE","RENNIN","MICROBES","LIMBURGER","CURED","LLAMAS","RAREBIT","CAROTENE","EMMENTHAL","CASEIN","SLICE","CAMEMBERT","CALCIUM","CHESHIRE","TABLE","BUFFALO","FARMER","PENICILLIN","BACTERIA","ACETIC","CACHAT","CHEESE","MILD","RAIL","BRIE","FRANCE","EDAM","CHEDDAR"],
        winningGame: [
            "sAPiD  B  DeRBy",
            "K  N A A   N  E",
            "I  D gOrgONzOLa",
            "mATuRe  O  Y  S",
            "   S D  arOmA T",
            "WhItE FEta E   ",
            " A R C  swIss K",
            "GrUyErE     A E",
            " D   E ByRE V T",
            "A E Fat A   O O",
            "cOwS miLk CHuRn",
            "I E   N     R E",
            "dEsSERt DAIRy S"]))

        games.append(GameModel(gameId:9505, maxWidth:17, maxHeight:15, winningScore:748, tags:[],
        winningWords:["PRIZE","ZIPPERS","LUXURY","BUYER","QUALITY","MONEY","ASSETS","PURSE","STORE","TRAPS","DISPLAY","POSTER","SHEETS","STOCK","GROCERY","EWERS","WARES","SOAP","LIFTS","GOODS","STAFF","ITEM","SPEND","SILK","CASH","DESK","SALE","CREDIT","FIRM"],
        nonWinningWords:["PAYMENT","TOWELS","TURNOVER","SHOWROOMS","BUSINESS","RESTAURANTS","PERFUMERY","CONSUMERS","DISTRIBUTOR","IRONMONGERY","FURNITURE","DRAPERY","SUPPLIER","COSMETICS","JEWELLERY","MILLINERY","DISHWASHERS","MANUFACTURERS","SHEARS","EMPORIUM","ACCOUNT","PROFIT","LIQUIDISERS","NUTCRACKERS","ESCALATORS","PERCOLATORS","ORDERS","RECEIPTS","CATALOGUES","DEPARTMENT","SERVICE","HABERDASHERY","MANCHESTER","REFRIGERATORS","MARKET","VEGETABLES","FASHION","TRADING","CLOTHING","MARKETING","SHOPKEEPER","TRADE","RETAIL","LIGHTING","BARGAINS","MATERIAL","TOBACCO","APPLIANCES","BRANCHES","HARDWARE","OVERHEAD","CASHIER","CHARGES","MERCHANDISE","FOOD","RECORD","HANDBAGS","MANAGER","CHAIN","BEDDING"],
        winningGame: [
            "pRIzE StOcK S D",
            "O  I C R A  P I",
            "sOAp R A sHEeTs",
            "T  P E P H  N P",
            "E  E dEsK S D L",
            "R  R I    T   A",
            " AssetS GRoCERy",
            "  T W  L  R    ",
            "S A E PuRse B G",
            "A firM X I  U O",
            "lIfts QuAlITy O",
            "E  E   R K  E D",
            "   mONEy  WArEs"]))

        games.append(GameModel(gameId:9506, maxWidth:17, maxHeight:15, winningScore:706, tags:[],
        winningWords:["BUZZARD","QUETZAL","OSPREY","SWAN","STORK","SPARROW","OWL","EMU","BLUETIT","CROW","TERN","WREN","PARROT","BITTERN","RATITE","LYREBIRD","STARLING","AUK","GULL","QUAIL","CUCKOO","IBIS","ROBIN","ORIOLE","BROLGA","RAIL","COB","EIDER","EAGLE"],
        nonWinningWords:["RAZORBILL","CASSOWARY","VULTURE","TITMOUSE","SKYLARK","SWALLOW","PITTA","CANARY","NUTHATCH","HONEYEATER","OSTRICH","ALBATROSS","FROGMOUTH","STONECHAT","SANDGROUSE","CURRAWONG","GOSHAWK","GOOSE","CORMORANT","KITTIWAKE","KESTREL","FLYCATCHER","BULBUL","PHEASANT","RAVEN","WAGTAIL","GANNET","PETREL","PTARMIGAN","JACKASS","LAPWING","MOORHEN","SANDPIPER","THORNBILL","DARTER","ROSELLA","COCKATOO","SHELDUCK","WOODCOCK","KOOKABURRA","WEAVERBIRD","HUMMINGBIRD","MOA","HERON","MACAW","CONDOR","WHIPBIRD","PARTRIDGE","WOODPECKER","BUTCHERBIRD","BOWERBIRD","GROSBEAK","ROLLER","KINGFISHER","NIGHTINGALE","FANTAIL","HORNBILL","COLIN","BUDGERIGAR","HARRIER","BULLFINCH","DODO","BLUEBIRD","FLAMINGO","MOCKINGBIRD","MAGPIE","JACKDAW","GREENFINCH","FALCON","MALLARD","PELICAN","GOLDFINCH","PEACOCK","RIFLEBIRD","BLACKBIRD","CHAFFINCH","DABCHICK"],
        winningGame: [
            "C  BrOLGA RObIN",
            "O A A    C  U  ",
            "bLuEtIt QuETzAL",
            "  K I E  C  Z  ",
            "I  storK K  A L",
            "bITtern  osPrEy",
            "I  A I Crow D R",
            "spArRoW A A   E",
            " A L L  I N   B",
            " R I eAglE    I",
            "WrEn   U  eIDEr",
            " O G OWl  M   D",
            " T     L QuAIL "]))

        games.append(GameModel(gameId:9507, maxWidth:17, maxHeight:15, winningScore:802, tags:[],
        winningWords:["RAZZAMATAZZ","ZOO","TRAPEZE","GYMNAST","ARTISTS","SHOW","NETS","STAR","TENT","FLYER","TRUCK","TUMBLERS","ACTORS","FUN","VAN","BUSKER","LIONS","RISK","WHIP","CLOWN","WAGON","TAMER","TRAINER","ACT","ROPE","SKILL","BEARS","RING","MAGIC","BAND","CAGE"],
        nonWinningWords:["SAWDUST","VARIETY","STUNTMAN","MONKEYS","ASSISTANT","SOMERSAULTS","COSTUME","ROUSEABOUT","COMEDY","HORSES","SPOTLIGHT","SIDESHOW","MUSICIANS","TIGHTWIRE","ATTRACTION","EQUESTRIAN","ANTICS","CIRCUS","HARNESS","BICYCLES","TIGHTROPE","UNIFORM","CANVAS","FEATS","EXCITEMENT","RINGMASTER","SHOWPEOPLE","SPANGLES","ADVERTISING","BARNUM","APPLAUSE","CAROUSEL","CROWD","POPCORN","SPECTACULAR","LAUGHTER","ELEPHANTS","TIGER","FERRIS","MAKEUP","GREASEPAINT","AERIALIST","BANDSTAND","ANIMALS","JUGGLER","PERFORMER","SPECTACLE","DAREDEVILS","CARNIVAL","ACROBAT","CARAVAN","HOOPLA","POLE","ROAD","RIDER","AUDIENCE","MENAGERIE","ARENA","DANGER","MAGICIAN","PARADE","BALANCING","BILLBOARD","FANFARE","BALANCE","BAREBACK"],
        winningGame: [
            " T BaND CLOwN B",
            "FuN C      H  U",
            " M StAr R LiONs",
            " B  O O A  P  K",
            " L trApEzE  G E",
            "BeArs E Z FLyEr",
            " R A    A   M  ",
            " sKiLL  M Van N",
            "   N  M A  caGe",
            "tAMer aRtIsts T",
            "E  riNg A H T S",
            "N   S I zOo    ",
            "tRUCk C Z wAGON"]))

        games.append(GameModel(gameId:9508, maxWidth:17, maxHeight:15, winningScore:778, tags:[],
        winningWords:["SLIVOVITZ","RYE","USSR","TURKEY","TOKAY","SHERRY","WINERY","ITALY","PERRY","RUM","SWEET","MALMSEY","PORT","AZERBAIJAN","WATER","ROSE","SOIL","CORKS","SPAIN","WINE","GRAPES","NOG","VODKA","CASK","GROG","RHONE","CHIANTI","GIN","APPLE","GREECE"],
        nonWinningWords:["WHISKY","BURGUNDY","MANZANILLA","HUNGARY","SPIRITS","MUSCAT","VERMOUTH","BOUQUET","CHERRY","CULTURE","HARVEST","BRANDY","CANARY","WINEPRESS","DESSERT","EXTRACT","SAUTERNE","ODOUR","WHITE","MUSCATEL","PORTUGAL","RETSINA","AUSTRALIA","DUBONNET","PUNCH","CHARDONNAY","BOURBON","VINTAGE","CRUSHED","WEATHER","BORDEAUX","CALVADOS","SPARKLING","KIRSCH","MOSELLE","AROMATIC","RIESLING","MARSALA","ARGENTINE","BEAUJOLAIS","APERITIF","VINIFERA","CLARET","AROMA","JUICE","DRAMBUIE","CLIMATE","COLLECT","FORTIFIED","LOIRE","RHINE","TABLE","PERENNIAL","CAMPARI","CHABLIS","BEVERAGE","BENEDICTINE","ALCOHOL","CHAMPAGNE","COGNAC","FRANCE","MADEIRA","ALGERIA","MALAGA","CIDER","PEACH","MEAD"],
        winningGame: [
            "  S  APpLE U W ",
            "R P G  O   sOiL",
            "O A R graPEs N ",
            "sLivoVitz  R E ",
            "E nog N E   P  ",
            "   D   GrEECe  ",
            "cAsk    B   rUm",
            "H watER A   R A",
            "I E U  WiNEry L",
            "A E R R J  H  M",
            "N tOkAy A CoRKs",
            "T   E E N  N  E",
            "iTALy    SHeRRy"]))

        games.append(GameModel(gameId:9509, maxWidth:17, maxHeight:15, winningScore:762, tags:[],
        winningWords:["ZEUS","ZEALOTS","YORK","ROMSEY","PRIORY","GROTTO","TOTEM","VESPERS","TRANSEPT","PULPIT","SHINTO","FONT","TOMB","WELLS","ABBEY","EASTER","SPIRE","PISA","BISHOP","NAVE","SHRINE","SEE","ALTAR","ICON","KIRK","BEADS","ARK","GRAIL","KALPA","NICHE"],
        nonWinningWords:["MUEZZIN","OLYMPUS","SANCTUARY","MONASTERY","SALISBURY","SYNAGOGUE","WESTMINSTER","MOSQUE","CANTERBURY","ACOLYTE","LAMASERY","WORSHIP","AVESTA","MINSTER","WORCESTER","EPIPHANY","MISSAL","BRISTOL","JUPITER","GLOUCESTER","WINCHESTER","COMMUNION","EXETER","CLOISTER","MANTRA","OXFORD","CHARTRES","PETERBOROUGH","CHESTER","NORWICH","STEEPLE","PARTHENON","LIVERPOOL","MINARET","NIRVANA","REQUIEM","DURHAM","TEMPLE","KRISHNA","VICAR","CENOTAPH","ORGAN","ARCHBISHOP","APOLLO","ASGARD","BELLS","CANON","HOPE","LINCOLN","CARLISLE","CHOIR","DIOCESE","CANDLEMAS","VALHALLA","CATHEDRAL","BASILICA","HEREFORD","PREACHER","PAGODA","KEEP","RELIC","DEACON","CARDINAL","ARCHANGEL","CHAPEL","DEAN"],
        winningGame: [
            "W nAvE  ALtAR E",
            "E I E B   R   A",
            "L C S I BEaDs S",
            "L H pIsA  N H T",
            "sEe E H   sPiRe",
            "   prIoRy E N R",
            " zEus P O P T  ",
            " E L   grOtto A",
            "KaLpA Ark  O  B",
            " L I I A K tOMb",
            "FoNt C I I E  E",
            " T   O L rOmSEy",
            " sHRInE  K     "]))

        games.append(GameModel(gameId:9510, maxWidth:17, maxHeight:15, winningScore:706, tags:[],
        winningWords:["KAZOO","ZITHER","WURLITZER","ZAMPOGNA","TUDUM","LYRE","PSALTERY","MUSETTE","SPOONS","LUTE","SITAR","SPINET","DRUM","RATTLE","VIOL","CORNET","VIOLIN","TABOR","HORN","PANPIPE","DARBUK","HARP","PIPE","OBOE","OCARINA","CELLO","FIFE"],
        nonWinningWords:["SYMPHONIUM","TRUMPET","XYLOPHONE","QUINTON","CYMBALS","CASTANETS","SAXHORN","WHISTLE","SOUSAPHONE","BASSOON","VIOLETTA","GUITAR","GITTERN","SACKBUT","EUPHONIUM","FLUTE","AUTOHARP","SAXOPHONE","CONTRABASS","KETTLEDRUM","COMPONIUM","TROMBONE","TAMBOURINE","TIMPANI","MANDOBASS","CORNO","VIOLA","TIMBALES","FLEXATONE","CELESTE","CLAPPERS","VIRGINAL","KONIGHORN","VIOLONCELLO","GONG","ORGAN","PIANO","SHAKER","ALPHORN","TRIANGLE","FLUGELHORN","HARPSICHORD","CLARINET","DULCIMER","MARACAS","LIRONE","RACKET","BUGLE","MANDOLIN","COWBELL","SHIELD","BOMBARDON","MELODEON","CLAVICHORD","PICCOLO","HARMONICA","CARILLON","RECORDER","ACCORDION","FLAGEOLET","GADULKA","UKELELE","BANJO","DIDGERIDOO","GEKKIN","BAGPIPE","CALLIOPE","BANJOLELE","ALBOKA","HANDBELL","CRECELLE","BELL","BALALAIKA","FIDDLE"],
        winningGame: [
            " dARBUk H cELLo",
            " R    A A O   B",
            "WuRlITzEr R F O",
            " M U  O pAnPiPe",
            "S  tABoR  E F  ",
            "pIpe    zItHer ",
            "O S     A    A ",
            "oCaRINA mUsETtE",
            "N L     P P  T ",
            "sItAR vIoLiN L ",
            "  E   I G N  E ",
            "  R  HoRn E    ",
            " LyRE L A tUDUM"]))

        games.append(GameModel(gameId:9511, maxWidth:17, maxHeight:15, winningScore:772, tags:["P","P33"],
        winningWords:["ZIGZAGGER","ZIPPERS","CUT","WOOLS","SATINS","VELVETS","CROSS","PRESS","TUCK","WELT","ADJUST","MUSLIN","WORK","SEAMS","ART","SLEEVES","PLEATS","CANVAS","WEAVE","WEAVING","TIE","DRAWN","IRON","PIN","RAISE","BIAS","DIOR","PIPED","WELDED","REEL","LACE"],
        nonWinningWords:["TAPESTRY","VESTMENTS","SCISSORS","BRUSSELS","EYELET","PATTERNS","STITCHES","TATTING","BUTTONHOLES","KNOT","DARTS","DRESS","OVERCAST","SEWING","POCKETS","RUNNING","GARMENTS","KNITTING","QUILTING","WAISTLINE","MEASUREMENT","MONOGRAMS","FITTING","DRESSMAKERS","PUNCH","EMBROIDERY","HEMS","GATHERS","VENETIAN","ARRAS","BOUND","RUFFLES","SHIRRING","SMOCKING","MOSAIC","RHODES","ELASTIC","TAILORING","GODET","INTERLINING","RENAISSANCE","HANGINGS","CRAFT","MOIRE","SHELL","DESIGN","CROCHET","GOBELINS","MATERIAL","TACKING","THIMBLE","BRAIDS","CREWEL","NAPKIN","THREAD","BATIK","INTERFACING","FILLET","DECORATE","LINEN","ARMHOLE","DARNING","FEATHER","NEEDLES","RICHELIEU","MEND","FANCIFUL","PINKED","CANDLEWICK","BRODERIE","BOBBIN","LAPPED","BARGELLO","DELICATE","CHAIN","MADEIRA","FABRIC","EDGE"],
        winningGame: [
            "zIGZaGGER C   A",
            "I   R     R   D",
            "P   tIE DIoR  J",
            "pIN    P  S L U",
            "E  P wOrK sEams",
            "rEEl E E W  cut",
            "S  E A sLeEves ",
            "  CaNvAs L E L ",
            "D  T E   D L I ",
            "rAisE B weAvInG",
            "A R  PiPed E   ",
            "wOoLS A L  tUCK",
            "N N   sAtINs   "]))

        games.append(GameModel(gameId:9512, maxWidth:17, maxHeight:15, winningScore:764, tags:[],
        winningWords:["TANSY","SAVORY","CURRY","THYME","BAY","COSTMARY","BETONY","SALSIFY","ROSEMARY","MULBERRY","PORT","SALT","CHERRY","MINT","COMFREY","RUE","CRANBERRY","SPICES","PIMENTO","CICELY","MELONS","SESAME","LEMON","LIME","COCOA","FENNEL","BALM","MACE"],
        nonWinningWords:["BRAZIL","HYSSOP","DITTANY","EUCALYPTUS","PARSLEY","MUSTARD","CARAWAY","NUTMEG","SASSAFRAS","CRESS","SHALLOTS","BURNET","CHICORY","ZINGIBERACEAE","CLOVES","CAYENNE","TURMERIC","SPEARMINT","WOODRUFF","SHALLOT","SORREL","CUMIN","SMOKE","LEMONGRASS","CAPSICUM","ONION","PEPPERMINT","JUNIPER","WINTERGREEN","CASSIA","TARRAGON","GRAPEFRUIT","APRICOT","TABASCO","NECTARINES","HOREHOUND","GINSENG","SAFFRON","ANISE","HERBS","SARSAPARILLA","BERGAMOT","FEVERFEW","BLACKCURRANT","SAGE","LOVAGE","PEPPER","CINNAMON","MARJORAM","AVOCADO","CHERVIL","OREGANO","VANILLA","VERBENA","AROMA","BASIL","CHIVE","PINE","LAVENDER","CARDOON","ALMOND","ORANGE","FENUGREEK","ALLSPICE","MANDARIN","ANISEED","PAPRIKA","PINEAPPLE","GINGER","CARDAMOM","CORIANDER","CAMOMILE","CALENDULA","DANDELION","BORAGE","LICORICE","GARLIC","DILL","ANGELICA","FIG","LEEK"],
        winningGame: [
            "SpIcEs mACE B C",
            " I H E E    E O",
            " M E sAlT   T S",
            " E R A O   PoRt",
            " N R mInt   N M",
            " tHyme saVOry A",
            " O  U C N  O  R",
            "  B L U sALsIfy",
            "cRaNbErRy  E E ",
            "O L E R  lEmOn ",
            "cOmFrEy  I A N ",
            "O   R    M rUe ",
            "A BAy CICeLy L "]))

        games.append(GameModel(gameId:9601, maxWidth:17, maxHeight:15, winningScore:800, tags:[],
        winningWords:[
            "MIZZEN","PRIZE","YAWL","DORY","PUNT","TUG","ARGOSY","WHERRY","TUB","SCOW",
            "FERRY","DUGOUT","TOSHER","ROWBOAT","TRAMP","GALLEY","JUNK","SHIP","SLAVER","TRAWLER",
            "BOAT","RAFT","SHOALER","KETCH","SKIFF","LOG","ARK","COG","GALLEON","BRIG",
            "GIG","BARGE","COBLE"],
        nonWinningWords:[
            "CAPSIZE","YACHT","DESTROYER","CUTTER","BOWSPRIT","VESSEL","PONTOON","TUGBOAT","DINGHY","SHOWBOAT",
            "KAYAK","SLOOP","CORVETTE","MOTORBOAT","PUTELI","WARSHIP","HOUSEBOAT","CRUISER","GUNBOAT","OUTRIGGER",
            "SMUGGLER","COASTER","STEAMER","DHOW","SAMPAN","PRIVATEER","SUBMARINE","HULK","SCHOONER","TRIMARAN",
            "BARQUENTINE","CORSAIR","TRIREME","UMIAK","HOVERCRAFT","PIRATE","TANKER","PROA","SPEEDBOAT","BARQUE",
            "LUGGER","TENDER","TRADER","WHALEBOAT","WINDJAMMER","MERCHANTMAN","CRAFT","SHELL","LAUNCH","WHALER",
            "DRIFTER","LIGHTER","BRIGANTINE","CARVEL","PACKET","SEALER","CATAMARAN","FREIGHTER","FLAGSHIP","FRIGATE",
            "LINER","GONDOLA","DERELICT","LIFEBOAT","PINNACE","PADDLEBOAT","INDIAMAN","COCKLESHELL","LOCKER","COLLIER",
            "CANOE","BIREME","FELUCCA","CORACLE","DREDGER","BINNACLE"],
        winningGame: [
            "  G   C W tRAMp",
            "sHiP toShEr   U",
            "K G Tug E A C N",
            "I  A B  rOwBoAt",
            "fERry   R L B  ",
            "F  gaLLEy E lOg",
            " sCow     R E A",
            " H slAVEr     L",
            "DoRy    A   P L",
            " A  J B F bArGe",
            " L DuGoUt R I O",
            " E  N A  MiZzEn",
            "ArK kEtCH G E  "]))

        games.append(GameModel(gameId:9602, maxWidth:17, maxHeight:15, winningScore:844, tags:[],
        winningWords:["ZOOM","RAYS","SUN","HYPO","MAGAZINES","EYE","SHOT","SHOOT","SPOOLS","VIEW","VISION","PRISM","STILL","BOX","MAGNIFY","SNAP","BULBS","COLOUR","TRIPOD","CUBES","LENS","TIME","MAXWELL","MIRROR","BICONVEX","METER","TAPE","LEVER","LIGHT","PLATE","ROLL","SCENE","IMAGE"],
        nonWinningWords:["CRYSTALS","SHUTTER","SNAPSHOTS","RUSHES","STUDIO","INFINITY","EXPOSURE","SENSITIVE","PHOTOGRAPHY","POSITIVE","BRADY","FOCUS","PRINT","PORTRAIT","ROTOGRAVURE","SENSITISED","GLASS","ATTACHMENTS","SILVER","EMULSION","AUTOMATIC","FIXES","SHADOW","TALBOT","PICTURE","TELEVISION","APERTURE","FLUORESCENT","MINIATURE","TELEPHOTO","BELLOWS","FILTERS","HELIOGRAPHY","MATCHBOX","LEAVES","FILMS","NEGATIVE","DISTANCE","VIDEO","CARTRIDGES","VIEWFINDER","FIXING","SCREEN","LUMIERE","PHOTOCELL","PICTORIAL","PAN","BULB","SPEED","MAPPING","DARKROOM","ENLARGEMENT","DEVELOPER","PROJECTED","CHARGERS","BROMINE","OBJECT","REFLEX","FLASH","POLAROID","FLICKS","HERSCHEL","CELLULOID","RECORD","ENLARGER","BLADES","DIAPHRAGM","INFRARED","FRAME","ARCHER","CINEMA","NIEPCE","DARK","LOAD","CAMERA","LEAF"],
        winningGame: [
            "TImE  lEvEr I P",
            "  A   E I O M L",
            "mAgAzInEs L A A",
            "E N O S I lIght",
            "tRiPoD boX  eye",
            "E F M Sun B  P ",
            "rAys   L MiRRoR",
            "   H C B  C    ",
            "S  O O spOoLs  ",
            "H stIlL R N C  ",
            "O N  O  I vIeW ",
            "O A CuBEs E N  ",
            "tApE R  mAxWeLL"]))

        games.append(GameModel(gameId:9603, maxWidth:17, maxHeight:15, winningScore:680, tags:[],
        winningWords:["ESSAY","SPURS","QUEST","LISTS","TILTYARD","COURT","PANOPLY","SWORD","SURCOAT","CAVALRY","CUIRASS","QUIVER","SQUIRE","VALOUR","CREST","ARMS","PALFREY","WARRIOR","CASTLE","GORGET","JENNET","VIGIL","HERO","RANK","PRINCE","EPIC","HERALD"],
        nonWinningWords:["SUZERAIN","TRUMPETS","EMBLAZONMENT","VENTURE","JOUSTING","TROUBADOURS","TOURNAMENT","MINSTRELS","PAGEANTRY","CHIVALRY","FROISSART","GALLANTRY","HONOUR","PORTCULLIS","GAUNTLET","ARROW","ARMOUR","PENNONS","BASSINET","ABBEY","RUEFUL","TILTING","ADVENTURE","CRUSADERS","HERALDRY","BATTLEMENT","ESCUTCHEON","ARMOURER","HELMETS","CORSELET","ENSIGN","STANDARD","BATTLEAXE","HATCHMENT","GUERDON","GLOVE","GARTER","KNIGHT","INTREPID","CAPARISON","ALTAR","FEUDALISM","KNIGHTHOOD","SEEK","AWARD","COURAGE","ACHIEVEMENT","SARACEN","DAMSEL","FAITH","ORDER","CHAMPION","GONFALON","HAUBERK","LEGENDS","SHIELD","TABARD","BANNER","IDEALS","FLETCHER","MEDIEVAL","DRAWBRIDGE","DEEDS","NOBLE","ACHIEVE","SCABBARD","GRAIL","ARCHER","MAIDEN","CHARLEMAGNE","CHALLENGER","FANFARE","LANCE","HALL","BALDRIC","ALLEGIANCE","ACCOLADE","GALAHAD"],
        winningGame: [
            "   hERO P cRESt",
            " Q E    A A   I",
            "CuIrAsS N vIgIl",
            " I A P  O A O T",
            " vAlOuR pAlFrEy",
            " E D R  L R G A",
            " R  essAy Y E R",
            "S P P U  C  T D",
            "wArRiOr  A Q A ",
            "O I C C  sQuIrE",
            "rAnK CoURt E M ",
            "D C   A  lIsTs ",
            " JeNNEt  E T   "]))

        games.append(GameModel(gameId:9604, maxWidth:17, maxHeight:15, winningScore:720, tags:[],
        winningWords:["PIAZZA","MEZZANINE","ZIGGURAT","STUD","ALCAZAR","BAY","HUT","ARMOURY","MONASTERY","ATRIUM","WINDOW","LABYRINTH","HOSTEL","ABBEY","GALLERY","EAVES","COTTAGE","THEATRE","ALETTE","DOOR","WALL","SCAPE","PIER","PLAN","DOME","PAGODA"],
        nonWinningWords:["UNIVERSITY","BUTTRESS","GYMNASIUM","OBSERVATORY","DORMITORY","COURT","GROTTO","CLERESTORY","DISPENSARY","SKYSCRAPER","MOSQUE","JOIST","EXIT","JOINERY","STONEMASON","VESTIBULE","CHIMNEY","LIBRARY","ROTUNDA","BELFRY","CASTLES","SOLARIUM","AQUARIUM","PROSCENIUM","DRAUGHTSMEN","COLUMN","MITRE","BLUEPRINT","CLOISTER","MONOLITH","PILASTER","PLASTERER","ANNEX","STEEPLE","APSE","MINARET","PAINTER","PLUMBER","ARCHITECTURE","HOTEL","BRICKLAYER","GRANDSTAND","INN","CUPOLA","TEMPLE","ACROPOLIS","THEODOLITE","ROOF","ARCHITRAVE","INWALL","RAFTER","PEDIMENT","CARPENTER","ERECT","CHURCH","ENTRANCE","LEGATION","VERANDA","BUILD","BUILDER","EXEDRA","PLANK","ANTECHAMBER","CORNICE","CATHEDRAL","BASILICA","CRANE","ARCH","BANK","CEILING","FIREPLACE","EDIFICE","FACADE"],
        winningGame: [
            "T DOmE H  sCApE",
            "H   E  U  T  I ",
            "E   Z atRIum E ",
            "aLCAzAr   doOr ",
            "T   A M    N   ",
            "R wInDoW PIaZzA",
            "E A I U    S I ",
            " plan R COTtAgE",
            "GalleRy    E G ",
            " G E       R U ",
            "HoStEL ABbEy R ",
            " D T     A   A ",
            "EaVeS LAByRINtH"]))

        games.append(GameModel(gameId:9605, maxWidth:17, maxHeight:15, winningScore:840, tags:[],
        winningWords:["USURY","PRIZE","ASSIZES","JURY","SUIT","SURTAX","TESTIMONY","SUMMONS","SUE","USE","WITNESS","WRIT","INSULT","LAWSUIT","TESTATOR","ARREST","ESCROW","PRISON","TREASON","RENT","STEAL","OATH","LAW","ACT","ROB","ABET","CASE","FALSE","LIEN","BAR","BENCH"],
        nonWinningWords:["AVIZANDUM","GUILTY","STATUTE","CRUELTY","PERJURY","BANKRUPTCY","ATTESTATION","MANDATORY","BURGLARY","TRESPASSER","FELONY","INDEMNITY","STIPENDIARY","ESTATE","CONSPIRACY","EXTENUATION","ROBBERY","JUSTICE","WARRANT","ARSON","JUDICIARY","ABSTRACT","INJUNCTION","MAGISTRATE","ACQUITTAL","COLLUSION","SOLICITOR","PRISONER","SUBPOENA","JUDGMENT","CONFESSION","BARRISTER","LITIGANT","VERDICT","PROBATION","ARBITRATION","EXAMINATION","SENTENCE","FORECLOSURE","TRIAL","ATTAINDER","GUARANTEE","LOITERING","ADVOCATE","FORENSIC","REPRIEVE","AWARD","PARDON","ACCUSED","ALIENATION","LICENSING","MAINTENANCE","JUDGE","VALID","PLAINTIFF","CAPITAL","DEFAMATION","PAROLE","REMAND","DEFENDANT","INNOCENCE","CRIME","EVIDENCE","POLICE","APPEAL","IMPEACH","HOMICIDE","DOCK","CHARGE","BLACKMAIL","ILLEGAL","LIBEL","BAIL","DEFENCE","FEE"],
        winningGame: [
            "L aBEt LiEN J S",
            "A C  E  N  SuIt",
            "wItNEsS S S R E",
            "S    T  uSuRy A",
            "uSE Bar L M   L",
            "I    teStImONY ",
            "tREason   O   L",
            "   surtAX N P A",
            "FALse    EsCrOw",
            "   I    O   I  ",
            "PRIzE   aRrEsT ",
            "   E WRIt O O  ",
            " CAsE   H bEnCH"]))
    
    }
}
