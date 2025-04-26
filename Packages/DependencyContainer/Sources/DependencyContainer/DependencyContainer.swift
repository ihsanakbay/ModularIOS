import Foundation

public typealias DC = DependencyContainer

public final class DependencyContainer: @unchecked Sendable {
    public static let shared = DependencyContainer()

    private var singleInstanceDependencies: [ObjectIdentifier: AnyObject] = [:]
    private var closureBasedDependencies: [ObjectIdentifier: () -> Any] = [:]

    private let dependencyAccessQueue = DispatchQueue(
        label: "com.modularios.dependency.container.access.queue",
        attributes: .concurrent
    )

    private init() {}

    public func register(type: DependencyContainerRegistrationType, for interface: Any.Type) {
        dependencyAccessQueue.sync(flags: .barrier) {
            let objectIdentifier = ObjectIdentifier(interface)
            switch type {
            case .singleInstance(let instance):
                singleInstanceDependencies[objectIdentifier] = instance
            case .closureBased(let closure):
                closureBasedDependencies[objectIdentifier] = closure
            }
        }
    }

    public func resolve<Value>(_ type: DependencyContainerResolvingType, for interface: Value.Type) -> Value {
        var value: Value!
        dependencyAccessQueue.sync {
            let objectIdentifier = ObjectIdentifier(interface)
            switch type {
            case .singleInstance:
                guard let singleInstanceDependencies = singleInstanceDependencies[objectIdentifier] as? Value else {
                    fatalError("Could not retrieve a dependency for the given type: \(interface)")
                }
                value = singleInstanceDependencies
            case .closureBased:
                guard let closure = closureBasedDependencies[objectIdentifier],
                      let closureBasedDependencies = closure() as? Value
                else {
                    fatalError("Could not retrieve closure based dependency for the given type: \(interface)")
                }
                value = closureBasedDependencies
            }
        }
        return value
    }
}
