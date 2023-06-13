//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    
    public static func Shapes_8710() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8710) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopLeft = ShapeCalculator.toShapes(pacmans: PacmanCalculator.TopLeft(
            start: words,
            end: end,
            len: len,
            scoreMin: 132,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

//        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
//            interlockWidth: 2,
//            interlockHeight: 4,
//            words: words,
//            lengths: len,
//            scoreMin: 72,
//            widthMax: widthMax,
//            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let wren_lory_swallow_canary = square4x4.containing(["WREN", "LORY", "SWALLOW", "CANARY"], from: words)[0]
        let grouse_wren_swan_swallow_tern = c2x3.containing(["GROUSE", "WREN", "SWAN", "SWALLOW", "TERN"], from: words)[0]
        let lory_sparrow_owlet_roc_swallow_owl = pacman3x3_TopLeft.containing(["LORY", "SPARROW", "OWLET", "ROC", "SWALLOW", "OWL"], from: words)[0]
        let owlet_chat_roc_tit = rectangle3x5_TopRight.containing(["OWLET", "CHAT", "ROC", "TIT"], from: words)[0]
        let tomtit_sparrow_rook_rooster = rectangle3x5_TopRight.containing(["TOMTIT", "SPARROW", "ROOK", "ROOSTER"], from: words)[0]
        let tomtit_auk_turkey_rook = c2x2.containing(["TOMTIT", "AUK", "TURKEY", "ROOK"], from: words)[0]
        let auk_skylark_turkey_skua = rectangle3x5_TopRight.containing(["AUK", "SKYLARK", "TURKEY", "SKUA"], from: words)[0]
        let auk_skylark_ibis_turkey = rectangle3x5_TopLeft.containing(["AUK", "SKYLARK", "IBIS", "TURKEY"], from: words)[0]
        let grouse_tomtit_egret_rooster = rectangle3x4.containing(["GROUSE", "TOMTIT", "EGRET", "ROOSTER"], from: words)[0]
        let snipe_tomtit_shag_egret = square5x5_BottomLeft.containing(["SNIPE", "TOMTIT", "SHAG", "EGRET"], from: words)[0]
        let tui_ibis = edges.containing(["TUI", "IBIS"], from: words)[0]
        let tui_teal = edges.containing(["TUI", "TEAL"], from: words)[0]
        let tui_emu = edges.containing(["TUI", "EMU"], from: words)[0]
        let hen_emu = edges.containing(["HEN", "EMU"], from: words)[0]
        let myna_shag = edges.containing(["MYNA", "SHAG"], from: words)[0]
        let myna_jay = edges.containing(["MYNA", "JAY"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            wren_lory_swallow_canary,
            grouse_wren_swan_swallow_tern,
            lory_sparrow_owlet_roc_swallow_owl,
            owlet_chat_roc_tit,
            tomtit_sparrow_rook_rooster,
            tomtit_auk_turkey_rook,
            auk_skylark_turkey_skua,
            auk_skylark_ibis_turkey,
            grouse_tomtit_egret_rooster,
            snipe_tomtit_shag_egret,
            tui_ibis,
            tui_teal,
            tui_emu,
            hen_emu,
            myna_shag,
            myna_jay
        ], words: words)
    return result
    }
    
    
    public static func Shapes_8711() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8711) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 118,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x5 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x5(
           start: words,
           end: end,
           len: len,
           scoreMin: 204,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let lac_zoffany_colour_rouge_jet_azure_corot = c2x5.containing(["LAC", "ZOFFANY", "COLOUR", "ROUGE", "JET", "AZURE", "COROT"], from: words)[0]
        let zoffany_dyck = edges.containing(["ZOFFANY", "DYCK"], from: words)[0]
        let zoffany_rouge_azure_lake = rectangle3x5.containing(["ZOFFANY", "ROUGE", "AZURE", "LAKE"], from: words)[0]
        let colour_ruby_hue_ebony = square3x3_TopLeft.containing(["COLOUR", "RUBY", "HUE", "EBONY"], from: words)[0]
        let ruby_blue_rubens_hue = c2x2.containing(["RUBY", "BLUE", "RUBENS", "HUE"], from: words)[1]
        let blue_sandy_rubens_bay = rectangle3x4_TopRight.containing(["BLUE", "SANDY", "RUBENS", "BAY"], from: words)[0]
        let blue_sandy_brush_rubens = rectangle3x4.containing(["BLUE", "SANDY", "BRUSH", "RUBENS"], from: words)[0]
        let rouge_grey = edges.containing(["ROUGE", "GREY"], from: words)[0]
        let sepia_goya_sooty_grey_paint = c2x3.containing(["SEPIA", "GOYA", "SOOTY", "GREY", "PAINT"], from: words)[0]
        let goya_ruddy_red_sooty = rectangle3x4_TopLeft.containing(["GOYA", "RUDDY", "RED", "SOOTY"], from: words)[0]
        let goya_tone_sooty_paint = square3x3.containing(["GOYA", "TONE", "SOOTY", "PAINT"], from: words)[0]
        let amber_ruddy_umber_red = square3x3.containing(["AMBER", "RUDDY", "UMBER", "RED"], from: words)[1]
        let sepia_art = edges.containing(["SEPIA", "ART"], from: words)[0]
        let tube_ebony = edges.containing(["TUBE", "EBONY"], from: words)[0]
        let tube_tan = edges.containing(["TUBE", "TAN"], from: words)[0]
        let dun_tan = edges.containing(["DUN", "TAN"], from: words)[0]
        let dun_jade = edges.containing(["DUN", "JADE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            lac_zoffany_colour_rouge_jet_azure_corot,
            zoffany_dyck,
            zoffany_rouge_azure_lake,
            colour_ruby_hue_ebony,
            ruby_blue_rubens_hue,
            blue_sandy_rubens_bay,
            blue_sandy_brush_rubens,
            rouge_grey,
            sepia_goya_sooty_grey_paint,
            goya_ruddy_red_sooty,
            goya_tone_sooty_paint,
            amber_ruddy_umber_red,
            sepia_art,
            tube_ebony,
            tube_tan,
            dun_tan,
            dun_jade
        ], words: words)
    return result
    }
    
    public static func Shapes_8712() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8712) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 118,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let meat_roast_turkey_fare_toys = c2x3.containing(["MEAT", "ROAST", "TURKEY", "FARE", "TOYS"], from: words)[0]
        let jelly_turkey_salt_yule = c2x2.containing(["JELLY", "TURKEY", "SALT", "YULE"], from: words)[0]
        let roast_sweets_toys_nutmeg = rectangle3x4.containing(["ROAST", "SWEETS", "TOYS", "NUTMEG"], from: words)[0]
        let sweets_holly_wishes_parsley = rectangle4x5.containing(["SWEETS", "HOLLY", "WISHES", "PARSLEY"], from: words)[0]
        let dates_jelly_tree_salt = square3x3.containing(["DATES", "JELLY", "TREE", "SALT"], from: words)[0]
        let turkey_sauce_guests_yule = square3x3_TopLeft.containing(["TURKEY", "SAUCE", "GUESTS", "YULE"], from: words)[0]
        let sauce_presents_sugar_guests = rectangle3x5.containing(["SAUCE", "PRESENTS", "SUGAR", "GUESTS"], from: words)[0]
        let plums_presents_port_bush = rectangle3x4_BottomRight.containing(["PLUMS", "PRESENTS", "PORT", "BUSH"], from: words)[0]
        let sauce_eggs_sugar_guests = square3x3.containing(["SAUCE", "EGGS", "SUGAR", "GUESTS"], from: words)[1]
        let spice_wishes = edges.containing(["SPICE", "WISHES"], from: words)[1]
        let wine_nutmeg = edges.containing(["WINE", "NUTMEG"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            meat_roast_turkey_fare_toys,
            jelly_turkey_salt_yule,
            roast_sweets_toys_nutmeg,
            sweets_holly_wishes_parsley,
            dates_jelly_tree_salt,
            turkey_sauce_guests_yule,
            sauce_presents_sugar_guests,
            plums_presents_port_bush,
            sauce_eggs_sugar_guests,
            spice_wishes,
            wine_nutmeg
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8802() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8802) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 74,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 148,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let sport_blazer_prize_art = square3x3_TopRight.containing(["SPORT", "BLAZER", "PRIZE", "ART"], from: words)[0]
        let mates_tennis_art_captain = square4x4_TopLeft.containing(["MATES", "TENNIS", "ART", "CAPTAIN"], from: words)[1]
        let copy_maths_captain_swot_physics_boys = c2x4.containing(["COPY", "MATHS", "CAPTAIN", "SWOT", "PHYSICS", "BOYS"], from: words)[0]
        let pen_sport_prize_quiet = c2x2.containing(["PEN", "SPORT", "PRIZE", "QUIET"], from: words)[0]
        let class_study_quiet_play = square3x3_TopLeft.containing(["CLASS", "STUDY", "QUIET", "PLAY"], from: words)[0]
        let sport_lines = edges.containing(["SPORT", "LINES"], from: words)[0]
        let cane_gym_crayon_lines = rectangle3x4_BottomRight.containing(["CANE", "GYM", "CRAYON", "LINES"], from: words)[0]
        let study_sums = edges.containing(["STUDY", "SUMS"], from: words)[1]
        let roll_cane_term_lines = rectangle3x4_TopRight.containing(["ROLL", "CANE", "TERM", "LINES"], from: words)[0]
        let tables_sums = edges.containing(["TABLES", "SUMS"], from: words)[0]
        let ink_crayon = edges.containing(["INK", "CRAYON"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            sport_blazer_prize_art,
            mates_tennis_art_captain,
            copy_maths_captain_swot_physics_boys,
            pen_sport_prize_quiet,
            class_study_quiet_play,
            sport_lines,
            cane_gym_crayon_lines,
            study_sums,
            roll_cane_term_lines,
            tables_sums,
            ink_crayon
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8803() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8803) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 88,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.TopRight(
            start: words,
            end: end,
            len: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let quito_zurich_suez_toronto = square3x3.containing(["QUITO", "ZURICH", "SUEZ", "TORONTO"], from: words)[0]
        let tokyo_lagos_toronto_oslo = c2x2.containing(["TOKYO", "LAGOS", "TORONTO", "OSLO"], from: words)[0]
        let tokyo_york = edges.containing(["TOKYO", "YORK"], from: words)[2]
        let bonn_lagos_osaka_toronto = square3x3.containing(["BONN", "LAGOS", "OSAKA", "TORONTO"], from: words)[0]
        let lagos_cairo_osaka_oslo = rectangle3x4.containing(["LAGOS", "CAIRO", "OSAKA", "OSLO"], from: words)[0]
        let rome_york = edges.containing(["ROME", "YORK"], from: words)[1]
        let zurich_omaha = edges.containing(["ZURICH", "OMAHA"], from: words)[0]
        let bogota_omaha = edges.containing(["BOGOTA", "OMAHA"], from: words)[0]
        let bogota_toledo = edges.containing(["BOGOTA", "TOLEDO"], from: words)[4]
        let delhi_bombay_toledo_hobart = square3x3.containing(["DELHI", "BOMBAY", "TOLEDO", "HOBART"], from: words)[0]
        let delhi_omsk_bombay_hobart_lima_sydney = pacman3x3_TopRight.containing(["DELHI", "OMSK", "BOMBAY", "HOBART", "LIMA", "SYDNEY"], from: words)[0]
        let omsk_ayr_hobart_sydney = rectangle3x6_BottomLeft.containing(["OMSK", "AYR", "HOBART", "SYDNEY"], from: words)[0]
        let reno_ayr_hobart_sydney = square3x3_BottomLeft.containing(["RENO", "AYR", "HOBART", "SYDNEY"], from: words)[0]
        let omsk_cork = edges.containing(["OMSK", "CORK"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            quito_zurich_suez_toronto,
            tokyo_lagos_toronto_oslo,
            tokyo_york,
            bonn_lagos_osaka_toronto,
            lagos_cairo_osaka_oslo,
            rome_york,
            zurich_omaha,
            bogota_omaha,
            bogota_toledo,
            delhi_bombay_toledo_hobart,
            delhi_omsk_bombay_hobart_lima_sydney,
            omsk_ayr_hobart_sydney,
            reno_ayr_hobart_sydney,
            omsk_cork
        ], words: words)
        return result
    }
    
    public static func Shapes_8804() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8804) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let hymn_mazurka_hum_mezzo = square3x3.containing(["HYMN", "MAZURKA", "HUM", "MEZZO"], from: words)[1]
        let mazurka_viola_mezzo_aria = square3x3.containing(["MAZURKA", "VIOLA", "MEZZO", "ARIA"], from: words)[0]
        let hymn_key = edges.containing(["HYMN", "KEY"], from: words)[0]
        let hymn_sign = edges.containing(["HYMN", "SIGN"], from: words)[0]
        let song_sign = edges.containing(["SONG", "SIGN"], from: words)[0]
        let song_trio_note_tie = square3x3_TopRight.containing(["SONG", "TRIO", "NOTE", "TIE"], from: words)[0]
        let tune_trio_tie_duo = c2x2.containing(["TUNE", "TRIO", "TIE", "DUO"], from: words)[0]
        let viola_low = edges.containing(["VIOLA", "LOW"], from: words)[0]
        let slow_low = edges.containing(["SLOW", "LOW"], from: words)[2]
        let tune_rest = edges.containing(["TUNE", "REST"], from: words)[0]
        let strum_stop_rest_tone_harp = c2x3.containing(["STRUM", "STOP", "REST", "TONE", "HARP"], from: words)[0]
        let hit_strum_harp_time = square3x3.containing(["HIT", "STRUM", "HARP", "TIME"], from: words)[0]
        let stop_slur = edges.containing(["STOP", "SLUR"], from: words)[0]
        
        let mazurka_basso = edges.containing(["MAZURKA", "BASSO"], from: words)[1]
        
        
        let score_hold_basso_mood = square3x3.containing(["SCORE", "HOLD", "BASSO", "MOOD"], from: words)[0]
        let mute_score_mood_slur_tempo = c2x3.containing(["MUTE", "SCORE", "MOOD", "SLUR", "TEMPO"], from: words)[0]
        
        let march_forte_tempo_fret = square3x3.containing(["MARCH", "FORTE", "TEMPO", "FRET"], from: words)[0]
        let march_echo = edges.containing(["MARCH", "ECHO"], from: words)[1]
        
       

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            hymn_mazurka_hum_mezzo,
            mazurka_viola_mezzo_aria,
            hymn_key,
            hymn_sign,
            song_sign,
            song_trio_note_tie,
            tune_trio_tie_duo,
            viola_low,
            slow_low,
            tune_rest,
            strum_stop_rest_tone_harp,
            hit_strum_harp_time,
            stop_slur,
            mazurka_basso,
            score_hold_basso_mood,
            mute_score_mood_slur_tempo,
            march_forte_tempo_fret,
            march_echo
        ], words: words)
        return result
    }
    
    public static func Shapes_8806() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8806) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 62,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let ahoy_yaw_stay_hawser_bow = c2x3.containing(["AHOY", "YAW", "STAY", "HAWSER", "BOW"], from: words)[0]
        let buoy_ahoy_bow_guy = c2x2.containing(["BUOY", "AHOY", "BOW", "GUY"], from: words)[0]
        let mast_port_moor_spar_stay = c2x3.containing(["MAST", "PORT", "MOOR", "SPAR", "STAY"], from: words)[0]
        let buoy_ply = edges.containing(["BUOY", "PLY"], from: words)[0]
        let yaw_bowsprit_fog_hawser = square3x3_TopLeft.containing(["YAW", "BOWSPRIT", "FOG", "HAWSER"], from: words)[0]
        let bowsprit_prow_hawser_crew = square3x3.containing(["BOWSPRIT", "PROW", "HAWSER", "CREW"], from: words)[0]
        let bowsprit_log_box_fog = c2x2.containing(["BOWSPRIT", "LOG", "BOX", "FOG"], from: words)[0]
        let bowsprit_watch = edges.containing(["BOWSPRIT", "WATCH"], from: words)[1]
        let mast_set = edges.containing(["MAST", "SET"], from: words)[1]
        let ship_set = edges.containing(["SHIP", "SET"], from: words)[0]
        let port_oar_dory_moor = square3x3_TopLeft.containing(["PORT", "OAR", "DORY", "MOOR"], from: words)[1]
        let quay_dory = edges.containing(["QUAY", "DORY"], from: words)[0]
        let quay_aft = edges.containing(["QUAY", "AFT"], from: words)[0]
        let yacht_aft = edges.containing(["YACHT", "AFT"], from: words)[1]
        let yacht_jetty = edges.containing(["YACHT", "JETTY"], from: words)[2]
        let junk_jetty = edges.containing(["JUNK", "JETTY"], from: words)[0]
        let junk_astern = edges.containing(["JUNK", "ASTERN"], from: words)[0]
        let transom_trim_astern_sail = square3x3.containing(["TRANSOM", "TRIM", "ASTERN", "SAIL"], from: words)[0]
        let transom_tack = edges.containing(["TRANSOM", "TACK"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            ahoy_yaw_stay_hawser_bow,
            buoy_ahoy_bow_guy,
            mast_port_moor_spar_stay,
            buoy_ply,
            yaw_bowsprit_fog_hawser,
            bowsprit_prow_hawser_crew,
            bowsprit_log_box_fog,
            bowsprit_watch,
            mast_set,
            ship_set,
            port_oar_dory_moor,
            quay_dory,
            quay_aft,
            yacht_aft,
            yacht_jetty,
            junk_jetty,
            junk_astern,
            transom_trim_astern_sail,
            transom_tack
        ], words: words)
        return result
    }
    
    public static func Shapes_8809() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8809) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let pork_gorgonzola_pizza_rolls = square3x3.containing(["PORK", "GORGONZOLA", "PIZZA", "ROLLS"], from: words)[0]
        let gorgonzola_parsley_pizza_rolls = square3x3.containing(["GORGONZOLA", "PARSLEY", "PIZZA", "ROLLS"], from: words)[1]
        let parsley_turkey = edges.containing(["PARSLEY", "TURKEY"], from: words)[2]
        let tart_gravy_turkey_pastry = rectangle3x4.containing(["TART", "GRAVY", "TURKEY", "PASTRY"], from: words)[0]
        let gravy_edam_turkey_veal = square3x3.containing(["GRAVY", "EDAM", "TURKEY", "VEAL"], from: words)[0]
        let steak_gorgonzola_pear_stilton = rectangle3x5_TopLeft.containing(["STEAK", "GORGONZOLA", "PEAR", "STILTON"], from: words)[0]
        let mints_steak_nuts_stilton = c2x2.containing(["MINTS", "STEAK", "NUTS", "STILTON"], from: words)[0]
        let loin_mints_lamb_nuts = rectangle3x4.containing(["LOIN", "MINTS", "LAMB", "NUTS"], from: words)[0]
        let soup_steak_stilton_duck = rectangle3x4_TopLeft.containing(["SOUP", "STEAK", "STILTON", "DUCK"], from: words)[0]
        let gorgonzola_sago_eggs_stilton = rectangle3x5_BottomRight.containing(["GORGONZOLA", "SAGO", "EGGS", "STILTON"], from: words)[0]
        let pork_milk = edges.containing(["PORK", "MILK"], from: words)[0]
        let meat_milk = edges.containing(["MEAT", "MILK"], from: words)[0]
        let meat_tea = edges.containing(["MEAT", "TEA"], from: words)[2]
        let meat_pie = edges.containing(["MEAT", "PIE"], from: words)[0]
        let spice_pie = edges.containing(["SPICE", "PIE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            pork_gorgonzola_pizza_rolls,
            gorgonzola_parsley_pizza_rolls,
            parsley_turkey,
            tart_gravy_turkey_pastry,
            gravy_edam_turkey_veal,
            steak_gorgonzola_pear_stilton,
            mints_steak_nuts_stilton,
            loin_mints_lamb_nuts,
            soup_steak_stilton_duck,
            gorgonzola_sago_eggs_stilton,
            pork_milk,
            meat_milk,
            meat_tea,
            meat_pie,
            spice_pie
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8810() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8810) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let orczy_zola = edges.containing(["ORCZY", "ZOLA"], from: words)[1]
        let mann_orczy_rohmer_henry = rectangle3x4.containing(["MANN", "ORCZY", "ROHMER", "HENRY"], from: words)[0]
        let pope_orczy_poe_rohmer = c2x2.containing(["POPE", "ORCZY", "POE", "ROHMER"], from: words)[0]
        let waugh_pope_hugo_rohmer = square3x3.containing(["WAUGH", "POPE", "HUGO", "ROHMER"], from: words)[0]
        let waugh_shaw = edges.containing(["WAUGH", "SHAW"], from: words)[2]
        let gaskin_shaw = edges.containing(["GASKIN", "SHAW"], from: words)[0]
        let pope_pepys = edges.containing(["POPE", "PEPYS"], from: words)[0]
        let kyne_grey_heyer_pepys = square3x3.containing(["KYNE", "GREY", "HEYER", "PEPYS"], from: words)[0]
        let gaskin_glyn = edges.containing(["GASKIN", "GLYN"], from: words)[0]
        let cheyney_henry = edges.containing(["CHEYNEY", "HENRY"], from: words)[0]
        let cheyney_sand_sayers_eden = rectangle3x4.containing(["CHEYNEY", "SAND", "SAYERS", "EDEN"], from: words)[0]
        let sand_hardy_ayres_doyle = square3x3.containing(["SAND", "HARDY", "AYRES", "DOYLE"], from: words)[0]
        let cheyney_hay = edges.containing(["CHEYNEY", "HAY"], from: words)[2]
        let dumas_sayers = edges.containing(["DUMAS", "SAYERS"], from: words)[0]
        let jacobs_ayres = edges.containing(["JACOBS", "AYRES"], from: words)[1]
       
        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            orczy_zola,
            mann_orczy_rohmer_henry,
            pope_orczy_poe_rohmer,
            waugh_pope_hugo_rohmer,
            waugh_shaw,
            gaskin_shaw,
            pope_pepys,
            kyne_grey_heyer_pepys,
            gaskin_glyn,
            cheyney_henry,
            cheyney_sand_sayers_eden,
            sand_hardy_ayres_doyle,
            cheyney_hay,
            dumas_sayers,
            jacobs_ayres
        ], words: words)
        return result
    }
    
    public static func Shapes_8811() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8811) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 142,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let maize_guava_fig_zucchini_pea = c2x3.containing(["MAIZE", "GUAVA", "FIG", "ZUCCHINI", "PEA"], from: words)[0]
        let papaya_guava_pea_pear = square3x3.containing(["PAPAYA", "GUAVA", "PEA", "PEAR"], from: words)[1]
        let papaya_yam = edges.containing(["PAPAYA", "YAM"], from: words)[0]
        let cherry_celery_zucchini_orange = rectangle3x5_BottomLeft.containing(["CHERRY", "CELERY", "ZUCCHINI", "ORANGE"], from: words)[0]
        let cherry_celery_orange_lychee = rectangle3x5.containing(["CHERRY", "CELERY", "ORANGE", "LYCHEE"], from: words)[0]
        let cos_celery_lychee_parsley = rectangle3x4.containing(["COS", "CELERY", "LYCHEE", "PARSLEY"], from: words)[0]
        let maize_mango = edges.containing(["MAIZE", "MANGO"], from: words)[0]
        let pecan_sago_citrus_mango = rectangle4x6_TopRight.containing(["PECAN", "SAGO", "CITRUS", "MANGO"], from: words)[0]
        let plum_sago_citrus_marrow = c2x2.containing(["PLUM", "SAGO", "CITRUS", "MARROW"], from: words)[0]
        let plum_taro_potato_marrow = rectangle4x5.containing(["PLUM", "TARO", "POTATO", "MARROW"], from: words)[0]
        let date_citrus = edges.containing(["DATE", "CITRUS"], from: words)[0]
        let raisin_marrow = edges.containing(["RAISIN", "MARROW"], from: words)[1]
        let raisin_soy = edges.containing(["RAISIN", "SOY"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            maize_guava_fig_zucchini_pea,
            papaya_guava_pea_pear,
            papaya_yam,
            cherry_celery_zucchini_orange,
            cherry_celery_orange_lychee,
            cos_celery_lychee_parsley,
            maize_mango,
            pecan_sago_citrus_mango,
            plum_sago_citrus_marrow,
            plum_taro_potato_marrow,
            date_citrus,
            raisin_marrow,
            raisin_soy
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8812() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8812) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.TopRight(
            start: words,
            end: end,
            len: len,
            scoreMin: 152,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let azalea_annual_zinnia_leaf = square3x3.containing(["AZALEA", "ANNUAL", "ZINNIA", "LEAF"], from: words)[0]
        let annual_trim_wattle_zinnia = square3x3.containing(["ANNUAL", "TRIM", "WATTLE", "ZINNIA"], from: words)[0]
        let alow_violet_vine_wattle = rectangle3x5_TopLeft.containing(["ALOW", "VIOLET", "VINE", "WATTLE"], from: words)[0]
        let violet_pest_vine_lotus = square3x3.containing(["VIOLET", "PEST", "VINE", "LOTUS"], from: words)[0]
        let pest_tuber_hose_stock_lotus_bed = pacman3x3_TopRight.containing(["PEST", "TUBER", "HOSE", "STOCK", "LOTUS", "BED"], from: words)[0]
        let tuber_rose = edges.containing(["TUBER", "ROSE"], from: words)[1]
        let sow_rose = edges.containing(["SOW", "ROSE"], from: words)[0]
        let sow_lawn = edges.containing(["SOW", "LAWN"], from: words)[0]
        let lily_natives_lawn_plant = rectangle3x4.containing(["LILY", "NATIVES", "LAWN", "PLANT"], from: words)[0]
        let pansy_lily_plant_may = c2x2.containing(["PANSY", "LILY", "PLANT", "MAY"], from: words)[0]
        let tap_pansy_may_poppy = rectangle3x4_TopLeft.containing(["TAP", "PANSY", "MAY", "POPPY"], from: words)[0]
        let tap_pot = edges.containing(["TAP", "POT"], from: words)[0]
        let pansy_can_may_spade = square3x3_BottomLeft.containing(["PANSY", "CAN", "MAY", "SPADE"], from: words)[1]
        let rake_stock = edges.containing(["RAKE", "STOCK"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            azalea_annual_zinnia_leaf,
            annual_trim_wattle_zinnia,
            alow_violet_vine_wattle,
            violet_pest_vine_lotus,
            pest_tuber_hose_stock_lotus_bed,
            tuber_rose,
            sow_rose,
            sow_lawn,
            lily_natives_lawn_plant,
            pansy_lily_plant_may,
            tap_pansy_may_poppy,
            tap_pot,
            pansy_can_may_spade,
            rake_stock
        ], words: words)
        return result
    }
    
    public static func Shapes_8902() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8902) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 154,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 132,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let flowers_rendezvous_waltz_woo = square3x3.containing(["FLOWERS", "RENDEZVOUS", "WALTZ", "WOO"], from: words)[0]
        let flowers_rendezvous_waltz_words = rectangle3x5.containing(["FLOWERS", "RENDEZVOUS", "WALTZ", "WORDS"], from: words)[0]
        let pew_words = edges.containing(["PEW", "WORDS"], from: words)[0]
        let pew_trip = edges.containing(["PEW", "TRIP"], from: words)[0]
        let guests_tryst_post_trip_posy = c2x3.containing(["GUESTS", "TRYST", "POST", "TRIP", "POSY"], from: words)[0]
        let old_tryst_posy_date = square3x3.containing(["OLD", "TRYST", "POSY", "DATE"], from: words)[0]
        let guests_trust = edges.containing(["GUESTS", "TRUST"], from: words)[1]
        let toast_gift_taxi_trust = square5x5_BottomLeft.containing(["TOAST", "GIFT", "TAXI", "TRUST"], from: words)[1]
        let mix_taxi = edges.containing(["MIX", "TAXI"], from: words)[0]
        let mix_hymn = edges.containing(["MIX", "HYMN"], from: words)[0]
        let joy_hymn = edges.containing(["JOY", "HYMN"], from: words)[0]
        let win_hymn = edges.containing(["WIN", "HYMN"], from: words)[0]
        let win_wine = edges.containing(["WIN", "WINE"], from: words)[0]
        let gift_roses_usher_kiss = square3x3_TopLeft.containing(["GIFT", "ROSES", "USHER", "KISS"], from: words)[0]
        let roses_adore_groom_usher = square3x3.containing(["ROSES", "ADORE", "GROOM", "USHER"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            flowers_rendezvous_waltz_woo,
            flowers_rendezvous_waltz_words,
            pew_words,
            pew_trip,
            guests_tryst_post_trip_posy,
            old_tryst_posy_date,
            guests_trust,
            toast_gift_taxi_trust,
            mix_taxi,
            mix_hymn,
            joy_hymn,
            win_hymn,
            win_wine,
            gift_roses_usher_kiss,
            roses_adore_groom_usher
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8903() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8903) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let tanzania_zambia = edges.containing(["TANZANIA", "ZAMBIA"], from: words)[0]
        let germany_tanzania_yemen_guyana = rectangle3x4.containing(["GERMANY", "TANZANIA", "YEMEN", "GUYANA"], from: words)[0]
        let italy_germany_togo_yemen = rectangle3x4.containing(["ITALY", "GERMANY", "TOGO", "YEMEN"], from: words)[0]
        let uruguay_tanzania_guyana_hungary = rectangle3x4.containing(["URUGUAY", "TANZANIA", "GUYANA", "HUNGARY"], from: words)[1]
        let uruguay_syria = edges.containing(["URUGUAY", "SYRIA"], from: words)[1]
        let tanzania_cyprus_guyana_hungary = square3x3_BottomLeft.containing(["TANZANIA", "CYPRUS", "GUYANA", "HUNGARY"], from: words)[1]
        let uruguay_cuba = edges.containing(["URUGUAY", "CUBA"], from: words)[2]
        let cyprus_sudan_peru_burma = rectangle3x4.containing(["CYPRUS", "SUDAN", "PERU", "BURMA"], from: words)[0]
        let tanzania_turkey = edges.containing(["TANZANIA", "TURKEY"], from: words)[0]
        let kenya_turkey = edges.containing(["KENYA", "TURKEY"], from: words)[1]
        let zaire_turkey = edges.containing(["ZAIRE", "TURKEY"], from: words)[0]
        let zaire_belize = edges.containing(["ZAIRE", "BELIZE"], from: words)[0]
        let niger_zambia = edges.containing(["NIGER", "ZAMBIA"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            tanzania_zambia,
            germany_tanzania_yemen_guyana,
            italy_germany_togo_yemen,
            uruguay_tanzania_guyana_hungary,
            uruguay_syria,
            tanzania_cyprus_guyana_hungary,
            uruguay_cuba,
            cyprus_sudan_peru_burma,
            tanzania_turkey,
            kenya_turkey,
            zaire_turkey,
            zaire_belize,
            niger_zambia
        ], words: words)
        return result
    }
    
    public static func Shapes_8904() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8904) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 126,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 168,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let zigzag_zipper = edges.containing(["ZIGZAG", "ZIPPER"], from: words)[0]
        let west_party_wallet_zipper_stage_city = c2x4.containing(["WEST", "PARTY", "WALLET", "ZIPPER", "STAGE", "CITY"], from: words)[0]
        let tahiti_wallet = edges.containing(["TAHITI", "WALLET"], from: words)[2]
        let tahiti_east = edges.containing(["TAHITI", "EAST"], from: words)[1]
        let cards_city = edges.containing(["CARDS", "CITY"], from: words)[0]
        let cards_sun = edges.containing(["CARDS", "SUN"], from: words)[0]
        let usa_money_sun_sea_relay = c2x3.containing(["USA", "MONEY", "SUN", "SEA", "RELAY"], from: words)[0]
        let money_orient = edges.containing(["MONEY", "ORIENT"], from: words)[0]
        let cards_air = edges.containing(["CARDS", "AIR"], from: words)[1]
        let swim_italy_ski_orient = rectangle3x4_BottomLeft.containing(["SWIM", "ITALY", "SKI", "ORIENT"], from: words)[0]
        let italy_fly = edges.containing(["ITALY", "FLY"], from: words)[1]
        let keys_east = edges.containing(["KEYS", "EAST"], from: words)[0]
        let keys_journey = edges.containing(["KEYS", "JOURNEY"], from: words)[1]
        let route_sand_ports_journey = square3x3.containing(["ROUTE", "SAND", "PORTS", "JOURNEY"], from: words)[0]
        let jet_route_journey_trek = square3x3.containing(["JET", "ROUTE", "JOURNEY", "TREK"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            zigzag_zipper,
            west_party_wallet_zipper_stage_city,
            tahiti_wallet,
            tahiti_east,
            cards_city,
            cards_sun,
            usa_money_sun_sea_relay,
            money_orient,
            cards_air,
            swim_italy_ski_orient,
            italy_fly,
            keys_east,
            keys_journey,
            route_sand_ports_journey,
            jet_route_journey_trek
        ], words: words)
        return result
    }
    
    public static func Shapes_8905() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8905) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 160,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 114,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rose_fizz_shiraz_crush = square3x3_BottomRight.containing(["ROSE", "FIZZ", "SHIRAZ", "CRUSH"], from: words)[1]
        let sack_porphyry_shiraz_tokay_crush_whisky = c2x4.containing(["SACK", "PORPHYRY", "SHIRAZ", "TOKAY", "CRUSH", "WHISKY"], from: words)[0]
        let scotch_sack_tokay_whisky = rectangle3x4.containing(["SCOTCH", "SACK", "TOKAY", "WHISKY"], from: words)[0]
        let porphyry_ouzo_cola_booze = square3x3_TopLeft.containing(["PORPHYRY", "OUZO", "COLA", "BOOZE"], from: words)[1]
        let ouzo_bar_cola_booze = square3x3_BottomRight.containing(["OUZO", "BAR", "COLA", "BOOZE"], from: words)[1]
        let scotch_asti = edges.containing(["SCOTCH", "ASTI"], from: words)[0]
        let port_asti = edges.containing(["PORT", "ASTI"], from: words)[0]
        let port_nip = edges.containing(["PORT", "NIP"], from: words)[0]
        let wine_nip = edges.containing(["WINE", "NIP"], from: words)[1]
        let wine_water = edges.containing(["WINE", "WATER"], from: words)[0]
        let split_grog_milk_water = square3x3_BottomLeft.containing(["SPLIT", "GROG", "MILK", "WATER"], from: words)[0]
        let split_spirit = edges.containing(["SPLIT", "SPIRIT"], from: words)[0]
        let ice_toddy_spirit_coke_red = c2x3.containing(["ICE", "TODDY", "SPIRIT", "COKE", "RED"], from: words)[0]
        let toddy_rye = edges.containing(["TODDY", "RYE"], from: words)[0]
        let rum_milk = edges.containing(["RUM", "MILK"], from: words)[0]
        let mead_coke = edges.containing(["MEAD", "COKE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            rose_fizz_shiraz_crush,
            sack_porphyry_shiraz_tokay_crush_whisky,
            scotch_sack_tokay_whisky,
            porphyry_ouzo_cola_booze,
            ouzo_bar_cola_booze,
            scotch_asti,
            port_asti,
            port_nip,
            wine_nip,
            wine_water,
            split_grog_milk_water,
            split_spirit,
            ice_toddy_spirit_coke_red,
            toddy_rye,
            rum_milk,
            mead_coke
        ], words: words)
        return result
    }
    
    public static func Shapes_8705() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8705) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 106,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let pansy_mower_stalk_path_pest_earth = c2x4.containing(["PANSY", "MOWER", "STALK", "PATH", "PEST", "EARTH"], from: words)[0]
        let pansy_lily = edges.containing(["PANSY", "LILY"], from: words)[0]
        let sweep_mower_stem_poppy = c2x2.containing(["SWEEP", "MOWER", "STEM", "POPPY"], from: words)[0]
        let mower_peony_pool_poppy = rectangle3x4_TopLeft.containing(["MOWER", "PEONY", "POOL", "POPPY"], from: words)[0]
        let alyssum_mimosa_sweep_grass_lawn = c2x3.containing(["ALYSSUM", "MIMOSA", "SWEEP", "GRASS", "LAWN"], from: words)[0]
        let alyssum_sweep_stem_bud = square3x3_BottomRight.containing(["ALYSSUM", "SWEEP", "STEM", "BUD"], from: words)[1]
        let alyssum_may = edges.containing(["ALYSSUM", "MAY"], from: words)[0]
        let pansy_stalk_earth_salvia = square3x3.containing(["PANSY", "STALK", "EARTH", "SALVIA"], from: words)[0]
        let pot_mimosa_palm_trim = rectangle3x4.containing(["POT", "MIMOSA", "PALM", "TRIM"], from: words)[0]
        let dig_salvia = edges.containing(["DIG", "SALVIA"], from: words)[0]
        let peony_tap = edges.containing(["PEONY", "TAP"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            pansy_mower_stalk_path_pest_earth,
            pansy_lily,
            sweep_mower_stem_poppy,
            mower_peony_pool_poppy,
            alyssum_mimosa_sweep_grass_lawn,
            alyssum_sweep_stem_bud,
            alyssum_may,
            pansy_stalk_earth_salvia,
            pot_mimosa_palm_trim,
            dig_salvia,
            peony_tap
        ], words: words)
    return result
    }
    
   
    public static func Shapes_8906() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8906) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 162,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 144,
            widthMax: widthMax,
            heightMax: heightMax))

        let ozone_eros_meteor_zodiac_cosmos = c2x3.containing(["OZONE", "EROS", "METEOR", "ZODIAC", "COSMOS"], from: words)[0]
        let epoch_ozone_meteor_cosmos = rectangle3x4.containing(["EPOCH", "OZONE", "METEOR", "COSMOS"], from: words)[0]
        let epoch_ozone_cosmos_phase = rectangle3x4.containing(["EPOCH", "OZONE", "COSMOS", "PHASE"], from: words)[0]
        let comet_meteor = edges.containing(["COMET", "METEOR"], from: words)[2]
        let comet_saturn_crater_moon = c2x2.containing(["COMET", "SATURN", "CRATER", "MOON"], from: words)[0]
        let saturn_zenith_syzygy_titan = square3x3.containing(["SATURN", "ZENITH", "SYZYGY", "TITAN"], from: words)[0]
        let day_syzygy = edges.containing(["DAY", "SYZYGY"], from: words)[0]
        let sky_syzygy = edges.containing(["SKY", "SYZYGY"], from: words)[2]
        let year_syzygy = edges.containing(["YEAR", "SYZYGY"], from: words)[2]
        let sky_star = edges.containing(["SKY", "STAR"], from: words)[0]
        let light_titan = edges.containing(["LIGHT", "TITAN"], from: words)[0]
        let time_moon = edges.containing(["TIME", "MOON"], from: words)[0]
        let year_arc = edges.containing(["YEAR", "ARC"], from: words)[1]
        let aries_crater = edges.containing(["ARIES", "CRATER"], from: words)[2]
        let aries_sun = edges.containing(["ARIES", "SUN"], from: words)[0]
        let uranus_sun = edges.containing(["URANUS", "SUN"], from: words)[0]
        let uranus_ursa = edges.containing(["URANUS", "URSA"], from: words)[0]
        let light_cloud = edges.containing(["LIGHT", "CLOUD"], from: words)[0]
       
        let day_cloud = edges.containing(["DAY", "CLOUD"], from: words)[0]
        let aries_arc = edges.containing(["ARIES", "ARC"], from: words)[0]
        let uranus_zodiac = edges.containing(["URANUS", "ZODIAC"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            ozone_eros_meteor_zodiac_cosmos,
            epoch_ozone_meteor_cosmos,
            epoch_ozone_cosmos_phase,
            comet_meteor,
            comet_saturn_crater_moon,
            saturn_zenith_syzygy_titan,
            day_syzygy,
            sky_syzygy,
            year_syzygy,
            sky_star,
            light_titan,
            time_moon,
            year_arc,
            aries_crater,
            aries_sun,
            uranus_sun,
            uranus_ursa,
            light_cloud,
            
            day_cloud,
            aries_arc,
            uranus_zodiac
        ], words: words)
        return result
    }
   
    
    
    public static func Shapes_8908() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8908) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 94,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let snow_moritz_olympics_freeze = rectangle3x6_TopRight.containing(["SNOW", "MORITZ", "OLYMPICS", "FREEZE"], from: words)[0]
        let snow_flurry_resort_olympics = square3x3.containing(["SNOW", "FLURRY", "RESORT", "OLYMPICS"], from: words)[0]
        let skis_flurry_white_lift_sled = c2x3.containing(["SKIS", "FLURRY", "WHITE", "LIFT", "SLED"], from: words)[0]
        let skis_pass = edges.containing(["SKIS", "PASS"], from: words)[2]
        let gloves_pass = edges.containing(["GLOVES", "PASS"], from: words)[0]
        let gloves_alps_gear_davos = rectangle3x4.containing(["GLOVES", "ALPS", "GEAR", "DAVOS"], from: words)[0]
        let white_wet = edges.containing(["WHITE", "WET"], from: words)[0]
        let quiet_wet = edges.containing(["QUIET", "WET"], from: words)[1]
        let snow_cow = edges.containing(["SNOW", "COW"], from: words)[1]
        let quiet_luge = edges.containing(["QUIET", "LUGE"], from: words)[0]
        let frost_olympics = edges.containing(["FROST", "OLYMPICS"], from: words)[1]
        let powder_resort = edges.containing(["POWDER", "RESORT"], from: words)[0]
        let white_italy = edges.containing(["WHITE", "ITALY"], from: words)[0]
        let germany_italy = edges.containing(["GERMANY", "ITALY"], from: words)[1]
        let cold_davos = edges.containing(["COLD", "DAVOS"], from: words)[0]
        let ice_cow = edges.containing(["ICE", "COW"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            snow_moritz_olympics_freeze,
            snow_flurry_resort_olympics,
            skis_flurry_white_lift_sled,
            skis_pass,
            gloves_pass,
            gloves_alps_gear_davos,
            white_wet,
            quiet_wet,
            snow_cow,
            quiet_luge,
            frost_olympics,
            powder_resort,
            white_italy,
            germany_italy,
            cold_davos,
            ice_cow
        ], words: words)
        return result
    }
    
    public static func Shapes_8909() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8909) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 148,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let azalea_pansy_zinnia_lily = rectangle3x4.containing(["AZALEA", "PANSY", "ZINNIA", "LILY"], from: words)[0]
        let azalea_pansy_poppy_zinnia = rectangle3x4_TopLeft.containing(["AZALEA", "PANSY", "POPPY", "ZINNIA"], from: words)[0]
        let may_poppy = edges.containing(["MAY", "POPPY"], from: words)[0]
        let may_mimosa = edges.containing(["MAY", "MIMOSA"], from: words)[0]
        let sage_mimosa = edges.containing(["SAGE", "MIMOSA"], from: words)[0]
        let azalea_aloe = edges.containing(["AZALEA", "ALOE"], from: words)[4]
        let oxlip_aloe = edges.containing(["OXLIP", "ALOE"], from: words)[0]
        let oxlip_tansy_lotus_lupin = square3x3.containing(["OXLIP", "TANSY", "LOTUS", "LUPIN"], from: words)[0]
        let tansy_cactus_stock_lotus_aster = c2x3.containing(["TANSY", "CACTUS", "STOCK", "LOTUS", "ASTER"], from: words)[0]
        let tulip_tansy_lupin_peony = rectangle3x5.containing(["TULIP", "TANSY", "LUPIN", "PEONY"], from: words)[0]
        let cactus_rose_iris_balsam = square3x3_TopLeft.containing(["CACTUS", "ROSE", "IRIS", "BALSAM"], from: words)[0]
        let rose_alyssum_iris_balsam = square3x3.containing(["ROSE", "ALYSSUM", "IRIS", "BALSAM"], from: words)[0]
        let nerine_aster = edges.containing(["NERINE", "ASTER"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            azalea_pansy_zinnia_lily,
            azalea_pansy_poppy_zinnia,
            may_poppy,
            may_mimosa,
            sage_mimosa,
            azalea_aloe,
            oxlip_aloe,
            oxlip_tansy_lotus_lupin,
            tansy_cactus_stock_lotus_aster,
            tulip_tansy_lupin_peony,
            cactus_rose_iris_balsam,
            rose_alyssum_iris_balsam,
            nerine_aster
        ], words: words)
        return result
    }
       
    
    public static func Shapes_8911() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8911) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c3x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 142,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.BottomRight(
            start: words,
            end: end,
            len: len,
            scoreMin: 138,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let trainer_zulu_prize_field = square3x3.containing(["TRAINER", "ZULU", "PRIZE", "FIELD"], from: words)[0]
        let hats_tuesday_trainer_gate_turf_course = pacman3x3_BottomRight.containing(["HATS", "TUESDAY", "TRAINER", "GATE", "TURF", "COURSE"], from: words)[0]
        let tuesday_money = edges.containing(["TUESDAY", "MONEY"], from: words)[1]
        let time_wotan_wins_kiwi_money_bets = c3x3.containing(["TIME", "WOTAN", "WINS", "KIWI", "MONEY", "BETS"], from: words)[0]
        let tuesday_silks = edges.containing(["TUESDAY", "SILKS"], from: words)[0]
        let wotan_owner = edges.containing(["WOTAN", "OWNER"], from: words)[2]
        let run_course = edges.containing(["RUN", "COURSE"], from: words)[1]
        let tuesday_filly_turf_silks = square3x3.containing(["TUESDAY", "FILLY", "TURF", "SILKS"], from: words)[0]
        let start_silks = edges.containing(["START", "SILKS"], from: words)[1]
        let start_colt = edges.containing(["START", "COLT"], from: words)[1]
        let cup_colt = edges.containing(["CUP", "COLT"], from: words)[0]
        let cup_post = edges.containing(["CUP", "POST"], from: words)[0]
        let track_course = edges.containing(["TRACK", "COURSE"], from: words)[0]
        let track_tab = edges.containing(["TRACK", "TAB"], from: words)[0]
        let malua_tab = edges.containing(["MALUA", "TAB"], from: words)[1]
        let malua_race_mare_place = square3x3.containing(["MALUA", "RACE", "MARE", "PLACE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            trainer_zulu_prize_field,
            hats_tuesday_trainer_gate_turf_course,
            tuesday_money,
            time_wotan_wins_kiwi_money_bets,
            tuesday_silks,
            wotan_owner,
            run_course,
            tuesday_filly_turf_silks,
            start_silks,
            start_colt,
            cup_colt,
            cup_post,
            track_course,
            track_tab,
            malua_tab,
            malua_race_mare_place
        ], words: words)
        return result
    }
    
    
    public static func Shapes_8912() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 8912) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let blitzen_card_holly_razor = rectangle3x4_TopRight.containing(["BLITZEN", "CARD", "HOLLY", "RAZOR"], from: words)[0]
        let blitzen_joy_box_holly = c2x2.containing(["BLITZEN", "JOY", "BOX", "HOLLY"], from: words)[0]
        let iron_blitzen_razor_seasoning = square3x3.containing(["IRON", "BLITZEN", "RAZOR", "SEASONING"], from: words)[0]
        let bells_tools_belt_seasoning = rectangle4x5.containing(["BELLS", "TOOLS", "BELT", "SEASONING"], from: words)[0]
        let watch_holly = edges.containing(["WATCH", "HOLLY"], from: words)[0]
        let yule_watch_toys_sweets = rectangle3x4_TopRight.containing(["YULE", "WATCH", "TOYS", "SWEETS"], from: words)[0]
        let ties_yule_toys_sweets = rectangle3x4.containing(["TIES", "YULE", "TOYS", "SWEETS"], from: words)[0]
        let video_socks_vase_toys = rectangle3x5.containing(["VIDEO", "SOCKS", "VASE", "TOYS"], from: words)[0]
        let wine_sweets = edges.containing(["WINE", "SWEETS"], from: words)[0]
        let watch_wallet = edges.containing(["WATCH", "WALLET"], from: words)[0]
        let tinsel_santa_nuts_wallet = square4x4.containing(["TINSEL", "SANTA", "NUTS", "WALLET"], from: words)[0]
        let tinsel_tree = edges.containing(["TINSEL", "TREE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            blitzen_card_holly_razor,
            blitzen_joy_box_holly,
            iron_blitzen_razor_seasoning,
            bells_tools_belt_seasoning,
            watch_holly,
            yule_watch_toys_sweets,
            ties_yule_toys_sweets,
            video_socks_vase_toys,
            wine_sweets,
            watch_wallet,
            tinsel_santa_nuts_wallet,
            tinsel_tree
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9001() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9001) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let eyre_jantz_lyons_menzies = square3x3.containing(["EYRE", "JANTZ", "LYONS", "MENZIES"], from: words)[0]
        let fisk_menzies = edges.containing(["FISK", "MENZIES"], from: words)[1]
        let mawson_menzies = edges.containing(["MAWSON", "MENZIES"], from: words)[0]
        let mawson_oxley = edges.containing(["MAWSON", "OXLEY"], from: words)[0]
        let boyd_oxley = edges.containing(["BOYD", "OXLEY"], from: words)[1]
        let gold_oxley = edges.containing(["GOLD", "OXLEY"], from: words)[1]
        let fisk_fysh = edges.containing(["FISK", "FYSH"], from: words)[0]
        let murray_chifley_dark_fysh = square3x3_BottomLeft.containing(["MURRAY", "CHIFLEY", "DARK", "FYSH"], from: words)[0]
        let chifley_quay = edges.containing(["CHIFLEY", "QUAY"], from: words)[0]
        let murray_sturt = edges.containing(["MURRAY", "STURT"], from: words)[0]
        let bass_smith_roberts_sturt = rectangle4x5.containing(["BASS", "SMITH", "ROBERTS", "STURT"], from: words)[0]
        let reid_bass_roberts_sirius = square3x3.containing(["REID", "BASS", "ROBERTS", "SIRIUS"], from: words)[0]
        let fisher_sirius = edges.containing(["FISHER", "SIRIUS"], from: words)[0]
        let hume_quay = edges.containing(["HUME", "QUAY"], from: words)[0]
        let hume_dobell = edges.containing(["HUME", "DOBELL"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            eyre_jantz_lyons_menzies,
            fisk_menzies,
            mawson_menzies,
            mawson_oxley,
            boyd_oxley,
            gold_oxley,
            fisk_fysh,
            murray_chifley_dark_fysh,
            chifley_quay,
            murray_sturt,
            bass_smith_roberts_sturt,
            reid_bass_roberts_sirius,
            fisher_sirius,
            hume_quay,
            hume_dobell
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9003() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9003) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let eden_fitzroy_breeza_sydney = rectangle3x4.containing(["EDEN", "FITZROY", "BREEZA", "SYDNEY"], from: words)[0]
        let bunbury_eden_breeza_sydney = rectangle3x4.containing(["BUNBURY", "EDEN", "BREEZA", "SYDNEY"], from: words)[0]
        let bunbury_fitzroy_quilpie_breeza = rectangle3x5.containing(["BUNBURY", "FITZROY", "QUILPIE", "BREEZA"], from: words)[0]
        let fitzroy_ouyen = edges.containing(["FITZROY", "OUYEN"], from: words)[0]
        let ayr_ouyen = edges.containing(["AYR", "OUYEN"], from: words)[0]
        let young_ouyen = edges.containing(["YOUNG", "OUYEN"], from: words)[3]
        let young_hay = edges.containing(["YOUNG", "HAY"], from: words)[0]
        let nhill_quilpie = edges.containing(["NHILL", "QUILPIE"], from: words)[2]
        let nhill_lorne = edges.containing(["NHILL", "LORNE"], from: words)[2]
        let exeter_scone_texas_lorne = rectangle3x5.containing(["EXETER", "SCONE", "TEXAS", "LORNE"], from: words)[0]
        let stawell_exeter_texas_lorne = rectangle3x5.containing(["STAWELL", "EXETER", "TEXAS", "LORNE"], from: words)[0]
        let scone_wyee_nowra_bega = square3x3_TopRight.containing(["SCONE", "WYEE", "NOWRA", "BEGA"], from: words)[0]
        let wyee_avoca_bega_moe = square3x3_TopRight.containing(["WYEE", "AVOCA", "BEGA", "MOE"], from: words)[0]
        let scone_cairns = edges.containing(["SCONE", "CAIRNS"], from: words)[1]
        let uki_yass_tully_cairns = rectangle3x4.containing(["UKI", "YASS", "TULLY", "CAIRNS"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            eden_fitzroy_breeza_sydney,
            bunbury_eden_breeza_sydney,
            bunbury_fitzroy_quilpie_breeza,
            fitzroy_ouyen,
            ayr_ouyen,
            young_ouyen,
            young_hay,
            nhill_quilpie,
            nhill_lorne,
            exeter_scone_texas_lorne,
            stawell_exeter_texas_lorne,
            scone_wyee_nowra_bega,
            wyee_avoca_bega_moe,
            scone_cairns,
            uki_yass_tully_cairns
        ], words: words)
        return result
    }
    
    public static func Shapes_9004() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9004) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 54,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let quartz_zinc = edges.containing(["QUARTZ", "ZINC"], from: words)[0]
        let quartz_ruby_quarry_porphyry = square4x4.containing(["QUARTZ", "RUBY", "QUARRY", "PORPHYRY"], from: words)[0]
        let pyrites_porphyry = edges.containing(["PYRITES", "PORPHYRY"], from: words)[5]
        let clay_quarry = edges.containing(["CLAY", "QUARRY"], from: words)[1]
        let quartz_radium_quarry_gypsum = c2x2.containing(["QUARTZ", "RADIUM", "QUARRY", "GYPSUM"], from: words)[1]
        let onyx_quartz_rock_gypsum = rectangle3x4_BottomLeft.containing(["ONYX", "QUARTZ", "ROCK", "GYPSUM"], from: words)[0]
        let reef_radium_silver_face = c2x2.containing(["REEF", "RADIUM", "SILVER", "FACE"], from: words)[0]
        let jasper_talc_jet_silver = square3x3.containing(["JASPER", "TALC", "JET", "SILVER"], from: words)[0]
        let pewter_porphyry = edges.containing(["PEWTER", "PORPHYRY"], from: words)[0]
        let topaz_pewter_pit_zircon = square3x3.containing(["TOPAZ", "PEWTER", "PIT", "ZIRCON"], from: words)[0]
        let iron_zircon = edges.containing(["IRON", "ZIRCON"], from: words)[3]
        let iron_ochre = edges.containing(["IRON", "OCHRE"], from: words)[1]
        let steel_face = edges.containing(["STEEL", "FACE"], from: words)[1]
        let steel_tin = edges.containing(["STEEL", "TIN"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            quartz_zinc,
            quartz_ruby_quarry_porphyry,
            pyrites_porphyry,
            clay_quarry,
            quartz_radium_quarry_gypsum,
            onyx_quartz_rock_gypsum,
            reef_radium_silver_face,
            jasper_talc_jet_silver,
            pewter_porphyry,
            topaz_pewter_pit_zircon,
            iron_zircon,
            iron_ochre,
            steel_face,
            steel_tin
        ], words: words)
        return result
    }
    
    public static func Shapes_9005() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9005) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 90,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let mezzo_tenor_bizet_joan = square3x3.containing(["MEZZO", "TENOR", "BIZET", "JOAN"], from: words)[0]
        let tenor_pinza_duo_opus_trio = c2x3.containing(["TENOR", "PINZA", "DUO", "OPUS", "TRIO"], from: words)[0]
        let tempo_pinza_trio_mozart = square3x3.containing(["TEMPO", "PINZA", "TRIO", "MOZART"], from: words)[0]
        let pinza_baton_mozart_lind = rectangle3x4_TopRight.containing(["PINZA", "BATON", "MOZART", "LIND"], from: words)[0]
        let duo_chorus_duet_opus = c2x2.containing(["DUO", "CHORUS", "DUET", "OPUS"], from: words)[0]
        let chorus_forte_solo_duet = square3x3.containing(["CHORUS", "FORTE", "SOLO", "DUET"], from: words)[0]
        let ruffo_tempo_tune_oboe = rectangle3x4.containing(["RUFFO", "TEMPO", "TUNE", "OBOE"], from: words)[0]
        let chorus_dance = edges.containing(["CHORUS", "DANCE"], from: words)[0]
        let haydn_stage_alto_dance = rectangle3x4.containing(["HAYDN", "STAGE", "ALTO", "DANCE"], from: words)[0]
        let haydn_scenery = edges.containing(["HAYDN", "SCENERY"], from: words)[1]
        let basso_song_bass_scenery = rectangle3x4.containing(["BASSO", "SONG", "BASS", "SCENERY"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            mezzo_tenor_bizet_joan,
            tenor_pinza_duo_opus_trio,
            tempo_pinza_trio_mozart,
            pinza_baton_mozart_lind,
            duo_chorus_duet_opus,
            chorus_forte_solo_duet,
            ruffo_tempo_tune_oboe,
            chorus_dance,
            haydn_stage_alto_dance,
            haydn_scenery,
            basso_song_bass_scenery
        ], words: words)
        return result
    }
    
    public static func Shapes_9006() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9006) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 136,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let bronze_dart_sand_zander_whaler = c2x3.containing(["BRONZE", "DART", "SAND", "ZANDER", "WHALER"], from: words)[0]
        let bronze_stingray_bass_dory = c2x2.containing(["BRONZE", "STINGRAY", "BASS", "DORY"], from: words)[0]
        let dart_ray_zander_tunny = rectangle3x5.containing(["DART", "RAY", "ZANDER", "TUNNY"], from: words)[0]
        let stingray_squid_bass_tuna = square3x3_TopRight.containing(["STINGRAY", "SQUID", "BASS", "TUNA"], from: words)[0]
        let stingray_manta_trout_bonito = rectangle3x5_BottomRight.containing(["STINGRAY", "MANTA", "TROUT", "BONITO"], from: words)[0]
        let stingray_export_trout_bonito = square3x3.containing(["STINGRAY", "EXPORT", "TROUT", "BONITO"], from: words)[0]
        let seal_bronze_sand_whaler = square3x3.containing(["SEAL", "BRONZE", "SAND", "WHALER"], from: words)[0]
        let minnow_whaler = edges.containing(["MINNOW", "WHALER"], from: words)[0]
        let export_manta_bream_trout = rectangle3x4.containing(["EXPORT", "MANTA", "BREAM", "TROUT"], from: words)[0]
        let stingray_nets = edges.containing(["STINGRAY", "NETS"], from: words)[0]
        let line_nets = edges.containing(["LINE", "NETS"], from: words)[0]
        let shark_line_sole_roe = rectangle3x4.containing(["SHARK", "LINE", "SOLE", "ROE"], from: words)[0]
        let box_bonito = edges.containing(["BOX", "BONITO"], from: words)[0]
        let box_lax = edges.containing(["BOX", "LAX"], from: words)[0]
        let eel_lax = edges.containing(["EEL", "LAX"], from: words)[0]
        let orca_tuna = edges.containing(["ORCA", "TUNA"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            bronze_dart_sand_zander_whaler,
            bronze_stingray_bass_dory,
            dart_ray_zander_tunny,
            stingray_squid_bass_tuna,
            stingray_manta_trout_bonito,
            stingray_export_trout_bonito,
            seal_bronze_sand_whaler,
            minnow_whaler,
            export_manta_bream_trout,
            stingray_nets,
            line_nets,
            shark_line_sole_roe,
            box_bonito,
            box_lax,
            eel_lax,
            orca_tuna
        ], words: words)
        return result
    }
    
    public static func Shapes_9007() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9007) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 134,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x7 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 6,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let adams_zones_jazz_kansas = rectangle3x5.containing(["ADAMS", "ZONES", "JAZZ", "KANSAS"], from: words)[0]
        let arkansas_nixon_kansas_twain = rectangle3x5.containing(["ARKANSAS", "NIXON", "KANSAS", "TWAIN"], from: words)[0]
        let liberty_webster_arkansas_twain_hayes = c2x3.containing(["LIBERTY", "WEBSTER", "ARKANSAS", "TWAIN", "HAYES"], from: words)[0]
        let nixon_howe_ohio_lee = rectangle3x4_TopRight.containing(["NIXON", "HOWE", "OHIO", "LEE"], from: words)[0]
        let liberty_arkansas_tyler_hayes = rectangle3x7.containing(["LIBERTY", "ARKANSAS", "TYLER", "HAYES"], from: words)[0]
        let july_arkansas_bush_tyler = rectangle3x4_BottomLeft.containing(["JULY", "ARKANSAS", "BUSH", "TYLER"], from: words)[0]
        let texas_tyler = edges.containing(["TEXAS", "TYLER"], from: words)[0]
        let webster_sequoia = edges.containing(["WEBSTER", "SEQUOIA"], from: words)[0]
        let quota_iowa_sequoia_stowe = square3x3.containing(["QUOTA", "IOWA", "SEQUOIA", "STOWE"], from: words)[0]
        let webster_taft = edges.containing(["WEBSTER", "TAFT"], from: words)[1]
        let utah_taft = edges.containing(["UTAH", "TAFT"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            adams_zones_jazz_kansas,
            arkansas_nixon_kansas_twain,
            liberty_webster_arkansas_twain_hayes,
            nixon_howe_ohio_lee,
            liberty_arkansas_tyler_hayes,
            july_arkansas_bush_tyler,
            texas_tyler,
            webster_sequoia,
            quota_iowa_sequoia_stowe,
            webster_taft,
            utah_taft
        ], words: words)
        return result
    }
    
    public static func Shapes_9009() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9009) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 150,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let zone_gulf_zigzag_reef = rectangle3x4.containing(["ZONE", "GULF", "ZIGZAG", "REEF"], from: words)[1]
        let zenith_zigzag = edges.containing(["ZENITH", "ZIGZAG"], from: words)[0]
        let wind_cables_streets_zenith_west_isthmus = c2x4.containing(["WIND", "CABLES", "STREETS", "ZENITH", "WEST", "ISTHMUS"], from: words)[0]
        let metres_sea_isthmus_estuary = square3x3.containing(["METRES", "SEA", "ISTHMUS", "ESTUARY"], from: words)[0]
        let bay_estuary = edges.containing(["BAY", "ESTUARY"], from: words)[1]
        let metres_soil_cities_south = c2x2.containing(["METRES", "SOIL", "CITIES", "SOUTH"], from: words)[1]
        let metres_routes_estuary_south = square4x4.containing(["METRES", "ROUTES", "ESTUARY", "SOUTH"], from: words)[0]
        let soil_routes_south_atlas = square3x3.containing(["SOIL", "ROUTES", "SOUTH", "ATLAS"], from: words)[0]
        let asia_cables_space_west = rectangle3x4_BottomLeft.containing(["ASIA", "CABLES", "SPACE", "WEST"], from: words)[0]
        let east_atlas = edges.containing(["EAST", "ATLAS"], from: words)[0]
        let east_trees = edges.containing(["EAST", "TREES"], from: words)[2]
        let east_tropic = edges.containing(["EAST", "TROPIC"], from: words)[0]
        let ports_trees = edges.containing(["PORTS", "TREES"], from: words)[1]
        let area_trees = edges.containing(["AREA", "TREES"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            zone_gulf_zigzag_reef,
            zenith_zigzag,
            wind_cables_streets_zenith_west_isthmus,
            metres_sea_isthmus_estuary,
            bay_estuary,
            metres_soil_cities_south,
            metres_routes_estuary_south,
            soil_routes_south_atlas,
            asia_cables_space_west,
            east_atlas,
            east_trees,
            east_tropic,
            ports_trees,
            area_trees
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9010() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9010) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 100,
           widthMax: widthMax,
           heightMax: heightMax))

        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 170,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let drama_crazy_trick_jazz = rectangle3x4.containing(["DRAMA", "CRAZY", "TRICK", "JAZZ"], from: words)[0]
        let mask_trick = edges.containing(["MASK", "TRICK"], from: words)[0]
        let mask_act_stage_author_smash_actor_star = c3x4.containing(["MASK", "ACT", "STAGE", "AUTHOR", "SMASH", "ACTOR", "STAR"], from: words)[0]
        let stage_motley_actor_debut = square4x4_BottomLeft.containing(["STAGE", "MOTLEY", "ACTOR", "DEBUT"], from: words)[0]
        let bill_motley_debut_play = rectangle3x4.containing(["BILL", "MOTLEY", "DEBUT", "PLAY"], from: words)[0]
        let author_satire_cast_actor = rectangle3x5_BottomRight.containing(["AUTHOR", "SATIRE", "CAST", "ACTOR"], from: words)[1]
        let magic_satire_tights_cast = rectangle3x4.containing(["MAGIC", "SATIRE", "TIGHTS", "CAST"], from: words)[0]
        let pit_tights = edges.containing(["PIT", "TIGHTS"], from: words)[2]
        let hit_tights = edges.containing(["HIT", "TIGHTS"], from: words)[0]
        let wings_smash = edges.containing(["WINGS", "SMASH"], from: words)[0]
        let hero_box_wings_show_exit = c2x3.containing(["HERO", "BOX", "WINGS", "SHOW", "EXIT"], from: words)[0]
        let hero_wings_show_song = rectangle3x4.containing(["HERO", "WINGS", "SHOW", "SONG"], from: words)[0]
        let set_song = edges.containing(["SET", "SONG"], from: words)[0]
        let gods_show = edges.containing(["GODS", "SHOW"], from: words)[0]
        let gods_gag = edges.containing(["GODS", "GAG"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            drama_crazy_trick_jazz,
            mask_trick,
            mask_act_stage_author_smash_actor_star,
            stage_motley_actor_debut,
            bill_motley_debut_play,
            author_satire_cast_actor,
            magic_satire_tights_cast,
            pit_tights,
            hit_tights,
            wings_smash,
            hero_box_wings_show_exit,
            hero_wings_show_song,
            set_song,
            gods_show,
            gods_gag
        ], words: words)
        return result
    }
    
    
    
    
    public static func Shapes_9011() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9011) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_time_narita_zimbabwe = square3x3.containing(["BRAZIL", "TIME", "NARITA", "ZIMBABWE"], from: words)[0]
        let time_wales_zimbabwe_tea = square3x3_TopRight.containing(["TIME", "WALES", "ZIMBABWE", "TEA"], from: words)[0]
        let taxi_wales_asia_tea_class = c2x3.containing(["TAXI", "WALES", "ASIA", "TEA", "CLASS"], from: words)[0]
        let taxi_asia_class_italy = square3x3.containing(["TAXI", "ASIA", "CLASS", "ITALY"], from: words)[0]
        let orly_italy = edges.containing(["ORLY", "ITALY"], from: words)[1]
        let view_zimbabwe = edges.containing(["VIEW", "ZIMBABWE"], from: words)[1]
        let turkey_italy = edges.containing(["TURKEY", "ITALY"], from: words)[0]
        let turkey_sleep_paris_oxygen = rectangle3x4.containing(["TURKEY", "SLEEP", "PARIS", "OXYGEN"], from: words)[0]
        let pilot_turkey_paris_oxygen = rectangle3x4.containing(["PILOT", "TURKEY", "PARIS", "OXYGEN"], from: words)[0]
        let safety_pilot_meal_egypt = square3x3.containing(["SAFETY", "PILOT", "MEAL", "EGYPT"], from: words)[0]
        let travel_safety_visa_meal = rectangle3x4_BottomLeft.containing(["TRAVEL", "SAFETY", "VISA", "MEAL"], from: words)[0]
        let travel_rug = edges.containing(["TRAVEL", "RUG"], from: words)[0]
        let india_narita = edges.containing(["INDIA", "NARITA"], from: words)[0]
        let view_fin = edges.containing(["VIEW", "FIN"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            brazil_time_narita_zimbabwe,
            time_wales_zimbabwe_tea,
            taxi_wales_asia_tea_class,
            taxi_asia_class_italy,
            orly_italy,
            view_zimbabwe,
            turkey_italy,
            turkey_sleep_paris_oxygen,
            pilot_turkey_paris_oxygen,
            safety_pilot_meal_egypt,
            travel_safety_visa_meal,
            travel_rug,
            india_narita,
            view_fin
        ], words: words)
        return result
    }
    
    public static func Shapes_9012() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9012) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 78,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let future_money_turner_marley = rectangle3x4.containing(["FUTURE", "MONEY", "TURNER", "MARLEY"], from: words)[0]
        let future_money_firm_turner = rectangle3x4.containing(["FUTURE", "MONEY", "FIRM", "TURNER"], from: words)[0]
        let dream_marley = edges.containing(["DREAM", "MARLEY"], from: words)[0]
        let frosty_turner = edges.containing(["FROSTY", "TURNER"], from: words)[1]
        let frosty_happy = edges.containing(["FROSTY", "HAPPY"], from: words)[0]
        let holly_past_happy_bless = square3x3.containing(["HOLLY", "PAST", "HAPPY", "BLESS"], from: words)[0]
        let winter_holly_bless_tiny = square3x3_TopLeft.containing(["WINTER", "HOLLY", "BLESS", "TINY"], from: words)[0]
        let sleet_winter_new_tiny = c2x2.containing(["SLEET", "WINTER", "NEW", "TINY"], from: words)[0]
        let foggy_winter_grate_year = rectangle3x4.containing(["FOGGY", "WINTER", "GRATE", "YEAR"], from: words)[0]
        let past_silver_bless_tim = c2x2.containing(["PAST", "SILVER", "BLESS", "TIM"], from: words)[0]
        let bob_silver_eve_poor = square3x3_TopLeft.containing(["BOB", "SILVER", "EVE", "POOR"], from: words)[0]
        let ghost_sleet_sole_new = square3x3_TopRight.containing(["GHOST", "SLEET", "SOLE", "NEW"], from: words)[0]
        let dream_joe = edges.containing(["DREAM", "JOE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            future_money_turner_marley,
            future_money_firm_turner,
            dream_marley,
            frosty_turner,
            frosty_happy,
            holly_past_happy_bless,
            winter_holly_bless_tiny,
            sleet_winter_new_tiny,
            foggy_winter_grate_year,
            past_silver_bless_tim,
            bob_silver_eve_poor,
            ghost_sleet_sole_new,
            dream_joe
        ], words: words)
        return result
    }
    
    public static func Shapes_9101() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9101) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 168,
           widthMax: widthMax,
           heightMax: heightMax))

        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 186,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let relax_quiet_stove_party_rest_jetty = c2x4.containing(["RELAX", "QUIET", "STOVE", "PARTY", "REST", "JETTY"], from: words)[0]
        let ease_quiet_sleep_scuba = square3x3_BottomLeft.containing(["EASE", "QUIET", "SLEEP", "SCUBA"], from: words)[0]
        let sport_sleep = edges.containing(["SPORT", "SLEEP"], from: words)[0]
        let sport_sand_oars_tan = c2x2.containing(["SPORT", "SAND", "OARS", "TAN"], from: words)[0]
        let forest_oars = edges.containing(["FOREST", "OARS"], from: words)[0]
        let forest_spade = edges.containing(["FOREST", "SPADE"], from: words)[0]
        let party_scuba = edges.containing(["PARTY", "SCUBA"], from: words)[0]
        let amusement_spade = edges.containing(["AMUSEMENT", "SPADE"], from: words)[0]
        let bat_amusement_sun_hat_bush_casual_tent = c3x4.containing(["BAT", "AMUSEMENT", "SUN", "HAT", "BUSH", "CASUAL", "TENT"], from: words)[0]
        let sand_spade = edges.containing(["SAND", "SPADE"], from: words)[0]
        let amusement_tennis = edges.containing(["AMUSEMENT", "TENNIS"], from: words)[0]
        let fun_dunes_quay_tennis = rectangle3x4_TopLeft.containing(["FUN", "DUNES", "QUAY", "TENNIS"], from: words)[0]
        let flying_quay = edges.containing(["FLYING", "QUAY"], from: words)[0]
        let amusement_reef = edges.containing(["AMUSEMENT", "REEF"], from: words)[0]
        let rod_reef = edges.containing(["ROD", "REEF"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            relax_quiet_stove_party_rest_jetty,
            ease_quiet_sleep_scuba,
            sport_sleep,
            sport_sand_oars_tan,
            forest_oars,
            forest_spade,
            party_scuba,
            amusement_spade,
            bat_amusement_sun_hat_bush_casual_tent,
            sand_spade,
            amusement_tennis,
            fun_dunes_quay_tennis,
            flying_quay,
            amusement_reef,
            rod_reef
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9103() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9103) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let cenis_olympus_cook_whitney = square3x3.containing(["CENIS", "OLYMPUS", "COOK", "WHITNEY"], from: words)[0]
        let jungfrau_olympus_jura_vesuvius = c2x2.containing(["JUNGFRAU", "OLYMPUS", "JURA", "VESUVIUS"], from: words)[0]
        let wilhelm_everest_blue_vesuvius = rectangle3x4_BottomLeft.containing(["WILHELM", "EVEREST", "BLUE", "VESUVIUS"], from: words)[0]
        let wilhelm_white_whitney_blue = square3x3.containing(["WILHELM", "WHITE", "WHITNEY", "BLUE"], from: words)[0]
        let pelee_everest_alps_etna = c2x2.containing(["PELEE", "EVEREST", "ALPS", "ETNA"], from: words)[0]
        let everest_jungfrau_vesuvius_crag = square3x3.containing(["EVEREST", "JUNGFRAU", "VESUVIUS", "CRAG"], from: words)[0]
        let jungfrau_mckinley_rigi_ural = rectangle3x4.containing(["JUNGFRAU", "MCKINLEY", "RIGI", "URAL"], from: words)[0]
        let mckinley_rocky = edges.containing(["MCKINLEY", "ROCKY"], from: words)[2]
        let white_snow = edges.containing(["WHITE", "SNOW"], from: words)[0]
        let peak_pelee_alps_andes = square4x4_TopLeft.containing(["PEAK", "PELEE", "ALPS", "ANDES"], from: words)[0]
        //let jungfrau_etna = edges.containing(["JUNGFRAU", "ETNA"], from: words)[0]
        let hecla_jura = edges.containing(["HECLA", "JURA"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            cenis_olympus_cook_whitney,
            jungfrau_olympus_jura_vesuvius,
            wilhelm_everest_blue_vesuvius,
            wilhelm_white_whitney_blue,
            pelee_everest_alps_etna,
            everest_jungfrau_vesuvius_crag,
            jungfrau_mckinley_rigi_ural,
            mckinley_rocky,
            white_snow,
            peak_pelee_alps_andes,
            //jungfrau_etna,
            hecla_jura
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9104() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9104) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 128,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let zenith_zero = edges.containing(["ZENITH", "ZERO"], from: words)[0]
        let waves_steer_stars_zenith_west_earth = c2x4.containing(["WAVES", "STEER", "STARS", "ZENITH", "WEST", "EARTH"], from: words)[0]
        let tables_fix_midday_waves_time_axis = c2x4.containing(["TABLES", "FIX", "MIDDAY", "WAVES", "TIME", "AXIS"], from: words)[0]
        let tables_midday_time_sky = rectangle3x6.containing(["TABLES", "MIDDAY", "TIME", "SKY"], from: words)[0]
        let steer_zenith_sextant_west = square3x3.containing(["STEER", "ZENITH", "SEXTANT", "WEST"], from: words)[0]
        let lee_tropics_pilot_zero = square3x3.containing(["LEE", "TROPICS", "PILOT", "ZERO"], from: words)[0]
        let stars_signs = edges.containing(["STARS", "SIGNS"], from: words)[2]
        let globe_south_signs_orbit = rectangle3x4.containing(["GLOBE", "SOUTH", "SIGNS", "ORBIT"], from: words)[0]
        let sun_sextant = edges.containing(["SUN", "SEXTANT"], from: words)[0]
        let log_orbit = edges.containing(["LOG", "ORBIT"], from: words)[0]
        let moon_signs = edges.containing(["MOON", "SIGNS"], from: words)[0]
        let moon_box = edges.containing(["MOON", "BOX"], from: words)[0]
        let range_sextant = edges.containing(["RANGE", "SEXTANT"], from: words)[0]
        let pole_range_port_line = square3x3.containing(["POLE", "RANGE", "PORT", "LINE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            zenith_zero,
            waves_steer_stars_zenith_west_earth,
            tables_fix_midday_waves_time_axis,
            tables_midday_time_sky,
            steer_zenith_sextant_west,
            lee_tropics_pilot_zero,
            stars_signs,
            globe_south_signs_orbit,
            sun_sextant,
            log_orbit,
            moon_signs,
            moon_box,
            range_sextant,
            pole_range_port_line
        ], words: words)
        return result
    }
    
    public static func Shapes_9105() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9105) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 116,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let louis_majesty_cole_dynasty = rectangle3x4.containing(["LOUIS", "MAJESTY", "COLE", "DYNASTY"], from: words)[0]
        let royalty_dynasty = edges.containing(["ROYALTY", "DYNASTY"], from: words)[1]
        let cabinet_royalty_henry_attila = square3x3.containing(["CABINET", "ROYALTY", "HENRY", "ATTILA"], from: words)[0]
        let cabinet_royalty_oberon_henry = square3x3.containing(["CABINET", "ROYALTY", "OBERON", "HENRY"], from: words)[0]
        let regent_oberon = edges.containing(["REGENT", "OBERON"], from: words)[1]
        let regent_arthur_lord_banner_rule_emperor = c2x4.containing(["REGENT", "ARTHUR", "LORD", "BANNER", "RULE", "EMPEROR"], from: words)[0]
        let throne_arthur_coronet_emperor = rectangle4x5.containing(["THRONE", "ARTHUR", "CORONET", "EMPEROR"], from: words)[0]
        let throne_rani_victoria_coronet = square3x3.containing(["THRONE", "RANI", "VICTORIA", "CORONET"], from: words)[1]
        let midas_throne_coronet_ivan = rectangle3x4_TopLeft.containing(["MIDAS", "THRONE", "CORONET", "IVAN"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            louis_majesty_cole_dynasty,
            royalty_dynasty,
            cabinet_royalty_henry_attila,
            cabinet_royalty_oberon_henry,
            regent_oberon,
            regent_arthur_lord_banner_rule_emperor,
            throne_arthur_coronet_emperor,
            throne_rani_victoria_coronet,
            midas_throne_coronet_ivan
        ], words: words)
        return result
    }
    
    public static func Shapes_9106() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9106) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let zeus_pluto_zephyrus_seth = rectangle3x4.containing(["ZEUS", "PLUTO", "ZEPHYRUS", "SETH"], from: words)[0]
        let rhea_saturn_zephyrus_nestor = square3x3.containing(["RHEA", "SATURN", "ZEPHYRUS", "NESTOR"], from: words)[0]
        let saturn_furies_nestor_adonis = rectangle3x4.containing(["SATURN", "FURIES", "NESTOR", "ADONIS"], from: words)[0]
        let odin_ionia_adonis_orion = square3x3.containing(["ODIN", "IONIA", "ADONIS", "ORION"], from: words)[0]
        let jason_odin_adonis_orion = square3x3.containing(["JASON", "ODIN", "ADONIS", "ORION"], from: words)[1]
        let mercury_jason_mars_creon = rectangle3x4.containing(["MERCURY", "JASON", "MARS", "CREON"], from: words)[0]
        let mercury_olympus_ulysses_nymphs = square3x3.containing(["MERCURY", "OLYMPUS", "ULYSSES", "NYMPHS"], from: words)[1]
        let olympus_isis_ulysses_nymphs = square3x3.containing(["OLYMPUS", "ISIS", "ULYSSES", "NYMPHS"], from: words)[0]
        //let olympus_creon = edges.containing(["OLYMPUS", "CREON"], from: words)[0]
        let olympus_abas = edges.containing(["OLYMPUS", "ABAS"], from: words)[0]
        let satyr_ulysses = edges.containing(["SATYR", "ULYSSES"], from: words)[2]
        let satyr_paris = edges.containing(["SATYR", "PARIS"], from: words)[1]
        let eros_paris = edges.containing(["EROS", "PARIS"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            zeus_pluto_zephyrus_seth,
            rhea_saturn_zephyrus_nestor,
            saturn_furies_nestor_adonis,
            odin_ionia_adonis_orion,
            jason_odin_adonis_orion,
            mercury_jason_mars_creon,
            mercury_olympus_ulysses_nymphs,
            olympus_isis_ulysses_nymphs,
            //olympus_creon,
            olympus_abas,
            satyr_ulysses,
            satyr_paris,
            eros_paris
        ], words: words)
        return result
    }
    
    public static func Shapes_9107() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9107) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 110,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let dazzle_royce_duty_benzine = rectangle3x4.containing(["DAZZLE", "ROYCE", "DUTY", "BENZINE"], from: words)[0]
        let sport_royce_rotor_rolls_duty = c2x3.containing(["SPORT", "ROYCE", "ROTOR", "ROLLS", "DUTY"], from: words)[0]
        let sport_tail_seats_rolls = square4x4.containing(["SPORT", "TAIL", "SEATS", "ROLLS"], from: words)[0]
        let royce_speed_rolls_care = rectangle3x4.containing(["ROYCE", "SPEED", "ROLLS", "CARE"], from: words)[0]
        let cars_sport_rotor_duty = rectangle3x4_TopRight.containing(["CARS", "SPORT", "ROTOR", "DUTY"], from: words)[0]
        let cars_gas = edges.containing(["CARS", "GAS"], from: words)[1]
        let belt_dazzle_benzine_tyre = square4x4.containing(["BELT", "DAZZLE", "BENZINE", "TYRE"], from: words)[0]
        let axle_dazzle_gas_benzine = rectangle3x4_TopRight.containing(["AXLE", "DAZZLE", "GAS", "BENZINE"], from: words)[0]
        let nut_benzine = edges.containing(["NUT", "BENZINE"], from: words)[1]
        let road_brake_tyre_air = square3x3_BottomLeft.containing(["ROAD", "BRAKE", "TYRE", "AIR"], from: words)[0]
        let cars_lock = edges.containing(["CARS", "LOCK"], from: words)[0]
        let brake_boot = edges.containing(["BRAKE", "BOOT"], from: words)[0]
        let horn_auto_hubs_boot_roof = c2x3.containing(["HORN", "AUTO", "HUBS", "BOOT", "ROOF"], from: words)[0]
        let auto_safety_hubs_roof = square3x3.containing(["AUTO", "SAFETY", "HUBS", "ROOF"], from: words)[0]
        let safety_key = edges.containing(["SAFETY", "KEY"], from: words)[1]
        let brake_spare = edges.containing(["BRAKE", "SPARE"], from: words)[2]
        let vans_spare = edges.containing(["VANS", "SPARE"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            dazzle_royce_duty_benzine,
            sport_royce_rotor_rolls_duty,
            sport_tail_seats_rolls,
            royce_speed_rolls_care,
            cars_sport_rotor_duty,
            cars_gas,
            belt_dazzle_benzine_tyre,
            axle_dazzle_gas_benzine,
            nut_benzine,
            road_brake_tyre_air,
            cars_lock,
            brake_boot,
            horn_auto_hubs_boot_roof,
            auto_safety_hubs_roof,
            safety_key,
            brake_spare,
            vans_spare
        ], words: words)
        return result
    }
    
    public static func Shapes_9108() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9108) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let ozone_wet_low_zephyr_hot = c2x3.containing(["OZONE", "WET", "LOW", "ZEPHYR", "HOT"], from: words)[0]
        let dusty_zephyr = edges.containing(["DUSTY", "ZEPHYR"], from: words)[0]
        let dusty_gust_dull_cumulus_storm = c2x3.containing(["DUSTY", "GUST", "DULL", "CUMULUS", "STORM"], from: words)[0]
        let gust_polar_dull_storm = square3x3.containing(["GUST", "POLAR", "DULL", "STORM"], from: words)[0]
        let eurus_dusty_cloud_cumulus = square3x3_BottomLeft.containing(["EURUS", "DUSTY", "CLOUD", "CUMULUS"], from: words)[1]
        let muggy_storm = edges.containing(["MUGGY", "STORM"], from: words)[0]
        let muggy_foggy = edges.containing(["MUGGY", "FOGGY"], from: words)[4]
        let frosts_gale_foggy_sleet = rectangle3x4.containing(["FROSTS", "GALE", "FOGGY", "SLEET"], from: words)[0]
        let thaw_sleet = edges.containing(["THAW", "SLEET"], from: words)[0]
        let thaw_snow = edges.containing(["THAW", "SNOW"], from: words)[0]
        let tropic_frosts_meteor_hills = rectangle4x5.containing(["TROPIC", "FROSTS", "METEOR", "HILLS"], from: words)[0]
        let mist_tropic_meteor_smog = square3x3.containing(["MIST", "TROPIC", "METEOR", "SMOG"], from: words)[0]
        //let ozone_meteor = edges.containing(["OZONE", "METEOR"], from: words)[3]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            ozone_wet_low_zephyr_hot,
            dusty_zephyr,
            dusty_gust_dull_cumulus_storm,
            gust_polar_dull_storm,
            eurus_dusty_cloud_cumulus,
            muggy_storm,
            muggy_foggy,
            frosts_gale_foggy_sleet,
            thaw_sleet,
            thaw_snow,
            tropic_frosts_meteor_hills,
            mist_tropic_meteor_smog
            //ozone_meteor
        ], words: words)
        return result
    }
    
    public static func Shapes_9110() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9110) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let freezer_traymobile_squeezer_tray = square3x3.containing(["FREEZER", "TRAYMOBILE", "SQUEEZER", "TRAY"], from: words)[0]
        let freezer_apron = edges.containing(["FREEZER", "APRON"], from: words)[0]
        let fan_apron = edges.containing(["FAN", "APRON"], from: words)[1]
        let tea_apron = edges.containing(["TEA", "APRON"], from: words)[0]
        let scales_tea_basket_tiles = square4x4_BottomRight.containing(["SCALES", "TEA", "BASKET", "TILES"], from: words)[0]
        let scales_saucers_tiles_squeezer = square3x3.containing(["SCALES", "SAUCERS", "TILES", "SQUEEZER"], from: words)[0]
        let saucers_sieves_shears_sink = c2x2.containing(["SAUCERS", "SIEVES", "SHEARS", "SINK"], from: words)[0]
        let bottles_scales_basket_tiles = rectangle3x4.containing(["BOTTLES", "SCALES", "BASKET", "TILES"], from: words)[0]
        let sieves_kettle_sink_trivet = square3x3.containing(["SIEVES", "KETTLE", "SINK", "TRIVET"], from: words)[0]
        let stool_sieves_trivet_spoons = rectangle3x4.containing(["STOOL", "SIEVES", "TRIVET", "SPOONS"], from: words)[0]
        let glass_stool_gas_spoons = rectangle3x4.containing(["GLASS", "STOOL", "GAS", "SPOONS"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            freezer_traymobile_squeezer_tray,
            freezer_apron,
            fan_apron,
            tea_apron,
            scales_tea_basket_tiles,
            scales_saucers_tiles_squeezer,
            saucers_sieves_shears_sink,
            bottles_scales_basket_tiles,
            sieves_kettle_sink_trivet,
            stool_sieves_trivet_spoons,
            glass_stool_gas_spoons
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9111() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9111) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let hydrozoa_coast_protozoa_castle = square3x3.containing(["HYDROZOA", "COAST", "PROTOZOA", "CASTLE"], from: words)[0]
        let shells_weeds_castle_reefs = rectangle3x4.containing(["SHELLS", "WEEDS", "CASTLE", "REEFS"], from: words)[0]
        let shells_fins_reefs_line = square3x3.containing(["SHELLS", "FINS", "REEFS", "LINE"], from: words)[0]
        let hydrozoa_sharks_oyster_rocks = rectangle3x5.containing(["HYDROZOA", "SHARKS", "OYSTER", "ROCKS"], from: words)[0]
        let salt_sharks_molluscs_oyster = rectangle3x4.containing(["SALT", "SHARKS", "MOLLUSCS", "OYSTER"], from: words)[1]
        //let hydrozoa_coast_rocks_protozoa = square3x3.containing(["HYDROZOA", "COAST", "ROCKS", "PROTOZOA"], from: words)[0]
        let shells_mussels = edges.containing(["SHELLS", "MUSSELS"], from: words)[5]
        let dunes_mussels = edges.containing(["DUNES", "MUSSELS"], from: words)[1]
        let prawns_dunes_wind_sting = rectangle3x4.containing(["PRAWNS", "DUNES", "WIND", "STING"], from: words)[0]
        let prawns_protozoa = edges.containing(["PRAWNS", "PROTOZOA"], from: words)[0]
        let marine_molluscs = edges.containing(["MARINE", "MOLLUSCS"], from: words)[0]
        let roses_marine_surf_sand = square3x3.containing(["ROSES", "MARINE", "SURF", "SAND"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            hydrozoa_coast_protozoa_castle,
            shells_weeds_castle_reefs,
            shells_fins_reefs_line,
            hydrozoa_sharks_oyster_rocks,
            salt_sharks_molluscs_oyster,
            //hydrozoa_coast_rocks_protozoa,
            shells_mussels,
            dunes_mussels,
            prawns_dunes_wind_sting,
            prawns_protozoa,
            marine_molluscs,
            roses_marine_surf_sand
        ], words: words)
        return result
    }
    
    public static func Shapes_9112() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9112) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let marzipan_donner_blitzen_piper = square3x3.containing(["MARZIPAN", "DONNER", "BLITZEN", "PIPER"], from: words)[0]
        let brandy_holly_blitzen_merry = c2x2.containing(["BRANDY", "HOLLY", "BLITZEN", "MERRY"], from: words)[0]
        let brandy_toy = edges.containing(["BRANDY", "TOY"], from: words)[0]
        let star_toy = edges.containing(["STAR", "TOY"], from: words)[0]
        let star_tree = edges.containing(["STAR", "TREE"], from: words)[1]
        let toast_tree = edges.containing(["TOAST", "TREE"], from: words)[0]
        let toast_turkey = edges.containing(["TOAST", "TURKEY"], from: words)[1]
        let whisky_turkey = edges.containing(["WHISKY", "TURKEY"], from: words)[0]
        let whisky_eggnog_sweets_presents = rectangle3x4.containing(["WHISKY", "EGGNOG", "SWEETS", "PRESENTS"], from: words)[0]
        
        let marzipan_dance = edges.containing(["MARZIPAN", "DANCE"], from: words)[0]
        let holly_food = edges.containing(["HOLLY", "FOOD"], from: words)[1]
        let cream_merry = edges.containing(["CREAM", "MERRY"], from: words)[0]
        let eggnog_season_sweets_presents = rectangle3x4.containing(["EGGNOG", "SEASON", "SWEETS", "PRESENTS"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            marzipan_donner_blitzen_piper,
            brandy_holly_blitzen_merry,
            brandy_toy,
            star_toy,
            star_tree,
            toast_tree,
            toast_turkey,
            whisky_turkey,
            whisky_eggnog_sweets_presents,
            
            marzipan_dance,
            holly_food,
            cream_merry,
            eggnog_season_sweets_presents,
        ], words: words)
        return result
    }
    
    public static func Shapes_9201() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9201) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let sturt_lizards_matilda_macrozamia = square3x3.containing(["STURT", "LIZARDS", "MATILDA", "MACROZAMIA"], from: words)[0]
        let lizards_swagmen_macrozamia_iron = square3x3.containing(["LIZARDS", "SWAGMEN", "MACROZAMIA", "IRON"], from: words)[0]
        let wombat_sturt_ewe_matilda = square3x3_BottomLeft.containing(["WOMBAT", "STURT", "EWE", "MATILDA"], from: words)[0]
        let lizards_opossums = edges.containing(["LIZARDS", "OPOSSUMS"], from: words)[0]
        let oreilly_skink_opossums_station = rectangle3x4.containing(["OREILLY", "SKINK", "OPOSSUMS", "STATION"], from: words)[0]
        let oreilly_lillypilly = edges.containing(["OREILLY", "LILLYPILLY"], from: words)[7]
        let cassowary_lillypilly = edges.containing(["CASSOWARY", "LILLYPILLY"], from: words)[1]
        //let cassowary_opossums = edges.containing(["CASSOWARY", "OPOSSUMS"], from: words)[7]
        let wonga_oreilly_opossums_station = rectangle3x4.containing(["WONGA", "OREILLY", "OPOSSUMS", "STATION"], from: words)[0]
        let idriess_wonga_ion_station = square3x3.containing(["IDRIESS", "WONGA", "ION", "STATION"], from: words)[0]
        //let wombat_macrozamia = edges.containing(["WOMBAT", "MACROZAMIA"], from: words)[0]
        let mulga_macrozamia = edges.containing(["MULGA", "MACROZAMIA"], from: words)[4]
        //let swagmen_matilda = edges.containing(["SWAGMEN", "MATILDA"], from: words)[0]
        let swagmen_bats = edges.containing(["SWAGMEN", "BATS"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            sturt_lizards_matilda_macrozamia,
            lizards_swagmen_macrozamia_iron,
            wombat_sturt_ewe_matilda,
            lizards_opossums,
            oreilly_skink_opossums_station,
            oreilly_lillypilly,
            cassowary_lillypilly,
            //cassowary_opossums,
            wonga_oreilly_opossums_station,
            idriess_wonga_ion_station,
            //wombat_macrozamia,
            mulga_macrozamia,
            //swagmen_matilda,
            swagmen_bats
        ], words: words)
        return result
    }
    
    public static func Shapes_9202() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9202) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let shuttle_rapunzel_thumb_lizards = square3x3.containing(["SHUTTLE", "RAPUNZEL", "THUMB", "LIZARDS"], from: words)[0]
        let shuttle_rapunzel_servant_thumb = rectangle3x4.containing(["SHUTTLE", "RAPUNZEL", "SERVANT", "THUMB"], from: words)[0]
        let trolls_servant = edges.containing(["TROLLS", "SERVANT"], from: words)[2]
        let trolls_tower = edges.containing(["TROLLS", "TOWER"], from: words)[1]
        let hare_tower = edges.containing(["HARE", "TOWER"], from: words)[0]
        //let trolls_lizards = edges.containing(["TROLLS", "LIZARDS"], from: words)[0]
        let dreams_duck_lizards_beauty = square3x3_BottomLeft.containing(["DREAMS", "DUCK", "LIZARDS", "BEAUTY"], from: words)[0]
        let gryphon_beauty = edges.containing(["GRYPHON", "BEAUTY"], from: words)[0]
        let dreams_puss = edges.containing(["DREAMS", "PUSS"], from: words)[0]
        let straw_puss = edges.containing(["STRAW", "PUSS"], from: words)[1]
        let straw_frog = edges.containing(["STRAW", "FROG"], from: words)[0]
        let straw_wand = edges.containing(["STRAW", "WAND"], from: words)[0]
        let spells_puss = edges.containing(["SPELLS", "PUSS"], from: words)[0]
        let giant_spells_imps_nose = rectangle3x4.containing(["GIANT", "SPELLS", "IMPS", "NOSE"], from: words)[0]
        let spells_goose = edges.containing(["SPELLS", "GOOSE"], from: words)[1]
        let trolls_lie = edges.containing(["TROLLS", "LIE"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            shuttle_rapunzel_thumb_lizards,
            shuttle_rapunzel_servant_thumb,
            trolls_servant,
            trolls_tower,
            hare_tower,
            //trolls_lizards,
            dreams_duck_lizards_beauty,
            gryphon_beauty,
            dreams_puss,
            straw_puss,
            straw_frog,
            straw_wand,
            spells_puss,
            giant_spells_imps_nose,
            spells_goose,
            trolls_lie
        ], words: words)
        return result
    }
    
    public static func Shapes_9203() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9203) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 166,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let guilt_stay_usher_lawsuit_law_penalty = c2x4.containing(["GUILT", "STAY", "USHER", "LAWSUIT", "LAW", "PENALTY"], from: words)[0]
        let aver_assault_lawsuit_penalty = square3x3.containing(["AVER", "ASSAULT", "LAWSUIT", "PENALTY"], from: words)[0]
        let assault_writ = edges.containing(["ASSAULT", "WRIT"], from: words)[0]
        let witness_writ = edges.containing(["WITNESS", "WRIT"], from: words)[0]
        let witness_seal = edges.containing(["WITNESS", "SEAL"], from: words)[1]
        let bribery_usher = edges.containing(["BRIBERY", "USHER"], from: words)[1]
        let bribery_larceny = edges.containing(["BRIBERY", "LARCENY"], from: words)[3]
        //let assault_larceny = edges.containing(["ASSAULT", "LARCENY"], from: words)[2]
        let felony_larceny = edges.containing(["FELONY", "LARCENY"], from: words)[0]
        let felony_legacy = edges.containing(["FELONY", "LEGACY"], from: words)[2]
        let felony_proof = edges.containing(["FELONY", "PROOF"], from: words)[1]
        let forgery_proof = edges.containing(["FORGERY", "PROOF"], from: words)[0]
        let court_forgery_judge_custody = rectangle3x4.containing(["COURT", "FORGERY", "JUDGE", "CUSTODY"], from: words)[0]
        //let court_legacy = edges.containing(["COURT", "LEGACY"], from: words)[0]
        let plea_legacy = edges.containing(["PLEA", "LEGACY"], from: words)[0]
        //let plea_seal = edges.containing(["PLEA", "SEAL"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            guilt_stay_usher_lawsuit_law_penalty,
            aver_assault_lawsuit_penalty,
            assault_writ,
            witness_writ,
            witness_seal,
            bribery_usher,
            bribery_larceny,
            //assault_larceny,
            felony_larceny,
            felony_legacy,
            felony_proof,
            forgery_proof,
            court_forgery_judge_custody,
            //court_legacy,
            plea_legacy
            //plea_seal
        ], words: words)
        return result
    }
    
    public static func Shapes_9205() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9205) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 116,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let cabinet_royalty_henry_attila = square3x3.containing(["CABINET", "ROYALTY", "HENRY", "ATTILA"], from: words)[0]
        let royalty_dynasty = edges.containing(["ROYALTY", "DYNASTY"], from: words)[4]
        let louis_majesty_cole_dynasty = rectangle3x4.containing(["LOUIS", "MAJESTY", "COLE", "DYNASTY"], from: words)[0]
        let cabinet_royalty_oberon_henry = square3x3.containing(["CABINET", "ROYALTY", "OBERON", "HENRY"], from: words)[0]
        let regent_oberon = edges.containing(["REGENT", "OBERON"], from: words)[3]
        let regent_arthur_lord_banner_rule_emperor = c2x4.containing(["REGENT", "ARTHUR", "LORD", "BANNER", "RULE", "EMPEROR"], from: words)[0]
        let rani_arthur_victoria_coronet = square3x3.containing(["RANI", "ARTHUR", "VICTORIA", "CORONET"], from: words)[0]
        let throne_rani_victoria_coronet = square3x3.containing(["THRONE", "RANI", "VICTORIA", "CORONET"], from: words)[0]
        let throne_ivan = edges.containing(["THRONE", "IVAN"], from: words)[0]
        let midas_ivan = edges.containing(["MIDAS", "IVAN"], from: words)[0]
        //let throne_emperor = edges.containing(["THRONE", "EMPEROR"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            cabinet_royalty_henry_attila,
            royalty_dynasty,
            louis_majesty_cole_dynasty,
            cabinet_royalty_oberon_henry,
            regent_oberon,
            regent_arthur_lord_banner_rule_emperor,
            rani_arthur_victoria_coronet,
            throne_rani_victoria_coronet,
            throne_ivan,
            midas_ivan
            //throne_emperor
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9206() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9206) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let clot_eczema_lozenge_anatomy = square3x3.containing(["CLOT", "ECZEMA", "LOZENGE", "ANATOMY"], from: words)[0]
        let galen_anatomy = edges.containing(["GALEN", "ANATOMY"], from: words)[1]
        let eczema_reid = edges.containing(["ECZEMA", "REID"], from: words)[0]
        let eyes_lozenge = edges.containing(["EYES", "LOZENGE"], from: words)[2]
        let ail_eczema_anatomy_salve = rectangle3x4_BottomRight.containing(["AIL", "ECZEMA", "ANATOMY", "SALVE"], from: words)[0]
        let salk_salve = edges.containing(["SALK", "SALVE"], from: words)[0]
        let virus_salve = edges.containing(["VIRUS", "SALVE"], from: words)[0]
        let body_virus_remedy_burnet_dose = c2x3.containing(["BODY", "VIRUS", "REMEDY", "BURNET", "DOSE"], from: words)[0]
        let body_oxygen = edges.containing(["BODY", "OXYGEN"], from: words)[1]
        let bone_remedy_oxygen_embryo = rectangle3x5.containing(["BONE", "REMEDY", "OXYGEN", "EMBRYO"], from: words)[0]
        let cure_nurse_pulse_burnet = square3x3_BottomRight.containing(["CURE", "NURSE", "PULSE", "BURNET"], from: words)[0]
        let thomas_burnet = edges.containing(["THOMAS", "BURNET"], from: words)[0]
        let thomas_iodine_cold_pain = square3x3.containing(["THOMAS", "IODINE", "COLD", "PAIN"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            clot_eczema_lozenge_anatomy,
            galen_anatomy,
            eczema_reid,
            eyes_lozenge,
            ail_eczema_anatomy_salve,
            salk_salve,
            virus_salve,
            body_virus_remedy_burnet_dose,
            body_oxygen,
            bone_remedy_oxygen_embryo,
            cure_nurse_pulse_burnet,
            thomas_burnet,
            thomas_iodine_cold_pain
        ], words: words)
        return result
    }
    
    public static func Shapes_9207() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9207) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 86,
            widthMax: widthMax,
            heightMax: heightMax))

        let cyclist_trophy_olympic_medley = square3x3.containing(["CYCLIST", "TROPHY", "OLYMPIC", "MEDLEY"], from: words)[0]
        let moscow_cyclist_medley_discus = rectangle3x4.containing(["MOSCOW", "CYCLIST", "MEDLEY", "DISCUS"], from: words)[0]
        let cyclist_team = edges.containing(["CYCLIST", "TEAM"], from: words)[0]
        let trophy_soccer_teammates_olympic = rectangle3x4.containing(["TROPHY", "SOCCER", "TEAMMATES", "OLYMPIC"], from: words)[0]
        let table_teammates = edges.containing(["TABLE", "TEAMMATES"], from: words)[0]
        let moscow_cyclist_discus_sport = rectangle3x4_BottomRight.containing(["MOSCOW", "CYCLIST", "DISCUS", "SPORT"], from: words)[0]
        let sculls_sport = edges.containing(["SCULLS", "SPORT"], from: words)[0]
        let sculls_solo = edges.containing(["SCULLS", "SOLO"], from: words)[1]
        let tokyo_sport = edges.containing(["TOKYO", "SPORT"], from: words)[0]
        let tokyo_torch_oath_roycroft = square3x3.containing(["TOKYO", "TORCH", "OATH", "ROYCROFT"], from: words)[0]
        let winter_roycroft = edges.containing(["WINTER", "ROYCROFT"], from: words)[0]
        let rome_cyclist_olympic_medley = square3x3.containing(["ROME", "CYCLIST", "OLYMPIC", "MEDLEY"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            cyclist_trophy_olympic_medley,
            moscow_cyclist_medley_discus,
            cyclist_team,
            trophy_soccer_teammates_olympic,
            table_teammates,
            moscow_cyclist_discus_sport,
            sculls_sport,
            sculls_solo,
            tokyo_sport,
            tokyo_torch_oath_roycroft,
            winter_roycroft,
            rome_cyclist_olympic_medley
        ], words: words)
        return result
    }
    
    public static func Shapes_9208() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9208) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let theatre_donizetti_intermezzo_tetrazzini = rectangle5x6.containing(["THEATRE", "DONIZETTI", "INTERMEZZO", "TETRAZZINI"], from: words)[0]
        let theatre_bizet_tetrazzini_operetta = rectangle3x4.containing(["THEATRE", "BIZET", "TETRAZZINI", "OPERETTA"], from: words)[1]
        let libretto_theatre_tetrazzini_operetta = square3x3.containing(["LIBRETTO", "THEATRE", "TETRAZZINI", "OPERETTA"], from: words)[1]
        let donizetti_borodin_intermezzo_tetrazzini = rectangle3x5.containing(["DONIZETTI", "BORODIN", "INTERMEZZO", "TETRAZZINI"], from: words)[0]
        let donizetti_valois = edges.containing(["DONIZETTI", "VALOIS"], from: words)[0]
        let chorus_valois = edges.containing(["CHORUS", "VALOIS"], from: words)[1]
        let ulanova_valois = edges.containing(["ULANOVA", "VALOIS"], from: words)[0]
        let singer_ulanova_manon_aria = rectangle3x4.containing(["SINGER", "ULANOVA", "MANON", "ARIA"], from: words)[0]
        let ulanova_duets = edges.containing(["ULANOVA", "DUETS"], from: words)[0]
        let tutu_duets = edges.containing(["TUTU", "DUETS"], from: words)[0]
        let tutu_trio = edges.containing(["TUTU", "TRIO"], from: words)[1]
        //let chorus_trio = edges.containing(["CHORUS", "TRIO"], from: words)[0]
        let carmen_manon = edges.containing(["CARMEN", "MANON"], from: words)[0]
        //let libretto_intermezzo = edges.containing(["LIBRETTO", "INTERMEZZO"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            theatre_donizetti_intermezzo_tetrazzini,
            theatre_bizet_tetrazzini_operetta,
            libretto_theatre_tetrazzini_operetta,
            donizetti_borodin_intermezzo_tetrazzini,
            donizetti_valois,
            chorus_valois,
            ulanova_valois,
            singer_ulanova_manon_aria,
            ulanova_duets,
            tutu_duets,
            tutu_trio,
            //chorus_trio,
            carmen_manon
            //libretto_intermezzo
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9210() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9210) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 100,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let manzanilla_brandy_spain_fizzy = square3x3.containing(["MANZANILLA", "BRANDY", "SPAIN", "FIZZY"], from: words)[0]
        let france_manzanilla_fizzy_cellar = rectangle3x5.containing(["FRANCE", "MANZANILLA", "FIZZY", "CELLAR"], from: words)[0]
        let toast_rhine_cellar_sherry_asti = c2x3.containing(["TOAST", "RHINE", "CELLAR", "SHERRY", "ASTI"], from: words)[0]
        let dry_sherry = edges.containing(["DRY", "SHERRY"], from: words)[2]
        let toast_taste = edges.containing(["TOAST", "TASTE"], from: words)[0]
        let vault_still_mull_taste = square3x3_BottomRight.containing(["VAULT", "STILL", "MULL", "TASTE"], from: words)[0]
        let vault_still_vat_mull = square3x3.containing(["VAULT", "STILL", "VAT", "MULL"], from: words)[0]
        let rhine_dregs_sherry_negus = square3x3.containing(["RHINE", "DREGS", "SHERRY", "NEGUS"], from: words)[0]
        let sec_asti = edges.containing(["SEC", "ASTI"], from: words)[0]
        let press_spain = edges.containing(["PRESS", "SPAIN"], from: words)[2]
        let press_port = edges.containing(["PRESS", "PORT"], from: words)[0]
        let brandy_wine_sweet_drink = square3x3_TopLeft.containing(["BRANDY", "WINE", "SWEET", "DRINK"], from: words)[1]
        let sec_marc = edges.containing(["SEC", "MARC"], from: words)[0]
        //let manzanilla_asti = edges.containing(["MANZANILLA", "ASTI"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            manzanilla_brandy_spain_fizzy,
            france_manzanilla_fizzy_cellar,
            toast_rhine_cellar_sherry_asti,
            dry_sherry,
            toast_taste,
            vault_still_mull_taste,
            vault_still_vat_mull,
            rhine_dregs_sherry_negus,
            sec_asti,
            press_spain,
            press_port,
            brandy_wine_sweet_drink,
            sec_marc
            //manzanilla_asti
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9211() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9211) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 96,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 126,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let laika_spitz_felis_schnauzer = rectangle3x5.containing(["LAIKA", "SPITZ", "FELIS", "SCHNAUZER"], from: words)[0]
        let flush_laika_saluki_schnauzer = square3x3.containing(["FLUSH", "LAIKA", "SALUKI", "SCHNAUZER"], from: words)[0]
        let crofts_nana_schnauzer_coon = square3x3.containing(["CROFTS", "NANA", "SCHNAUZER", "COON"], from: words)[0]
        let crofts_spaniel_cats_sphynx = c2x2.containing(["CROFTS", "SPANIEL", "CATS", "SPHYNX"], from: words)[0]
        let skye_sphynx = edges.containing(["SKYE", "SPHYNX"], from: words)[1]
        let skye_manx_asta_sphynx = square3x3.containing(["SKYE", "MANX", "ASTA", "SPHYNX"], from: words)[0]
        let claws_flush_saluki_schnauzer = square3x3.containing(["CLAWS", "FLUSH", "SALUKI", "SCHNAUZER"], from: words)[0]
        let chow_spaniel_cats_whine = square4x4.containing(["CHOW", "SPANIEL", "CATS", "WHINE"], from: words)[0]
        let hair_whine = edges.containing(["HAIR", "WHINE"], from: words)[0]
        let spaniel_lassie = edges.containing(["SPANIEL", "LASSIE"], from: words)[0]
        let dogs_macavity_korat_lassie = rectangle3x4_BottomRight.containing(["DOGS", "MACAVITY", "KORAT", "LASSIE"], from: words)[0]
        let boxer_schnauzer = edges.containing(["BOXER", "SCHNAUZER"], from: words)[1]
        //let nana_asta = edges.containing(["NANA", "ASTA"], from: words)[0]
        //let flush_felis = edges.containing(["FLUSH", "FELIS"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            laika_spitz_felis_schnauzer,
            flush_laika_saluki_schnauzer,
            crofts_nana_schnauzer_coon,
            crofts_spaniel_cats_sphynx,
            skye_sphynx,
            skye_manx_asta_sphynx,
            claws_flush_saluki_schnauzer,
            chow_spaniel_cats_whine,
            hair_whine,
            spaniel_lassie,
            dogs_macavity_korat_lassie,
            boxer_schnauzer
            //nana_asta,
            //flush_felis
        ], words: words)
        return result
    }
    
    public static func Shapes_9212() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9212) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 118,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let bear_blizzard_eskimos_breeze = rectangle3x4.containing(["BEAR", "BLIZZARD", "ESKIMOS", "BREEZE"], from: words)[0]
        let fox_walrus_furs_eskimos = c2x2.containing(["FOX", "WALRUS", "FURS", "ESKIMOS"], from: words)[0]
        let walrus_norway = edges.containing(["WALRUS", "NORWAY"], from: words)[1]
        let kayak_norway = edges.containing(["KAYAK", "NORWAY"], from: words)[2]
        let tent_walrus_norway_owl = rectangle3x4_TopRight.containing(["TENT", "WALRUS", "NORWAY", "OWL"], from: words)[0]
        let nansen_tent_nunataks_scott = rectangle4x5.containing(["NANSEN", "TENT", "NUNATAKS", "SCOTT"], from: words)[0]
        let snow_furs = edges.containing(["SNOW", "FURS"], from: words)[0]
        let base_ermine_breeze_somerset = square3x3.containing(["BASE", "ERMINE", "BREEZE", "SOMERSET"], from: words)[0]
        let atlas_somerset = edges.containing(["ATLAS", "SOMERSET"], from: words)[2]
        let atlas_mosses = edges.containing(["ATLAS", "MOSSES"], from: words)[1]
        let dogs_mosses = edges.containing(["DOGS", "MOSSES"], from: words)[3]
        //let ermine_blizzard_breeze_somerset = square3x3.containing(["ERMINE", "BLIZZARD", "BREEZE", "SOMERSET"], from: words)[0]
        let nome_scott = edges.containing(["NOME", "SCOTT"], from: words)[0]
        let ermine_ice = edges.containing(["ERMINE", "ICE"], from: words)[2]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            bear_blizzard_eskimos_breeze,
            fox_walrus_furs_eskimos,
            walrus_norway,
            kayak_norway,
            tent_walrus_norway_owl,
            nansen_tent_nunataks_scott,
            snow_furs,
            base_ermine_breeze_somerset,
            atlas_somerset,
            atlas_mosses,
            dogs_mosses,
            //ermine_blizzard_breeze_somerset,
            nome_scott,
            ermine_ice
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9301() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9301) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_customs_salzburg_boat = rectangle3x4_BottomLeft.containing(["BRAZIL", "CUSTOMS", "SALZBURG", "BOAT"], from: words)[0]
        let customs_gift_salzburg_boat = rectangle3x4.containing(["CUSTOMS", "GIFT", "SALZBURG", "BOAT"], from: words)[0]
        let customs_asia = edges.containing(["CUSTOMS", "ASIA"], from: words)[1]
        let ship_salzburg = edges.containing(["SHIP", "SALZBURG"], from: words)[0]
        let ship_trip = edges.containing(["SHIP", "TRIP"], from: words)[0]
        let italy_jet_trip_yacht = rectangle4x5_BottomLeft.containing(["ITALY", "JET", "TRIP", "YACHT"], from: words)[0]
        let china_salzburg = edges.containing(["CHINA", "SALZBURG"], from: words)[0]
        let china_bali = edges.containing(["CHINA", "BALI"], from: words)[0]
        let car_bali = edges.containing(["CAR", "BALI"], from: words)[0]
        let brazil_bus = edges.containing(["BRAZIL", "BUS"], from: words)[0]
        let tickets_bus = edges.containing(["TICKETS", "BUS"], from: words)[0]
        let tickets_boston_cab_athens = square3x3.containing(["TICKETS", "BOSTON", "CAB", "ATHENS"], from: words)[0]
        let egypt_athens = edges.containing(["EGYPT", "ATHENS"], from: words)[1]
        let york_egypt_voyage_norway = rectangle3x4.containing(["YORK", "EGYPT", "VOYAGE", "NORWAY"], from: words)[0]
        let venice_york_voyage_norway = square3x3.containing(["VENICE", "YORK", "VOYAGE", "NORWAY"], from: words)[0]
        let tickets_tax = edges.containing(["TICKETS", "TAX"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            brazil_customs_salzburg_boat,
            customs_gift_salzburg_boat,
            customs_asia,
            ship_salzburg,
            ship_trip,
            italy_jet_trip_yacht,
            china_salzburg,
            china_bali,
            car_bali,
            brazil_bus,
            tickets_bus,
            tickets_boston_cab_athens,
            egypt_athens,
            york_egypt_voyage_norway,
            venice_york_voyage_norway,
            tickets_tax
        ], words: words)
        return result
    }
    
    public static func Shapes_9302() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9302) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let kunzite_amazonite = edges.containing(["KUNZITE", "AMAZONITE"], from: words)[0]
        let garnet_kunzite_agate_fire = square3x3_BottomRight.containing(["GARNET", "KUNZITE", "AGATE", "FIRE"], from: words)[0]
        let garnet_trinkets = edges.containing(["GARNET", "TRINKETS"], from: words)[0]
        let coin_buckle_locket_trinkets = square3x3.containing(["COIN", "BUCKLE", "LOCKET", "TRINKETS"], from: words)[0]
        let buckle_amethyst_ruby_locket = square3x3.containing(["BUCKLE", "AMETHYST", "RUBY", "LOCKET"], from: words)[0]
        let kunzite_beauty = edges.containing(["KUNZITE", "BEAUTY"], from: words)[0]
        let rarity_beauty = edges.containing(["RARITY", "BEAUTY"], from: words)[0]
        let rarity_watch_crown_carat = square3x3.containing(["RARITY", "WATCH", "CROWN", "CARAT"], from: words)[0]
        let amethyst_amazonite = edges.containing(["AMETHYST", "AMAZONITE"], from: words)[0]
        let pyrope_beauty = edges.containing(["PYROPE", "BEAUTY"], from: words)[0]
        let pyrope_onyx = edges.containing(["PYROPE", "ONYX"], from: words)[0]
        let coral_onyx = edges.containing(["CORAL", "ONYX"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            kunzite_amazonite,
            garnet_kunzite_agate_fire,
            garnet_trinkets,
            coin_buckle_locket_trinkets,
            buckle_amethyst_ruby_locket,
            kunzite_beauty,
            rarity_beauty,
            rarity_watch_crown_carat,
            amethyst_amazonite,
            pyrope_beauty,
            pyrope_onyx,
            coral_onyx
        ], words: words)
        return result
    }
    
    public static func Shapes_9303() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9303) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 98,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let annuity_yield_security_trade = rectangle3x5.containing(["ANNUITY", "YIELD", "SECURITY", "TRADE"], from: words)[0]
        let pistole_annuity_security_salary = square4x4.containing(["PISTOLE", "ANNUITY", "SECURITY", "SALARY"], from: words)[0]
        let annuity_buy_audit_penny = c2x2.containing(["ANNUITY", "BUY", "AUDIT", "PENNY"], from: words)[0]
        let pounds_pistole_net_salary = square3x3.containing(["POUNDS", "PISTOLE", "NET", "SALARY"], from: words)[0]
        let lira_yield_security_trade = square3x3.containing(["LIRA", "YIELD", "SECURITY", "TRADE"], from: words)[0]
        let buy_quote_sou_audit = rectangle3x4_TopLeft.containing(["BUY", "QUOTE", "SOU", "AUDIT"], from: words)[0]
        let bonus_sou = edges.containing(["BONUS", "SOU"], from: words)[0]
        let rupee_bonus_proxy_ecu = square3x3.containing(["RUPEE", "BONUS", "PROXY", "ECU"], from: words)[0]
        let pay_proxy = edges.containing(["PAY", "PROXY"], from: words)[1]
        let rupee_bonus_dinero_proxy = square3x3_BottomLeft.containing(["RUPEE", "BONUS", "DINERO", "PROXY"], from: words)[0]
        let rupee_rouble = edges.containing(["RUPEE", "ROUBLE"], from: words)[2]
        let margin_ducat_rouble_notes = rectangle3x4.containing(["MARGIN", "DUCAT", "ROUBLE", "NOTES"], from: words)[0]
        //let pistole_penny = edges.containing(["PISTOLE", "PENNY"], from: words)[0]
        let yield_aid = edges.containing(["YIELD", "AID"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            annuity_yield_security_trade,
            pistole_annuity_security_salary,
            annuity_buy_audit_penny,
            pounds_pistole_net_salary,
            lira_yield_security_trade,
            buy_quote_sou_audit,
            bonus_sou,
            rupee_bonus_proxy_ecu,
            pay_proxy,
            rupee_bonus_dinero_proxy,
            rupee_rouble,
            margin_ducat_rouble_notes,
            //pistole_penny,
            yield_aid
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9304() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9304) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 130,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
           start: words,
           end: end,
           len: len,
           scoreMin: 122,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let kilohertz_ream_troy_outsize = c2x2.containing(["KILOHERTZ", "REAM", "TROY", "OUTSIZE"], from: words)[0]
        let ream_yard_troy_acre = square3x3.containing(["REAM", "YARD", "TROY", "ACRE"], from: words)[0]
        let step_kilohertz_cask_tierce_bushel_pocket = c2x4.containing(["STEP", "KILOHERTZ", "CASK", "TIERCE", "BUSHEL", "POCKET"], from: words)[0]
        let kilohertz_feet_tierce_pocket = rectangle3x5.containing(["KILOHERTZ", "FEET", "TIERCE", "POCKET"], from: words)[0]
        let kilohertz_keg_pocket_erg = square3x3.containing(["KILOHERTZ", "KEG", "POCKET", "ERG"], from: words)[0]
        let quarto_step_bushel_dram = rectangle3x4_BottomRight.containing(["QUARTO", "STEP", "BUSHEL", "DRAM"], from: words)[0]
        let quarto_pole = edges.containing(["QUARTO", "POLE"], from: words)[0]
        let proof_pole = edges.containing(["PROOF", "POLE"], from: words)[0]
        //let proof_outsize = edges.containing(["PROOF", "OUTSIZE"], from: words)[0]
        let proof_foot = edges.containing(["PROOF", "FOOT"], from: words)[0]
        let ohm_pint_foot_moiety = square3x3_BottomLeft.containing(["OHM", "PINT", "FOOT", "MOIETY"], from: words)[0]
        let tun_dyne_moiety_unit_stone = c2x3.containing(["TUN", "DYNE", "MOIETY", "UNIT", "STONE"], from: words)[0]
        //let pint_tun_moiety_stone = square3x3.containing(["PINT", "TUN", "MOIETY", "STONE"], from: words)[0]
        let watt_unit = edges.containing(["WATT", "UNIT"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            kilohertz_ream_troy_outsize,
            ream_yard_troy_acre,
            step_kilohertz_cask_tierce_bushel_pocket,
            kilohertz_feet_tierce_pocket,
            kilohertz_keg_pocket_erg,
            quarto_step_bushel_dram,
            quarto_pole,
            proof_pole,
            //proof_outsize,
            proof_foot,
            ohm_pint_foot_moiety,
            tun_dyne_moiety_unit_stone,
            //pint_tun_moiety_stone,
            watt_unit
        ], words: words)
        return result
    }
    
    public static func Shapes_9305() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9305) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_spritz = edges.containing(["BRAZIL", "SPRITZ"], from: words)[2]
        let pies_spritz = edges.containing(["PIES", "SPRITZ"], from: words)[0]
        let gums_pies_syrup_mints_russe = c2x3.containing(["GUMS", "PIES", "SYRUP", "MINTS", "RUSSE"], from: words)[0]
        let taffy_syrup = edges.containing(["TAFFY", "SYRUP"], from: words)[0]
        let sorbet_gums_syrup_russe = rectangle3x4.containing(["SORBET", "GUMS", "SYRUP", "RUSSE"], from: words)[0]
        let pies_torte_mints_spritz = square3x3.containing(["PIES", "TORTE", "MINTS", "SPRITZ"], from: words)[0]
        let sorbet_truffles = edges.containing(["SORBET", "TRUFFLES"], from: words)[3]
        let nuts_mints = edges.containing(["NUTS", "MINTS"], from: words)[2]
        let nuts_simnel = edges.containing(["NUTS", "SIMNEL"], from: words)[0]
        //let torte_truffles = edges.containing(["TORTE", "TRUFFLES"], from: words)[0]
        let taffy_bars = edges.containing(["TAFFY", "BARS"], from: words)[0]
        let floss_bars = edges.containing(["FLOSS", "BARS"], from: words)[1]
        let floss_sweets = edges.containing(["FLOSS", "SWEETS"], from: words)[0]
        let trifle_yogurt_pastry_sweets = rectangle3x6.containing(["TRIFLE", "YOGURT", "PASTRY", "SWEETS"], from: words)[0]
        let trifle_yogurt_pastry_fruit = rectangle3x4.containing(["TRIFLE", "YOGURT", "PASTRY", "FRUIT"], from: words)[0]
        let tarts_fruit = edges.containing(["TARTS", "FRUIT"], from: words)[2]
        let floss_peel = edges.containing(["FLOSS", "PEEL"], from: words)[0]
        let drops_peel = edges.containing(["DROPS", "PEEL"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            brazil_spritz,
            pies_spritz,
            gums_pies_syrup_mints_russe,
            taffy_syrup,
            sorbet_gums_syrup_russe,
            pies_torte_mints_spritz,
            sorbet_truffles,
            nuts_mints,
            nuts_simnel,
            //torte_truffles,
            taffy_bars,
            floss_bars,
            floss_sweets,
            trifle_yogurt_pastry_sweets,
            trifle_yogurt_pastry_fruit,
            tarts_fruit,
            floss_peel,
            drops_peel
        ], words: words)
        return result
    }
    
    public static func Shapes_9306() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9306) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 146,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let zeugloptera_dayfly_buzzardet_botfly = rectangle5x6.containing(["ZEUGLOPTERA", "DAYFLY", "BUZZARDET", "BOTFLY"], from: words)[0]
        let dayfly_tau_buzzardet_maybug = square3x3.containing(["DAYFLY", "TAU", "BUZZARDET", "MAYBUG"], from: words)[0]
        let zeugloptera_thrips_termite_zoraptera = rectangle3x6.containing(["ZEUGLOPTERA", "THRIPS", "TERMITE", "ZORAPTERA"], from: words)[0]
        let epizoon_zoraptera = edges.containing(["EPIZOON", "ZORAPTERA"], from: words)[2]
        let tsetse_thrips_zoraptera_mantis = rectangle3x4.containing(["TSETSE", "THRIPS", "ZORAPTERA", "MANTIS"], from: words)[0]
        let wasp_tsetse_mantis_dipterans = square3x3.containing(["WASP", "TSETSE", "MANTIS", "DIPTERANS"], from: words)[0]
        let aphis_dipterans = edges.containing(["APHIS", "DIPTERANS"], from: words)[0]
        let mite_lema = edges.containing(["MITE", "LEMA"], from: words)[0]
        let dayfly_lema = edges.containing(["DAYFLY", "LEMA"], from: words)[0]
        let borer_buzzardet = edges.containing(["BORER", "BUZZARDET"], from: words)[0]
        let mite_termite = edges.containing(["MITE", "TERMITE"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            zeugloptera_dayfly_buzzardet_botfly,
            dayfly_tau_buzzardet_maybug,
            zeugloptera_thrips_termite_zoraptera,
            epizoon_zoraptera,
            tsetse_thrips_zoraptera_mantis,
            wasp_tsetse_mantis_dipterans,
            aphis_dipterans,
            mite_lema,
            dayfly_lema,
            borer_buzzardet,
            mite_termite
        ], words: words)
        return result
    }
    
    public static func Shapes_9307() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9307) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 130,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 50,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let tanzania_belize_brazil_venezuela = square3x3.containing(["TANZANIA", "BELIZE", "BRAZIL", "VENEZUELA"], from: words)[1]
        let qatar_tanzania_malta_brazil = rectangle3x4.containing(["QATAR", "TANZANIA", "MALTA", "BRAZIL"], from: words)[0]
        let belize_kenya_peru_egypt = square3x3_TopLeft.containing(["BELIZE", "KENYA", "PERU", "EGYPT"], from: words)[0]
        let kenya_austria_peru_egypt = square3x3.containing(["KENYA", "AUSTRIA", "PERU", "EGYPT"], from: words)[0]
        //let austria_venezuela = edges.containing(["AUSTRIA", "VENEZUELA"], from: words)[0]
        let tanzania_sudan = edges.containing(["TANZANIA", "SUDAN"], from: words)[4]
        let uruguay_sudan = edges.containing(["URUGUAY", "SUDAN"], from: words)[0]
        let uruguay_syria = edges.containing(["URUGUAY", "SYRIA"], from: words)[2]
        let uruguay_cuba = edges.containing(["URUGUAY", "CUBA"], from: words)[1]
        let uruguay_turkey = edges.containing(["URUGUAY", "TURKEY"], from: words)[3]
        let libya_turkey = edges.containing(["LIBYA", "TURKEY"], from: words)[0]
        let libya_iraq_fiji_italy = square3x3_TopLeft.containing(["LIBYA", "IRAQ", "FIJI", "ITALY"], from: words)[0]
        let libya_yemen_italy_iran = square5x5_TopRight.containing(["LIBYA", "YEMEN", "ITALY", "IRAN"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            tanzania_belize_brazil_venezuela,
            qatar_tanzania_malta_brazil,
            belize_kenya_peru_egypt,
            kenya_austria_peru_egypt,
            //austria_venezuela,
            tanzania_sudan,
            uruguay_sudan,
            uruguay_syria,
            uruguay_cuba,
            uruguay_turkey,
            libya_turkey,
            libya_iraq_fiji_italy,
            libya_yemen_italy_iran
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9308() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9308) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 68,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let velazquez_ernst_rubens_cezanne = square3x3.containing(["VELAZQUEZ", "ERNST", "RUBENS", "CEZANNE"], from: words)[0]
        let velazquez_greuze = edges.containing(["VELAZQUEZ", "GREUZE"], from: words)[0]
        let velazquez_weyden_vernet_heyden = c2x2.containing(["VELAZQUEZ", "WEYDEN", "VERNET", "HEYDEN"], from: words)[0]
        let romney_heyden = edges.containing(["ROMNEY", "HEYDEN"], from: words)[1]
        let weyden_eyck = edges.containing(["WEYDEN", "EYCK"], from: words)[0]
        let weyden_scott_watts_vernet = square5x5.containing(["WEYDEN", "SCOTT", "WATTS", "VERNET"], from: words)[0]
        let redon_dyck_lely_rubens = rectangle3x4_BottomRight.containing(["REDON", "DYCK", "LELY", "RUBENS"], from: words)[0]
        let ernst_steer_rubens_cezanne = square3x3.containing(["ERNST", "STEER", "RUBENS", "CEZANNE"], from: words)[0]
        let ernst_sargent = edges.containing(["ERNST", "SARGENT"], from: words)[3]
        let hals_sargent = edges.containing(["HALS", "SARGENT"], from: words)[0]
        let bril_greuze = edges.containing(["BRIL", "GREUZE"], from: words)[0]
        let hooch_heyden = edges.containing(["HOOCH", "HEYDEN"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            velazquez_ernst_rubens_cezanne,
            velazquez_greuze,
            velazquez_weyden_vernet_heyden,
            romney_heyden,
            weyden_eyck,
            weyden_scott_watts_vernet,
            redon_dyck_lely_rubens,
            ernst_steer_rubens_cezanne,
            ernst_sargent,
            hals_sargent,
            bril_greuze,
            hooch_heyden
        ], words: words)
        return result
    }
    
    public static func Shapes_9309() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9309) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
           start: words,
           end: end,
           len: len,
           scoreMin: 68,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 130,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let minuet_zapateado_passamezzo_hula = rectangle3x4.containing(["MINUET", "ZAPATEADO", "PASSAMEZZO", "HULA"], from: words)[0]
        let pirouette_step_passamezzo_reel = square3x3.containing(["PIROUETTE", "STEP", "PASSAMEZZO", "REEL"], from: words)[0]
        let pirouette_cancan_tango_valse = square3x3_TopRight.containing(["PIROUETTE", "CANCAN", "TANGO", "VALSE"], from: words)[0]
        let valeta_cancan_valse_fan = c2x2.containing(["VALETA", "CANCAN", "VALSE", "FAN"], from: words)[1]
        let valeta_poussette_valse_trot = rectangle4x5.containing(["VALETA", "POUSSETTE", "VALSE", "TROT"], from: words)[0]
        let zapateado_polka_tap_ball = square3x3.containing(["ZAPATEADO", "POLKA", "TAP", "BALL"], from: words)[0]
        let zapateado_polka_ball_jota = square3x3.containing(["ZAPATEADO", "POLKA", "BALL", "JOTA"], from: words)[0]
        let twostep_jota = edges.containing(["TWOSTEP", "JOTA"], from: words)[0]
        let twostep_twist = edges.containing(["TWOSTEP", "TWIST"], from: words)[5]
        //let poussette_twist = edges.containing(["POUSSETTE", "TWIST"], from: words)[0]
        let zapateado_pas = edges.containing(["ZAPATEADO", "PAS"], from: words)[0]
        let twostep_hop = edges.containing(["TWOSTEP", "HOP"], from: words)[0]
        //let poussette_tango = edges.containing(["POUSSETTE", "TANGO"], from: words)[0]
        let jive_twist = edges.containing(["JIVE", "TWIST"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            minuet_zapateado_passamezzo_hula,
            pirouette_step_passamezzo_reel,
            pirouette_cancan_tango_valse,
            valeta_cancan_valse_fan,
            valeta_poussette_valse_trot,
            zapateado_polka_tap_ball,
            zapateado_polka_ball_jota,
            twostep_jota,
            twostep_twist,
            //poussette_twist,
            zapateado_pas,
            twostep_hop,
            //poussette_tango,
            jive_twist
        ], words: words)
        return result
    }
    
    public static func Shapes_9310() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9310) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let donizetti_rodriguez = edges.containing(["DONIZETTI", "RODRIGUEZ"], from: words)[0]
        let moussorgsky_rodriguez = edges.containing(["MOUSSORGSKY", "RODRIGUEZ"], from: words)[0]
        let delius_moussorgsky_stravinsky_debussy = square3x3.containing(["DELIUS", "MOUSSORGSKY", "STRAVINSKY", "DEBUSSY"], from: words)[1]
        let strauss_stravinsky = edges.containing(["STRAUSS", "STRAVINSKY"], from: words)[3]
        let strauss_szymanowski_rodriguez_tosti = square3x3_TopLeft.containing(["STRAUSS", "SZYMANOWSKI", "RODRIGUEZ", "TOSTI"], from: words)[0]
        let marks_szymanowski_mascagni_raybould = square3x3.containing(["MARKS", "SZYMANOWSKI", "MASCAGNI", "RAYBOULD"], from: words)[1]
        let szymanowski_gaul_mascagni_raybould = rectangle3x4.containing(["SZYMANOWSKI", "GAUL", "MASCAGNI", "RAYBOULD"], from: words)[0]
        let szymanowski_verdi_rodriguez_tosti = square3x3.containing(["SZYMANOWSKI", "VERDI", "RODRIGUEZ", "TOSTI"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            donizetti_rodriguez,
            moussorgsky_rodriguez,
            delius_moussorgsky_stravinsky_debussy,
            strauss_stravinsky,
            strauss_szymanowski_rodriguez_tosti,
            marks_szymanowski_mascagni_raybould,
            szymanowski_gaul_mascagni_raybould,
            szymanowski_verdi_rodriguez_tosti
        ], words: words)
        return result
    }
    
    public static func Shapes_9311() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9311) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let tarpaulin_mizzentop_trice_horizon = square3x3.containing(["TARPAULIN", "MIZZENTOP", "TRICE", "HORIZON"], from: words)[0]
        let tarpaulin_mizzentop_horizon_scuttle = rectangle3x4.containing(["TARPAULIN", "MIZZENTOP", "HORIZON", "SCUTTLE"], from: words)[0]
        let stowaway_tarpaulin_scuttle_wind = rectangle3x4.containing(["STOWAWAY", "TARPAULIN", "SCUTTLE", "WIND"], from: words)[0]
        let stowaway_buoy = edges.containing(["STOWAWAY", "BUOY"], from: words)[1]
        let after_stowaway_aft_crew = rectangle3x5.containing(["AFTER", "STOWAWAY", "AFT", "CREW"], from: words)[0]
        let hatch_horizon = edges.containing(["HATCH", "HORIZON"], from: words)[1]
        let embargo_hatch_mast_rig = square4x4_BottomRight.containing(["EMBARGO", "HATCH", "MAST", "RIG"], from: words)[0]
        let embargo_hatch_ashore_mast = rectangle3x4_TopLeft.containing(["EMBARGO", "HATCH", "ASHORE", "MAST"], from: words)[0]
        let seaworthy_scuttle = edges.containing(["SEAWORTHY", "SCUTTLE"], from: words)[1]
        let port_seaworthy_float_jetty = square3x3.containing(["PORT", "SEAWORTHY", "FLOAT", "JETTY"], from: words)[1]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            tarpaulin_mizzentop_trice_horizon,
            tarpaulin_mizzentop_horizon_scuttle,
            stowaway_tarpaulin_scuttle_wind,
            stowaway_buoy,
            after_stowaway_aft_crew,
            hatch_horizon,
            embargo_hatch_mast_rig,
            embargo_hatch_ashore_mast,
            seaworthy_scuttle,
            port_seaworthy_float_jetty
        ], words: words)
        return result
    }
    
    
    public static func Shapes_9312() -> ShapeModel? {

        let widthMax = 17
        let heightMax = 12

        let gameList = GameList()
        guard let game = gameList.getGame(gameId: 9312) else {
            return nil
        }

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
           start: words,
           end: end,
           len: len,
           scoreMin: 112,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 124,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let vesuvius_ruwenzori_quizapu_fuji = rectangle3x4.containing(["VESUVIUS", "RUWENZORI", "QUIZAPU", "FUJI"], from: words)[0]
        let erebus_ruwenzori_ural_jura_sulaiman = c2x3.containing(["EREBUS", "RUWENZORI", "URAL", "JURA", "SULAIMAN"], from: words)[0]
        let ruwenzori_itaculomi_peteroa_quizapu = rectangle3x4.containing(["RUWENZORI", "ITACULOMI", "PETEROA", "QUIZAPU"], from: words)[0]
        let itaculomi_barry_caha_rocky = square4x4.containing(["ITACULOMI", "BARRY", "CAHA", "ROCKY"], from: words)[0]
        let ural_rosa = edges.containing(["URAL", "ROSA"], from: words)[0]
        let atlas_rosa = edges.containing(["ATLAS", "ROSA"], from: words)[0]
        let atlas_everest = edges.containing(["ATLAS", "EVEREST"], from: words)[1]
        let simplon_sulaiman = edges.containing(["SIMPLON", "SULAIMAN"], from: words)[4]
        let simplon_alps = edges.containing(["SIMPLON", "ALPS"], from: words)[0]
        let itaculomi_olives = edges.containing(["ITACULOMI", "OLIVES"], from: words)[3]
        //let itaculomi_sulaiman = edges.containing(["ITACULOMI", "SULAIMAN"], from: words)[0]
        //let atlas_alps = edges.containing(["ATLAS", "ALPS"], from: words)[0]
        //let erebus_everest = edges.containing(["EREBUS", "EVEREST"], from: words)[0]
        let pelee_everest = edges.containing(["PELEE", "EVEREST"], from: words)[0]
        //let vesuvius_peteroa = edges.containing(["VESUVIUS", "PETEROA"], from: words)[0]

        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [
            vesuvius_ruwenzori_quizapu_fuji,
            erebus_ruwenzori_ural_jura_sulaiman,
            ruwenzori_itaculomi_peteroa_quizapu,
            itaculomi_barry_caha_rocky,
            ural_rosa,
            atlas_rosa,
            atlas_everest,
            simplon_sulaiman,
            simplon_alps,
            itaculomi_olives,
            //itaculomi_sulaiman,
            //atlas_alps,
           // erebus_everest,
            pelee_everest
            //vesuvius_peteroa
        ], words: words)
        return result
    }
    
    
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
        
        let pacman3x3_bottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.BottomRight(
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
    
    public static func Shapes_8702() -> ShapeModel? {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8702) else {
            return nil
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
        
        let pacman3x3_bottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculator.BottomRight(
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
        return final
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
