/*  MVVM in swift

    The Model-View-ViewModel (MVVM) design pattern is a way to structure an app in order to make it easier 
    to maintain and develop. In MVVM, the "Model" represents the data and the business logic of the app, 
    the "View" is the user interface, and the "ViewModel" is an intermediary that mediates the interaction 
    between the Model and the View.
*/

struct Product {
    let name: String
    let price: Double
}

class ProductViewModel {
    private let product: Product
    
    var name: String {
        return product.name
    }
    
    var price: String {
        return "$\(product.price)"
    }
    
    init(product: Product) {
        self.product = product
    }
}

class ProductViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel: ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
    }
}

/* In this example, the Product struct represents the Model, and the ProductViewModel class is the ViewModel. 
    The ProductViewController is the View, and it has a reference to a ProductViewModel instance. 
    The ProductViewModel class exposes the product name and price as computed properties, 
    which are then used to update the labels in the ProductViewController.

    One advantage of using MVVM is that it can make it easier to test the app, 
    since the ViewModel can be tested without relying on the user interface. 
    It can also make it easier to maintain the app, since the Model and ViewModel can be developed 
    and tested independently of the View. 
*/

/* MVVM with RxSwift ````
    
    RxSwift is a framework for working with reactive programming in Swift. 
    It can be used in conjunction with the MVVM design pattern to help manage data flow 
    and communication between the Model, ViewModel, and View.
*/

struct Product {
    let name: String
    let price: Double
}

class ProductViewModel {
    private let product: Product
    private let disposeBag = DisposeBag()
    
    var name: String {
        return product.name
    }
    
    var price: String {
        return "$\(product.price)"
    }
    
    let nameChanged: Observable<String>
    
    init(product: Product) {
        self.product = product
        
        nameChanged = Observable.of(product.name)
    }
}

class ProductViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel: ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.nameChanged
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        priceLabel.text = viewModel.price
    }
}
/* 
    In this example, the ProductViewModel class has an Observable property called nameChanged, 
    which emits the product name whenever it changes. This allows the ProductViewController to react to changes 
    in the product name and update the label accordingly.

    RxSwift can make it easier to manage data flow and communication between the different components 
    of an MVVM app. It can also help to make the code more modular and easier to maintain, 
    since the different components can be developed and tested independently.
*/