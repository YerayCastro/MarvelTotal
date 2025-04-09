//
//  MarvelVM.swift
//  MarvelTotal
//
//  Created by Yery Castro on 24/3/25.
//

import Foundation

@Observable
final class MarvelVM {
    let network: DataInteractor
    let characters = CharactersLogic()
    let series = SeriesLogic()
    let events = EventsLogic()
    let stories = StoriesLogic()
    let comics = ComicsLogic()
    var showAlert = false
    var msg = ""
    private var offset = 0
    private let limit = 100  // Máximo permitido por la API
    private var total = Int.max
    private var isLoading = false
    
    
    init(network: DataInteractor = Network()) {
        self.network = network
        Task {
            await getData()
        }
        
    }
    func getData() async {
        guard !isLoading, offset < total else { return }  // Evita peticiones innecesarias
                
                isLoading = true
                defer { isLoading = false }
        do {
            let (characters, series, events, stories, comics) = try await (network.getCharacters(url: .urlGetCharacters, apikey: publicKey, offset: offset, limit: limit), network.getSeries(url: .urlGetSeries, apikey: publicKey, offset: offset, limit: limit), network.getEvents(url: .urlGetEvents, apikey: publicKey, offset: offset, limit: limit), (network.getStories(url: .urlGetStories, apikey: publicKey, offset: offset, limit: limit)), network.getComics(url: .urlGetComics, apikey: publicKey, offset: offset, limit: limit))
            await MainActor.run {
                self.characters.characters = characters
                self.series.series = series
                self.events.events = events
                self.stories.stories = stories
                self.comics.comics = comics
            }
        } catch {
            await MainActor.run {
                self.msg = "\(error)"
                self.showAlert.toggle()
            }
        }
    }
    func getCharacters() async {
        guard !isLoading, offset < total else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let newCharacters = try await network.getCharacters(
                url: .urlGetCharacters,
                apikey: publicKey,
                offset: offset,
                limit: limit
            )
            await MainActor.run {
                characters.characters += newCharacters
                offset += limit
            }
        } catch {
            await MainActor.run {
                msg = "\(error)"
                showAlert.toggle()
            }
        }
    }
    func getComics() async {
        guard !isLoading, offset < total else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let newComics = try await network.getComics(
                url: .urlGetComics,
                apikey: publicKey,
                offset: offset,
                limit: limit
            )
            await MainActor.run {
                comics.comics += newComics
                offset += limit
            }
        } catch {
            await MainActor.run {
                msg = "\(error)"
                showAlert.toggle()
            }
        }
    }
    func getSeries() async {
        guard !isLoading, offset < total else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let newSeries = try await network.getSeries(
                url: .urlGetSeries,
                apikey: publicKey,
                offset: offset,
                limit: limit
            )
            await MainActor.run {
                series.series += newSeries
                offset += limit
            }
        } catch {
            await MainActor.run {
                msg = "\(error)"
                showAlert.toggle()
            }
        }
    }
    func getEvents() async {
        guard !isLoading, offset < total else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let newEvents = try await network.getEvents(
                url: .urlGetEvents,
                apikey: publicKey,
                offset: offset,
                limit: limit
            )
            await MainActor.run {
                events.events += newEvents
                offset += limit
            }
        } catch {
            await MainActor.run {
                msg = "\(error)"
                showAlert.toggle()
            }
        }
    }
    func getStories() async {
        guard !isLoading, offset < total else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let newStories = try await network.getStories(
                url: .urlGetStories,
                apikey: publicKey,
                offset: offset,
                limit: limit
            )
            await MainActor.run {
                stories.stories += newStories
                offset += limit
            }
        } catch {
            await MainActor.run {
                msg = "\(error)"
                showAlert.toggle()
            }
        }
    }
}

