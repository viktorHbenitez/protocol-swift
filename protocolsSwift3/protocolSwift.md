#  Protocol Pattern

## Sketch
![imagen](../master/assets/protocolPattern.png)

Step 1. Create and add protocol  
```swift
protocol EditNameViewControllerDelegate: class{
func editNameViewControllerDidFinish(newName: String?)
}

```
// Step 2. Class B, create a delegate property.  
```swift
weak var delegate: EditNameViewControllerDelegate!
```
Step 3. Add the delegate method call.  
```swift
delegate?.editNameViewControllerDidFinish(newName: (txfName?.text)!)
```

Step 4. Class A conform the protocol.  
```swift

//MARK: step 4 conform the protocol here.
extension ViewController: EditNameViewControllerDelegate {

//MARK: step 6 finally use the method of the contract
func editNameViewControllerDidFinish(newName: String?) {
    if let strTextUser = newName {
        strTitle = strTextUser
        lblName.text = strTextUser
    }
        dismiss(animated: true, completion: nil)
    }
    
}
```
Class A adopts the protocol  is like signing a contract with class B and this contract says “Any class adopting me MUST use my functions!”
![imagen](../master/assets/memeOne.jpg)

Step 5. Class A create a reference of Class B and bind them through the prepareforsegue method.  
```swift
// Step 5. create a reference of Class EditNameViewController and bind them through the prepareforsegue method or other one.
@IBAction func editButtonTapped(_ sender: Any) {
    guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: "MyViewController") as? EditNameViewController else { return }

    // 4. Indicamos que ViewController sera delegado de EditNameViewController
    myVC.delegate = self

    present(myVC, animated: true, completion: nil)
}
```

Step 6. Class A finally use the method of the contract
```swift
func changeBackgroundColor(_ color: UIColor?) {
    view.backgroundColor = color
}
```

