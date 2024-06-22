public class OpportunityTriggerHandler {
    public static void beforeUpdate(List<Opportunity> newOpps, map<Id, Opportunity> newOppsMap){
        for(Opportunity currOpp : newOpps){
            if (currOpp.Amount <= 5000) {
                currOpp.addError('Opportunity amount must be greater than 5000');
            }
        }
    } 
public static void beforeDelete(List<Opportunity> oppsToDelete){
    set<Id> accountsId = new set<Id>();
    for(Opportunity currOpp : oppsToDelete){
        accountsId.add(currOpp.AccountId);
    }
    map<Id, Account> accountsMap = new map<Id, Account>([SELECT Id, Industry FROM Account WHERE Id In :accountsId]);
    for(Opportunity currOpp : oppsToDelete){
        Account currAccount = accountsMap.get(currOpp.AccountId);
        if (currOpp.StageName == 'Closed Won' && currAccount.Industry == 'Banking') {
            currOpp.addError('Cannot delete closed opportunity for a banking account that is won');
        }
    }
}
}