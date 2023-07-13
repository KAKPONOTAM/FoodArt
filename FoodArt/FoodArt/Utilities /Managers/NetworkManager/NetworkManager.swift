import Foundation

final class NetworkManager {
    func downloadData<T: Codable>(_ link: URL.Links) async throws -> T {
        guard let url = URL(link) else { throw NetworkError.fetchFailed }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.unknownError
        }
    }
}
