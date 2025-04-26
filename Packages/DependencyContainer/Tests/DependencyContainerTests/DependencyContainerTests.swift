@testable import DependencyContainer
import XCTest

final class DependencyContainerTests: XCTestCase {
    func test_single_instance_registration_and_resolving() {
        let instance = SingleInstanceImplementation()
        DC.shared.register(type: .singleInstance(instance), for: SingleInstanceProtocol.self)
        let resolvedInstance = DC.shared.resolve(.singleInstance, for: SingleInstanceProtocol.self)
        XCTAssert(instance === resolvedInstance)
    }

    func test_closure_based_registration_and_resolving() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImplementation()
        }
        DC.shared.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)
        let resolved = DC.shared.resolve(.closureBased, for: ClosureBasedProtocol.self)
        XCTAssert(resolved is ClosureBasedImplementation)
    }

    func test_closure_based_dependency_that_depends_on_another() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImplementation()
        }
        DC.shared.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

        let anotherDependencyClosure: () -> AnotherDependencyProtocol = {
            let service = DC.shared.resolve(.closureBased, for: ClosureBasedProtocol.self)
            let anotherDependency = AnotherDependencyImplemention(servise: service)
            return anotherDependency
        }
        DC.shared.register(type: .closureBased(anotherDependencyClosure), for: AnotherDependencyProtocol.self)

        let resolvedAnotherDependency = DC.shared.resolve(.closureBased, for: AnotherDependencyProtocol.self)
    }
}
