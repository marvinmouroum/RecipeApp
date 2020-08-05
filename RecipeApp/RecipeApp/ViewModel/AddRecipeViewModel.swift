//
//  AddRecipeViewModel.swift
//  RecipeApp
//
//  Created by Marvin Mouroum on 02.08.20.
//  Copyright © 2020 mouroum. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

//using an external library
//https://github.com/mikaoj/BSImagePicker
import BSImagePicker

class AddRecipeViewModel:NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    ///The recipe object remains nil until the save button is pressed*
    var recipe:Recipe?
    
    var titleTextField:UITextField = {
        let field = UITextField()
        field.font = UIFont.systemFont(ofSize: 16)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var descriptionTextField:UITextView = {
        let field = UITextView()
        field.font = UIFont.systemFont(ofSize: 16)
        field.layer.cornerRadius = 5
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderWidth = 0.5
        field.backgroundColor = UIColor.tertiarySystemFill
        return field
    }()
    
    var imageContainer:ImageContainer = {
        let container = ImageContainer(images: [])
        container.translatesAutoresizingMaskIntoConstraints = false
        container.insertButton()
        return container
    }()
    
    ///stores selected recipe images as NSManagedObject type
    private var images:[RecipeImages] = []
    
    ///view controller reference for presenting the UIImagePickerController
    var viewcontroller:UIViewController?
    
    ///AppDelegate reference for easier access
    fileprivate var appDel:AppDelegate
    
    ///stackview that is used for the input elements and the labels
    private var stack:UIStackView {
        let stack = UIStackView()
        stack.alignment = .top
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    /**
     *initalizes the AddRecipeViewModel*
     - Parameters:
     *     - Parameter appdel: the appDelegate reference for accessing the persistent storage
     */
    init(_ appdel:AppDelegate) {
        
        self.appDel = appdel
            
        super.init()
        
        //adding the button for adding images
        self.imageContainer.addButton.addTarget(self, action: #selector(presentImagePicker), for: .touchUpInside)
    }
    
    ///assignes a title to the recipe object
    private func setTitle(){
        recipe?.title = self.titleTextField.text
    }
    
    ///assignes objects  to the recipe content relation,
    ///each recipe has a one to many content relationship
    private func setDescriptionContent(){
        let content = self.descriptionTextField.text.components(separatedBy: "\n")
        for item in content {
            let recipeContent = CoreAPI.createRecipeContent(self.appDel,item)
            self.recipe?.addToContentRelation(recipeContent)
        }
    }
    
    ///assignes the images to the recipe,
    ///each recipe has a one to many image relationship
    private func setImageContent(){
        
        for image in self.images {
            self.recipe?.addToImageRelation(image)
        }
    }
    
    ///check the input and
    ///save the recipe object in the persitent storage
    func saveRecipe()->UIAlertController?{
        
        //alert the user if the check failed
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        if titleTextField.text?.count ?? 0 < 2 {
            alert.title = "Please enter a title"
            return alert
        }
        else if descriptionTextField.text?.count ?? 0 < 2 {
            alert.title = "Please enter a description"
            return alert
        }
        else if images.isEmpty {
            alert.title = "Please add an image"
            return alert
        }
        
        //create the NSManagedObject
        self.recipe = CoreAPI.createEmptyRecipe(appDelegate: appDel)
        
        //assign values
        setTitle()
        setDescriptionContent()
        setImageContent()
        
        print(recipe!)
        
        //save it
        do {
            try CoreAPI.save(self.appDel)
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NewRecipe"), object: self)
        }
        catch CoreDataError.SavingError {
            print("data was not saved")
            alert.title = "Sorry!! An error occured!!"
            return alert
        }
        catch {
            alert.title = "Sorry!! An error occured!!"
            return alert
        }
        
        return nil
        
    }
    
    func addTitle(to view:UIView,with topAnchor:NSLayoutYAxisAnchor)->UIView{
        
        let stack = self.stack
        
        //Add label and input field
        let label = InformationLabel("Title")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(titleTextField)
        
        //Layout Stack
        view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        //Layout titleTextField
        titleTextField.widthAnchor.constraint(greaterThanOrEqualTo: stack.widthAnchor, multiplier: 0.95).isActive = true
        
        return stack
        
    }
    
    func addDescription(to view:UIView,with topAnchor:NSLayoutYAxisAnchor)->UIView{
        
        let stack = self.stack
        
        //Add label and input field
        let label = InformationLabel("Description")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(self.descriptionTextField)
        
        
        //Layout for stack
        view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        //Layout for descriptionTextField
        self.descriptionTextField.widthAnchor.constraint(greaterThanOrEqualTo: stack.widthAnchor, multiplier: 0.95).isActive = true
        self.descriptionTextField.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        return stack
        
    }
    
    func addImageContainer(to view:UIView,with topAnchor:NSLayoutYAxisAnchor)->UIView {
        
        let label = InformationLabel("Images")
        
        //Layouts for Label
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        //layouts for container
        view.addSubview(self.imageContainer)
        imageContainer.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0).isActive = true
        imageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        imageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
    
        return self.imageContainer
    }
    
    ///present the imagepickercontroller
    @objc func presentImagePicker(){
        print("adding an Image")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            viewcontroller?.present(imagePicker, animated: true)
        }
    }
    
    ///react to the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //get the image (NS)URL
        let image = info[UIImagePickerController.InfoKey.imageURL] as! NSURL
        
        do {
            //load the data from the location
            let data = try Data(contentsOf: image as URL)
            //create a NSManagedObject
            let recipeImage:RecipeImages = CoreAPI.createRecipeImage(self.appDel, data)
            //store the reference
            self.images.append(recipeImage)
            //reload table data
            self.reloadData()
            
        }catch {
            print("Error while picking image")
        }
        
        //close the picker
        picker.dismiss(animated: false){
            self.reloadData()
        }
        
    }
    
    @objc func removeImage(_ sender:UIButton){
        print("remove image")
        guard let recipeImage = (sender.superview as? RecipeImage) else{ return}
        self.images.removeAll { (image) -> Bool in
            image == recipeImage.coreModel
        }
        self.reloadData()
        
        
    }
    
    /**
     *updates the images in the imageContainer with the current images*
     */
    func reloadData(){
        self.imageContainer.images = self.images
        self.imageContainer.fill(self, selector: #selector(AddRecipeViewModel.removeImage))
    }
    
    
}
