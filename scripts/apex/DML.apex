// ##### Upsert Syntax

// Contact jane = new Contact(FirstName='Jane',
//                          LastName='Smith',
//                          Email='jane.smith@example.com',
//                          Description='Contact of the day');
// insert jane;
// // 1. Upsert using an idLookup field
// // Create a second sObject variable.
// // This variable doesn’t have any ID set.
// Contact jane2 = new Contact(FirstName='Jane',
//                          LastName='Smith',  
//                          Email='jane.smith@example.com',
//                          Description='Prefers to be contacted by email.');
// // Upsert the contact by using the idLookup field for matching.
// upsert jane2 Contact.fields.Email;
// // Verify that the contact has been updated
// System.assertEquals('Prefers to be contacted by email.',
//                    [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);

// ##### Delete Records

// Contact[] contactsDel = [SELECT id FROM Contact WHERE LastName = 'Smith']; 
// delete contactsDel;

// ##### DML Statement Exceptions

// try {
//   // This causes an exception because
//   //   the required Name field is missing.
//   Account acct = new Account();
//   // Insert the account
//   insert acct;
// } catch (DmlException e) {
//     System.debug('An unexpected error has occurred: ' + e.getMessage());
// }
// System.DmlException: Insert failed. First exception on row 0; first error: 
//   REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]

// ##### Insert Records with Partial Success

// Create a list of contacts
// List<Contact> conList = new List<Contact> {
//     new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
//     new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
//     new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
//     new Contact()};
//     // bulk and insert all contacts with one DML call:
// Database.SaveResult[] srList = Database.insert(conList, false);
// // itarates through each returned result
// for (Database.SaveResult sr : srList) {
//     if (sr.isSuccess()) {
//       // Operation was sucessful, so get the ID of the record that was processed
//       System.debug('Sucessfully inserted contact. Contact ID: ' + sr.getID());
//     }  else {
//       // Operation failed, so get all errors
//       for (Database.Error err : sr.getErrors()) {
//         System.debug('The following error occurred.');
//         System.debug(err.getStatusCode() + ': ' + err.getMessage());
//         System.debug('Contact fields that affected this error: ' + err.getFields());
//       }
//     }
// }

// ##### Insert Related Records

// Account acct = new Account(Name = 'SFDC account');
// insert acct;
// // Once the account is inserted, the sObject will be populated with an ID.
// // get this ID.
// ID acctID = acct.ID;
// // Add a contact to this account.
// Contact Mario = new Contact(
//   FirstName = 'Mario',
//   LastName = 'Ruiz',
//   Phone = '415.555.1212',
//   AccountId = acctID);
// insert Mario;

// ##### Update Related Records

// Contact queriedContact = [SELECT account.Name 
//                           FROM Contact 
//                           WHERE FirstName = 'Mario' AND LastName = 'RUIZ'
//                           LIMIT 1];
// // Update the contact's phone number
// queriedContact.Phone = '(415)555-1213';
// // Update the related account industry
// queriedContact.Account.Industry = 'Technology';
// // Make two separete calls
// // 1. This call is to update the contact's phone
// update queriedContact;
// // 2. This call is to update the related account's Industry field.
// update queriedContact.Account;

// ##### Delete Related Records - cascade

// Account [] queriedAccounts = [SELECT id
//                               FROM Account
//                               WHERE Name = 'SFDC account'];
// delete queriedAccounts;

public class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        Account newAccount = new Account();
        try {
            newAccount.Name = accountName;
            insert newAccount;
            return newAccount;
        
        } catch (DmlException e) {
            // e.getErrors();
            return null;
        }
    }
}