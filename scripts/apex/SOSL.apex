// // New account with 2 contacts
// Account acct = new Account (
//     Name = 'SFDC Computing',
//     Phone = '(415)555-1212',
//     NumberOfEmployees = 50,
//     BillingCity = 'San Francisco'
// );
// insert acct;
// ID acctID = acct.Id;
// // New account with no contacts
// Account acct2 = new Account (
//     Name = 'SFDC Industry',
//     Phone = '(310)555-1213',
//     NumberOfEmployees = 140,
//     BillingCity = 'Los Angeles'
// );
// insert acct2;

// Contact ctt = new Contact(
//     FirstName = 'Zé',
//     LastName = 'Da Silva',
//     Phone = '(415)555-1212',
//     Department = 'Wingo',
//     AccountId = acctID
// );
// insert ctt;

// Contact ctt2 = new Contact(
//     FirstName = 'Mário',
//     LastName = 'Atrás do armario',
//     Phone = '(15)4443-2222',
//     Department = 'Wingo',
//     AccountId = acctID
// );
// insert ctt2;

// FIND {Wingo} IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Department)

// String soslFindClause = 'Wingo OR SFDC*';
// List<List<SObject>> searchList = [FIND :soslFindClause
//                                   IN ALL FIELDS 
//                                   RETURNING Account(Name), Contact(FirstName,LastName,Department)];
// Account[] searchAccounts = (Account[])searchList[0];
// Contact[] searchContacts = (Contact[])searchList[1];
// System.debug('Found the following accounts.');
// for (Account a : searchAccounts) {
//     System.debug(a.Name);    
// }
// for (Contact c : searchContacts) {
//     System.debug(c.FirstName + ' ' + c.LastName + ' ' + c.Department);
// }

// public class ContactAndLeadSearch {
//     public static List<List<SObject>> searchContactsAndLeads (String searchFindClause) {
//         List<List<SOBject>> searchList = [FIND :searchFindClause IN ALL FIELDS
//                                          RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
//         Contact[] searchContacts = (Contact[])searchList[0];
//         Lead[] searchLeads = (Lead[])searchList[1];
//         for (Contact c : searchContacts) {
//             System.debug(c.FirstName + ' ' + c.LastName);
//         }
//         for(Lead l : searchLeads) {
//             System.debug(l.FirstName + ' ' + l.LastName);
//         }
//         return searchList;
//     }
// }