# swift-w3-emoticon
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