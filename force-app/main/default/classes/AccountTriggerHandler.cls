public class AccountTriggerHandler {
   public static void beforeInsert(List<Account> newAccounts) {
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
        
        if (currAccount.Phone != null && currAccount.Website != null && currAccount.Fax != null){
            currAccount.Rating = 'Hot';
        }
        }
    }
    public static void afterInsert(List<Account> newAccounts){
        Contact[] contactToCreate  = new List<Contact>();
        String lastName = 'DefaultContact';
        String email = 'default@email.com';
        for (Account currAccount : newAccounts) {
            Contact newCont = new Contact();
            newCont.LastName = lastName;
            newCont.Email = email;
            newCont.AccountId = currAccount.Id;
            contactToCreate.add(newCont);
        }
        if (contactToCreate != null) {
            insert contactToCreate;
        }
    }
}