//
//  QuestionModel.swift
//  MvvmExampleWithQuestionApp
//
//  Created by Furkan Kahraman on 13.05.2022.
//

import Foundation

//struct Questions: Codable {
//    var data: QuestionModel?
//}
//
//struct QuestionModel: Codable {
//    var data: [Question]?
//}
//
//struct Question: Codable {
//    var category: String?
//    var type: String?
//    var difficulty: String?
//    var question: String?
//    var correct_answer: String?
//    var incorrect_answers: [String]?
//}

// MARK: - Questions
struct Questions: Codable {
    let responseCode: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let category: String
    let type: TypeEnum
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case multiple = "multiple"
}
