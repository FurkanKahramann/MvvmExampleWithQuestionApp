//
//  ViewController.swift
//  MvvmExampleWithQuestionApp
//
//  Created by Furkan Kahraman on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = QuestionViewModel()
    var questionsData: Questions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.getAllQuestion { responseData in
            let jsonDecoder = JSONDecoder()
            let response = try! jsonDecoder.decode(Questions.self, from: responseData)
            print(response)
            self.questionsData = response
            print(self.questionsData?.results.count)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if(!(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }

        cell?.textLabel?.text = questionsData?.results[indexPath.row].question
        print(questionsData?.results[indexPath.row].question)
        return cell!
    }
}

