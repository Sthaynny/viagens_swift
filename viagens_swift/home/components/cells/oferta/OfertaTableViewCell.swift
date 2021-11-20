//
//  OfertaTableViewCell.swift
//  viagens_swift
//
//  Created by Igor Sthaynny on 18/11/21.
//

import UIKit

class OfertaTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagensLabels: [UILabel]!
    @IBOutlet var subtituloViagenLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    
    func configurarCell(_ viagens: [Viagem]?){
        guard let listaDeViagens = viagens else {return}
        for i in 0..<listaDeViagens.count{
            setOutlets(i, viagem: listaDeViagens[i])
        }
        
        fundoViews.forEach{ viewAtual in
            viewAtual.addSombra()
        }
    }
    
    
    func setOutlets(_ index: Int, viagem: Viagem) {
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
        
        let subtituloOutlet = subtituloViagenLabels[index]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoSemOutlet = precoSemDescontoLabels[index]
        precoSemOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
        
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
        
        
        
    }
}
