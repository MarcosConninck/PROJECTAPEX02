// //Add account and related contact
// Account acct = new Account(
//    Name='SFDC Computing',
//    Phone='(415)555-1212',
//    NumberOfEmployees=50,       
//    BillingCity='San Francisco'
// );

// insert acct;

// //Once the account is inserted, the sObject will be populated with an ID.
// //Get this ID.

// ID acctID = acct.ID;

// //Add contact to this account.

// Contact con = new Contact(
//    FirstName='Caroline',
//    LastName='Ruiz',
//    Phone='(415)555-1212',
//    Department='Wingo',
//    AccountID = acctID
//    );

// insert con;

// // Add account with no contact
// Account acct2 = new Account(
//    Name='The SFDC Query Man',
//    Phone='(310)555-1213',
//    NumberOfEmployees=50,       
//    BillingCity='Los Angeles',
//    Description='Expert in wing technologies.');

// insert acct2;

// Account[] acct = [SELECT Name,Phone 
//                   FROM Account 
//                   WHERE (Name='SFDC Computing' AND NumberOfEmployees > 25) 
//                   ORDER BY Name
//                   LIMIT 5];
// System.debug(acct.size() + ' Account(s) returned.');
// System.debug(acct);

// String targetDepartment = 'Wingo';
// Contact [] techContacts = [SELECT FirstName, LastName
//                            FROM Contact
//                            WHERE Department =:targetDepartment];
// System.debug(techContacts.size() + ' contact(s) returned.');                          
// System.debug(techContacts);

// Account[] accountWithContacts = [SELECT Name,
//                                 (SELECT FirstName, LastName FROM Contacts)
//                                 FROM Account
//                                 WHERE (Name = 'SFDC Computing')
//                                 ];
// // Get child recors
// Contact[] cts = accountWithContacts[0].Contacts;                                                  
// System.debug('Name of First associate contact: ' +
//              cts[0].FirstName + ' ' + cts[0].LastName);                          

// Contact[] cct = [SELECT Account.name 
//                FROM Contact
//                WHERE FirstName = 'Caroline' AND LastName = 'Ruiz'];
// Contact Carol = cct[0];
// String acctName = carol.Account.Name;
// System.debug('Carol\'s account name is ' + acctName);               

// insert new Account[] {new Account(Name='For loop 1'), 
//                      new Account(Name='For loop 2'),
//                      new Account(Name='For loop 3')};
// // The sObject list format executes the for loop once per returned batch
// // of records
// Integer i=0;
// Integer j=0;
// for (Account[] tmp : [SELECT Id FROM Account WHERE Name LIKE 'For loop _']) {
//   j = tmp.size();
//   i ++;
// }
// System.assertEquals(3, j); // The list should contained the three accounts
//                            // named 'yyy'
// System.assertEquals(1, i); // Since a single batch can hold up to 200 records
//                            // and, only three records should have been returned,
//                            // the loop should have executed only once


// EMAIL MANAGER 

// public class EmailManager {
//   // Public method
//   public void sendMail(String address, String subject, String body) {
//       // Create an email message object
//       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//       String[] toAddresses = new String[] {address};
//       mail.setToAddresses(toAddresses);
//       mail.setSubject(subject);
//       mail.setPlainTextBody(body);
//       // Pass this email message to the built-in sendEmail method
//       // of the Messaging class
//       Messaging.SendEmailResult[] results = Messaging.sendEmail(
//                                new Messaging.SingleEmailMessage[] { mail });
//       // Call a helper method to inspect the returned results
//       inspectResults(results);
//   }
//   // Helper method
//   private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
//       Boolean sendResult = true;
//       // sendEmail returns a list of result objects.
//       // Iterate through the list to inspect results.
//       // In this class, the methods send only one email,
//       // so we should have only one result.
//       for (Messaging.SendEmailResult res : results) {
//           if (res.isSuccess()) {
//               System.debug('Email sent successfully');
//           }
//           else {
//               sendResult = false;
//               System.debug('The following errors occurred: ' + res.getErrors());
//           }
//       }
//       return sendResult;
//   }
// }

// Account[] conta_deletar = [SELECT id FROM Account WHERE(name LIKE 'nova%')];
// system.debug(conta_deletar);
// Database.delete(conta_deletar);

// Account conta_deletar = [SELECT id, Name FROM Account WHERE(Name LIKE '%Comput%')];
// Database.delete(conta_deletar);