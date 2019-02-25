//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation
import UIKit

@objc public class ConversationExport: UIAlertController {
  TSThread thread;
  DateFormatter dateFormatter;

  @objc
  public init(thread: TSThread) {
    super.init(title: "Conversation export", message: "Export message thread", preferredStyle: .alert)
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    addAction(UIAlertAction(title: "Export", handler: exportAction)
    addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: cancelAction))
    self.thread = thread;
  }

  @objc
  public class var exportAction = UIAlertAction(title: "Export") {
    let data = NSData(thread.serialize())
    let date = dateFormatter.string(from: thread.creationDate)
    data.write(toFile: "${NSSearchPathDirectory.NSDocumentDirectory}/${date}.xml")
  }

  @objc
  public class var cancelAction = UIAlertAction(title: CommonStrings.cancelButton, style: .cancel) {
    dismiss()
  }
}
