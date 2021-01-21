모바일 3주차 이모티콘 저장소

### Setting Done

- branch -> fork -> clone
- .gitignore
- create EmoticonApp project

![image-20210118114223431](README.assets/image-20210118114223431.png)

### Add some assets

- add two images : pattern, basket

![image-20210118130338774](README.assets/image-20210118130338774.png)

![image-20210118130348960](README.assets/image-20210118130348960.png)

### add TableView in the View

- add TableView
- declare list of title/author/image
- override methods : tableView()

![image-20210118200355913](README.assets/image-20210118200355913.png)

### convert some view into code

- add upperview in code
- add some constraints in code

### Fill upperView

- fill background with pattern image
- add jeje Image

![image-20210118210817576](README.assets/image-20210118210817576.png)

### Fill UpperView(2)

- add Label : titleInView
- add Label : descriptionInView

![image-20210118214924554](README.assets/image-20210118214924554.png)

### Add UpperInnerView

- add UpperInnerView as a subview of upperView
- give upperInnerView padding

![image-20210118225401483](README.assets/image-20210118225401483.png)

### Midify - descriptionInView

- remove heightAnchor, widthAnchor
- add method : sizeToFit()

### Make model group

- make model group
- make a file : Emoticon.swift
- make a Model : struct Emoticon
  - list data
  - 3 methods : title, author, image

### Modify - TableViewController

- erase codes using raw data list
- add object : Emoticon()
- instead of access index of list directly, using struct method

### create myCell.swfit

- create myCell class
- set the class as a custom class of cell

### add some Subviews

- titleLabel
- descriptionLabel
- leadingImage
- extension UILabel to add method setConstraint

![image-20210119150619707](README.assets/image-20210119150619707.png)

### setting cell height

- setting cell height using `tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)` method

![image-20210119151913748](README.assets/image-20210119151913748.png)

### configure all elements in custom cell

- title label
- author label
- ImageView
- purchaceLabel
- set constrainits

![image-20210119203104181](README.assets/image-20210119203104181.png)

### Modify : how to measure height

- using initial height instead of height at that moment

### Got some feedback --> Modify!

- change struct name : Emoticon -> Emoticons
  - add two methods to create unique data : getEmoticons(), registerEmoticons
- make another struct : Emoticon
  - implement getter and setter

### Feedback Modify2

- change method : Emoticons.getEmoticons() -> getEmoticon(index : Int)
  - apply this modification -> TableViewController can pass minimum data to configure a cell
- add variable : emoticons.count

### Feedback Modify - TableViewController tableView methods

- add Emoticions.registerEmoticons() method in viewDidLoad()
- return Emoticons.count in tebleview method
- call cell.setEmoticon method instead of calling 3 methods

### Feedback Modify - myCell Methods

- combine 3 methods that configure each subview into 1method : setEmoticon()

### Feedback Modify - remove unused overriding method in myCell.swift

### Feedback Modify - Naming Convention

### Feedback Modify -  Decompose ViewController into View and Controller

- make UpperBelowView.swift
- make class : UpperView
  - add set methods : setUpperView, setUpperInnerView, setUpperImage, setUpperImageView, setUpperImageView, setTitleInView, setDescriptionInView
  - add get methods : getUpperInnerView, getTitleInView
- extension class : UIVlew
  - add method : setBelowView

### Feedback Modify - Decompose TableViewController into View and Controller

- make TableViewExtension.swift
- extension class : UITableView
  - add set methods : setTableView, assignDelegateAndDataSource

### Add NavigationController

- Embed NavigationController
- extension UINavigationItem -> add method : setNavigationItem

![image-20210120172210451](README.assets/image-20210120172210451.png)

### Rename : TableViewController -> EmoticonListTableViewController

### Add action to cart button

- add action : push new ViewController(HistoryTableViewController)
- remove : NavitationItemExtension

![image-20210120193712831](README.assets/image-20210120193712831.png)

### Remove useless borders

![image-20210120193914057](README.assets/image-20210120193914057.png)

### make Clear Button

- make clear button with action : clearButtonTouched
- add the button as a right bar button

![image-20210120194622193](README.assets/image-20210120194622193.png)

### NotificationCenter

- addObserver : EmoticonListTableViewController
- new method : addHistory
- addPost : buyButtonTouched

![image-20210120232640641](README.assets/image-20210120232640641.png)

### ClearButton

- add action : clearButtonTouched

![image-20210120234431411](README.assets/image-20210120234431411.png)

### ClearButtonTouched - add logic

- add logic : reloadData()

### Record Exact Log

- using Date().description, record exact time when buy button touched

![image-20210121113430086](README.assets/image-20210121113430086.png)

### Remove from History

- make swipeRecognizer
- addGestureRecognizer : swipeRecognizer
- use NotificationCenter to notify the history log is swiped
- add HistoryTableViewController as a observer of swiping
- add Method of Histories : deleteHistory()

