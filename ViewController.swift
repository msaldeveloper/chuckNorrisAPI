//
//  ViewController.swift
//  testApp
//
//  Created by Mario Saldana on 09/02/22.
//

import UIKit
//
class ViewController: UIViewController {
    
    var responseViewController = ResponseViewController()
    var image : UIImageView?
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var chuckManager = ChuckManager()
    var phrase : String?
    
    var button : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue21
        initUi()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
        chuckManager.delegate = self
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //button?.isEnabled = false
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func initUi(){
        titleLabel = UILabel()
        titleLabel?.text = "ChukNorris API"
        titleLabel?.font = UIFont.textFont2
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        view.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 40, right: 10, bottom: nil)
        
        descriptionLabel = UILabel()
        descriptionLabel?.text = "frases de CHUCK NORRIS"
        descriptionLabel?.font = UIFont.textFont
        descriptionLabel?.backgroundColor = .clear
        descriptionLabel?.textAlignment = .center
        view.addSubview(descriptionLabel!)
        descriptionLabel?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 15, right: 10, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
        
//        searcher = UIView()
//        searcher?.layer.cornerRadius = 10
//        searcher?.layer.borderColor = CGColor(red: 109/255, green: 69/255, blue: 223/255, alpha: 1)
//        searcher?.layer.borderWidth = 1
//        view.addSubview(searcher!)
//        searcher?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 20, right: 10, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
//
//        searcherLabel = UITextField()
//        searcherLabel?.placeholder = "Ingresa tu busqueda"
//        searcher?.addSubview(searcherLabel!)
//        searcherLabel?.addAnchorsAndSize(width: nil, height: 50, left: 5, top: nil, right: 5, bottom: nil)
//
        
        image = UIImageView()
        image?.image = UIImage(named: "")
        let urlImage = "https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png"
        if let url = NSURL(string: urlImage) {
            print(type(of: url), url)
            if let data = NSData(contentsOf: url as URL) {
                self.image?.image = UIImage(data: data as Data)
                self.image?.layer.cornerRadius = 10
                self.image?.layer.masksToBounds = true
          }
        }
        view.addSubview(image!)
        image?.addAnchorsAndSize(width: nil, height: 250, left: 10, top: 50, right: 10, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
        

        
        button = UIButton()
        button?.backgroundColor = UIColor(red: 109/255, green: 69/255, blue: 223/255, alpha: 1)
        button?.setTitle("Buscar", for: .normal)
        button?.layer.cornerRadius = 10
        view.addSubview(button!)
        button?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 50, right: 10, bottom: nil, withAnchor: .top, relativeToView: image)
        let tapSearcherButton = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        button?.addGestureRecognizer(tapSearcherButton)
    }
    @objc func buttonAction(){
        chuckManager.getFrase()
        let resposeViewController = ResponseViewController()
        resposeViewController.prase2 = phrase
        present(resposeViewController,animated: true,completion:{print("register button press validated")} )
        }
    
    
    
//    @objc func newSearchButton() {
//        drinkManager.getDrink(drinkName: drinkInput?.text ?? "")
//
//    }
//    DispatchQueue.main.async {
//        self.fraseLabel?.text = "\(frase.value)"
//    }


}
extension ViewController: chuckManagerDelegate{
    func didUpdateFrase(_ chuckManager: ChuckManager, frase: ChuckModel) {
        DispatchQueue.main.async { [self] in
            print("@@@@@", frase.value)
            phrase = frase.value
            //button?.isEnabled = true
            //phrase = "\(frase.value)"
            //self.phrase = "\(String(describing: frase.value ))"
            //self.responseViewController.sendFrase(frase: "\(frase.value)")
            //self.responseViewController.phrase = phrase
        }

    }
}





