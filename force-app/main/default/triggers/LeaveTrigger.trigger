trigger LeaveTrigger on Leave__c (after insert, after delete, after update) {
    List<Leave__c> triggerRecords = (Trigger.isDelete) ? trigger.old : trigger.new;
    if (Trigger.isInsert) {
        LeaveTriggerHandler.handleInsert(triggerRecords);
    } else if (Trigger.isDelete) {
        LeaveTriggerHandler.handleDelete(triggerRecords);
    } else {
       LeaveTriggerHandler.handleUpdate(triggerRecords, Trigger.oldMap); 
    }
}