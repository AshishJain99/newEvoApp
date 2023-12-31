//
//  getApiData.swift
//  newEvoApp
//
//  Created by Ashish Jain on 03/09/23.
//

import Foundation
import UIKit


class GetApiResponse {
    var allRecommended: [Recommended] = []
    var allFeatured:[Featured] = []
    var allCategoryResponse:[categoryElement]=[]

    private func fetchRecommendedData(completion: @escaping ([Recommended]?) -> Void) {
        
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/recomended.php") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let apiResponse = try JSONDecoder().decode(RecommendedApiResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.allRecommended.removeAll()
                        self.allRecommended.append(contentsOf: apiResponse.Recommended ?? [])
                        completion(self.allRecommended)
                    }
                } catch {
                    print("Model Problem")
                    completion(nil)
                }
            } else {
                print("Parsing problem")
                completion(nil)
            }
        }.resume()
    }

    func recommendedApiResponse(completion: @escaping ([Recommended]?) -> Void) {
        fetchRecommendedData { recommendedData in
            completion(recommendedData)
        }
    }
    
    func fetchImageRecommended(urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    func fetchImageFeatured(urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }

    
     func fetchFeaturedData(completion: @escaping ([Featured]?) -> Void) {
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/featured.php") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let apiResponse = try JSONDecoder().decode(featuredApiResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.allFeatured.removeAll()
                        self.allFeatured.append(contentsOf: apiResponse.Featured!)
                        completion(self.allFeatured)
                    }
                } catch {
                    print("Model Problem")
                    completion(nil)
                }
            } else {
                print("Parsing problem")
                completion(nil)
            }
        }.resume()
    }
    

//    let apiURL: String = "https://privapi.amkette.com/egpapp_v3/iosapi/list_category.php"
    
    func fetchGenres(completion: @escaping ([Genre]?) -> Void) {
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/list_category.php") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let genreNames = try JSONDecoder().decode([String].self, from: data)
                let genres = genreNames.map { Genre(name: $0) }
                completion(genres)
            } catch {
                completion(nil)
            }
        }.resume()
    }


    func getImageFromString(url: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let imageUrl = URL(string: url) {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } catch {
                    print("Error fetching the image: \(error)")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    func fetchCategoriesData(category:String,completion: @escaping ([categoryElement]?) -> Void) {
        
       guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/category.php?category=\(category)") else {
           completion(nil)
           return
       }
       
       URLSession.shared.dataTask(with: url) { data, response, error in
           if let data = data, error == nil {
               do {
                   let apiResponse = try JSONDecoder().decode(CategoryApiResponse.self, from: data)
                   DispatchQueue.main.async {
                       self.allCategoryResponse.removeAll()
                       self.allCategoryResponse.append(contentsOf: apiResponse.Category!)
                       completion(self.allCategoryResponse)
                   }
               } catch {
                   print("Model Problem")
                   completion(nil)
               }
           } else {
               print("Parsing problem")
               completion(nil)
           }
       }.resume()
   }
    
}


