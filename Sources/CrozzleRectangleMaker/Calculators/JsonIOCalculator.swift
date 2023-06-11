//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import Foundation
public class JsonIOCalculator {

/// load a file from document directory
/// - Parameter fileName: name of the file
/// - Returns: data of the file
    public static func loadFile(fileName: String) -> Data? {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
        guard let file = fileURL else {
            return nil
        }
        do {
            let data = try Data(contentsOf: file)
            return data
        } catch {
            return nil
        }
    }

//public func tryit(jsonData: Data) -> [JsonShapeModel]? {
//    let decoder = JSONDecoder()
//
//    do {
//        let jsonShapes = try decoder.decode([JsonShapeModel].self, from: jsonData)
//        print(people)
//    } catch {
//        print(error.localizedDescription)
//    }
//}

/// convert data to json array of ShapeModel
/// - Parameter data: data to convert
/// - Returns: array of ShapeModel
//    public func convertDataToShapeModelArray(data: Data) -> [ShapeModel]? {
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            guard let jsonArray = json as? [[String: Any]] else {
//                return nil
//            }
//            var shapeModelArray = [ShapeModel]()
//            for jsonObject in jsonArray {
//                guard let shapeModel = ShapeModel(json: jsonObject) else {
//                    return nil
//                }
//                shapeModelArray.append(shapeModel)
//            }
//            return shapeModelArray
//        } catch {
//            return nil
//        }
//    }

/// convert data to json
/// - Parameter data: data to convert
/// - Returns: json
    public func convertDataToJson(data: Data) -> Any? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return json
        } catch {
            return nil
        }
    }

}
