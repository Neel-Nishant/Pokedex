//
//  PokeCell.swift
//  Pokedex by Neel
//
//  Created by Neel Nishant on 11/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    
    
    required init?(coder aDecoder: NSCoder){
        
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 10.0
        
    }
    func configCell(pokemon: Pokemon)
    {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumb.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
}
