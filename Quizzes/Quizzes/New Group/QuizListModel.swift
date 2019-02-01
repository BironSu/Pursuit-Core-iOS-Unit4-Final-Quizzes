//
//  QuizListModel.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class QuizListModel {
    private static let filename = "SavedQuiz.plist"
    static var favoriteQuiz = [QuizFavorite]()
    
    private init() {}
    
    static func saveQuiz() {
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteQuiz)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func addQuiz(quiz: QuizFavorite) {
        favoriteQuiz.append(quiz)
        saveQuiz()
    }
    static func getQuiz() -> [QuizFavorite] {
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteQuiz = try PropertyListDecoder().decode([QuizFavorite].self, from: data).sorted(by: {$0.createdAt > $1.createdAt})
                } catch {
                    print("Property list decode error: \(error)")
                }
            } else {
                print("Data does not exist...")
            }
        } else {
            print("\(filename) does not exist...")
        }
        return favoriteQuiz
    }
    static func deleteFavoriteQuiz(index: Int) {
        favoriteQuiz.remove(at: index)
        saveQuiz()
    }
}
