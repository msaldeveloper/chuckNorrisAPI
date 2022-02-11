import Foundation

protocol chuckManagerDelegate {
    func didUpdateFrase(_ chuckManager: ChuckManager, frase: ChuckModel)
}

struct ChuckManager {
    let chuckUrl = "https://api.chucknorris.io/jokes/random"
    
    var delegate: chuckManagerDelegate?
    
    func getFrase() {
        let urlString = "\(chuckUrl)"
        perfomRequest(urlString: urlString)
    }
    
    func perfomRequest(urlString: String) {
        // Hacemos los 4 pasos
        //1.Crear un URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Darle la session una tarea

            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error ?? "")
                    
                    return
                }

                if let safeData = data {
                    if  let frase = self.parseJSON(frase: safeData) {
                        delegate?.didUpdateFrase(self, frase: frase)
                    }
                }
            }

            task.resume()
        }
    }
    
    func parseJSON(frase: Data) -> ChuckModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(ChuckData.self, from: frase)
            
            let frasesData = decodedData.value
            
//            let drink = DrinkModel(id: drinkData.idDrink, name: drinkData.strDrink, type: drinkData.strCategory, glassType: drinkData.strGlass, instructions: drinkData.strInstructions, image: drinkData.strDrinkThumb, ingredients: drinkData.strIngredient1, measure: drinkData.strMeasure1)
            let frase = ChuckModel(value: frasesData)
            print(frase)
            
            return frase
        } catch {
            print(error)
            
            return nil
        }
    }
}
