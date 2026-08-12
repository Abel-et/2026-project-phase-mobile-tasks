import 'dart:io';

bool checkInputs(int? userInput){
   if(userInput == null || userInput < 0 || userInput > 5){
    return true;
   }
   return false;
}

void decide(){
  UserInterface user = UserInterface();
  user.choose();
        String input = stdin.readLineSync() ??"";
        int? userInput = int.tryParse(input);
        if(userInput == 0){
          exit(0);
        }
}
void main(){
  ManageCommerce manager = ManageCommerce();
  UserInterface user = UserInterface();

  String userInput;
  int? parsedValue;
  while(true){
    // this will display the menu
    user.displayMenu();
    stdout.write("select one operation by pressing the number : ");
    userInput = stdin.readLineSync() ??"";
     parsedValue = int.tryParse(userInput);

    // if input is null or invalid not number give chance again else exit
    if(checkInputs(parsedValue)){
      print('Invalid Input try again: ');
      userInput = stdin.readLineSync() ??"";
      parsedValue = int.tryParse(userInput);
      if(checkInputs(parsedValue)){
        break;
      }}

      if(parsedValue ==5 ){
        break;
      }


      switch(parsedValue){
        case 1:
        print(user.logo);
        manager.createProduct();
        decide();

        case 2:
        print(user.logo);
        manager.displayProducts();
        decide();
        
        case 3:
        print(user.logo);
        // get product id:
        print('Which product you want to edit ? ');
        manager.displayProducts();
        stdout.write('Enter the Id of the product :');
        String? productId = stdin.readLineSync()?? "";
        int? id = int.tryParse(productId);
        bool value = manager.editProduct(id);
        decide();
         
        case 4:
        print(user.logo);
        print('Which product you want to delete? ');
        manager.displayProducts();
        String? productId = stdin.readLineSync()?? "";
        int? id = int.tryParse(productId);
        manager.deleteProduct(id);
        decide();
        case 5: 
        exit(1);
        default:
        print('Invalid Input ');
        continue;

      }
    

  }
  
}

// product class that is storing products blue print
class Product {
  String? name , category,price;
  int? quantity ;

  Product (String name , category,  price, int quantity){
    this.name = name;
    this.category = category;
    this.price = price;
    this.quantity = quantity;
  }

  void showProduct(){
    print('Product $name is successfully created !');
  }

 @override
  String toString() {
    return 'Name: $name, Category: $category, Price: $price, Quantity: $quantity';
  }
}



class ManageCommerce{
  List<Product> products = [];
  
  // add product  and put to list
  void addProduct(Product product){
    products.add(product);
    print(' ${product.name} is successfully added to the product');
  }

  // creating product 
  void createProduct(){
    // create product object using Product class 
      // ask user to full fill these fields
      print('\tAdding product to store :');
      stdout.write('Enter product Name ');
      String name = stdin.readLineSync() ?? '';

      stdout.write('Enter product Category ');
      String category = stdin.readLineSync() ?? '';

      stdout.write('Enter product Price ');
      String price = stdin.readLineSync() ?? '';

      stdout.write('Enter product Quantity ');
      String quantity = stdin.readLineSync() ?? '';

      // create product 
      Product product = Product(name, category, price, int.parse(quantity));
      this.addProduct(product);
    
  }

  // Display all products that are in Product list 
  void displayProducts(){
    if (products.length < 1){
      print('There is no Product !');
    }else{
    var n = products.length;
    // Iterate through each product and display 
    print('Id\t Name\t Category\t Price\t Quantity\t');
    for(var i = 0; i < n ; i++){
      print('$i\t ${products[i].name}\t ${products[i].category}\t ${products[i].price}\t ${products[i].quantity}');
    }
    }

  }

  // Edit product using their id
  bool editProduct(int? id){
    int n = products.length;
    if(  id == null ||id > n || id < 0 ){
      print('There is no product with this has id number ');
      return false;
    }
    Product productToUpdate = products[id];
    print("What do you want to update: \n\t 1.name\n\t 2.category\n\t 3.price\n\t 4.Quantity \n Enter a number to be Update");
    String input = stdin.readLineSync()?? '';
    int? choose = int.parse(input);

    switch(choose){
      case 1 :
      stdout.write("Enter the name : ");
      String name = stdin.readLineSync()??'';
      productToUpdate.name = name;
      print("updated product : $productToUpdate");
      return true;

       case 2:
       stdout.write("Enter the Category : ");
      String category= stdin.readLineSync()??'';
      productToUpdate.category = category;
      print("updated product : $productToUpdate");
      return true;

      case 3:
       stdout.write("Enter the price : ");
      String price= stdin.readLineSync()??'';
      productToUpdate.price = price;
      print("updated product : $productToUpdate");
      return true;
    
    case 4:
       stdout.write("Enter the Quantity : ");
      String quantity= stdin.readLineSync()??'';
      int quant  = int.parse(quantity);
      productToUpdate.quantity = quant;
      print("updated product : $productToUpdate");
      return true;
    default:
    print('invalid Input');

    
  }
  return false;



}

  bool deleteProduct(id){
    int n  = products.length;

    if (id >= n || id <0){
      print('the id number is invalid please check');
      return false;
    }

    Product deletedProduct = products.removeAt(id);
    print('${deletedProduct.name} is deleted successfully ');
    return true;

  }
}

class UserInterface{
  String logo = "****** Welcome To A2SV E-commerce Console Platform******";
// display main menu
  void displayMenu(){
    print('$logo \n');
    print(
      """
      \t 1. Add Product 
      \t 2. View Products
      \t 3. Edit Product
      \t 4. Delete Product
      \t 0. Exit\n
 
""")
;
  }
  void choose(){
    print('1.Back to main     0.Exit');
  }


}