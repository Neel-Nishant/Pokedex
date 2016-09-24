//
//  PokemonDetailVC.swift
//  Pokedex by Neel
//
//  Created by Neel Nishant on 20/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    
    @IBOutlet weak var HeightLbl: UILabel!
 
    @IBOutlet weak var pokedexLbl: UILabel!
   
    @IBOutlet weak var cuuentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        var img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        cuuentEvoImg.image = img
        
       pokemon.downloadPokemonDetails { () -> () in
        //this will be called when download is done
        
        self.updateUI()
        }
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenceLbl.text = pokemon.defence
        HeightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        attackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        if pokemon.nextEvolutionId == ""{
            evoLbl.text = "No evolutions"
            nextEvoImg.hidden = true
        }else{
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != ""
            {
                str += " -LVL \(pokemon.nextEvolutionLvl)"
            }
            evoLbl.text = str
        }
        
        
        
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

