//
//  ViagemOfertaViewModel.swift
//  viagens_swift
//
//  Created by Igor Sthaynny on 18/11/21.
//

import Foundation
import UIKit


class ViagemOfertaViewModel: ViagemViewModel{
    var tituloSessao: String{
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType{
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int{
        return viagens.count
    }
    
    init(_ viagens: [Viagem]){
        self.viagens = viagens
    }
    
}
