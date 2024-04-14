import Foundation

class ContentService {
    private let apiKey = "a4776f352c238462bcca0dbbdd94e67e"
    private let baseURL = "https://api.themoviedb.org/3"
    
    static let categories = ["Popular Movies", "Now Playing Movies", "Upcoming Movies", "Top Rated Movies", "Trending Movies"]
    
    // genre를 model에 저장할 때는 id로 저장할 것이나, 사용할 때는 이것을 이용하여 mapping
    static let genreMapping: [Int: String] = [
        28: "Action",
        12: "Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751: "Family",
        14: "Fantasy",
        36: "History",
        27: "Horror",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western",
        10759: "Action & Adventure",
        10762: "Kids",
        10763: "News",
        10764: "Reality",
        10765: "Sci-Fi & Fantasy",
        10766: "Soap",
        10767: "Talk",
        10768: "War & Politics",
    ]
    
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
                    // title
                    let title = movie.title
                    // poster
                    let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!
                    // backdrop
                    let backdropURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)")!
                    // releaseDate: 포맷 ui에 맞게 저장해야함
                    var releaseDate = ""
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let date = dateFormatter.date(from: movie.release_date) {
                        dateFormatter.dateFormat = "'Season 1 Coming' MMMM dd"
                        let formattedDate = dateFormatter.string(from: date)
                        releaseDate = formattedDate
                    } else {
                        print("Invalid date format")
                    }
                    // overview
                    let overview = movie.overview
                    let genreIds = movie.genre_ids
                    return ContentModel(category: category, title: title, imageURL: imageURL, backdropURL: backdropURL, releaseDate: releaseDate, overview: overview, genreIds: genreIds)
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
    let title: String
    let poster_path: String
    let backdrop_path: String
    let release_date: String
    let overview: String
    let genre_ids: [Int]
}
