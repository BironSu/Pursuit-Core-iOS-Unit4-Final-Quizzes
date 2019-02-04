//
//  QuizFavorites.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

//struct UserNames: Codable {
//    let userName: String
//}
struct QuizFavorite: Codable {
    let quizID: String
    let quizTitle: String
    let facts: [String]
    let createdAt: String
}
