import Foundation

class ContentService {
    private let apiKey = "a4776f352c238462bcca0dbbdd94e67e"
    private let baseURL = "https://api.themoviedb.org/3"
    
    static let categories = ["Popular Movies", "Now Playing Movies", "Upcoming Movies", "Top Rated Movies", "Trending Movies"]
    
    func fetchMovies(category: String, completion: @escaping ([ContentModel]?, Error?) -> Void) {
        let endpoint: String
        switch category {
        case "Popular Movies":
            endpoint = "/movie/popular"
        case "Now Playing Movies":
            endpoint = "/movie/now_playing"
        case "Upcoming Movies":
            endpoint = "/movie/upcoming"
        case "Top Rated Movies":
            endpoint = "/movie/top_rated"
        case "Trending Movies":
            endpoint = "/trending/movie/week"
        default:
            endpoint = ""
            print("Can not find the category")
        }
        
        let url = URL(string: "\(baseURL)\(endpoint)?api_key=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TMDBResponse.self, from: data)
                let movies = result.results.map { movie -> ContentModel in
                    let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!
                    return ContentModel(category: category, imageURL: imageURL)
                }
                completion(movies, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

struct TMDBResponse: Decodable {
    let results: [TMDBMovie]
}

struct TMDBMovie: Decodable {
    let poster_path: String
}
