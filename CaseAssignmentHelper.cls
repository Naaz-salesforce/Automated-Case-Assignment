public class CaseAssignmentHelper {
    public static Id getAvailableAgent() {
        List<User> availableAgents = [SELECT Id FROM User WHERE Profile.Name = 'Support Agent' LIMIT 1];
        return availableAgents.isEmpty() ? UserInfo.getUserId() : availableAgents[0].Id;
    }
}
