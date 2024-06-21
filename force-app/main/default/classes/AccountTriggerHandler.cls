public class AccountTriggerHandler {
   public static void beforeInsert(List<Account> newAccounts){
    for (Account currAccount : newAccounts) {
        if (currAccount.Type == null){
            currAccount.Type = 'Prospect';
          }
        if (currAccount.BillingStreet == null && currAccount.ShippingStreet != null) {
            currAccount.BillingStreet = currAccount.ShippingStreet;
        }
        if (currAccount.BillingCity == null && currAccount.ShippingCity != null) {
            currAccount.BillingCity = currAccount.ShippingCity;
        }
        if (currAccount.BillingState == null && currAccount.ShippingState != null) {
            currAccount.BillingState = currAccount.ShippingState;
        }
        if (currAccount.BillingPostalCode == null && currAccount.ShippingPostalCode != null) {
            currAccount.BillingPostalCode = currAccount.ShippingPostalCode;
        }
        if (currAccount.BillingCountry == null && currAccount.ShippingCountry != null) {
            currAccount.BillingCountry = currAccount.ShippingCountry;
        }   
        }
    }
}