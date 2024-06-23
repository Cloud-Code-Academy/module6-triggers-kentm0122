trigger OpportunityTrigger on Opportunity (before update, before delete) {
    switch on trigger.operationType {
        when BEFORE_UPDATE{
            OpportunityTriggerHandler.beforeUpdate(trigger.new, trigger.newMap);
        }
        
        when BEFORE_DELETE {
            OpportunityTriggerHandler.beforeDelete(trigger.old);
        }
    }

}