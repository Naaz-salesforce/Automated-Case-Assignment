trigger CaseNotificationTrigger on Case (after insert) {
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for (Case c : Trigger.new) {
        if (c.OwnerId != null) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{UserInfo.getUserEmail()});
            mail.setSubject('New Case Assigned: ' + c.CaseNumber);
            mail.setPlainTextBody('You have been assigned a new case: ' + c.Subject);
            emails.add(mail);
        }
    }

    if (!emails.isEmpty()) {
        Messaging.sendEmail(emails);
    }
}
