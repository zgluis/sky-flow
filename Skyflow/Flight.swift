import SwiftUI

struct Flight : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}


#if DEBUG
let testData = [Flight(name: "One", capacity: 1, hasVideo: true),
                Flight(name: "Two", capacity: 2, hasVideo: false),
                Flight(name: "Three", capacity: 3, hasVideo: true),
                Flight(name: "Four", capacity: 4, hasVideo: false),
                Flight(name: "Five", capacity: 5, hasVideo: true)]
#endif
