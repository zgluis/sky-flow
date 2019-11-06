import SwiftUI

protocol FlightListDisplayLogic
{
    mutating func displaySomething(viewModel: FlightList.Something.ViewModel)
}

struct ContentView: View, FlightListDisplayLogic {
    @State var flights: [Flight] = []
    @State var interactor: FlightListBusinessLogic?
    
    var body: some View {
        NavigationView {
            List(flights) { flight in
                FlightDetailView(flight: flight)
            }
            .navigationBarTitle("Best flights for u")
        }.onAppear(perform: setup)
    }
    
    // MARK: Setup
    
    private func setup()
    {
        print("setuping")
        let viewController = self
        let interactor = FlightListInteractor()
        let presenter = FlightListPresenter()
        let router = FlightListRouter()
        viewController.interactor = interactor
        // viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        // router.viewController = viewController
        router.dataStore = interactor
        doSomething()
    }
    
    func doSomething()
    {
        print("doing something")
        let request = FlightList.Something.Request.init(req: testData)
        print(interactor != nil ? "not nil" : "nil")
        interactor?.doSomething(request: request)
    }
    
    mutating func displaySomething(viewModel: FlightList.Something.ViewModel) {
        print("displaySomething")
        flights = viewModel.data
    }
    
    // MARK: Routing
    
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(flights: testData)
    }
}

#endif


