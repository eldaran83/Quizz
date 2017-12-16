//
//  QuestionView .swift
//  Quizz
//
//  Created by lionel montoya on 06/12/2017.
//  Copyright © 2017 lionel montoya. All rights reserved.
//

import UIKit

class QuestionView: UIView {
//on met le type optionnel déballé car on sais qu'on aura forcement pas nil pour ces outlets
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    var title = "" {
        //didset permet d'observer :  cette méthode est appelée juste après la modification de la propriété.
        didSet {
            label.text = title
        }
    }
    
    enum Style {
        case correct, incorrect, standard
    }
    
    var style: Style = .standard{
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
            backgroundColor = #colorLiteral(red: 0.7846242189, green: 0.9252766967, blue: 0.6281000972, alpha: 1)
        case .incorrect:
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
            backgroundColor = #colorLiteral(red: 0.9516502023, green: 0.5314736366, blue: 0.5782714486, alpha: 1)
        case .standard:
            icon.isHidden = true
            backgroundColor = #colorLiteral(red: 0.7500585318, green: 0.7690333724, blue: 0.7860409617, alpha: 1)
        }
    }
    
    

}
