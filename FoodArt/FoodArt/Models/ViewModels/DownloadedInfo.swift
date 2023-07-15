import UIKit

struct DownloadedInfo<T: Decodable> {
    let downloadedInfo: T
    let images: [String: UIImage?]
}
