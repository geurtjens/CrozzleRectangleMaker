//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    
    
    
   
    
   
    
    
    
    
    
    
    
    
    //public static func
    
    public static func Shapes_8612() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8612) else {
            return
        }
        
        let words = game.winningWords
      
        let len = WordCalculator.lengths(words: words)
        
        let rectangles4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth:3,
            interlockHeight:4,
            words: words,
            lengths:len,
            scoreMin:48,
            widthMax: widthMax,
            heightMax:heightMax))
        
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let C2x3_2x2 = ShapesFromMergesCalculator.Execute2x3And2x2(words: words, scoreMin: 52, widthMax: 17, heightMax: 12)
        
        let ladder2x2x2 = ShapesFromMergesCalculator.Ladder2x2x2(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        

        let hazelnut_merry = ladder2x2x2.containing(["HAZELNUT", "MERRY", "HYMN", "AZURE", "JELLY"], from: words)[0]
        print(hazelnut_merry.ToString(words: words))
        
        
        

        let nazareth_sing = C2x3_2x2.containing(["NUTS","ZION","EVE","NAZARETH","SING","BELLS"], from: words)[0]
        print(nazareth_sing.ToString(words: words))
        
        let toys_tree = rectangles4x5.containing(["TOYS","TREE","TOAST","SAUCE"], from: words)[0]
        print(toys_tree.ToString(words: words))
        
        let joy_holly = edges.containing(["JOY","HOLLY"], from: words)[1]
        print(joy_holly.ToString(words: words))
        
        let joy_jelly = edges.containing(["JOY","JELLY"], from: words)[0]
        print(joy_jelly.ToString(words: words))
        
        let joy_holly_jelly = MergeShapesCalculator.Merge_Two_Shapes(smaller: [joy_holly], larger: [joy_jelly], words: words)[0]
        print(joy_holly_jelly.ToString(words: words))
        
        let fork = Create_Fork(edges: edges, words: words)
        print(fork.ToString(words: words))
        
        // These are just the edges that are in the winning game
        let turkey_hymn = edges.containing(["TURKEY","HYMN"], from: words)
        let turkey_sauce = edges.containing(["TURKEY","SAUCE"], from: words)
        
        let turkey_pork = edges.containing(["TURKEY","PORK"], from: words)
        let inn_hymn = edges.containing(["INN","HYMN"], from: words)
        let hazelnut_star = edges.containing(["HAZELNUT","STAR"], from: words)
        
        let hazelnut_merry_joy = MergeShapesCalculator.Merge_Two_Shapes(smaller: [joy_holly_jelly], larger: [hazelnut_merry], words: words)
        print(hazelnut_merry_joy[0].ToString(words: words))
        
        let hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: hazelnut_merry_joy, larger: [nazareth_sing], words: words)
        print(hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let turkey_sauce_hymn = MergeShapesCalculator.Merge_Two_Shapes(smaller: turkey_hymn, larger: turkey_sauce, words:words)
        print(turkey_sauce_hymn[0].ToString(words: words))
        
        let turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: turkey_sauce_hymn, larger: hazelnut_merry_joy_nazareth, words: words)
        print(turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: [toys_tree], larger: turkey_hazelnut_merry_joy_nazareth, words: words)
        print(toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let toys_family = edges.containing(["TOYS","FAMILY"], from: words)[0]
        print(toys_family.ToString(words: words))
        
        let family_toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: [toys_family], larger: toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let fork_family_toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: [fork], larger: family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: turkey_pork, larger: fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: inn_hymn, larger: pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = MergeShapesCalculator.Merge_Two_Shapes(smaller: hazelnut_star, larger: inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        print("\nWINNING GAME")
        print(ShapeCalculator.Flip(shape:star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0]).ToString(words: words))
    }
    
    public static func Shapes_8612New() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8612) else {
            return
        }
        
        let words = game.winningWords
      
        let len = WordCalculator.lengths(words: words)
        
        let rectangles4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth:3,
            interlockHeight:4,
            words: words,
            lengths:len,
            scoreMin:48,
            widthMax: widthMax,
            heightMax:heightMax))
        
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let C2x3_2x2 = ShapesFromMergesCalculator.Execute2x3And2x2(
            words: words,
            scoreMin: 52,
            widthMax: 17,
            heightMax: 12)
        
        let ladder2x2x2 = ShapesFromMergesCalculator.Ladder2x2x2(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let nazareth_sing_bells = C2x3_2x2.containing(["NUTS","ZION","EVE","NAZARETH","SING","BELLS"], from: words)[0]
        let holly_joy = edges.containing(["HOLLY", "JOY"], from: words)[1]
        let joy_jelly = edges.containing(["JOY", "JELLY"], from: words)[0]
        let jelly_hazelnut_merry = ladder2x2x2.containing(["HAZELNUT", "MERRY", "HYMN", "AZURE", "JELLY"], from: words)[0]
        let hymn_turkey = edges.containing(["HYMN", "TURKEY"], from: words)[0]
        let turkey_sauce = edges.containing(["TURKEY","SAUCE"], from: words)[0]
        let sauce_toys_tree = rectangles4x5.containing(["SAUCE", "TOYS","TREE","TOAST"], from: words)[0]
        let toys_family = edges.containing(["TOYS", "FAMILY"], from: words)[0]
        let hazelnut_star = edges.containing(["HAZELNUT", "STAR"], from: words)[1]
        let hymn_inn = edges.containing(["HYMN", "INN"], from: words)[1]
        let turkey_pork = edges.containing(["TURKEY", "PORK"], from: words)[1]
        let family_white = edges.containing(["FAMILY", "WHITE"], from: words)[0]
        let white_snow = edges.containing(["WHITE", "SNOW"], from: words)[0]
        let white_cake = edges.containing(["WHITE", "CAKE"], from: words)[0]
        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes:[
            nazareth_sing_bells,
            holly_joy,
            joy_jelly,
            jelly_hazelnut_merry,
            hymn_turkey,
            turkey_sauce,
            sauce_toys_tree,
            toys_family,
            hazelnut_star,
            hymn_inn,
            turkey_pork,
            family_white,
            white_snow,
            white_cake
        ], words: words)
        
        print("WINNER ")
        print(result.Flip().ToString(words:words))
        
        
    }
    
    public static func Shapes_8702New() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8702) else {
            return
        }
        
        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        
        // Create required shapes
        let edges = ShapeCalculator.toShapes(edges:EdgeCalculator.Execute(
            words: words,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2_RL_DU(
            start: words,
            end: end,
            len: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square4x4 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Square(
            interlockWidth:3,
            words: words,
            lengths: len,
            scoreMin:76,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let squares3x3 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square3x3_topRight = ShapeCalculator.toShapes(rectangles: RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square3x3_topLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth:2,
            words: words,
            lengths: len,
            scoreMin:72,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let pacman3x3_bottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.bottomRight(
            start: words,
            end: end,
            len: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))

        
        // Assemble the game from the generated shapes
        
        let stock_pay = c2x2[0]
        let stock_debit = square4x4.containing(["STOCK","DEBIT","SALE","COST"], from: words)[0]
        let stock_short = square3x3_topRight.containing(["STOCK","SHORT","COST","BONUS"], from: words)[0]
        let short_units = square3x3_topLeft.containing(["SHORT","BONUS", "UNITS","NET"], from: words)[0]
        let units_bull_sold = pacman3x3_bottomRight[0]
        let bull_notes = squares3x3.containing(["BULL","TRUST","SELL", "NOTES"], from: words)[0]
        let scrip_stock = square3x3_topRight.containing(["STOCK","PARITY", "CASH","SCRIP"], from: words)[0]
        let capital_scrip = squares3x3.containing(["SCRIP","PARITY", "CASH", "CAPITAL"], from: words)[0]
        let capital_scrip2 = squares3x3.containing(["SCRIP","PARITY","CAPITAL","TIP"], from: words)[0]
        let short_cut = square3x3_topRight.containing(["SHORT","BONUS","COST", "CUT"], from: words)[0]
        let debit_buy = edges.containing(["DEBIT", "BUY"], from: words)[0]
        let buyer_buy = edges.containing(["BUY", "BUYER"], from: words)[2]
        let units_iou = edges.containing(["UNITS", "IOU"], from: words)[0]
        let loss_spot = edges.containing(["LOSS", "SPOT"], from: words)[1]
        let spot_tax = edges.containing(["SPOT", "TAX"], from: words)[0]
        let spot_par = edges.containing(["SPOT", "PAR"], from: words)[0]
        let par_bear = edges.containing(["PAR", "BEAR"], from: words)[1]
        let bear_bid = edges.containing(["BEAR", "BID"], from: words)[0]
        let bid_deed = edges.containing(["BID", "DEED"], from: words)[0]
        
        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes:[
            stock_pay,
            stock_debit,
            stock_short,
            short_units,
            units_bull_sold,
            bull_notes,
            scrip_stock,
            capital_scrip,
            capital_scrip2,
            short_cut,
            debit_buy,
            buyer_buy,
            units_iou,
            loss_spot,
            spot_tax,
            spot_par,
            par_bear,
            bear_bid,
            bid_deed
        ], words: words)
        
        print("WINNER ")
        print(result.ToString(words:words))
        
        
    }
    
    public static func Shapes_8704New() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8704) else {
            return
        }
        
        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        
        // Create required shapes
        let edges = ShapeCalculator.toShapes(edges:EdgeCalculator.Execute(
            words: words,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3_RLR_DU(
            start: words,
            end: end,
            len: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let rectangle3x4 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin:0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square3x3 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let rectangle3x4_topRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin:0,
            widthMax: widthMax,
            heightMax: heightMax))
        let square3x4_topLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin:0,
            widthMax: widthMax,
            heightMax: heightMax))
        
       

        
        // Assemble the game from the generated shapes
        
        let donne_hood_yeats = c2x3.containing(["DONNE","HOOD","YEATS","DOYLE","ODE"], from: words)[0]
        let donne_yeats_slessor = rectangle3x4.containing(["DONNE","YEATS","ODE", "SLESSOR"], from: words)[0]
        let slessor_scott = rectangle3x4.containing(["SLESSOR", "SCOTT","HARDY","POESY"], from: words)[0]
        let short_units = square3x3.containing(["POESY","SCOTT", "SAXE","TEXT"], from: words)[0]
        let slessor_stanza = edges.containing(["SLESSOR", "STANZA"], from: words)[0]
        let homer_stanza = rectangle3x4.containing(["STANZA", "HOMER","FOOT","PRIZE"], from: words)[0]
        let donne_poet = rectangle3x4_topRight.containing(["DONNE", "MILTON","POET","HOPE"], from: words)[0]
        let milton_poet_hope_lamb = square3x4_topLeft.containing(["MILTON","POET", "HOPE","LAMB"], from: words)[0]
        let hood_hymn = edges.containing(["HOOD", "HYMN"], from: words)[0]
        let hymn_gray_scan_bridges = rectangle3x4.containing(["HYMN", "GRAY","SCAN","BRIDGES"], from: words)[0]
        let bridges_rhyme = edges.containing(["BRIDGES", "RHYME"], from: words)[0]
        let rhyme_elegy = edges.containing(["RHYME", "ELEGY"], from: words)[0]
        let elegy_poe = edges.containing(["ELEGY", "POE"], from: words)[0]
        
        
        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes:[
            donne_hood_yeats,
            donne_yeats_slessor,
            slessor_scott,
            short_units,
            slessor_stanza,
            homer_stanza,
            donne_poet,
            milton_poet_hope_lamb,
            hood_hymn,
            hymn_gray_scan_bridges,
            bridges_rhyme,
            rhyme_elegy,
            elegy_poe
            
        ], words: words)
        
        print("WINNER ")
        print(result.ToString(words:words))
        
        
    }
    
    public static func Shapes_8702() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8702) else {
            return
        }
        
        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        
        // Create required shapes
        let edges = ShapeCalculator.toShapes(edges:EdgeCalculator.Execute(
            words: words,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square4x4 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Square(
            interlockWidth:3,
            words: words,
            lengths: len,
            scoreMin:76,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let squares3x3 = ShapeCalculator.toShapes(rectangles: RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square3x3_topRight = ShapeCalculator.toShapes(rectangles: RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let square3x3_topLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth:2,
            words: words,
            lengths: len,
            scoreMin:72,
            widthMax: widthMax,
            heightMax: heightMax))
        
        let pacman3x3_bottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.bottomRight(
            start: words,
            end: end,
            len: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))

        
        // Assemble the game from the generated shapes
        
        let stock_pay = c2x2[0]
        print(stock_pay.ToString(words: words))
        
        let stock_debit = square4x4.containing(["STOCK","DEBIT","SALE","COST"], from: words)[0]
        print(stock_debit.ToString(words: words))
        
        let stock_pay_debit = MergeShapesCalculator.Merge_Two_Shapes(smaller: [stock_debit], larger: [stock_pay], words: words)[0]
        print(stock_pay_debit.ToString(words: words))
        
        let stock_short = square3x3_topRight.containing(["STOCK","SHORT","COST","BONUS"], from: words)[0]
        print(stock_short.ToString(words:words))
        
        let stock_pay_debit_short = MergeShapesCalculator.Merge_Two_Shapes(smaller: [stock_short], larger: [stock_pay_debit], words: words)[0]
        print(stock_pay_debit_short.ToString(words:words))
        
        let short_units = square3x3_topLeft.containing(["SHORT","BONUS", "UNITS","NET"], from: words)[0]
        print(short_units.ToString(words: words))
        
        let stock_pay_debit_short_units = MergeShapesCalculator.Merge_Two_Shapes(smaller: [short_units], larger: [stock_pay_debit_short], words: words)[0]
        print(stock_pay_debit_short_units.ToString(words: words))
        
        let units_bull_sold = pacman3x3_bottomRight[0]
        print(units_bull_sold.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold = MergeShapesCalculator.Merge_Two_Shapes(smaller: [units_bull_sold], larger: [stock_pay_debit_short_units], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold.ToString(words: words))
        
        let bull_notes = squares3x3.containing(["BULL","TRUST","SELL", "NOTES"], from: words)[0]
        print(bull_notes.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold_notes = MergeShapesCalculator.Merge_Two_Shapes(smaller:[bull_notes], larger:[stock_pay_debit_short_units_bull_sold], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes.ToString(words: words))
        
        let scrip_stock = square3x3_topRight.containing(["STOCK","PARITY", "CASH","SCRIP"], from: words)[0]
        print(scrip_stock.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold_notes_scrip = MergeShapesCalculator.Merge_Two_Shapes(smaller: [scrip_stock], larger: [stock_pay_debit_short_units_bull_sold_notes], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes_scrip.ToString(words: words))
        
        let capital_scrip = squares3x3.containing(["SCRIP","PARITY", "CASH", "CAPITAL"], from: words)[0]
        print(capital_scrip.ToString(words: words))
        
        let capital_scrip2 = squares3x3.containing(["SCRIP","PARITY","CAPITAL","TIP"], from: words)[0]
        print(capital_scrip2.ToString(words: words))
        
        let capital_scrip_merged = MergeShapesCalculator.Merge_Two_Shapes(smaller: [capital_scrip], larger: [capital_scrip2], words: words)[0]
        print(capital_scrip_merged)
        
        let stock_pay_debit_short_units_bull_sold_notes_scrip_capital = MergeShapesCalculator.Merge_Two_Shapes(smaller: [capital_scrip_merged], larger: [stock_pay_debit_short_units_bull_sold_notes_scrip], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes_scrip_capital.ToString(words: words))
        
        let short_cut = square3x3_topRight.containing(["SHORT","BONUS","COST", "CUT"], from: words)[0]
        print(short_cut.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut = MergeShapesCalculator.Merge_Two_Shapes(smaller: [short_cut], larger: [stock_pay_debit_short_units_bull_sold_notes_scrip_capital], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut.ToString(words: words))
        
        let debit_buy = edges.containing(["DEBIT", "BUY"], from: words)[0]
        print(debit_buy.ToString(words: words))
        
        let buyer_buy = edges.containing(["BUY", "BUYER"], from: words)[2]
        print(buyer_buy.ToString(words: words))
        
        let debit_buyer = MergeShapesCalculator.Merge_Two_Shapes(smaller: [debit_buy], larger: [buyer_buy], words: words)[0]
        print(debit_buyer.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer = MergeShapesCalculator.Merge_Two_Shapes(smaller: [debit_buyer], larger: [stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer.ToString(words: words))

        let units_iou = edges.containing(["UNITS", "IOU"], from: words)[0]
        print(units_iou.ToString(words: words))
        
        let stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer_iou = MergeShapesCalculator.Merge_Two_Shapes(smaller: [units_iou], larger: [stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer], words: words)[0]
        print(stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer_iou.ToString(words: words))
        
        let loss_spot = edges.containing(["LOSS", "SPOT"], from: words)[1]
        print(loss_spot.ToString(words: words))
        
        let spot_tax = edges.containing(["SPOT", "TAX"], from: words)[0]
        print(spot_tax.ToString(words: words))
        
        let loss_spot_tax = MergeShapesCalculator.Merge_Two_Shapes(smaller: [loss_spot], larger: [spot_tax], words: words)[0]
        print(loss_spot_tax.ToString(words: words))
        
        let spot_par = edges.containing(["SPOT", "PAR"], from: words)[0]
        print(spot_par.ToString(words: words))
        
        let par_bear = edges.containing(["PAR", "BEAR"], from: words)[1]
        print(par_bear.ToString(words: words))
        
        let spot_par_bear = MergeShapesCalculator.Merge_Two_Shapes(smaller: [spot_par], larger: [par_bear], words: words)[0]
        print(spot_par_bear.ToString(words: words))
        
        let bear_bid = edges.containing(["BEAR", "BID"], from: words)[0]
        print(bear_bid.ToString(words: words))
        
        let spot_par_bear_bid = MergeShapesCalculator.Merge_Two_Shapes(smaller: [bear_bid], larger: [spot_par_bear], words: words)[0]
        print(spot_par_bear_bid.ToString(words: words))
        
        let bid_deed = edges.containing(["BID", "DEED"], from: words)[0]
        print(bid_deed.ToString(words: words))
        
        let spot_par_bear_bid_deed = MergeShapesCalculator.Merge_Two_Shapes(smaller: [bid_deed], larger: [spot_par_bear_bid], words: words)[0]
        print(spot_par_bear_bid_deed.ToString(words: words))
        
        let loss_spot_par_bear_bid_deed = MergeShapesCalculator.Merge_Two_Shapes(smaller: [loss_spot_tax], larger: [spot_par_bear_bid_deed], words: words)[0]
        print(loss_spot_par_bear_bid_deed.ToString(words: words))
        
        let final = MergeShapesCalculator.Merge_Two_Shapes(smaller: [loss_spot_par_bear_bid_deed], larger: [stock_pay_debit_short_units_bull_sold_notes_scrip_capital_cut_buyer_iou], words: words)[0]
        print(final.ToString(words: words))
    }
    
    private static let widthMax = 17
    private static let heightMax = 12
    
    public static func Create_Fork(edges: [ShapeModel], words: [String]) -> ShapeModel {
        
        
        
        let white_family = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","FAMILY"], from: words)[0]
        print(white_family.ToString(words: words))
        
        let white_snow = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","SNOW"], from: words)[0]
        print(white_snow.ToString(words: words))
        
        let white_cake = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","CAKE"], from: words)[0]
        print(white_cake.ToString(words: words))
        
        let fork = [white_snow, white_family, white_cake]
        
        let gpuFork = GpuShapeModel(shapes: fork, totalWords: words.count, stride: 2)
        
        let mergeFork = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
//        for item in mergeFork {
//            print(item.ToString(words: words))
//        }
        
        let gpuFork2 = GpuShapeModel(shapes: mergeFork, totalWords: words.count, stride:3)
        
        var mergeFork2 = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork2, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.SortWithWordSequence(shapes: &mergeFork2)
        
        let _ = RemoveDuplicatesCalculator.findDuplicates(shapes: &mergeFork2)
        
        
        let withoutDuplicates = RemoveDuplicatesCalculator.removeDuplicates(shapes: mergeFork2)
            
        
        
//        for item in withoutDuplicates {
//            print(item.ToString(words: words))
//        }
        
        return withoutDuplicates[0]
    }
}