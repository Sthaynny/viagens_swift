//
//  ViewController.swift
//  viagens_swift
//
//  Created by Igor Sthaynny on 10/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        view.backgroundColor  = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    
    func configuraTableView() {
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }

    func irParaDetalhe(_ viagem: Viagem?){
        if let viageSelecionada = viagem {
            let detalheController = DetalheViewController.instanciar(viageSelecionada)
            navigationController?.pushViewController(detalheController, animated: true)
        }
        
    }

}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = secaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row]
            irParaDetalhe(viagemSelecionada)
        case .ofertas:
            break
        default:
            break
        }
     
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secaoDeViagens?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let viewModel = secaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else{
                fatalError("Erro na cria????o da ViagemTableViewCell")
            }
            cell.configuraCelular(viewModel?.viagens[indexPath.row])
            return cell
        case .ofertas:
            guard let cellOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {
                fatalError("Erro na cria????o da OfertaTableViewCell")
            }
            cellOferta.configuraCelula(viewModel?.viagens)
            cellOferta.delegate = self
            return cellOferta
        default:
            return UITableViewCell()
        }
        
    }
}

extension ViewController: UITableViewDelegate{
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as! HomeTableViewHeader
            header.configurarView()
            
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 300 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 450
    }
}

extension ViewController: OfertaTableViewCellDelegate{
    func didSelectView(_ viagem: Viagem?) {
        irParaDetalhe(viagem)
    }
}
