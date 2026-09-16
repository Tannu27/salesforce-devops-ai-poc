public with sharing class CasePriorityService {

    public static String determinePriority(String caseType) {

        for (CasePriorityRule__mdt rule : [
            SELECT Case_Type__c, Priority__c
            FROM CasePriorityRule__mdt
        ]) {

            if (rule.Case_Type__c == caseType) {
                return rule.Priority__c;
            }
        }

        return 'Low';
    }

    public static void updateCasePriority(List<Case> casesToUpdate) {

        for (Case c : casesToUpdate) {
            c.Priority = determinePriority(c.Type);
        }
    }
}