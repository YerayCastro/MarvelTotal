//
//  DataTest2.swift
//  MarvelTotal
//
//  Created by Yery Castro on 24/3/25.
//

import Foundation
struct DataTest: DataInteractor {
    let urlCharacters = Bundle.main.url(forResource: "charactersTest", withExtension: "json")!
    let urlSeries = Bundle.main.url(forResource: "seriesTest", withExtension: "json")!
    let urlEvents = Bundle.main.url(forResource: "eventsTest", withExtension: "json")!
    let urlStories = Bundle.main.url(forResource: "storiesTest", withExtension: "json")!
    let urlComics = Bundle.main.url(forResource: "comicsTest", withExtension: "json")!
    
    func getCharacters(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [CharactersComplete] {
        let data = try Data(contentsOf: urlCharacters)
        return try JSONDecoder().decode(CharactersResponse.self, from: data).data.results
    }
    func getSeries(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [SeriesComplete] {
        let data = try Data(contentsOf: urlSeries)
        return try JSONDecoder().decode(SeriesResponse.self, from: data).data.results
    }
    func getEvents(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [EventsComplete] {
        let data = try Data(contentsOf: urlEvents)
        return try JSONDecoder().decode(EventsResponse.self, from: data).data.results
    }
    func getStories(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [StoriesComplete] {
        let data = try Data(contentsOf: urlSeries)
        return try JSONDecoder().decode(StoriesResponse.self, from: data).data.results
    }
    func getComics(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [ComicsComplete] {
        let data = try Data(contentsOf: urlComics)
        return try JSONDecoder().decode(ComicsResponse.self, from: data).data.results
    }
}
extension MarvelVM {
    static let preview = MarvelVM(network: DataTest())
}
extension CharactersComplete {
    static let testCharacters = CharactersComplete(
        id: 1017100,
        name: "A-Bomb (HAS)",
        description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
        modified: "2013-09-18T15:54:04-0400",
        thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
            imageExtension: .jpg
        ),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1017100",
        comics: Comics(
            available: 4,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1017100/comics",
            items: [ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/comics/47176",
                name: "FREE COMIC BOOK DAY 2013 1 (2013) #1"
            )],
            returned: 4
        ),
        series: Comics(
            available: 2,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1017100/series",
            items: [ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/series/17765",
                name: "FREE COMIC BOOK DAY 2013 1 (2013)"
            )],
            returned: 2
        ),
        stories: Stories(
            available: 7,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1017100/stories",
            items: [StoriesItem(
                resourceURI: "http://gateway.marvel.com/v1/public/stories/92086",
                name: "Hulk (2008) #53",
                type: .cover
            )],
            returned: 7
        ),
        events: Comics(
            available: 0,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1017100/events",
            items: [],
            returned: 0
        ),
        urls: [URLElement(
            type: .detail,
            url: "http://marvel.com/characters/76/a-bomb?utm_campaign=apiRef&utm_source=705c81713fe9baf57c60aad163a5272e"
        )]
    )
}

extension SeriesComplete {
    static let testSeries = SeriesComplete(id: 26024, title: " Superior Spider-Man Vol. 2: Otto-matic (2019)", description: "", resourceURI: "http://gateway.marvel.com/v1/public/series/26024", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/26024/_superior_spider-man_vol_2_otto-matic_2019?utm_campaign=apiRef&utm_source=705c81713fe9baf57c60aad163a5272e")], startYear: 2019, endYear: 2019, rating: "", type: "collection", modified: "2019-12-13T16:23:45-0500", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", imageExtension: .jpg), creators: Creators(available: 4, collectionURI: "http://gateway.marvel.com/v1/public/series/26024/creators", items: [Creator(resourceURI: "http://gateway.marvel.com/v1/public/creators/11765", name: "Christos Gage", role: "writer")], returned: 4), characters: Characters(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/series/26024/stories", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/characters/1009610", name: "Spider-Man (Peter Parker)")], returned: 1), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/26024/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/158776", name: "cover from SUPERIOR SPIDER-MAN VOL. 2 TPB (2020) #2", type: .cover)], returned: 2), comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/series/26024/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/71400", name: " Superior Spider-Man Vol. 2: Otto-matic (Trade Paperback)")], returned: 1), events: Events(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/series/26024/events", items: [], returned: 1))
}
extension EventsComplete {
    static let testEvents = EventsComplete(id: 116, title: "Acts of Vengeance!", description: "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.", resourceURI: "http://gateway.marvel.com/v1/public/events/116", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/events/116/acts_of_vengeance?utm_campaign=apiRef&utm_source=705c81713fe9baf57c60aad163a5272e")], modified: "2013-06-28T16:31:24-0400", start: "1989-12-10 00:00:00", end: "2008-01-04 00:00:00", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b", imageExtension: .jpg), creators: Creators(available: 98, collectionURI: "http://gateway.marvel.com/v1/public/events/116/creators", items: [Creator(resourceURI: "http://gateway.marvel.com/v1/public/creators/2707", name: "Jeff Albrecht", role: "inker")], returned: 20), characters: Characters(available: 113, collectionURI: "http://gateway.marvel.com/v1/public/events/116/characters", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/characters/1009148", name: "Absorbing Man")], returned: 20), stories: Stories(available: 166, collectionURI: "http://gateway.marvel.com/v1/public/events/116/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/21328", name: "Cover #21328", type: .cover)], returned: 20), comics: Characters(available: 53, collectionURI: "http://gateway.marvel.com/v1/public/events/116/comics", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/comics/12744", name: "Alpha Flight (1983) #79")], returned: 20), series: Characters(available: 22, collectionURI: "http://gateway.marvel.com/v1/public/events/116/series", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/series/2116", name: "Alpha Flight (1983 - 1994)")], returned: 20), next: Next(resourceURI: "http://gateway.marvel.com/v1/public/events/240", name: "Days of Future Present"), previous: Next(resourceURI: "http://gateway.marvel.com/v1/public/events/233", name: "Atlantis Attacks"))
}
extension StoriesComplete {
    static let testStories = StoriesComplete(id: 7, title: "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf", description: "", resourceURI: "http://gateway.marvel.com/v1/public/stories/7", type: .story, modified: "1969-12-31T19:00:00-0500", thumbnail: nil, creators: Characters(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/stories/7/creators", items: [], returned: 0), characters: Characters(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/stories/7/characters", items: [], returned: 0), comics: Characters(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/stories/7/comics", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/comics/941", name: "CAGE (Hardcover)")], returned: 1), series: Characters(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/stories/7/series", items: [SeriesItems(resourceURI: "http://gateway.marvel.com/v1/public/series/6", name: "CAGE (2002)")], returned: 1), events: Characters(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/stories/7/events", items: [], returned: 0), originalIssue: OriginalIssue(resourceURI: "http://gateway.marvel.com/v1/public/comics/941", name: "CAGE (Hardcover)"))
}
extension ComicsComplete {
    static let testComics = ComicsComplete(id: 82967, digitalID: 0, title: "Marvel Previews (2017)", issueNumber: 0, variantDescription: "", description: "", modified: "2019-11-07T08:46:15+0000", isbn: "", upc: "75960608839302811", diamondCode: "", ean: "", issn: "", format: .empty, pageCount: 122, textObjects: [], resourceURI: "https://gateway.marvel.com/v1/public/comics/82967", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/issue/82967/marvel_previews_2017?utm_campaign=apiRef&utm_source=705c81713fe9baf57c60aad163a5272e")], series: Series(resourceURI: "https://gateway.marvel.com/v1/public/series/23665", name: "Marvel Previews (2017 - Present)"), variants: [Series(resourceURI: "https://gateway.marvel.com/v1/public/comics/82965", name: "Marvel Previews (2017)")], collections: [], collectedIssues: [], dates: [DateElement(type: .onsaleDate, date: "2099-10-30T00:00:00+0000")], prices: [Price(type: .printPrice, price: 0.0)], thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", imageExtension: .jpg), images: [], creators: Creators(available: 1, collectionURI: "https://gateway.marvel.com/v1/public/comics/82967/creators", items: [Creator(resourceURI: "https://gateway.marvel.com/v1/public/creators/10021", name: "Jim Nausedas", role: "editor")], returned: 1), characters: Characters(available: 0, collectionURI: "https://gateway.marvel.com/v1/public/comics/82967/characters", items: [], returned: 0), stories: Stories(available: 2, collectionURI: "https://gateway.marvel.com/v1/public/comics/82967/stories", items: [StoriesItem(resourceURI: "https://gateway.marvel.com/v1/public/stories/183698", name: "cover from Marvel Previews (2017)", type: .cover)], returned: 2), events: Characters(available: 0, collectionURI: "https://gateway.marvel.com/v1/public/comics/82967/events", items: [], returned: 0))
}
