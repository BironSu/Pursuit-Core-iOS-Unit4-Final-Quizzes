//
//  QuizAPIClient.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPIClient{
    static func getQuiz(data: Data?, completionHandler: @escaping (AppError?, [Quiz]?) -> Void) {
        let getQuizEndpoint = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        NetworkHelper.shared.performDataTask(endpointURLString: getQuizEndpoint, httpMethod: "GET", httpBody: data) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let quiz = try JSONDecoder().decode([Quiz].self, from: data)
                    completionHandler(nil,quiz.sorted(by: {$0.quizTitle < $1.quizTitle}))
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
