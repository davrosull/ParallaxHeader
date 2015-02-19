# ParallaxHeader
Parallax scrolling effect on UITableView header view when scrolled, built using Swift.

Installation
============

Copy `ParallaxHeader.swift` into your project.

Usage
========
Create a reference to the ParallaxHeader class:

    let parallaxHeader = ParallaxHeader()

In `viewDidLoad()` set the tableheader to the parallax header:

    tableView.tableHeaderView = parallaxHeader.parallaxHeaderViewWithImage(UIImage(named: "HeaderBackground")!, headerSize: CGSizeMake(tableView.frame.size.height, 300))
    parallaxHeader.layoutHeaderViewForScrollViewOffset(self.tableView.contentOffset)

Override the scrollViewDelegate method:

    override func  scrollViewDidScroll(scrollView: UIScrollView) {
        parallaxHeader.layoutHeaderViewForScrollViewOffset(scrollView.contentOffset)
    }

Credits
========
*Heavily* influenced on [ParallaxTableViewHeader by Vinodh-G](https://github.com/Vinodh-G/ParallaxTableViewHeader)
