// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// string tempvar = 'Marcos';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);

// // Create a list of contacts
// List<Contact> conList = new List<Contact> {
//   new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
//       new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
//       new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
//       new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
// // Bulk insert all contacts with one DML call
// insert conList;
// // List to hold the new contacts to update
// List<Contact> listToUpdate = new List<Contact>();
// // Iterate through the list and add a title only
// //   if the department is Finance
// for(Contact con : conList) {
//   if (con.Department == 'Finance') {
//       con.Title = 'Financial analyst';
//       // Add updated contact sObject to the list.
//       listToUpdate.add(con);
//   }
// }
// // Bulk update all contacts with one DML call
// update listToUpdate;

// insert contact Josh
Contact josh = new Contact(FirstName = 'Josh', LastName = 'Kaplan', Department = 'Finance');
insert josh;

// Josh's record has been inserted
//   so the variable josh has now an ID.
//   which will be used to match the records by upsert

josh.Description = 'Josh\'s record has been updated by the upsert operation.';
// Create the Kathy contact, nut don't persist in the database
Contact kathy = new Contact(FirstName = 'Kathy', LastName = 'Brown', Department = 'Technology');
// List to hold the new contacts to upsert
List<Contact> contacts = new List<Contact> { josh, kathy };
// Call upsert
upsert contacts;
// Result: Josh is updated, Kathy is created.