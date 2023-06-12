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
