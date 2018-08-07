//
//  BottomView.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit



protocol BottomViewDelegate:class {
    func buttonTappedWith(_ ref:ReferenceType)
}

class BottomView:UIView {
    
    @IBOutlet weak var weekButton:CustomButton!
    @IBOutlet weak var monthButton:CustomButton!
    @IBOutlet weak var yearButton:CustomButton!
    @IBOutlet weak var allButton:CustomButton!
    
    
    weak var delegate:BottomViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unselectButtonS()
        configButtons()
    }
    
    func setReference(_ type:ReferenceType) {
        unselectButtonS()
        var button:CustomButton
        switch type {
        case .all: button = allButton
        case .month: button = monthButton
        case .week: button = weekButton
        case .year: button = yearButton
        }
        button.isSelected = true
    }
    
    @IBAction func buttonTapped(_ sender:UIButton) {
        unselectButtonS()
        var ref:ReferenceType
        guard let currentTitle = sender.currentTitle else { return }
        sender.isSelected = true
        if currentTitle == ReferenceType.week.rawValue {
            ref = ReferenceType.week
        }else if currentTitle == ReferenceType.month.rawValue {
            ref = ReferenceType.month
        }else if currentTitle == ReferenceType.year.rawValue {
            ref = ReferenceType.year
        }else {
            ref = ReferenceType.all
        }
        delegate?.buttonTappedWith(ref)
    }
    
    func unselectButtonS() {
        [weekButton,monthButton,yearButton,allButton].forEach { btn in
            btn?.isSelected = false
        }
    }
    
    func configButtons() {
        [weekButton,monthButton,yearButton,allButton].forEach { btn in
            btn?.layer.cornerRadius = 5.0
        }
        weekButton.setTitle(ReferenceType.week.rawValue, for: .normal)
        monthButton.setTitle(ReferenceType.month.rawValue, for: .normal)
        yearButton.setTitle(ReferenceType.year.rawValue, for: .normal)
        allButton.setTitle(ReferenceType.all.rawValue, for: .normal)
    }
}
