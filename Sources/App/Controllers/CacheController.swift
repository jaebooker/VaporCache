import Vapor

/// Controls basic CRUD operations on Caches
final class CacheController {
    /// Returns a list of all Caches
    func index(_ req: Request) throws -> Future<[Cache]> {
        return Cache.query(on: req).all()
    }

    /// Saves a decoded Cache to the database.
    func create(_ req: Request) throws -> Future<Cache> {
        return try req.content.decode(Cache.self).flatMap { cache in
            return cache.save(on: req)
        }
    }
    func update(_ req: Request) throws -> Future<Cache> {
        return try req.parameters.next(Cache.self).flatMap {
            cache in
            return try req.content.decode(Cache.self).flatMap {
                newCache in
                cache.notes = newCache.notes
                cache.xcoordinate = newCache.xcoordinate
                cache.ycoordinate = newCache.ycoordinate
                return cache.save(on: req)
            }
        }
    }
    /// Deletes a parameterized Cache
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Cache.self).flatMap { cache in
            return cache.delete(on: req)
        }.transform(to: .ok)
    }
}
