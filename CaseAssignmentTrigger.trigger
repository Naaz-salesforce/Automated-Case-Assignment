trigger CaseAssignmentTrigger on Case (before insert, before update) {
    List<Case> caseList = new List<Case>();
    
    for (Case c : Trigger.new) {
        if (c.OwnerId == null) { // If no owner is assigned
            c.OwnerId = CaseAssignmentHelper.getAvailableAgent();
            caseList.add(c);
        }
    }
}
