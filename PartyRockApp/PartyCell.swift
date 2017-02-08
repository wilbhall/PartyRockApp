//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Joseph Leichter on 1/11/17.
//  Copyright © 2017 Joseph Leichter. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    func  updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        //TODO: set image from URL
        let url = URL(string: partyRock.imageURL)!
        
        //get image on background thread
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                
                //come back to main thread
                DispatchQueue.global().sync {
                 self.videoPreviewImage.image = UIImage(data: data)
                }
                
            } catch {
                
            }
            
        }
        
        
    }
   
}
