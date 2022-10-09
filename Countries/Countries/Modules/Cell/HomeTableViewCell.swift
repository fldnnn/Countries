//
//  HomeTableViewCell.swift
//  Countries
//
//  Created by Fulden Onan on 8.10.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    private func setupUI(){
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    @IBAction func favButtonPressed(_ sender: Any) {
        favButtonPressed()
    }
    
    func favButtonPressed() {
        
        favButton.isSelected = !favButton.isSelected
        if favButton.isSelected {
            favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            //user defaults idx i kaydet
        } else {
            favButton.setImage(UIImage(systemName: "star"), for: .normal)
            //remove from idx
            
         
        }
    }
}
