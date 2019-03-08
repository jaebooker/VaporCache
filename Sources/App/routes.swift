import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return "Welcome to the ArCache API!"
    }
    
    // Basic "Hello, world!"
    router.get("hello") { req in
        return "Hello, world!"
    }

    // configuring a controller
    let cacheController = CacheController()
    router.get("caches", use: cacheController.index)
    router.post("caches", use: cacheController.create)
    router.patch("caches", Cache.parameter, use: cacheController.update)
    router.delete("caches", Cache.parameter, use: cacheController.delete)
}
