//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Кефир Кефирчик on 09.04.2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dataLabel = nil
            locationLabel = nil
        } else {
            let dateString = dateFormatter.string(from: task.date)
            dataLabel.text = dateString
            
            self.titleLabel.text = task.title
            self.locationLabel.text = task.location?.name
        }
    }
}
