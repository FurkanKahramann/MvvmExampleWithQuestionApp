//
//  QuestionViewModel.swift
//  MvvmExampleWithQuestionApp
//
//  Created by Furkan Kahraman on 13.05.2022.
//

import Foundation

class QuestionViewModel {
    
    private var sourceUrl = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple")!
    
    
    func getAllQuestion(completion: @escaping (_ questions: Data) -> ()){
        URLSession.shared.dataTask(with: sourceUrl) { data, response, error in
            if let data = data{
                completion(data)
            }
        }.resume()
    }
    
    
}
