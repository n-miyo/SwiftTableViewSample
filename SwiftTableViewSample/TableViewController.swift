// -*- mode:swift -*-

import UIKit

class TableViewController: UITableViewController {
  let CellIdentifier = "Cell"
  let SectionHeaderHeight : CGFloat = 40.0
  let SectionFooterHeight : CGFloat = 20.0
  let SectionDelimiterMargin : CGFloat = 10.0

  @lazy var objects: Array<(String, Array<String>, String)> = {
    var a0 = ("Apple", ["AppleII", "Macintosh", "iMac"], "Desktop")
    var a1 = ("NEC", ["PC-2001", "PC-8201", "PC-98HA"], "Handheld")
    var a2 = ("CASIO", ["PB-100", "PB-120", "PB-1000C"], "Pocket")
    return [a0, a1, a2]
  }()

  init(style: UITableViewStyle) {
    super.init(style: style)
  }

  init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.registerClass(
      UITableViewCell.self, forCellReuseIdentifier:CellIdentifier)

    edgesForExtendedLayout = .None;
    extendedLayoutIncludesOpaqueBars = false;
    automaticallyAdjustsScrollViewInsets = false;
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // #pragma mark - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
    return objects.count
  }

  override func tableView(
    tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
    let (_, d, _) = objects[section]
    return d.count
  }

  override func tableView(
    tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!)
    -> UITableViewCell? {
    var cell =
      tableView?.dequeueReusableCellWithIdentifier(
        CellIdentifier, forIndexPath:indexPath) as? UITableViewCell

    if !cell {
      return nil;
    }

    let (_, d, _) = objects[indexPath.section]
    cell!.text = d[indexPath.row]

    return cell
  }

  // #pragma mark - Table view delegate

  override func tableView(tableView: UITableView!,
    heightForHeaderInSection section: Int) -> CGFloat {
      return SectionHeaderHeight
  }

  override func tableView(tableView: UITableView!,
    heightForFooterInSection section: Int) -> CGFloat {
      return SectionFooterHeight
  }

  override func tableView(
    tableView: UITableView!, viewForHeaderInSection section: Int) -> UIView! {
    let (h, _, _) = objects[section]

    // create the label
    var headerLabel = UILabel(frame:CGRectZero)
    headerLabel.backgroundColor = UIColor.clearColor()
    headerLabel.font = UIFont(name:"HelveticaNeue-Light", size:14.0)
    headerLabel.frame =
      CGRectMake(0, 0,
        tableView.frame.width-SectionDelimiterMargin, SectionHeaderHeight)
    headerLabel.textAlignment = .Right
    headerLabel.text = h
    headerLabel.textColor = UIColor.darkGrayColor()

    // create the parent view that will hold header Label
    var customView = UIView(frame:headerLabel.frame)
    customView.addSubview(headerLabel)

    return customView
  }

  override func tableView(
    tableView: UITableView!, viewForFooterInSection section: Int) -> UIView! {
    let (_, _, f) = objects[section]

    // create the label
    var footerLabel = UILabel(frame:CGRectZero)
    footerLabel.backgroundColor = UIColor.clearColor()
    footerLabel.font = UIFont(name:"HelveticaNeue-Light", size:12.0)
    footerLabel.frame =
      CGRectMake(0, 0,
        tableView.frame.width-SectionDelimiterMargin, SectionFooterHeight)
    footerLabel.textAlignment = .Right
    footerLabel.text = f
    footerLabel.textColor = UIColor.lightGrayColor()

    // create the parent view that will hold header Label
    var customView = UIView(frame:footerLabel.frame)
    customView.addSubview(footerLabel)

    return customView
  }
}

// EOF
