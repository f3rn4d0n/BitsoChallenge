//
//  Artwork+Extension.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 15/02/24.
//

import Foundation
import iOSChallengeEntities

extension Artwork {
    
    static func getSample() -> [Artwork] {
        return [
            .init(id: 0, title: "Antique Frieze with Labors of Hercules", thumbnail: "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/40,/0/default.jpg"),
            .init(id: 1, title: "Madonna Appearing to Kneeling Saint", thumbnail: "https://www.artic.edu/iiif/2/cde8bfc7-b0f9-d234-204f-39b99f447a8d/full/40,/0/default.jpg"),
            .init(id: 2, title: "Saltwood Castle of Kent", thumbnail: "https://www.artic.edu/iiif/2/73c9612f-8fd5-21b5-ded4-ebca7ad8e0ad/full/40,/0/default.jpg"),
            .init(id: 3, title: "Water Birds Hanging", thumbnail: "https://www.artic.edu/iiif/2/b6f0de14-d255-a248-44f4-47c7dab995cb/full/40,/0/default.jpg"),
            .init(id: 4, title: "Untitled", thumbnail: "https://www.artic.edu/iiif/2/07083317-bde9-1df9-f686-361f9e484bd1/full/40,/0/default.jpg"),
            .init(id: 5, title: "Untitled", thumbnail: "https://www.artic.edu/iiif/2/aabe1530-f22f-8337-43d3-848a079c8e97/full/40,/0/default.jpg"),
            .init(id: 6, title: "Untitled", thumbnail: "https://www.artic.edu/iiif/2/b7822359-6dd4-5275-ce52-a4acaf20fe23/full/40,/0/default.jpg"),
            .init(id: 7, title: "Study for Moon Meet May", thumbnail: "https://www.artic.edu/iiif/2/d1273720-44fd-2409-b5c3-ead5895bdb0a/full/40,/0/default.jpg"),
            .init(id: 8, title: "Study for Moon Meet May", thumbnail: "https://www.artic.edu/iiif/2/caacfaf1-4e80-f647-9f0f-b572135b7e4a/full/40,/0/default.jpg"),
            .init(id: 9, title: "Study for Moon Meet May", thumbnail: "https://www.artic.edu/iiif/2/95f70fd6-c2f7-b3ee-5b3e-e0bbd69326c4/full/40,/0/default.jpg"),
            .init(id: 10, title: "Study for Moon Meet May", thumbnail: "https://www.artic.edu/iiif/2/5dcfdb06-ad3b-1299-ee93-9885930a061c/full/40,/0/default.jpg"),
            .init(id: 11, title: "Study for Moon Meet May", thumbnail: "https://www.artic.edu/iiif/2/787010ad-70f7-d967-8e78-8f8424c9559f/full/40,/0/default.jpg"),
            .init(id: 12, title: "Woven Structure Pattern (No. 4-10)", thumbnail: "https://www.artic.edu/iiif/2/a92ba852-dea3-08cf-ae81-9e795af57e43/full/40,/0/default.jpg"),
            .init(id: 13, title: "Market Cross at Salisbury or Chichester", thumbnail: "https://www.artic.edu/iiif/2/4e3f3b5c-a143-90bf-274b-737c048b011c/full/40,/0/default.jpg"),
            .init(id: 14, title: "Putto Crowned with Laurel, on Prancing Horse", thumbnail: "https://www.artic.edu/iiif/2/0771cb91-ebd3-3671-3d92-f6057d83b978/full/40,/0/default.jpg"),
            .init(id: 15, title: "Cavalryman on Horseback"),
            .init(id: 16, title: "Landscape with Ruined Arch near Water, and Mountains in Distance", thumbnail: "https://www.artic.edu/iiif/2/3fb17cd4-8fb7-60ef-d201-4f50962aa2da/full/40,/0/default.jpg"),
            .init(id: 17, title: "Madonna and Child, with Saints Anthony of Padua and William of Aquitaine", thumbnail: "https://www.artic.edu/iiif/2/af680d7e-2907-b15f-4619-16183cb9f59d/full/40,/0/default.jpg"),
            .init(id: 18, title: "Half-Length Portrait of Woman (in profile to left) Reading by Opera Window", thumbnail: "https://www.artic.edu/iiif/2/0ab18a3b-18f8-2203-059a-3718a6e5fbda/full/40,/0/default.jpg"),
            .init(id: 19, title: "Head of Little Boy Wearing Plumed Hat", thumbnail: "https://www.artic.edu/iiif/2/41bc57c4-5fde-7749-9690-d7583f24eeb1/full/40,/0/default.jpg"),
            .init(id: 20, title: "Cottage and Ruined Tower near Stream", thumbnail: "https://www.artic.edu/iiif/2/ebcbb104-30ed-91f5-684e-1b6d867cd05d/full/40,/0/default.jpg"),
            .init(id: 21, title: "Indian Village Beside Stream", thumbnail: "https://www.artic.edu/iiif/2/dffe86c0-7009-e718-733e-04e37a41ef20/full/40,/0/default.jpg"),
            .init(id: 22, title: "Mercury Watching Sunset", thumbnail: "https://www.artic.edu/iiif/2/58693d08-2c8d-78e3-ac68-e98b8409a17c/full/40,/0/default.jpg"),
            .init(id: 23, title: "Rocky Pool", thumbnail: "https://www.artic.edu/iiif/2/a3b965d5-5348-8789-10ef-3b8e2c13b617/full/40,/0/default.jpg"),
            .init(id: 24, title: "Two Dogs Fighting", thumbnail: "https://www.artic.edu/iiif/2/a562b14f-8dd2-cd02-53a8-17be864c8199/full/40,/0/default.jpg"),
            .init(id: 25, title: "Female Allegorical Statue", thumbnail: "https://www.artic.edu/iiif/2/04991bb8-44f4-8d3c-dbbd-89849870fb91/full/40,/0/default.jpg"),
            .init(id: 26, title: "Outside of Porta Metella, Rome", thumbnail: "https://www.artic.edu/iiif/2/c7cf62f8-54ff-53f9-9688-4624dde0d700/full/40,/0/default.jpg")
        ]
    }
}
